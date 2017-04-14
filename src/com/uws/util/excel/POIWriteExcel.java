package com.uws.util.excel;
 

import java.io.FileInputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;


public class POIWriteExcel {



/**
 * 
 * @param headers 标题数组
 * @param list 结果集
 * @param os 输出流
 * @throws Exception
 */
public void  writeExcel(String[] headers,List<Map<Integer, Object>> list,OutputStream os) throws Exception {
	Workbook wb = createWorkbook(headers, 0, 0);
	writeDatas(wb,0,list);
	wb.write(os);
}

/**  
 *	   
 * @param templatePath 带有表头的Excel文件
 * @param list
 * @param os
 * @throws Exception
 */
public void writeExcel(String templatePath,List<Map<Integer, Object>> list,OutputStream os) throws  Exception {  
	Workbook wb = POIReadExcel.validateExcel(new FileInputStream(templatePath));
	writeDatas(wb,0,list);
	wb.write(os);
} 

/**
 * 创建一个含有标题的工作簿
 * @param sheetName
 * @param headers
 * @param startWriteRows
 * @param startWriteCols
 */
private Workbook createWorkbook(String[] headers,int startWriteRows, int startWriteCols){
	HSSFWorkbook workbook = new HSSFWorkbook(); //创建工作簿
	HSSFSheet sheet = workbook.createSheet("Sheet0"); //创建sheet时 sheet的名称应该由外部传入.
	if(headers.length > 0 ){
	Row titleRow = sheet.createRow(startWriteRows);
		for (int i = 0; i < headers.length; i++) {
			Cell titleCell = titleRow.createCell(startWriteCols + i);
			titleCell.setCellValue(headers[i]);
		}
	}
	return workbook;
}

/**  
* 写入结果集
* @param wb   
* @param sheetIndex sheet页下标：从0开始  
* @param startReadLine 开始读取的行:从0开始  
* @param tailLine 去除最后读取的行
* @param list返回结果集
*/  
private void writeDatas(Workbook wb,int sheetIndex,List<Map<Integer, Object>> list) {  
	Sheet sheet = wb.getSheetAt(sheetIndex);  
	int lastRowNum = sheet.getLastRowNum() ;
	if(lastRowNum == 0){
		Row r = sheet.getRow(lastRowNum);
		if(r == null || r.getLastCellNum() == 0 ){
			lastRowNum--;
		}
	}
	lastRowNum++;
	Row row = null; 
	if(list != null && list.size() > 0){
		for (int i = 0; i < list.size(); i++) {
			row = sheet.createRow(lastRowNum+i);  
			writeExcelRow(row,0,list.get(i));
		}
	}
} 
	

/**
 * 逐行写入
 * @param row
 * @param datas
 * @param style
 */
private void writeExcelRow(Row row,int startWriteCols, Map<Integer, Object> datas) {
	 for (Map.Entry<Integer, Object> data : datas.entrySet()) {
		Cell cell = row.createCell(startWriteCols+data.getKey());
		Object obj = data.getValue();
	      if ((obj == null)) {
	        cell.setCellValue("");
	      } else {
	    	 setCellValue(cell,obj);
	      }
	 }
 }
	
/**   
* 设置单元格的值   
* @param cell   
* @return   
*/    
private void setCellValue(Cell cell, Object value){
	if(value instanceof Integer){
		Integer i = Integer.valueOf(value.toString().split("\\.")[0]);
		cell.setCellType(Cell.CELL_TYPE_NUMERIC);
		cell.setCellValue(i);
	}else if(value instanceof Float){
		Float f = Float.valueOf(value.toString());
		cell.setCellType(Cell.CELL_TYPE_NUMERIC);
		cell.setCellValue(f);
	}else if(value instanceof Double){
		Double d = Double.valueOf(value.toString());
		cell.setCellType(Cell.CELL_TYPE_NUMERIC);
		cell.setCellValue(d);
	}else if(value instanceof String){	
		cell.setCellType(Cell.CELL_TYPE_STRING );
		cell.setCellValue(value.toString());
	}else if(value instanceof Boolean){	
		cell.setCellType(Cell.CELL_TYPE_BOOLEAN );
		cell.setCellValue(((Boolean) value).booleanValue());
	}else if(value instanceof Date){
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		cell.setCellType(Cell.CELL_TYPE_FORMULA);
		try{
			cell.setCellValue(sdf.format(value));//对于 yyyy-MM-dd格式的日期 此处会抛异常
		}catch(Exception e){
			sdf = new SimpleDateFormat("yyyy-MM-dd");
			cell.setCellValue(sdf.format(value));
		}
	}else{
		cell.setCellValue("");
	}
}
 
/**  
* 合并单元格  
* @param sheet   
* @param firstRow 开始行  
* @param lastRow 结束行  
* @param firstCol 开始列  
* @param lastCol 结束列  
*/  
//private void mergeRegion(Sheet sheet, int firstRow, int lastRow, int firstCol, int lastCol) {  
//	sheet.addMergedRegion(new CellRangeAddress(firstRow, lastRow, firstCol, lastCol));  
//} 
 
}
