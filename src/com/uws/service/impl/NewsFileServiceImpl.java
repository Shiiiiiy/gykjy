package com.uws.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.uws.dao.NewsFileDao;
import com.uws.service.NewsFileService;
/**
 * 新闻资讯、政策、动态、文件查询service实现类
 * @author hejin
 *
 */
@Service("NewsFileService")
public class NewsFileServiceImpl implements NewsFileService{

	@Resource(name="newsFileDao")
	private NewsFileDao newsFileDao;
	/**
	   * 查询新闻信息列表
	   * @param moduleCode 新闻模块编码(参见字段注释)
	   * @param parentCode 新闻父编码
	   * @param moduleType 新闻类型(参见字段注释)
	   * @param  pageStart 分页起始参数,无需分页时，可传入0
	   * @param  pageEnd   分页截止参数,无需分页时，可传入0
	   * @return List<Map<String,Object>>
	   */
	@Override
	public List<Map<String,Object>> getNews(String moduleCode,String parentCode,String moduleType,int pageStart,int pageEnd){
		
		
		return newsFileDao.getNews(moduleCode, parentCode, moduleType, pageStart, pageEnd);
	}
    /**
     * 查询文件图片信息列表
	   * @param moduleCode 模块编码(参见字段注释)
	   * @param parentCode 父编码
	   * @param fileType 文件类型(参见字段注释)
	   * @param  pageStart 分页起始参数,无需分页时，可传入0
	   * @param  pageEnd   分页截止参数,无需分页时，可传入0
	   * @return List<Map<String,Object>>
	   */
	@Override
	public List<Map<String,Object>> getFiles(String moduleCode,String parentCode,String fileType,int pageStart,int pageEnd){
		
		return newsFileDao.getFiles(moduleCode, parentCode, fileType, pageStart, pageEnd);
	}
    /**
     * 查询新闻信息详情
	   * @param newsId 新闻id
	   * @return Map<String,Object>
	   */
	@Override
	public Map<String,Object> getNewsDetail(String  newsId){
		
		return newsFileDao.getNewsDetail(newsId);
	}
    /**
     * 查询上一条新闻信息详情
	   * @param moduleCode code值
	   * @param parentCode code值
	   * @param moduleType 值
	   * @param newsOne 当前新闻实体
	   * @return Map<String,Object>
	   */
	@Override
	public Map<String, Object> getPreNews(String moduleCode, String parentCode,
			String moduleType, Map<String, Object> newsOne) {
		return newsFileDao.getPreNews(moduleCode,parentCode,moduleType,newsOne);
	}
    /**
     * 查询下一条新闻信息详情
	   * @param moduleCode code值
	   * @param parentCode code值
	   * @param moduleType 值
	   * @param newsOne 当前新闻实体
	   * @return Map<String,Object>
	   */
	@Override
	public Map<String, Object> getNextNews(String moduleCode,
			String parentCode, String moduleType, Map<String, Object> newsOne) {
		return newsFileDao.getNextNews(moduleCode,parentCode,moduleType,newsOne);
	}
}
