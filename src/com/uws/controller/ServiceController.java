package com.uws.controller;


import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
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
import com.uws.service.LoginRegisterService;
import com.uws.service.NewsFileService;
import com.uws.service.ProductInfoService;
/**
 * 产业服务controller
 * @author hejin
 *
 */
@Controller
@RequestMapping("/industry")
public class ServiceController {

	@Resource(name="NewsFileService")
	private NewsFileService newsFileService;
	
	@Resource(name="industryGardenService")
	private IndustryGardenService industryGardenService;
	
	@Resource
	private CompanyInfoService companyInfoService;
	
	@Resource(name="productInfoService")
	private ProductInfoService productInfoService;
	
	@Resource(name="loginRegisterService")
	private LoginRegisterService loginRegisterService;
	
	
	/**
	 * F2  产业服务首页
	 * @param request
	 * @return
	 */
	@RequestMapping("/index")
	public String index(HttpServletRequest request,Model model) {  
		//获取banner图片
		List<Map<String,Object>> bannerImages=newsFileService.getFiles("MODULE_D", "N", "FILE_BANNER", 0, 0);
	    model.addAttribute("bannerImages", (bannerImages==null || bannerImages.size()==0) ?null:bannerImages.get(0));
		
	    //获取统计图表图片
	    List<Map<String,Object>> statistImages=newsFileService.getFiles("MODULE_D", "N", "FILE_STATISTICS", 0, 0);
	    model.addAttribute("statistImages",statistImages);
	    
	    //获取轮播图片
	    List<Map<String,Object>> sliderImages=newsFileService.getFiles("MODULE_D", "N", "FILE_SLIDER", 0, 0);
	    model.addAttribute("sliderImages",sliderImages);
	    
	    //最新产品列表
	    List<Map<String,Object>> newsList=this.newsFileService.getNews("NEWS_B","N","N",0, 7);
	    model.addAttribute("newsList",newsList);
	    
	    //获取工业产品产业列表
	    List<Map<String,Object>> industryList1=industryGardenService.getIndustryGardenList("INDUSTRY","INDUSTRY_A");
	    model.addAttribute("industryList1",industryList1);
	    
	    //获取生产服务产业列表
	    List<Map<String,Object>> industryList2=industryGardenService.getIndustryGardenList("INDUSTRY","INDUSTRY_B");
	    model.addAttribute("industryList2",industryList2);
	    model.addAttribute("moduleCode","NEWS_B");
	    
	    return "services/services";  
	 }  
	
	/**
	 * 进入每个产业查看详情
	 * @param request
	 * @param model
	 * @return String
	 */
	@RequestMapping("/getEveryIndustry")
	public String getEveryIndustry(HttpServletRequest request,Model model){
		
		String industryId=request.getParameter("industryId");
		//当前产业信息
		Map<String,Object> industry=industryGardenService.getIndustryGardenDetail(industryId);
		model.addAttribute("industry",industry);
		
		model.addAttribute("moduleCode","NEWS_B");
				
		//获取banner图片
		List<Map<String,Object>> bannerImages=newsFileService.getFiles("MODULE_D", industryId, "FILE_BANNER", 0, 0);
	    model.addAttribute("bannerImages", (bannerImages==null || bannerImages.size()==0) ?null:bannerImages.get(0));
		
	    //获取统计图表图片
	    List<Map<String,Object>> statistImages=newsFileService.getFiles("MODULE_D", industryId, "FILE_STATISTICS", 0, 0);
	    model.addAttribute("statistImages",statistImages);
	    
	    //获取轮播图片
	    List<Map<String,Object>> sliderImages=newsFileService.getFiles("MODULE_D", industryId, "FILE_SLIDER", 0, 0);
	    model.addAttribute("sliderImages",sliderImages);
	    
	    //最新产品列表
	    List<Map<String,Object>> newsList=this.newsFileService.getNews("NEWS_B",industryId,"N",0, 7);
	    model.addAttribute("newsList",newsList);
	    
	    //该行业的企业列表
	    List<Map<String,Object>> compList=companyInfoService.getInnovateCompList("PROP_E", industryId,"","","", 0, 7);
	    model.addAttribute("compList",compList);
	    //该行业的企业logo列表
	    //List<Map<String,Object>> compLogoList=companyInfoService.getInnovateCompList("PROP_E", industryId,"","", 0,0);
	    List<Map<String, Object>> compLogoList=this.companyInfoService.getListCompRecommend("PROP_E", industryId,0, 0);
	    model.addAttribute("compLogoList",compLogoList);
	    
	    //获取推广图片
	    List<Map<String,Object>> adList=newsFileService.getFiles("MODULE_D", industryId, "FILE_AD4", 0, 0);
	    model.addAttribute("adList",adList);
	    model.addAttribute("pageNo",0);
		return "services/everyService";
	}
	
