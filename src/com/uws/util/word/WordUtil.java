package com.uws.util.word;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/**导出为word工具
 * @author wangjun
 * */
public class WordUtil {
	/**
	 * 导出为word
	 * @req 请求
	 * @resp 响应
	 * @ExportName 导出文件名称 无后缀名
	 * @ExportFtlName ftl模版名称 无后缀名
	 * @textMap 常规字符输出
	 * @imgMap  图片输出
	 * */
    public static void exportWord(HttpServletRequest req, HttpServletResponse resp,String ExportName,String ExportFtlName,
    		Map<String, Object> textMap,Map<String, Object> imgMap)  
            throws ServletException, IOException {  
        req.setCharacterEncoding("utf-8");
        String filePath="";
        // 提示：在调用工具类生成Word文档之前应当检查所有字段是否完整  
        File file = null;  
        InputStream fin = null;  
        ServletOutputStream out = null;  
        try {  
            // 调用工具类WordGenerator的createDoc方法生成Word文档  
        	ServletContext sc=req.getSession().getServletContext();
            file = new WordGenerator(ExportFtlName,sc).createDoc(textMap, ExportName);  
            fin = new FileInputStream(file);  
            resp.setCharacterEncoding("utf-8");  
            resp.setContentType("application/msword");  
            // 设置浏览器以下载的方式处理该文件默认名为resume.doc  
            resp.addHeader("Content-Disposition", "attachment;filename="+ExportName+".doc");  
            out = resp.getOutputStream();  
            byte[] buffer = new byte[512];  // 缓冲区  
            int bytesToRead = -1;  
            // 通过循环将读入的Word文件的内容输出到浏览器中  
            while((bytesToRead = fin.read(buffer)) != -1) {  
                out.write(buffer, 0, bytesToRead);  
            }  
        } finally {  
            if(fin != null) fin.close();  
            if(out != null) out.close();  
            if(file != null) file.delete(); // 删除临时文件  
        }  
    }  
}
