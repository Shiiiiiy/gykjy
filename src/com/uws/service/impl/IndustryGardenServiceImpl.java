package com.uws.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.uws.dao.IndustryGardenDao;
import com.uws.service.IndustryGardenService;
/**
 * 产业或园区信息查询service实现类
 * @author hejin
 *
 */
@Service("industryGardenService")
public class IndustryGardenServiceImpl implements IndustryGardenService{

	@Resource(name="industryGardenDao")
	private IndustryGardenDao industryGardenDao;
	
	/**
	 * 查询所有产业或园区列表
	 * @param igType 类型(INDUSTRY——产业；GARDEN——园区；)
	 * @param industryType 产业类型
	 * @return List<Map<String,Object>>
	 */
	@Override
	public List<Map<String, Object>> getIndustryGardenList(String igType,String industryType) {
		// TODO Auto-generated method stub
		return industryGardenDao.getIndustryGardenList(igType,industryType);
	}

	/**
	 * 查询产业或园区详情信息
	 * @param id 产业或园区id
	 * @return Map<String,Object>
	 */
	@Override
	public Map<String, Object> getIndustryGardenDetail(String id) {
		// TODO Auto-generated method stub
		return industryGardenDao.getIndustryGardenDetail(id);
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
	public List<Map<String, Object>> getGardenProject(String gardenId,
			String status, String proStatus, int pageStart, int num) {
		// TODO Auto-generated method stub
		return industryGardenDao.getGardenProject(gardenId, status, proStatus, pageStart, num);
	}

	/**
	 * 根据id查询园区项目详情
	 * @param projectId 园区项目id
	 * @return Map<String,Object>
	 */
	@Override
	public Map<String, Object> getGardenProjectDetail(String projectId) {
		// TODO Auto-generated method stub
		return industryGardenDao.getGardenProjectDetail(projectId);
	}

}
