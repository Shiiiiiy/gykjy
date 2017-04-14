package com.uws.service;

import java.util.List;
import java.util.Map;

/**
 * 产品信息查询service接口
 * @author hejin
 *
 */
public interface ProductInfoService {
       
	
	/**
	 * 查询所有产品总数
	 * @return int 
	 */
	public int getProductCount();
	
    /**
     * 查询某个产的产品列表
     * @param productIndu 产品所属产业id
     * @param pageStart 分页起始参数
     * @param num  读取条数
     * @return List<Map<String,Object>>
     */
	public List<Map<String,Object>> getProductList(String productIndu,int pageStart,int num);
	
	/**
	 * 查询某个产的产品总数
	 * @param productIndu 产品所属产业id
	 * @return int
	 */
	public int getProductCount(String productIndu);
	
	
	/**
	 * 根据企业信息id查询该企业产品列表
	 * @param compId 企业信息id
	 * @return List<Map<String, Object>>
	 */
	public List<Map<String, Object>> getProductListByCompId(String compId);
	   
}
