package com.uws.controller;


import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import com.uws.service.NewsFileService;
/**
 * F5产业政策controller
 * @author hejin
 *
 */
@Controller
@RequestMapping("/policy")
public class PolicyController {
      

	@Resource(name="NewsFileService")
	private NewsFileService newsFileService;
	
	
	
	/**
	 * F5 产业政策首页
	 * @param request
	 * @return
	 */
	@RequestMapping("/index")
	public String index(HttpServletRequest request,Model model) {  
		//获取banner图片
		List<Map<String,Object>> bannerImages=newsFileService.getFiles("MODULE_I", "N", "FILE_BANNER", 0, 0);
	    model.addAttribute("bannerImages", (bannerImages==null || bannerImages.size()==0) ?null:bannerImages.get(0));
		
	    
	    //获取轮播图片
	    List<Map<String,Object>> sliderImages=newsFileService.getFiles("MODULE_I", "N", "FILE_SLIDER", 0, 0);
	    model.addAttribute("sliderImages",sliderImages);
	    
	    //政策动态列表
	    List<Map<String,Object>> newsList1=this.newsFileService.getNews("NEWS_E","N","N",0, 7);
	    model.addAttribute("newsList1",newsList1);
	    
	    //国家政策列表
	    List<Map<String,Object>> newsList2=this.newsFileService.getNews("NEWS_F","N","N",0, 7);
	    model.addAttribute("newsList2",newsList2);
	    
	    //省级政策列表
	    List<Map<String,Object>> newsList3=this.newsFileService.getNews("NEWS_G","N","N",0, 7);
	    model.addAttribute("newsList3",newsList3);
	    
	    //本市政策列表
	    List<Map<String,Object>> newsList4=this.newsFileService.getNews("NEWS_H","N","N",0, 7);
	    model.addAttribute("newsList4",newsList4);
	    
	    //政策解读列表
	    List<Map<String,Object>> newsList5=this.newsFileService.getNews("NEWS_I","N","N",0, 7);
	    model.addAttribute("newsList5",newsList5);
	    
	   
	    model.addAttribute("moduleCode","NEWS_E");
	    
	    return "policy/policy";  
	 }  
	
	
}
