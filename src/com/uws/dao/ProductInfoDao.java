package com.uws.dao;
import java.util.*;


/**
 * 产品信息查询dao接口
 * @author hejin
 *
 */
public interface ProductInfoDao {
       
	
	
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
	 * 查询某个产业的产品总数
	 * @param productIndu 产品所属产业id
	 * @return
	 */
	public int getProductCount(String productIndu);

	/**
	 * 根据企业信息id查询该企业产品列表
	 * @param compId 企业信息id
	 * @return
	 */
	public List<Map<String, Object>> getProductListByCompId(String compId);
	
}
