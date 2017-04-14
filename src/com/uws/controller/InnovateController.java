package com.uws.controller;


import java.io.IOException;
import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
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
import com.uws.service.InnovateService;
import com.uws.service.NewsFileService;
import com.uws.service.ProductInfoService;
import com.uws.util.Util;
/**
 * F4创新创业controller
 * @author hejin
 *
 */
@Controller
@RequestMapping("/innovate")
public class InnovateController {

	@Resource(name="NewsFileService")
	private NewsFileService newsFileService;
	
	@Resource(name="industryGardenService")
	private IndustryGardenService industryGardenService;
	
	@Resource
	private CompanyInfoService companyInfoService;
	
	@Resource(name="productInfoService")
	private ProductInfoService productInfoService;
	
	@Resource(name="innovateService")
	private InnovateService innovateService;
	
	/**
	 * F6 创新创业首页
	 * @param request
	 * @return
	 */
	@RequestMapping("/index")
	public String index(HttpServletRequest request,Model model) {  
		//获取banner图片
		List<Map<String,Object>> bannerImages=newsFileService.getFiles("MODULE_H", "N", "FILE_BANNER", 0, 0);
	    model.addAttribute("bannerImages", (bannerImages==null || bannerImages.size()==0) ?null:bannerImages.get(0));
		
	    //获取统计图表图片
	    List<Map<String,Object>> statistImages=newsFileService.getFiles("MODULE_H", "N", "FILE_STATISTICS", 0, 0);
	    model.addAttribute("statistImages",statistImages);
	    
	    //获取轮播图片
	    List<Map<String,Object>> sliderImages=newsFileService.getFiles("MODULE_H", "N", "FILE_SLIDER", 0, 0);
	    model.addAttribute("sliderImages",sliderImages);
	    
	    //创新创业动态列表
	    List<Map<String,Object>> newsList=this.newsFileService.getNews("NEWS_D","N","N",0, 7);
	    model.addAttribute("newsList",newsList);
	    
	    //获取创新创业平台列表
	    List<Map<String,Object>> platformList=newsFileService.getFiles("MODULE_H", "N", "LOGO_A", 0, 0);
	    model.addAttribute("platformList",platformList);
	    
	    //获取产业金融环境列表
	    List<Map<String,Object>> financeList=newsFileService.getFiles("MODULE_H", "N", "LOGO_B", 0, 0);
	    model.addAttribute("financeList",financeList);
	    
	    
	    //获取创新示范企业列表
	    List<Map<String,Object>> innovateCompList=companyInfoService.getInnovateCompList("PROP_A", "", "","","",0,0);
	    model.addAttribute("innovateCompList",innovateCompList);
	    
	    //获取领军人物列表
	    List<Map<String,Object>> leaderManList=innovateService.getExcellentPersonList("", "1", 0, 0);
	    model.addAttribute("leaderManList",leaderManList);
	    
	    
	    model.addAttribute("moduleCode","NEWS_D");
	    
	    return "innovate/innovate";  
	 }  
	
	
	
	
	
