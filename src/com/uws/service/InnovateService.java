package com.uws.service;

import java.util.List;
import java.util.Map;
/**
 * 创新创业查询service接口
 * @author hejin
 *
 */
public interface InnovateService {
      

	/**
	 * 查询创新创业模块各信息列表
	 * @param pageStart 分页起始参数
	 * @param num 读取条数
	 * @param tableName 创新创业模块各表名
	 * (INNOVATE_PLATFORM,FINANCE_ENVIRONMENT,NEW_COMPANIES,INVEST_COMPANIES,MARKET_COMPANIES)
	 * @return List<Map<String,Object>>
	 */
	public List<Map<String,Object>> getImmovateList(String tableName,int pageStart,int num);
	
	
	/**
	 * 查询创新或领军人物列表
	 * @param isInnovate 是否创新人物
	 * @param isLeader   是否领军人物
	 * @param pageStart  分页起始参数
	 * @param num  读取条数
	 * @return List<Map<String,Object>>
	 */
	public List<Map<String,Object>> getExcellentPersonList(String isInnovate,String isLeader,int pageStart,int num);
	
	
	 /**
     * 查询人物详情信息
     * @param personId 人物id
     * @return Map<String, Object>
     */
	public Map<String, Object> getPersonInfo(String personId);

	/**
	 * 查询创新创业模块各信息列表
	 * @param pageStart 分页起始参数
	 * @param num 读取条数
	 * @param tableName 创新创业模块各表名
	 * (INNOVATE_PLATFORM,FINANCE_ENVIRONMENT,NEW_COMPANIES,INVEST_COMPANIES,MARKET_COMPANIES)
	 * @return List<Map<String,Object>>
	 */
	public List<Map<String, Object>> getImmovateListByType(String tableName,String type, int pageStart, int num);

	/**
	 * 获取整表 
	 * @param pageStart 分页起始参数
	 * @param num 读取条数
	 */
	public List<Map<String, Object>> getTableByName(String string, int pageStart, int num);
	
}
