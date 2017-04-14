package com.uws.dao;
import java.util.*;

/**
 * 产业、园区查询Dao接口
 * @author hejin
 *
 */
public interface IndustryGardenDao {

	
	
	/**
	 * 查询所有产业或园区列表
	 * @param igType 类型(INDUSTRY——产业；GARDEN——园区；)
	 * @param ,industryType 产业类型
	 * @return List<Map<String,Object>>
	 */
	public List<Map<String,Object>> getIndustryGardenList(String igType,String industryType);
	
	/**
	 * 查询产业或园区详情信息
	 * @param id 产业或园区id
	 * @return Map<String,Object>
	 */
	public Map<String,Object> getIndustryGardenDetail(String id);
	
	
	/**
	 * 查询园区项目列表
	 * @param status 项目类型code(BASE——基础建设施建设项目；INDUSTRY——园区产业项目；)
	 * @param proStatus 项目建设状态(PROSTATUS_A——拟建;PROSTATUS_B——在建;PROSTATUS_C——竣工；)
	 * @param pageStart 分页起始参数
	 * @param gardenId 园区id
	 * @param num 读取条数
	 * @return List<Map<String,Object>>
	 */
	public List<Map<String,Object>> getGardenProject(String gardenId,String status,String proStatus,int pageStart,int num);
	
	
	/**
	 * 根据id查询园区项目详情
	 * @param projectId 园区项目id
	 * @return Map<String,Object>
	 */
	public Map<String,Object> getGardenProjectDetail(String projectId);
	
}