	/**
	 * 点击更多进入创新创业平台列表页
	 * @param request
	 * @param model
	 * @return String
	 */
	@RequestMapping("/getPlatformList")
	public String getPlatformList(HttpServletRequest request,Model model){
		
		//获取创新创业平台列表
	    List<Map<String,Object>> platformList=innovateService.getImmovateList("INNOVATE_PLATFORM", 0, 10);
	    model.addAttribute("platformList",platformList);
		
		model.addAttribute("moduleCode","NEWS_D");
				
		//获取banner图片 
		//List<Map<String,Object>> bannerImages=newsFileService.getFiles("MODULE_L", "N", "FILE_BANNER", 0, 0);
		List<Map<String,Object>> bannerImages=newsFileService.getFiles("MODULE_H", "N", "FILE_BANNER", 0, 0);
	    model.addAttribute("bannerImages", (bannerImages==null || bannerImages.size()==0) ?null:bannerImages.get(0));
		
	    //获取推广图片
	    List<Map<String,Object>> adList=newsFileService.getFiles("MODULE_H", "N", "FILE__AD8", 0, 0);
	    //List<Map<String,Object>> adList=newsFileService.getFiles("", "", "FILE_AD3", 0, 0);
	    model.addAttribute("adList",adList);
	    
	    model.addAttribute("pageNo",0);
	    
		return "innovate/platformList";
	}
	
	
	/**
	 * 点击更多进入产业金融环境列表页
	 * @param request
	 * @param model
	 * @return String
	 */
	@RequestMapping("/getFinanceList")
	public String getFinanceList(HttpServletRequest request,Model model){
		
		//获取产业金融环境列表
	    List<Map<String,Object>> financeList=innovateService.getImmovateList("FINANCE_ENVIRONMENT", 0, 10);
	    if(financeList!=null && financeList.size()>0){
		    for (int i = 0; i < financeList.size(); i++) {
				String SCALE="";
				if(financeList.get(i).get("SCALE")!=null){
					NumberFormat nf = NumberFormat.getCurrencyInstance();
					String str=(String)financeList.get(i).get("SCALE");
					if(!Util.isNull(str)){//产业金融环境1
						SCALE = nf.format(Double.parseDouble(str)); 
						
					}
					
				}
				
				financeList.get(i).put("SCALE", SCALE);
			}
	    }
	    model.addAttribute("financeList",financeList);
		
		model.addAttribute("moduleCode","NEWS_D");
				
		//获取banner图片
		//List<Map<String,Object>> bannerImages=newsFileService.getFiles("MODULE_M", "N", "FILE_BANNER", 0, 0);
		List<Map<String,Object>> bannerImages=newsFileService.getFiles("MODULE_H", "N", "FILE_BANNER", 0, 0);
	    model.addAttribute("bannerImages", (bannerImages==null || bannerImages.size()==0) ?null:bannerImages.get(0));
		
	    //获取推广图片
	    List<Map<String,Object>> adList=newsFileService.getFiles("MODULE_M", "N", "FILE__AD8", 0, 0);
	    //List<Map<String,Object>> adList=newsFileService.getFiles("", "", "FILE_AD3", 0, 0);
	    model.addAttribute("adList",adList);
	    
	    model.addAttribute("pageNo",0);
	    
		return "innovate/financeList";
	}
	
	
	
	/**
	 * 点击更多进入创新创业成果列表页
	 * @param request
	 * @param model
	 * @return String
	 */
	@RequestMapping("/getInnovateResultList")
	public String getInnovateResultList(HttpServletRequest request,Model model){
		
		//获取年度新增创新企业名录列表
	    List<Map<String,Object>> compList1=innovateService.getImmovateList("NEW_COMPANIES", 0, 10);
	    if(compList1!=null && compList1.size()>0){
		    for (int i = 0; i < compList1.size(); i++) {
				String SCALE="";
				if(compList1.get(i).get("SCALE")!=null){
					NumberFormat nf = NumberFormat.getCurrencyInstance();
					String str=(String)compList1.get(i).get("SCALE");
					if(!Util.isNull(str)){//创新企业名录列表 2
						SCALE = nf.format(Double.parseDouble(str)); 
						
					}
					
					compList1.get(i).put("SCALE", SCALE);
				}
				
				
			}
	    }
	    model.addAttribute("compList1",compList1);
	    //获取年度成功引入风险投资企业名录列表
	    List<Map<String,Object>> compList2=innovateService.getImmovateList("INVEST_COMPANIES", 0, 10);
	    if(compList2!=null && compList2.size()>0){
		    for (int i = 0; i < compList2.size(); i++) {
				String SCALE="";
				if(compList2.get(i).get("SCALE")!=null){
					NumberFormat nf = NumberFormat.getCurrencyInstance();
					String str=(String)compList2.get(i).get("SCALE");
					if(!Util.isNull(str)){
						SCALE = nf.format(Double.parseDouble(str)); 
						
					}
					
				}
				
				compList2.get(i).put("SCALE", SCALE);
			}
	    }
	    model.addAttribute("compList2",compList2);
	    //获取年度新增上市企业名录列表
	    List<Map<String,Object>> compList3=innovateService.getImmovateList("MARKET_COMPANIES", 0, 10);
	    model.addAttribute("compList3",compList3);
	    
		
		model.addAttribute("moduleCode","NEWS_D");
				
		//获取banner图片
		//List<Map<String,Object>> bannerImages=newsFileService.getFiles("MODULE_N", "N", "FILE_BANNER", 0, 0);
		List<Map<String,Object>> bannerImages=newsFileService.getFiles("MODULE_H", "N", "FILE_BANNER", 0, 0);
	    model.addAttribute("bannerImages", (bannerImages==null || bannerImages.size()==0) ?null:bannerImages.get(0));
		
	    //获取推广图片
	    List<Map<String,Object>> adList=newsFileService.getFiles("MODULE_N", "N", "FILE__AD8", 0, 0);
	    model.addAttribute("adList",adList);
	    
	    model.addAttribute("pageNo",0);
	    
		return "innovate/innovateResultList";
	}
	
	
	
