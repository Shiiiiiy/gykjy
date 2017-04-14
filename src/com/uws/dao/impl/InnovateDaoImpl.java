package com.uws.dao.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.uws.dao.InnovateDao;
import com.uws.util.Constants;
/**
 * 创新创业查询Dao实现类
 * @author hejin
 *
 */

@Repository("InnovateDao")
public class InnovateDaoImpl implements InnovateDao{

	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	/**
	 * 查询创新创业模块各信息列表
	 * @param pageStart 分页起始参数
	 * @param num 读取条数
	 * @param tableName 创新创业模块各表名
	 * (INNOVATE_PLATFORM,FINANCE_ENVIRONMENT,NEW_COMPANIES,INVEST_COMPANIES,MARKET_COMPANIES)
	 * @return List<Map<String,Object>>
	 */
	@Override
	public List<Map<String,Object>> getImmovateList(String tableName,int pageStart,int num){
		if(!"".equals(tableName) && tableName!=null ){
			StringBuffer sql=new StringBuffer(" SELECT * FROM "+tableName+" N WHERE 1=1   ");
			List<Object> values=new ArrayList();
			//2期
			sql.append(" AND N.STATUS = ? ");
			values.add(Constants.GYMANAGER_ENABLE);
			//
			sql.append(" ORDER BY N.CREATE_TIME DESC ");
			if(pageStart>=0 && num>0){
				sql.append(" LIMIT ?,? ");
				values.add(pageStart);
				values.add(num);
			}
			
			return jdbcTemplate.queryForList(sql.toString(), values.toArray());
		}else{
			return null;
		}
		
	}
	
	/**
	 * 查询创新或领军人物列表
	 * @param isInnovate 是否创新人物
	 * @param isLeader   是否领军人物
	 * @param pageStart  分页起始参数
	 * @param num  读取条数
	 * @return List<Map<String,Object>>
	 */
	@Override
	public List<Map<String,Object>> getExcellentPersonList(String isInnovate,String isLeader,int pageStart,int num){
		
		StringBuffer sql=new StringBuffer(" SELECT * FROM EXCELLENT_PERSON N WHERE 1=1  ");
		List<Object> values=new ArrayList();
		
		if(!"".equals(isInnovate) && isInnovate!=null ){
			sql.append(" AND N.IS_INNOVATE=? ");
			values.add(isInnovate);
		}
		
		if(!"".equals(isLeader) && isLeader!=null ){
			sql.append(" AND N.IS_LEADER=? ");
			values.add(isLeader);
		}
		//2期
		sql.append(" AND N.STATUS = ? ");
		values.add(Constants.GYMANAGER_ENABLE);
		//
		sql.append(" ORDER BY N.CREATE_TIME DESC ");
		
		if(pageStart>=0 && num>0){
			sql.append(" LIMIT ?,? ");
			values.add(pageStart);
			values.add(num);
		}
		
		
		return jdbcTemplate.queryForList(sql.toString(), values.toArray());
	}
	
	/**
     * 查询人物详情信息
     * @param personId 人物id
     * @return Map<String, Object>
     */
	@Override
	public Map<String,Object> getPersonInfo(String personId){
		String sql=" SELECT * FROM EXCELLENT_PERSON N WHERE 1=1 AND N.ID=? ";
		List<Object> values=new ArrayList();
		if(!"".equals(personId) && personId!=null){
			values.add(personId);
		}else{
			return null;
		}
		
		return jdbcTemplate.queryForMap(sql,values.toArray());
	}
    
	/**
	 * 查询创新创业模块各信息列表
	 * @param pageStart 分页起始参数
	 * @param num 读取条数
	 * @param tableName 创新创业模块各表名
	 * (INNOVATE_PLATFORM,FINANCE_ENVIRONMENT,NEW_COMPANIES,INVEST_COMPANIES,MARKET_COMPANIES)
	 * @return List<Map<String,Object>>
	 */
	@Override
	public List<Map<String, Object>> getImmovateListByType(String tableName,String type, int pageStart, int num) {
		if(!"".equals(tableName) && tableName!=null ){
			StringBuffer sql=new StringBuffer(" SELECT * FROM "+tableName+" N WHERE 1=1 ");
			List<Object> values=new ArrayList();
			if(!"".equals(type) && type!=null){
				sql.append(" AND N.TYPE = ? ");
				values.add(type);
			}
			//2期 这个 
			sql.append(" AND N.STATUS = ? ");
			values.add(Constants.GYMANAGER_ENABLE);
			//
			sql.append(" ORDER BY N.CREATE_TIME DESC ");
			if(pageStart>=0 && num>0){
				sql.append(" LIMIT ?,? ");
				values.add(pageStart);
				values.add(num);
			}
			return jdbcTemplate.queryForList(sql.toString(), values.toArray());
		}else{
			return null;
		}
	}
	/**
	 * 获取整表  非公用方法
	 * @param pageStart 分页起始参数
	 * @param num 读取条数
	 */
	@Override
	public List<Map<String, Object>> getTableByName(String tableName,int pageStart, int num) {
		if(!"".equals(tableName) && tableName!=null ){
			StringBuffer sql=new StringBuffer(" SELECT * FROM "+tableName+" N WHERE 1=1   ");
			List<Object> values=new ArrayList();
			//2期
			//不依赖状态
			//
			sql.append(" ORDER BY N.REC_TIME DESC ");
			if(pageStart>=0 && num>0){
				sql.append(" LIMIT ?,? ");
				values.add(pageStart);
				values.add(num);
			}
			
			return jdbcTemplate.queryForList(sql.toString(), values.toArray());
		}else{
			return null;
		}
	}
	
	
}
