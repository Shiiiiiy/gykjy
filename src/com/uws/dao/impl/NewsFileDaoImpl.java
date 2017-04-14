package com.uws.dao.impl;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.uws.dao.NewsFileDao;
import com.uws.util.Constants;

/**
 * 新闻资讯、政策、动态、文件查询DAO实现类
 * @author hejin
 *
 */
@Repository("newsFileDao")
public class NewsFileDaoImpl implements NewsFileDao{
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	 /**
	   * 查询新闻信息列表
	   * @param moduleCode 新闻模块编码(参见字段注释)
	   * @param parentCode 新闻父编码
	   * @param moduleType 新闻类型(参见字段注释)
	   * @param  pageStart 分页起始参数,无需分页时，可传入0
	   * @param  num   读取条数,无需分页时，可传入0
	   * @return List<Map<String,Object>>
	   */
	@Override
	public List<Map<String,Object>> getNews(String moduleCode,String parentCode,String moduleType,int pageStart,int num){
		StringBuffer sql=new StringBuffer(" SELECT * FROM NEWS_ALL N WHERE 1=1 ");
		List<Object> values=new ArrayList();
		//2期
		sql.append(" AND N.STATUS = ? ");
		values.add(Constants.GYMANAGER_ENABLE);
		//
		if(!"".equals(moduleCode) && moduleCode!=null ){
			if("N".equals(moduleCode)){
				sql.append(" AND N.MODULE_CODE IS NULL ");
			}else{
				sql.append(" AND N.MODULE_CODE=? ");
				values.add(moduleCode);
			}
		} 
		if(!"".equals(parentCode) && parentCode!=null ){
			if("N".equals(parentCode)){
				sql.append(" AND N.PARENT_CODE IS NULL ");
			}else{
				sql.append(" AND N.PARENT_CODE=? ");
				values.add(parentCode);
			}
		}
		
		if(!"".equals(moduleType) && moduleType!=null ){
			if("N".equals(moduleType)){
				sql.append(" AND N.MODULE_TYPE IS NULL ");
			}else{
				sql.append(" AND N.MODULE_TYPE=? ");
				values.add(moduleType);
			}
		}
		
		sql.append(" ORDER BY N.NEWS_TIME DESC ");
		
		if(pageStart>=0 && num>0){
			sql.append(" LIMIT ?,? ");
			values.add(pageStart);
			values.add(num);
		}
		
		List<Map<String,Object>> list=jdbcTemplate.queryForList(sql.toString(), values.toArray());
		
		
		return list;
	}
	
  /**
   * 查询文件图片信息列表
   * @param moduleCode 模块编码(参见字段注释)
   * @param parentCode 父编码
   * @param fileType 文件类型(参见字段注释)
   * @param  pageStart 分页起始参数,无需分页时，可传入0
   * @param  num   读取条数,无需分页时，可传入0
   * @return List<Map<String,Object>>
   */
	@Override
	public List<Map<String,Object>> getFiles(String moduleCode,String parentCode,String fileType,int pageStart,int num){
        StringBuffer sql=new StringBuffer(" SELECT * FROM FILE_INFO N WHERE 1=1 ");
        List<Object> values=new ArrayList();
        
		if(!"".equals(moduleCode) && moduleCode!=null ){
			if("N".equals(moduleCode)){
				sql.append(" AND N.MODULE_CODE IS NULL ");
			}else{
				sql.append(" AND N.MODULE_CODE=? ");
				values.add(moduleCode);
			}
		}
		
		if(!"".equals(parentCode) && parentCode!=null ){
			if("N".equals(parentCode)){
				sql.append(" AND N.PARENT_CODE IS NULL ");
			}else{
				sql.append(" AND N.PARENT_CODE=? ");
				values.add(parentCode);
			}
		}
		
		if(!"".equals(fileType) && fileType!=null ){
			if("N".equals(fileType)){
				sql.append(" AND N.FILE_TYPE IS NULL ");
			}else{
				sql.append(" AND N.FILE_TYPE=? ");
				values.add(fileType);
			}
		}
		
		//二期
		sql.append(" ORDER BY N.SORT ASC,N.CREATE_TIME DESC");
		//
		if(pageStart>=0 && num>0){
			sql.append(" LIMIT ?,? ");
			values.add(pageStart);
			values.add(num);
		}
		
		List<Map<String,Object>> list=jdbcTemplate.queryForList(sql.toString(), values.toArray());
		
		
		return list;
	}
	
