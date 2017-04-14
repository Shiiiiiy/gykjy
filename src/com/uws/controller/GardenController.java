package com.uws.controller;


import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import com.uws.service.CompanyInfoService;
import com.uws.service.IndustryGardenService;
import com.uws.service.NewsFileService;
import com.uws.service.ProductInfoService;
/**
 * F3产业园区controller
 * @author hejin
 *
 */
@Controller
@RequestMapping("/garden")
public class GardenController {
      

	@Resource(name="NewsFileService")
	private NewsFileService newsFileService;
	
	@Resource(name="industryGardenService")
	private IndustryGardenService industryGardenService;
	
	@Resource
	private CompanyInfoService companyInfoService;
	
	@Resource(name="productInfoService")
	private ProductInfoService productInfoService;
	
	
	/**
	 * F2  产业园区首页
	 * @param request
	 * @return
	 */
	@RequestMapping("/index")
	public String index(HttpServletRequest request,Model model) {  
		//获取banner图片
		List<Map<String,Object>> bannerImages=newsFileService.getFiles("MODULE_F", "N", "FILE_BANNER", 0, 0);
	    model.addAttribute("bannerImages", (bannerImages==null || bannerImages.size()==0) ?null:bannerImages.get(0));
		
	    //获取统计图表图片
	    List<Map<String,Object>> statistImages=newsFileService.getFiles("MODULE_F", "N", "FILE_STATISTICS", 0, 0);
	    model.addAttribute("statistImages",statistImages);
	    
	    //获取轮播图片
	    List<Map<String,Object>> sliderImages=newsFileService.getFiles("MODULE_F", "N", "FILE_SLIDER", 0, 0);
	    model.addAttribute("sliderImages",sliderImages);
	    
	    //园区动态列表
	    List<Map<String,Object>> newsList=this.newsFileService.getNews("NEWS_L","N","GARDEN_A",0, 7);
	    model.addAttribute("newsList",newsList);
	    
	    //获取园区列表
	    List<Map<String,Object>> gardenList=industryGardenService.getIndustryGardenList("GARDEN","");
	    model.addAttribute("gardenList",gardenList);
	    
	    model.addAttribute("moduleCode","NEWS_L");
	    
	    return "garden/garden";  
	 }  
	
