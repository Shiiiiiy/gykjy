package com.uws.service;

import java.util.List;
import java.util.Map;
/**
 * 新闻资讯、政策、动态、文件查询service接口
 * @author hejin
 *
 */
public interface NewsFileService {
	
	
	/**
	   * 查询新闻信息列表
	   * @param moduleCode 新闻模块编码(参见字段注释)
	   * @param parentCode 新闻父编码
	   * @param moduleType 新闻类型(参见字段注释)
	   * @param  pageStart 分页起始参数,无需分页时，可传入0
	   * @param  pageEnd   分页截止参数,无需分页时，可传入0
	   * @return List<Map<String,Object>>
	   */
    public List<Map<String,Object>> getNews(String moduleCode,String parentCode,String moduleType,int pageStart,int pageEnd);
    
    /**
     * 查询文件图片信息列表
	   * @param moduleCode 模块编码(参见字段注释)
	   * @param parentCode 父编码
	   * @param fileType 文件类型(参见字段注释)
	   * @param  pageStart 分页起始参数,无需分页时，可传入0
	   * @param  pageEnd   分页截止参数,无需分页时，可传入0
	   * @return List<Map<String,Object>>
	   */
    public List<Map<String,Object>> getFiles(String moduleCode,String parentCode,String fileType,int pageStart,int pageEnd);
    
    /**
     * 查询新闻信息详情
	   * @param newsId 新闻id
	   * @return Map<String,Object>
	   */
    public Map<String,Object> getNewsDetail(String  newsId);
    /**
     * 查询上一条新闻信息详情
	   * @param moduleCode code值
	   * @param parentCode code值
	   * @param moduleType 值
	   * @param newsOne 当前新闻实体
	   * @return Map<String,Object>
	   */
	public Map<String, Object> getPreNews(String moduleCode, String parentCode,String moduleType, Map<String, Object> newsOne);
    /**
     * 查询下一条新闻信息详情
	   * @param moduleCode code值
	   * @param parentCode code值
	   * @param moduleType 值
	   * @param newsOne 当前新闻实体
	   * @return Map<String,Object>
	   */
	public Map<String, Object> getNextNews(String moduleCode, String parentCode, String moduleType, Map<String, Object> newsOne);
	
	
	
	
	
}
