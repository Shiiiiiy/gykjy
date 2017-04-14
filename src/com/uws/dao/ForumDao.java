package com.uws.dao;

import java.util.Map;

import com.uws.model.DemandSupplyModel;
import com.uws.model.ProvideSupplyModel;

/**
 * Forum 对接服务 Dao接口
 * @author 王骏
 */
public interface ForumDao {
	/**
	 * 增加一个 DemandSupply 需求供应 实体
	 * @param param DemandSupply实体
	 * @return void
	 */
	public void addDemandSupply(DemandSupplyModel param);
	/**
	 * 通过id 查询一个 DemandSupply 需求供应 实体
	 * @param id 
	 * @return Map<String, Object>
	 */
	public Map<String, Object> getDemandSupplyById(String id);
	/**
	 * 增加一个 ProvideSupply 供应 实体
	 * @param param ProvideSupply 实体
	 * @return void
	 */
	public void addProvideSupply(ProvideSupplyModel param);
	/**
	 * 通过id 查询一个 ProvideSupply 供应 实体
	 * @param id 
	 * @return Map<String, Object>
	 */
	public Map<String, Object> getProvideSupplyById(String id);
}