	/**
	 * 加载更多企业列表
	 * @param request
	 * @param model
	 */
	@RequestMapping("/getMoreCompanies")
	public void getMoreCompanies(HttpServletRequest request,HttpServletResponse response,Model model){
		Integer pageNo=request.getParameter("pageNo")==null?0:Integer.parseInt(request.getParameter("pageNo"));
		String industryId=request.getParameter("industryId");
		String productName=request.getParameter("productName");
		String productCapacity=request.getParameter("productCapacity");
		String productType=request.getParameter("productType");
		boolean stat=true;
		
		//该行业的企业列表
	    List<Map<String,Object>> compList=companyInfoService.getInnovateCompList("PROP_E", industryId,productName,productCapacity,productType, (pageNo+1)*7, 7);
	   
	    if(compList==null || compList.size()==0){
	    	stat=false;
	    	
	    }else{
	    	for(int i=0;i<compList.size();i++){
	    		String CREATE_TIME="";
	    		if(compList.get(i).get("CREATE_TIME")!=null){
	    			CREATE_TIME = new SimpleDateFormat("yyyy-MM-dd").format(compList.get(i).get("CREATE_TIME")); 
				}
	    		compList.get(i).put("CREATE_TIME", CREATE_TIME);
	    	}
	    	
	    }
	    
		ObjectMapper mapper= new ObjectMapper();
		response.setCharacterEncoding("UTF-8");
		try {
			if(stat){
			     response.getWriter().write(mapper.writeValueAsString(compList));
			}else{
				 response.getWriter().write(mapper.writeValueAsString("nomore"));
			}
			
		}catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	
	/**
	 * 高级搜索企业列表
	 * @param request
	 * @param model
	 */
	@RequestMapping("/serchCompanies")
	public void serchCompanies(HttpServletRequest request,HttpServletResponse response,Model model){
		String industryId=request.getParameter("industryId");
		String productName=request.getParameter("productName");
		String productCapacity=request.getParameter("productCapacity");
		String productType=request.getParameter("productType");
		//System.out.println(productName+" "+productCapacity+" "+productType);
		boolean stat=true;
		
		//符合搜索条件的该行业的企业列表
	    List<Map<String,Object>> compList=companyInfoService.getInnovateCompList("PROP_E", industryId,productName,productCapacity,productType, 0, 7);
	   
	    if(compList==null || compList.size()==0){
	    	stat=false;
	    }else{
	    	for(int i=0;i<compList.size();i++){
	    		String CREATE_TIME="";
	    		if(compList.get(i).get("CREATE_TIME")!=null){
	    			CREATE_TIME = new SimpleDateFormat("yyyy-MM-dd").format(compList.get(i).get("CREATE_TIME")); 
				}
	    		compList.get(i).put("CREATE_TIME", CREATE_TIME);
	    	}
	    }
	    
		ObjectMapper mapper= new ObjectMapper();
		response.setCharacterEncoding("UTF-8");
		try {
			if(stat){
			     response.getWriter().write(mapper.writeValueAsString(compList));
			}else{
				 response.getWriter().write(mapper.writeValueAsString("nomore"));
			}
			
		}catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	
	
	/**
	 * 查询菜单节点列表
	 * @param request
	 * @param model
	 */
	@RequestMapping("/getProductTypeTree")
	public void getProductTypeTree(HttpServletRequest request,HttpServletResponse response){
		String parentCode=request.getParameter("id");
		List<Map<String,Object>> list=new ArrayList();
		//菜单节点列表
		List<Map<String,Object>> menuList=loginRegisterService.getDicListByParentCode(parentCode==null?"MENUTREE":parentCode);
		if(menuList!=null && menuList.size()>0){
			for(int i=0;i<menuList.size();i++){
				list=loginRegisterService.getDicListByParentCode((String)menuList.get(i).get("id"));
				if(list!=null && list.size()>0){
					menuList.get(i).put("isParent", true);
				}else{
					menuList.get(i).put("isParent", false);
				}
				
			}
		}
		
		ObjectMapper mapper= new ObjectMapper();
		response.setCharacterEncoding("UTF-8");
		try {
			 response.getWriter().write(mapper.writeValueAsString(menuList));
		}catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	
	
	
	
	/**
	 * 获取产品图片
	 * @param request
	 * @param response
	 * @param model
	 */
	@RequestMapping("/getProductImages")
	public void getProductImages(HttpServletRequest request,HttpServletResponse response){
		List<Map<String,Object>> compList=productInfoService.getProductListByCompId(request.getParameter("compId"));
		ObjectMapper mapper= new ObjectMapper();
		response.setCharacterEncoding("UTF-8");
		boolean stat=true;
		
		if(compList==null || compList.size()==0){
			
		    	stat=false;
		}
		try {
			if(stat){
				
			     response.getWriter().write(mapper.writeValueAsString(compList));
			}else{
				
				 response.getWriter().write(mapper.writeValueAsString("nomore"));
			}
			
		}catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 高级搜索
	 * @param request
	 * @param response
	 */
	@RequestMapping("/getCompAndProductList")
	public void getCompAndProductList(HttpServletRequest request,HttpServletResponse response){
		
		
	}
	  
}
