package com.uws.dao.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.uws.dao.ProductInfoDao;
/**
 *  产品信息查询dao实现类
 * @author hejin
 *
 */
@Repository("ProductInfoDao")
public class ProductInfoDaoImpl implements ProductInfoDao{
      
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	/**
	 * 查询所有产品总数
	 * @return int 
	 */
	@Override
	public int getProductCount(){
		
		return jdbcTemplate.queryForInt(" SELECT COUNT(*) FROM PRODUCT_INFO ");
	}
	
	/**
     * 查询某个产的产品列表
     * @param productIndu 产品所属产业id
     * @param pageStart 分页起始参数
     * @param num  读取条数
     * @return List<Map<String,Object>>
     */
	@Override
	public List<Map<String,Object>> getProductList(String productIndu,int pageStart,int num){
		
		StringBuffer sql=new StringBuffer(" SELECT C.*,N.* FROM PRODUCT_INFO N LEFT JOIN COMPANY_INFO C ON N.PRODUCT_COMP=C.ID  WHERE 1=1 ");
        List<Object> values=new ArrayList();
        
		if(!"".equals(productIndu) && productIndu!=null ){
			sql.append(" AND N.PRODUCT_INDU=? ");
			values.add(productIndu);
		}
		
		sql.append(" ORDER BY N.CREATE_TIME DESC ");
		
		if(pageStart>=0 && num>0){
			sql.append(" LIMIT ?,? ");
			values.add(pageStart);
			values.add(num);
		}
		
		List<Map<String,Object>> list=jdbcTemplate.queryForList(sql.toString(), values.toArray());
		
		
		return list;
	}
	
	/**
	 * 根据企业信息id查询该企业产品列表
	 * @param compId 企业信息id
	 * @return
	 */
	@Override
	public List<Map<String,Object>> getProductListByCompId(String compId){
		
		StringBuffer sql=new StringBuffer(" SELECT N.* FROM FILE_INFO N  WHERE 1=1 ");
        List<Object> values=new ArrayList();
        
		if(!"".equals(compId) && compId!=null ){
			sql.append(" AND N.PARENT_CODE=? AND N.MODULE_CODE IS NULL ");
			values.add(compId);
		}
		
		sql.append(" AND N.FILE_TYPE='FILE_PRO' ");
		
		//sql.append(" ORDER BY N.CREATE_TIME DESC ");
		//二期
		sql.append(" ORDER BY N.SORT ASC,N.CREATE_TIME DESC");
		List<Map<String,Object>> list=jdbcTemplate.queryForList(sql.toString(), values.toArray());
		
		
		return list;
	}
	
	/**
	 * 查询某个产业的产品总数
	 * @param productIndu 产品所属产业id
	 * @return
	 */
	@Override
    public int getProductCount(String productIndu){
		
		StringBuffer sql=new StringBuffer(" SELECT COUNT(*) FROM PRODUCT_INFO N WHERE 1=1 ");
        List<Object> values=new ArrayList();
        
		if(!"".equals(productIndu) && productIndu!=null ){
			sql.append(" AND N.PRODUCT_INDU=? ");
			values.add(productIndu);
		}
		
		
		return jdbcTemplate.queryForInt(sql.toString(), values.toArray());
	}
	
}
