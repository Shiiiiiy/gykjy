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
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.uws.service.CompanyInfoService;
import com.uws.service.IndustryGardenService;
import com.uws.service.NewsFileService;
import com.uws.util.Util;
/**
 * F3 支柱产业 控制层
 */
@Controller
@RequestMapping("/prop")
public class PropController {

	@Resource
	private NewsFileService newsFileService;
	@Resource
	private CompanyInfoService companyInfoService;
	@Resource(name="industryGardenService")
	private IndustryGardenService industryGardenService;
	/**
	 * 进入支柱产业主页  /prop/index.do
	 */
	@RequestMapping("/index")
	public String index(HttpServletRequest request) {  
		/**读取主页banner*/
		List<Map<String,Object>> bannerImages=newsFileService.getFiles("MODULE_E", "N", "FILE_BANNER", 0, 0);
		request.setAttribute("bannerImages", (bannerImages==null || bannerImages.size()==0)?null:bannerImages.get(0));
		/**属于支柱产业 的 所有 类别 7条产业动态新闻*/
		List<Map<String, Object>> NewslistA=this.newsFileService.getNews( "NEWS_M","N","N",0, 7);
		for (int i = 0; i < NewslistA.size(); i++) {
			try{ String NEWS_TIME2 = new SimpleDateFormat("yyyy-MM-dd").format(NewslistA.get(i).get("NEWS_TIME")); 
			NewslistA.get(i).put("NEWS_TIME", NEWS_TIME2); }catch(Exception e){/*e.printStackTrace();*/}
		} 
		request.setAttribute("NewslistA", NewslistA);
		/**主页页面展示N个滚动轮播企业图*/
		List<Map<String, Object>> Lunbo=this.newsFileService.getFiles("MODULE_E", "MODULE_E_MAIN", "FILE_SLIDER", 0, 0);
		request.setAttribute("Lunbo", Lunbo);
		/**主页展示N张统计图*/
		List<Map<String, Object>> TongJi=this.newsFileService.getFiles("MODULE_E", "MODULE_E_MAIN", "FILE_STATISTICS", 0, 0);
		request.setAttribute("TongJi", TongJi);
		/**8个子菜单的ID*/
	    List<Map<String,Object>> ZhizhuList=this.industryGardenService.getIndustryGardenList("INDUSTRY","INDUSTRY_D");
	    request.setAttribute("ZhizhuList",ZhizhuList);
		/**需要此码标题栏激活*/
		request.setAttribute("moduleCode", "NEWS_M");
	    return "prop/prop";  
	}
	/**
	 * 进入某一 支柱产业 主页  /prop/detail.do
	 */
	@RequestMapping("/detail")
	public String detail(HttpServletRequest request) {  
		//某一类支柱产业 ID
		String PropId=request.getParameter("PropId");
		Map<String,Object> PropOne=industryGardenService.getIndustryGardenDetail(PropId);
		//获取实体 存入页面
		request.setAttribute("PropOne",PropOne);
		/**INDUSTRY_GARDEN 中banner 包括中英文名称**/
		List<Map<String,Object>> bannerImages=newsFileService.getFiles("MODULE_E", PropId, "FILE_BANNER", 0, 0);
		request.setAttribute("bannerImages", (bannerImages==null || bannerImages.size()==0) ?null:bannerImages.get(0));
		/**属于支柱产业 的 此类别 企业图片轮播N张 */
		List<Map<String, Object>> LunboOne=this.newsFileService.getFiles("MODULE_E", PropId, "FILE_SLIDER", 0, 0);
		request.setAttribute("LunboOne", LunboOne);
		/**属于支柱产业 的 此类别 产业动态7条 新闻*/
	    List<Map<String,Object>> newsList=this.newsFileService.getNews("NEWS_M",PropId,"",0, 7);//
	    request.setAttribute("newsList",newsList);
		/**属于支柱产业 的 此类别 广告N张 */
		List<Map<String,Object>> adImages=newsFileService.getFiles("MODULE_E",PropId, "FILE_AD5", 0, 0);
		request.setAttribute("adImages", adImages);
		/**属于支柱产业 的 此类别 滚动logo N张*/
		//List<Map<String,Object>> CPLogoLunbo=companyInfoService.getInnovateCompList("PROP_F", PropId,"","",0, 20);
		List<Map<String, Object>> CPLogoLunbo=this.companyInfoService.getListCompRecommend("PROP_F", PropId,0, 0);
		request.setAttribute("CPLogoLunbo", CPLogoLunbo);
		/**属于支柱产业 的 此类别 统计信息2张 */
		/**属于支柱产业 的 此类别 [产业优质企业]  12个*/
	    Map<String,String> map=new HashMap();
	    map.put("PROP_F", PropId);
	    map.put("PROP_C", "");
	    List<Map<String,Object>> CPList;
	    CPList=companyInfoService.getInduGardCompList(map, 0, 12);
		request.setAttribute("CPList", CPList);
		/**属于支柱产业 的 经济运行分析报告 下载类新闻7条 +统计图 FILE_A */
		List<Map<String, Object>> XiaZai1=this.newsFileService.getFiles("MODULE_E", PropId, "FILE_A", 0, 7);
		for (int i = 0; i < XiaZai1.size(); i++) {
			try{ String TIME2 = new SimpleDateFormat("yyyy-MM-dd").format(XiaZai1.get(i).get("CREATE_TIME")); 
			XiaZai1.get(i).put("CREATE_TIME", TIME2); }catch(Exception e){/*e.printStackTrace();*/}
		}
		request.setAttribute("XiaZai1", XiaZai1);
		/**下载的旁边有N张统计图*/
		List<Map<String,Object>> STATISTu=newsFileService.getFiles("MODULE_E", PropId, "FILE_STATISTICS", 0, 0);
		try {
			request.setAttribute("STATISTu", STATISTu);
		} catch (Exception e) {/*e.printStackTrace();*/}
		/**高级搜索 同 何进的*/
		/**展示7个企业list*/
	    List<Map<String,Object>> compList=companyInfoService.getInnovateCompList("PROP_F", PropId,"","","", 0, 7);
	    request.setAttribute("compList",compList);
		/**需要此码标题栏激活*/
		request.setAttribute("moduleCode", "NEWS_M");
	    return "prop/propDetail";  
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
		String productCapacity=request.getParameter("productCapacity");
		String productName=request.getParameter("productName");	
		String productType=request.getParameter("productType");	
		productCapacity=Util.isNull(productCapacity)?"":productCapacity;
		productName    =Util.isNull(productName)?"":productName;
		productType    =Util.isNull(productType)?"":productType;
		//System.out.println("  "+industryId);
		boolean stat=true;
		//该行业的企业列表
		List<Map<String,Object>> compList=companyInfoService.getInnovateCompList("PROP_F", industryId,productName,productCapacity,productType, pageNo, 7);
		for (int i = 0; i < compList.size(); i++) {
			try{ String TIME2 = new SimpleDateFormat("yyyy-MM-dd").format(compList.get(i).get("CREATE_TIME")); 
			compList.get(i).put("CREATE_TIME", TIME2); }catch(Exception e){/*e.printStackTrace();*/}
		}
		
	    //List<Map<String,Object>> compList=companyInfoService.getInnovateCompList("PROP_F", industryId,"","", (pageNo+1)*7, 7);
	    //System.out.println("compList01.size==="+compList.size());
	    if(compList==null || compList.size()==0){
	    	stat=false;
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
}	
