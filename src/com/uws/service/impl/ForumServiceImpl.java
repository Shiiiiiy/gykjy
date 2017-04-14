package com.uws.service.impl;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.uws.dao.CompanyInfoDao;
import com.uws.dao.ForumDao;
import com.uws.model.DemandSupplyModel;
import com.uws.model.ProvideSupplyModel;
import com.uws.service.ForumService;


@Service
public class ForumServiceImpl implements ForumService{
	@Resource
	private ForumDao forumDao;
	/**
	 * 增加一个 DemandSupply 需求供应 实体
	 * @param param DemandSupply实体
	 * @return void
	 */
	@Override
	public void addDemandSupply(DemandSupplyModel param) {
		this.forumDao.addDemandSupply(param);
	}
	/**
	 * 通过id 查询一个 DemandSupply 需求供应 实体
	 * @param id 
	 * @return Map<String, Object>
	 */
	@Override
	public Map<String, Object> getDemandSupplyById(String id) {
		return this.forumDao.getDemandSupplyById(id);
	}
	/**
	 * 增加一个 ProvideSupply 供应 实体
	 * @param param ProvideSupply 实体
	 * @return void
	 */
	@Override
	public void addProvideSupply(ProvideSupplyModel param) {
		this.forumDao.addProvideSupply(param);
		
	}
	/**
	 * 通过id 查询一个 ProvideSupply 供应 实体
	 * @param id 
	 * @return Map<String, Object>
	 */
	@Override
	public Map<String, Object> getProvideSupplyById(String id) {
		return this.forumDao.getProvideSupplyById(id);
	}

}
