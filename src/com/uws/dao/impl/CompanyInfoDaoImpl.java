package com.uws.dao.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;



import javax.annotation.Resource;



import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;



import com.uws.dao.CompanyInfoDao;
import com.uws.util.Constants;
import com.uws.util.Util;
@Repository
public class CompanyInfoDaoImpl implements CompanyInfoDao{
	@Resource(name = "jdbcTemplate")
	private JdbcTemplate jdbcTemplate;
	/**
	 * 查询 企业信息详情
	 * @param compId ID值
	 * @return Map<String, Object>
	 * */
	@Override
	public Map<String, Object> getCompInfo(String compId) {
		StringBuffer sql=new StringBuffer(" SELECT * FROM COMPANY_INFO C WHERE 1=1 ");
		List<Object> values=new ArrayList();
		if(!"".equals(compId) && compId!=null ){
			sql.append(" AND C.ID=? ");
			values.add(compId);
			/**IS_SHOW=1表示是企业 2期 */
			sql.append(" AND C.IS_SHOW = ? ");
			values.add(1);
			//
			return jdbcTemplate.queryForMap(sql.toString(),values.toArray());
		}else{
			return null;
		}

	}
	/**
	 * 查询园区龙头企业或产业优质企业列表
	 * @param map 键是PROP_TYPE,值是PROP_VALUE
	 * @param pageStart 分页起始值
	 * @param num 读取条数
	 * @return List<Map<String, Object>>
	 * */
	@Override
	public List<Map<String, Object>> getInduGardCompList(Map<String,String> map,int pageStart, int num) {
		if(map!=null && map.size()==2){
			List<Object> values=new ArrayList<Object>();
			String sql=" SELECT C.* FROM  COMPANY_INFO C  WHERE 1=1 ";
			for(Entry<String, String> vo : map.entrySet()){ 
				String aa1=vo.getKey(); 
				String aa2=vo.getValue(); 
				 
				if("".endsWith(aa2)){
					sql=sql+" AND C.ID IN ( SELECT B.COMP_ID FROM COMPANIES_PROP B WHERE B.PROP_TYPE = ?) ";
					values.add(aa1);
				}else{
					sql=sql+" AND C.ID IN ( SELECT A.COMP_ID FROM COMPANIES_PROP A WHERE A.PROP_TYPE = ? AND A.PROP_VALUE = ? ) ";
					values.add(aa1);
					values.add(aa2);
				}
			}
			//2期
			sql=sql+" AND  C.IS_SHOW = ? ";
			values.add(1);
			sql=sql+" AND  C.STATUS = ? ";
			values.add(Constants.GYMANAGER_ENABLE);
			//
			
			sql=sql+" ORDER BY C.CREATE_TIME DESC ";
			if(pageStart>=0 && num>0){
				sql=sql+" LIMIT ?,? ";
				values.add(pageStart);
				values.add(num);
			}
			return jdbcTemplate.queryForList(sql.toString(),values.toArray());
		}else{
			return null;
		}

	}
	/**
	 * 查询创新企业列表
	 * @param propType  属性类型
	 * @param propValue 属性值
	 * @param pageStart 分页起始值
	 * @param num 读取条数
	 * @param productName 产品名称
	 * @param productCapacity 产品产能
	 * @return List<Map<String, Object>>
	 */
	@Override
	public List<Map<String, Object>> getInnovateCompList(String propType,String propValue,String productName,String productCapacity,String productType,int pageStart, int num){
		StringBuffer sql=new StringBuffer(" SELECT C.* FROM  COMPANY_INFO C LEFT JOIN COMPANIES_PROP P ON C.ID=P.COMP_ID WHERE 1=1 ");

		List<Object> values=new ArrayList();
		if(!"".equals(propType) && propType!=null ){
			sql.append(" AND P.PROP_TYPE=? ");
			values.add(propType);

		}

		if(!"".equals(propValue) && propValue!=null ){
			sql.append(" AND P.PROP_VALUE=? ");
			values.add(propValue);

		}
				
		if(!Util.isNull(productName) || !Util.isNull(productCapacity) || !Util.isNull(productType) ){
			 sql.append(" AND C.ID IN ( SELECT T.PRODUCT_COMP FROM PRODUCT_INFO T WHERE 1=1 ");
			 
			 if(!Util.isNull(productName)){
				 sql.append(" AND T.PRODUCT_NAME LIKE ? ");
				 values.add("%"+productName+"%");
			 }
			 if(!Util.isNull(productCapacity)){
				 sql.append(" AND T.PRODUCT_CAPACITY LIKE ? ");
				 values.add("%"+productCapacity+"%");			 
			 }
			 if(!Util.isNull(productType)){
				 sql.append(" AND T.PRODUCT_TYPE = ? ");
				 values.add(productType);
			 }
			
			 sql.append(" GROUP BY T.PRODUCT_COMP ) ");
		}
		//2期
		sql.append(" AND  C.IS_SHOW = ? ");
		values.add(1);
		sql.append(" AND  C.STATUS = ? ");
		values.add(Constants.GYMANAGER_ENABLE);
		//

		sql.append(" ORDER BY C.CREATE_TIME DESC ");

		if(pageStart>=0 && num>0){
			sql.append(" LIMIT ?,? ");
			values.add(pageStart);
			values.add(num);
		}
		//System.out.println("sql=====000==="+sql.toString());
		return jdbcTemplate.queryForList(sql.toString(),values.toArray());
	}

