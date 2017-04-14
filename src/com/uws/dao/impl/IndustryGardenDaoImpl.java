package com.uws.dao.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.uws.dao.IndustryGardenDao;
/**
 * 产业、园区查询Dao实现类
 * @author hejin
 *
 */
@Repository("industryGardenDao")
public class IndustryGardenDaoImpl implements IndustryGardenDao{
   
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	/**
	 * 查询所有产业或园区列表
	 * @param igType 类型(INDUSTRY——产业；GARDEN——园区；)
	 * @param industryType 产业类型
	 * @return List<Map<String,Object>>
	 */
	@Override
	public List<Map<String,Object>> getIndustryGardenList(String igType,String industryType){
		StringBuffer sql=new StringBuffer(" SELECT * FROM INDUSTRY_GARDEN N WHERE 1=1 ");
		List<Object> values=new ArrayList();
		if(!"".equals(igType) && igType!=null ){
			sql.append(" AND N.IG_TYPE=? ");
			values.add(igType);
		}
		
		if(!"".equals(industryType) && industryType!=null ){
			if("N".equals(industryType)){
				
				sql.append(" AND N.INDUSTRY_TYPE IS NULL ");
			}else{
			
				sql.append(" AND N.INDUSTRY_TYPE=? ");
				values.add(industryType);
			}
		}
		
		return jdbcTemplate.queryForList(sql.toString(), values.toArray());
	}
	
	/**
	 * 查询产业或园区详情信息
	 * @param id 产业或园区id
	 * @return Map<String,Object>
	 */
	@Override
	public Map<String,Object> getIndustryGardenDetail(String id){
		StringBuffer sql=new StringBuffer(" SELECT * FROM INDUSTRY_GARDEN N WHERE N.ID=? ");
		
		
		return jdbcTemplate.queryForMap(sql.toString(), new Object[]{id});
	}
	
	/**
	 * 查询园区项目列表
	 * @param status 项目类型code(BASE——基础建设施建设项目；INDUSTRY——园区产业项目；)
	 * @param proStatus 项目建设状态(PROSTATUS_A——拟建;PROSTATUS_B——在建;PROSTATUS_C——竣工；)
	 * @param pageStart 分页起始参数
	 * @param gardenId 园区id
	 * @param num 读取条数
	 * @return List<Map<String,Object>>
	 */
	@Override
	public List<Map<String,Object>> getGardenProject(String gardenId,String status,String proStatus,int pageStart,int num){
		StringBuffer sql=new StringBuffer(" SELECT * FROM GARDEN_PROJECT N WHERE 1=1 ");
		List<Object> values=new ArrayList();
		if(!"".equals(gardenId) && gardenId!=null ){
			sql.append(" AND N.OF_GARDEN=? ");
			values.add(gardenId);
		}
		if(!"".equals(status) && status!=null ){
			sql.append(" AND N.STATUS=? ");
			values.add(status);
		}
		if(!"".equals(proStatus) && proStatus!=null ){
			sql.append(" AND N.PRO_STATUS=? ");
			values.add(proStatus);
		}
		
		sql.append(" ORDER BY N.CREATE_TIME DESC ");
		
		if(pageStart>=0 && num>0){
			sql.append(" LIMIT ?,? ");
			values.add(pageStart);
			values.add(num);
		}
		return jdbcTemplate.queryForList(sql.toString(), values.toArray());
	}
	
	/**
	 * 根据id查询园区项目详情
	 * @param projectId 园区项目id
	 * @return Map<String,Object>
	 */
	@Override
	public Map<String,Object> getGardenProjectDetail(String projectId){
        String sql=" SELECT * FROM GARDEN_PROJECT N WHERE N.ID=? ";
		
		
		return jdbcTemplate.queryForMap(sql, new Object[]{projectId});
	}
	
}