	/**
	 * 点击更多进入创新示范企业列表页
	 * @param request
	 * @param model
	 * @return String
	 */
	@RequestMapping("/getInnovateCompList")
	public String getInnovateCompList(HttpServletRequest request,Model model){
		
		//获取创新示范企业列表
	    //List<Map<String,Object>> compList=companyInfoService.getInnovateCompList("PROP_A", "", "","","",0,10);
	    List<Map<String,Object>> compList=innovateService.getImmovateList("INNOV_BUSINESS",0,10);
	    model.addAttribute("compList",compList);
	   
		
		model.addAttribute("moduleCode","NEWS_D");
				
		//获取banner图片
		//List<Map<String,Object>> bannerImages=newsFileService.getFiles("MODULE_O", "N", "FILE_BANNER", 0, 0);
		List<Map<String,Object>> bannerImages=newsFileService.getFiles("MODULE_H", "N", "FILE_BANNER", 0, 0);
	    model.addAttribute("bannerImages", (bannerImages==null || bannerImages.size()==0) ?null:bannerImages.get(0));
		
	    //获取推广图片
	    List<Map<String,Object>> adList=newsFileService.getFiles("MODULE_O", "N", "FILE__AD8", 0, 0);
	    //List<Map<String,Object>> adList=newsFileService.getFiles("", "", "FILE_AD3", 0, 0);
	    model.addAttribute("adList",adList);
	    
	    model.addAttribute("pageNo",0);
	    
		return "innovate/innovateCompList";
	}
	
	
	/**
	 * 点击加载更多获取列表（各列表通用）
	 * @param request
	 * @param model
	 */
	@RequestMapping("/getMoreTableList")
	public void getMoreTableList(HttpServletRequest request,HttpServletResponse response){
		Integer pageNo=request.getParameter("pageNo")==null?0:Integer.parseInt(request.getParameter("pageNo"));
		String flag=request.getParameter("flag");
		List<Map<String,Object>> resultList=new ArrayList();
		boolean stat=true;
		
		if("A".equals(flag)){//创新创业平台列表
			resultList=innovateService.getImmovateList("INNOVATE_PLATFORM", (pageNo+1)*10, 10);
			if(resultList!=null && resultList.size()>0){
				for (int i = 0; i < resultList.size(); i++) {
					String PLAT_TIME ="";
					if(resultList.get(i).get("PLAT_TIME")!=null){
					     PLAT_TIME = new SimpleDateFormat("yyyy-MM-dd").format(resultList.get(i).get("PLAT_TIME")); 
					}
					resultList.get(i).put("PLAT_TIME", PLAT_TIME);
				}
			}else{
				stat=false;
			}
		}else if("B".equals(flag)){//产业金融环境列表
			resultList=innovateService.getImmovateList("FINANCE_ENVIRONMENT", (pageNo+1)*10, 10);
			if(resultList==null || resultList.size()==0){
				stat=false;
			}else{
				for (int i = 0; i < resultList.size(); i++) {
					String SCALE="";
					if(resultList.get(i).get("SCALE")!=null){
						NumberFormat nf = NumberFormat.getCurrencyInstance();
						String str=(String)resultList.get(i).get("SCALE");
						if(!Util.isNull(str)){ //产业金融环境 3
							SCALE = nf.format(Double.parseDouble(str)); 
							
						}
						
					}
					
					resultList.get(i).put("SCALE", SCALE);
				}
				
			}
		}else if("C".equals(flag)){//年度新增创新企业名录列表
			resultList=innovateService.getImmovateList("NEW_COMPANIES", (pageNo+1)*10, 10);
			
			
			if(resultList==null || resultList.size()==0){
				
				stat=false;
				
			}else{
				for (int i = 0; i < resultList.size(); i++) {
					String SCALE="";
					if(resultList.get(i).get("SCALE")!=null){
						NumberFormat nf = NumberFormat.getCurrencyInstance();
						
						String str=(String)resultList.get(i).get("SCALE");
						if(!Util.isNull(str)){//创新企业名录列表 4
							SCALE = nf.format(Double.parseDouble(str)); 
							
						}
						
					}
					
					resultList.get(i).put("SCALE", SCALE);
				}
			}
		}else if("D".equals(flag)){//获取年度成功引入风险投资企业名录列表
			resultList=innovateService.getImmovateList("INVEST_COMPANIES", (pageNo+1)*10, 10);
			if(resultList==null || resultList.size()==0){
				stat=false;
				
			}else{
				for (int i = 0; i < resultList.size(); i++) {
					String SCALE="";
					if(resultList.get(i).get("SCALE")!=null){
						NumberFormat nf = NumberFormat.getCurrencyInstance();
						
						String str=(String)resultList.get(i).get("SCALE");
						if(!Util.isNull(str)){//风险投资企业名录 5
							SCALE = nf.format(Double.parseDouble(str)); 
							
						} 
						
					}
					
					resultList.get(i).put("SCALE", SCALE);
				}
			}
		}else if("E".equals(flag)){//获取年度新增上市企业名录列表
			resultList=innovateService.getImmovateList("MARKET_COMPANIES", (pageNo+1)*10, 10);
			if(resultList!=null && resultList.size()>0){
				for (int i = 0; i < resultList.size(); i++) {
					String MARKET_TIME="";
					if(resultList.get(i).get("MARKET_TIME")!=null){
					      MARKET_TIME = new SimpleDateFormat("yyyy-MM-dd").format(resultList.get(i).get("MARKET_TIME")); 
					}
					
					resultList.get(i).put("MARKET_TIME", MARKET_TIME);
				}
			}else{
				stat=false;
			}		
		}else if("F".equals(flag)){//获取创新示范企业列表
			resultList=innovateService.getImmovateList("INNOV_BUSINESS",(pageNo+1)*10,10);
			if(resultList!=null && resultList.size()>0){
				for (int i = 0; i < resultList.size(); i++) {
					String START_TIME="";
					if(resultList.get(i).get("START_TIME")!=null){
						START_TIME = new SimpleDateFormat("yyyy-MM-dd").format(resultList.get(i).get("START_TIME")); 
					}
					resultList.get(i).put("START_TIME", START_TIME);
				}
			}else{
				stat=false;
			}	
		}
		
		
		ObjectMapper mapper= new ObjectMapper();
		response.setCharacterEncoding("UTF-8");
		try {
			if(stat){
			     response.getWriter().write(mapper.writeValueAsString(resultList));
			}else{
				 response.getWriter().write(mapper.writeValueAsString("nomore"));
			}
			
		}catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	
	/**
	 * 查询领军人物详情信息
	 * @param request
	 * @param model
	 */
	@RequestMapping("/getPerson")
	public void getPerson(HttpServletRequest request,HttpServletResponse response){
		
		String personId=request.getParameter("personId");
		boolean stat=true;
		
		//人物详情信息
	    Map<String,Object> personInfo=innovateService.getPersonInfo(personId);
	    
	    if(personInfo!=null && personInfo.size()>0){
	    	    String PS_BIRTH="";
			    if(personInfo.get("PS_BIRTH")!=null){
				      PS_BIRTH = new SimpleDateFormat("yyyy-MM-dd").format(personInfo.get("PS_BIRTH")); 
			    }
				personInfo.put("PS_BIRTH", PS_BIRTH);
			
		}else{
			stat=false;
		}
	    
		ObjectMapper mapper= new ObjectMapper();
		response.setCharacterEncoding("UTF-8");
		try {
			if(stat){
			     response.getWriter().write(mapper.writeValueAsString(personInfo));
			}else{
				 response.getWriter().write(mapper.writeValueAsString("nomore"));
			}
			
		}catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	
	  
}