	/**
	 * 查询企业属性列表
	 * @param propType 属性类型
	 * @param propValue 属性值
	 * @return List<Map<String, Object>>
	 */
	@Override
	public List<Map<String, Object>> getCompPropList(String propType,String propValue){
		StringBuffer sql=new StringBuffer(" SELECT * FROM COMPANIES_PROP C WHERE 1=1 ");
		List<Object> values=new ArrayList();
		if(!"".equals(propType) && propType!=null ){
			sql.append(" AND C.PROP_TYPE=? ");
			values.add(propType);

		}

		if(!"".equals(propValue) && propValue!=null ){
			sql.append(" AND C.PROP_VALUE=? ");
			values.add(propValue);

		}


		return jdbcTemplate.queryForList(sql.toString(),values.toArray());
	}

	/**
	 * 查询企业数目
	 * @return int
	 * */

	@Override
	public int getCompCount() {

		return jdbcTemplate.queryForInt("SELECT COUNT(*) FROM COMPANY_INFO C WHERE C.IS_SHOW = '1' ");
	}

	/**
	 * 查询企业信息列表
	 * @param sql 语句
	 * @param params 参数
	 * @param pageStart 起始查询
	 * @param pageEnd 查询数目
	 * @return List<Map<String, Object>>
	 */
	@Override
	public List<Map<String, Object>> getListComp(String sql, Object[] params,int pageStart, int pageEnd) {
		List<Map<String, Object>> list=new ArrayList<Map<String,Object>>();
		List<Object> values=new ArrayList<Object>();
		if("".equals(sql) && null==params){/**缺省查询*/
			sql="SELECT C.* FROM COMPANY_INFO C LEFT JOIN COMPANIES_PROP D ON C.ID = D.COMP_ID WHERE 1=1 " +
					"AND C.IS_SHOW = ? AND C.STATUS = ? AND D.PROP_VALUE =? ";
			
			values.add(1);
			//2期
			values.add(Constants.GYMANAGER_ENABLE);
			values.add("F1");
		}
		if(params!=null){
			for (int i = 0; i < params.length; i++) {
				values.add(params[i]);
			}
		}
		sql=sql+" ORDER BY C.CREATE_TIME DESC "; 
		if(pageStart>=0 && pageEnd>0){
			sql=sql+" LIMIT ?,? ";
			values.add(pageStart);
			values.add(pageEnd);
		}
		try{
			list=jdbcTemplate.queryForList(sql.toString(), values.toArray());
		}catch(Exception e){e.printStackTrace();}
		return list;
	}
	
	/**
	 * 条件查询企业列表
	 * @param sql 为空字符串 即无条件查询
	 * @param params 参数
	 * @param pageStart 起始查询id
	 * @param pageEnd  查询数目
	 * @return List<Map<String, Object>>
	 * */
	@Override
	public List<Map<String, Object>> getListCompSearch(String sql,Object[] params, int pageStart, int pageEnd) {
		List<Map<String, Object>> list=new ArrayList<Map<String,Object>>();
		List<Object> values=new ArrayList<Object>();
		if("".equals(sql) && null==params){
			sql="SELECT * FROM COMPANY_INFO WHERE 1=1 AND IS_SHOW = ?  AND STATUS = ? ";
			values.add(1);
			values.add(Constants.GYMANAGER_ENABLE);
		}
		if(params!=null){
			for (int i = 0; i < params.length; i++) {
				values.add(params[i]);
			}
		}
		//sql=sql+" ORDER BY CREATE_TIME DESC 不能加";
		if(pageStart>=0 && pageEnd>0){
			sql=sql+" LIMIT ?,? ";
			values.add(pageStart);
			values.add(pageEnd);
		}
		try{
			list=jdbcTemplate.queryForList(sql.toString(), values.toArray());
		}catch(Exception e){e.printStackTrace();}
		return list;
	}
	