	/**
     * 查询新闻信息详情
     * @param newsId 新闻id
     * @return Map<String,Object>
     */
	@Override
	public Map<String,Object> getNewsDetail(String  newsId){
		StringBuffer sql=new StringBuffer(" SELECT * FROM NEWS_ALL N WHERE 1=1 AND N.ID=? ");
		Map<String,Object> map=new HashMap();
		if(!"".equals(newsId) && newsId!=null ){
		   map=jdbcTemplate.queryForMap(sql.toString(), new Object[]{newsId});
		}
		return map;
	}
	/**查询上一条新闻 按照NEWS_TIME逆序 */
	@Override
	public Map<String, Object> getPreNews(String moduleCode, String parentCode,String moduleType, Map<String, Object> newsOne) {
		StringBuffer sql=new StringBuffer(" SELECT * FROM NEWS_ALL N WHERE 1=1 ");
		List<Object> values=new ArrayList();
		//2期
		sql.append(" AND N.STATUS = ? ");
		values.add(Constants.GYMANAGER_ENABLE);
		//
		if(!"".equals(moduleCode) && moduleCode!=null ){
			if("N".equals(moduleCode)){
				sql.append(" AND N.MODULE_CODE IS NULL ");
			}else{
				sql.append(" AND N.MODULE_CODE=? ");
				values.add(moduleCode);
			}
		}
		if(!"".equals(parentCode) && parentCode!=null ){
			if("N".equals(parentCode)){
				sql.append(" AND N.PARENT_CODE IS NULL ");
			}else{
				sql.append(" AND N.PARENT_CODE=? ");
				values.add(parentCode);
			}
		}
		
		if(!"".equals(moduleType) && moduleType!=null ){
			if("N".equals(moduleType)){
				sql.append(" AND N.MODULE_TYPE IS NULL ");
			}else{
				sql.append(" AND N.MODULE_TYPE=? ");
				values.add(moduleType);
			}
		}
		/**-----------*/
		if(newsOne!=null){
			sql.append(" AND N.NEWS_TIME > ? ");
			values.add(newsOne.get("NEWS_TIME"));
		}
		sql.append(" ORDER BY N.NEWS_TIME ");
		sql.append(" LIMIT ?,? ");
		values.add(0);
		values.add(1);
		/**-----------*/
		List<Map<String,Object>> list=jdbcTemplate.queryForList(sql.toString(), values.toArray());
		if(list.size()==0){			return null;		}
		return list.get(0);
	}

  /**
   * 查询下一条新闻信息详情
   * @param moduleCode code值
   * @param parentCode code值
   * @param moduleType 值
   * @param newsOne 当前新闻实体
   * @return Map<String,Object>
   */
	@Override
	public Map<String, Object> getNextNews(String moduleCode,String parentCode, String moduleType, Map<String, Object> newsOne) {
		StringBuffer sql=new StringBuffer(" SELECT * FROM NEWS_ALL N WHERE 1=1 ");
		List<Object> values=new ArrayList();
		//2期
		sql.append(" AND N.STATUS = ? ");
		values.add(Constants.GYMANAGER_ENABLE);
		//
		if(!"".equals(moduleCode) && moduleCode!=null ){
			if("N".equals(moduleCode)){
				sql.append(" AND N.MODULE_CODE IS NULL ");
			}else{
				sql.append(" AND N.MODULE_CODE=? ");
				values.add(moduleCode);
			}
		}
		
		if(!"".equals(parentCode) && parentCode!=null ){
			if("N".equals(parentCode)){
				sql.append(" AND N.PARENT_CODE IS NULL ");
			}else{
				sql.append(" AND N.PARENT_CODE=? ");
				values.add(parentCode);
			}
		}
		
		if(!"".equals(moduleType) && moduleType!=null ){
			if("N".equals(moduleType)){
				sql.append(" AND N.MODULE_TYPE IS NULL ");
			}else{
				sql.append(" AND N.MODULE_TYPE=? ");
				values.add(moduleType);
			}
		}
		
		/**-----------*/
		if(newsOne!=null){
			sql.append(" AND N.NEWS_TIME < ? ");
			values.add(newsOne.get("NEWS_TIME"));
		}
		sql.append(" ORDER BY N.NEWS_TIME DESC ");
		sql.append(" LIMIT ?,? ");
		values.add(0);
		values.add(1);
		/**-----------*/
		List<Map<String,Object>> list=jdbcTemplate.queryForList(sql.toString(), values.toArray());
		if(list.size()==0){			return null;		}
		return list.get(0);
	}	
}
