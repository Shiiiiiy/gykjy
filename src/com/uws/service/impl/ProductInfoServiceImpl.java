package com.uws.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.uws.dao.ProductInfoDao;
import com.uws.service.ProductInfoService;
/**
 * 
 * @author hejin
 *
 */
@Service("productInfoService")
public class ProductInfoServiceImpl implements ProductInfoService  {

	@Resource(name="ProductInfoDao")
	private ProductInfoDao productInfoDao;
	/**
	 * 查询所有产品总数
	 * @return int 
	 */
	@Override
	public int getProductCount() {
		// TODO Auto-generated method stub
		return productInfoDao.getProductCount();
	}
    /**
     * 查询某个产的产品列表
     * @param productIndu 产品所属产业id
     * @param pageStart 分页起始参数
     * @param num  读取条数
     * @return List<Map<String,Object>>
     */
	@Override
	public List<Map<String, Object>> getProductList(String productIndu,
			int pageStart, int num) {
		// TODO Auto-generated method stub
		return productInfoDao.getProductList(productIndu, pageStart, num);
	}
	/**
	 * 查询某个产的产品总数
	 * @param productIndu 产品所属产业id
	 * @return int
	 */
	@Override
	public int getProductCount(String productIndu) {
		// TODO Auto-generated method stub
		return productInfoDao.getProductCount(productIndu);
	}
	/**
	 * 根据企业信息id查询该企业产品列表
	 * @param compId 企业信息id
	 * @return List<Map<String, Object>>
	 */
	@Override
	public List<Map<String, Object>> getProductListByCompId(String compId) {
		// TODO Auto-generated method stub
		return productInfoDao.getProductListByCompId(compId);
	}

}