	/**
	 * 进入每个园区查看详情
	 * @param request
	 * @param model
	 * @return String
	 */
	@RequestMapping("/getEveryGarden")
	public String getEveryGarden(HttpServletRequest request,Model model){
		
		String gardenId=request.getParameter("gardenId");
		//当前园区信息
		Map<String,Object> garden=industryGardenService.getIndustryGardenDetail(gardenId);
		model.addAttribute("garden",garden);
		
		model.addAttribute("moduleCode","NEWS_L");
				
		//获取banner图片
		List<Map<String,Object>> bannerImages=newsFileService.getFiles("MODULE_F", gardenId, "FILE_BANNER", 0, 0);
	    model.addAttribute("bannerImages", (bannerImages==null || bannerImages.size()==0) ?null:bannerImages.get(0));
		
	    //获取统计图表图片
	    List<Map<String,Object>> statistImages=newsFileService.getFiles("MODULE_F", gardenId, "FILE_STATISTICS", 0, 0);
	    model.addAttribute("statistImages",statistImages);
	    
	    //获取轮播图片
	    List<Map<String,Object>> sliderImages=newsFileService.getFiles("MODULE_F", gardenId, "FILE_SLIDER", 0, 0);
	    model.addAttribute("sliderImages",sliderImages);
	    
	    //园区动态列表
	    List<Map<String,Object>> newsList=this.newsFileService.getNews("NEWS_L",gardenId,"GARDEN_A",0, 7);
	    model.addAttribute("newsList",newsList);
	    //园区政策列表
	    List<Map<String,Object>> policyList=this.newsFileService.getNews("NEWS_L",gardenId,"GARDEN_B",0, 10);//这个必须10条
	    model.addAttribute("policyList",policyList);
	    
	    Map<String,String> map=new HashMap();
	    map.put("PROP_D", gardenId);
	    map.put("PROP_B", "");
	    //该园区的龙头企业列表
	    List<Map<String,Object>> compList=newsFileService.getFiles("MODULE_F", gardenId, "COMP_A", 0,0);
	    model.addAttribute("compList",compList);
	    
	    //经济运行分析报告列表
	    List<Map<String,Object>> reportList=newsFileService.getFiles("MODULE_F", gardenId, "FILE_A", 0, 7);
	    model.addAttribute("reportList",reportList);
	    
	    //获取推广图片
	    List<Map<String,Object>> adList=newsFileService.getFiles("MODULE_F", gardenId, "FILE_AD6", 0, 0);
	    model.addAttribute("adList",adList);
	    
	    //获取园区基础设施建设项目  拟建
	    List<Map<String,Object>> projectList1=industryGardenService.getGardenProject(gardenId, "BASE", "PROSTATUS_A", 0, 5);
	    model.addAttribute("projectList1",projectList1);
	    //获取园区基础设施建设项目  在建
	    List<Map<String,Object>> projectList2=industryGardenService.getGardenProject(gardenId, "BASE", "PROSTATUS_B", 0, 5);
	    model.addAttribute("projectList2",projectList2);
	    //获取园区基础设施建设项目  完工
	    List<Map<String,Object>> projectList3=industryGardenService.getGardenProject(gardenId, "BASE", "PROSTATUS_C", 0, 5);
	    model.addAttribute("projectList3",projectList3);
	    //获取园区产业项目  拟建
	    List<Map<String,Object>> projectList4=industryGardenService.getGardenProject(gardenId, "INDUSTRY", "PROSTATUS_A", 0, 5);
	    model.addAttribute("projectList4",projectList4);
	    //获取园区产业项目  在建
	    List<Map<String,Object>> projectList5=industryGardenService.getGardenProject(gardenId, "INDUSTRY", "PROSTATUS_B", 0, 5);
	    model.addAttribute("projectList5",projectList5);
	    //获取园区产业项目  完工
	    List<Map<String,Object>> projectList6=industryGardenService.getGardenProject(gardenId, "INDUSTRY", "PROSTATUS_C", 0, 5);
	    model.addAttribute("projectList6",projectList6);
	    
	    
		return "garden/everyGarden";
	}
	
	
	/**
	 * 加载更多园区项目列表
	 * @param request
	 * @param model
	 */
	@RequestMapping("/getMoreProject")
	public void getMoreProject(HttpServletRequest request,HttpServletResponse response){
		Integer pageNo=request.getParameter("pageNo")==null?0:Integer.parseInt(request.getParameter("pageNo"));
		String gardenId=request.getParameter("gardenId");
		//项目类型
		String projectType=request.getParameter("projectType");
		//项目状态
		String projectStatus=request.getParameter("projectStatus");
		boolean stat=true;
		
		//园区项目列表
	    List<Map<String,Object>> projectList=industryGardenService.getGardenProject(gardenId, projectType, projectStatus, (pageNo+1)*10, 10);
	 
	    if(projectList!=null && projectList.size()>0){
			for (int i = 0; i < projectList.size(); i++) {
				String PRO_TIME=null;
				String PRO_OVERTIME=null;
				if(projectList.get(i).get("PRO_TIME")!=null){
					PRO_TIME = new SimpleDateFormat("yyyy-MM-dd").format(projectList.get(i).get("PRO_TIME")); 
				}
				if(projectList.get(i).get("PRO_OVERTIME")!=null){
					PRO_OVERTIME = new SimpleDateFormat("yyyy-MM-dd").format(projectList.get(i).get("PRO_OVERTIME")); 
				}
				projectList.get(i).put("PRO_TIME", PRO_TIME);
				projectList.get(i).put("PRO_OVERTIME", PRO_OVERTIME);
			}
		}else{
			stat=false;
		}
	    
		ObjectMapper mapper= new ObjectMapper();
		response.setCharacterEncoding("UTF-8");
		try {
			if(stat){
			     response.getWriter().write(mapper.writeValueAsString(projectList));
			}else{
				 response.getWriter().write(mapper.writeValueAsString("nomore"));
			}
			
		}catch (IOException e) {
			e.printStackTrace();
		}
		
		
	}
	
	
	/**
	 * 加载园区项目列表页面
	 * @param request
	 * @param response
	 * @param model
	 */
	@RequestMapping("/getMoreProjectList")
	public String getMoreProjectList(HttpServletRequest request,Model model){
		String gardenId=request.getParameter("gardenId");
		//项目类型
		String projectType=request.getParameter("projectType");
		//项目状态
		String projectStatus=request.getParameter("projectStatus");
		
		String url1=request.getParameter("url1");
		model.addAttribute("url1",url1);
		
		//当前园区信息
		Map<String,Object> garden=industryGardenService.getIndustryGardenDetail(gardenId);
		model.addAttribute("garden",garden);
		
		model.addAttribute("moduleCode","NEWS_L");
		
		//获取banner图片
		List<Map<String,Object>> bannerImages=newsFileService.getFiles("MODULE_F", gardenId, "FILE_BANNER", 0, 0);
	    model.addAttribute("bannerImages", (bannerImages==null || bannerImages.size()==0) ?null:bannerImages.get(0));
		
		
		//获取推广图片
	    List<Map<String,Object>> adImages=newsFileService.getFiles("MODULE_F", gardenId, "FILE_AD6", 0, 0);
	    model.addAttribute("adImages",adImages);
		
	    //园区项目列表
	    List<Map<String,Object>> projectList=industryGardenService.getGardenProject(gardenId, projectType, projectStatus, 0, 10);
	    model.addAttribute("projectList",projectList);
	    
	    model.addAttribute("projectType",projectType);
	    model.addAttribute("projectStatus",projectStatus);
	    model.addAttribute("pageNo",0);
	    
		return "garden/projectList";
	}
	
	  
	
	
	
}