	/**
	 * 对企业实体的 高级搜索  4字段
	 * @param array 参数数组
	 * @param pageStart 起始查询
	 * @param pageEnd 查询数目
	 * @return List<Map<String, Object>>
	 * */
	@Override
	public List<Map<String, Object>> getListCompByParm(Object[] array,int pageStart, int pageEnd) {
		List<Map<String, Object>> list=new ArrayList<Map<String,Object>>();
		StringBuffer sql=new StringBuffer(" SELECT C.* FROM COMPANY_INFO C LEFT JOIN COMPANIES_PROP D ON C.ID = D.COMP_ID WHERE 1=1 " +
					"AND C.IS_SHOW = ? AND C.STATUS = ? AND D.PROP_VALUE = ? ");
		List<Object> values=new ArrayList<Object>();
		values.add(1);
		//2期
		values.add(Constants.GYMANAGER_ENABLE);
		values.add("F1");
		//
		try{
			if(array.length==4){
				if(!"".equals(array[0]) && null!=array[0]){
					sql.append(" AND C.CP_MARKET = ? ");
					values.add(array[0]);
				}
				if(!"".equals(array[1]) && null!=array[1]){/**来自树形图code*/
					sql.append(" AND C.CP_BELONG = ? ");
					values.add(array[1]);
				}
				if(!"".equals(array[2]) && null!=array[2]){
					sql.append(" AND C.CP_CUSTOMERTYPE = ? ");
					values.add(array[2]);
				}
				if(!"".equals(array[3]) && null!=array[3]){
					sql.append(" AND C.CP_BELONGPART = ? ");
					values.add(array[3]);
				}
			}
			sql.append(" ORDER BY C.CREATE_TIME DESC ");
			if(pageStart>=0 && pageEnd>0){
				sql.append(" LIMIT ?,? ");
				values.add(pageStart);
				values.add(pageEnd);
			}
			list=jdbcTemplate.queryForList(sql.toString(), values.toArray());
		}catch(Exception e){e.printStackTrace();}
		return list;
	}
	/**
	 * 对企业实体的 推荐企业搜索  limit查询
	 * @param moduleCode code值
	 * @param parentCode code值
	 * @param pageStart 起始查询
	 * @param pageEnd 查询数目
	 * @return List<Map<String, Object>>
	 * */
	@Override
	public List<Map<String, Object>> getListCompRecommend(String propType, String propValue,int pageStart,int pageEnd) {
		List<Map<String, Object>> list=new ArrayList<Map<String,Object>>();
		List<Object> values=new ArrayList<Object>();
		StringBuffer sql=new StringBuffer(" SELECT C.* FROM  COMPANY_INFO C WHERE C.IS_SHOW = ? ");
		values.add(1);//展示的企业
		//2期
		sql.append(" AND C.STATUS = ? ");
		values.add(Constants.GYMANAGER_ENABLE);
		//
		if("N".equals(propType) && "N".equals(propValue)){//企业信息专用方法
			sql.append("AND C.ID IN ( SELECT A.COMP_ID FROM COMPANIES_PROP A WHERE A.PROP_TYPE = ? AND A.PROP_VALUE = ? ) ");
			values.add("PROP_G");
			values.add("F1");
		}else{
			if( "PROP_E".equals(propType) ){//产业服务
				sql.append("AND C.ID IN ( SELECT A.COMP_ID FROM COMPANIES_PROP A WHERE A.PROP_TYPE = ? AND A.PROP_VALUE = ? ) ");
				values.add("PROP_G");
				values.add("F2");
			}else if("PROP_F".equals(propType)){//支柱产业
				sql.append("AND C.ID IN ( SELECT A.COMP_ID FROM COMPANIES_PROP A WHERE A.PROP_TYPE = ? AND A.PROP_VALUE = ? ) ");
				values.add("PROP_G");
				values.add("F3");
			}
			sql.append("AND C.ID IN ( SELECT B.COMP_ID FROM COMPANIES_PROP B WHERE B.PROP_TYPE = ? AND B.PROP_VALUE = ? ) ");
			values.add(propType);
			values.add(propValue);
		}
		sql.append(" ORDER BY C.CREATE_TIME DESC ");
		if(pageStart>=0 && pageEnd>0){
			sql.append(" LIMIT ?,? ");
			values.add(pageStart);
			values.add(pageEnd);
		}
		try{
			list=jdbcTemplate.queryForList(sql.toString(), values.toArray());
		}catch(Exception e){e.printStackTrace();}
		return list;
	}



}
