package com.uws.service;
import java.util.List;
import java.util.Map;


/**
 * 对企业实体信息查询 的Service
 * @author wangjun
 * */
public interface CompanyInfoService {
	
	
	/**
	 * 查询 企业信息详情
	 * @param compId 企业id
	 * @return Map<String, Object>
	 * */
	public Map<String, Object> getCompInfo(String compId);
	

	/**
	 * 条件查询企业列表[分页]
	 * @param sql 为空字符串 即无条件查询
	 * @param params 参数
	 * @param pageStart 起始查询id
	 * @param pageEnd  查询数目
	 * @return List<Map<String, Object>>
	 * */
	public List<Map<String, Object>> getListComp(String sql,Object[] params,int pageStart,int pageEnd);

	/**
	 * 查询园区龙头企业或产业优质企业列表
	 * @param map 键是PROP_TYPE,值是PROP_VALUE
	 * @param pageStart 起始查询id
	 * @param pageEnd  查询数目
	 * @return List<Map<String, Object>>
	 * */
	public List<Map<String, Object>> getInduGardCompList(Map<String,String> map,int pageStart, int num);
	
	/**
	 * 查询企业数目
	 * @return int
	 * */
	public int getCompCount();
	
	/**
	 * 查询企业属性列表
	 * @param propType 属性类型
	 * @param propValue 属性值
	 * @return List<Map<String, Object>>
	 */
	public List<Map<String, Object>> getCompPropList(String propType, String propValue);
	
	
	/**
	 * 查询创新企业列表
	 * @param propType  属性类型
	 * @param propValue 属性值
	 * @param pageStart 分页起始值
	 * @param num 读取条数
	 * @param productName 产品名称
	 * @param productCapacity 产品产能
	 * @param productType 产品类型
	 * @return List<Map<String, Object>>
	 */
	public List<Map<String, Object>> getInnovateCompList(String propType,String propValue,String productName,String productCapacity,
			String productType,int pageStart, int num);
	/**
	 * 对企业实体的 高级搜索  4字段
	 * @param array  参数数组
	 * @param pageStart 分页起始值
	 * @param pageEnd 读取条数
	 * @return List<Map<String, Object>>
	 * */
	public List<Map<String, Object>> getListCompByParm(Object[] array,int pageStart, int pageEnd);
	/**
	 * 对企业实体的 查询推荐企业 logo表专用
	 * @param propType  值
	 * @param propValue  值
	 * @param pageStart 分页起始值
	 * @param pageEnd 读取条数
	 * @return List<Map<String, Object>>
	 * */
	public List<Map<String, Object>> getListCompRecommend(String propType, String propValue,int pageStart, int pageEnd);

	/**
	 * 条件查询企业列表[分页]
	 * @param sql 为空字符串 即无条件查询
	 * @param params 参数
	 * @param pageStart 起始查询id
	 * @param pageEnd  查询数目
	 * @return List<Map<String, Object>>
	 * */
	public List<Map<String, Object>> getListCompSearch(String sql,Object[] params,int pageStart,int pageEnd);

	
}
