package com.uws.controller;


import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
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
import org.springframework.web.bind.annotation.ResponseBody;

import com.uws.service.CompanyInfoService;
import com.uws.service.IndustryGardenService;
import com.uws.service.LoginRegisterService;
import com.uws.service.NewsFileService;
/**
 * F1 企业信息 控制层
 * @param userModel
 * @param request
 * @return
 */
@Controller
@RequestMapping("/info")
public class InformationController {

	@Resource
	private NewsFileService newsFileService;
	@Resource
	private CompanyInfoService companyInfoService;
	
	@Resource(name="industryGardenService")
	private IndustryGardenService industryGardenService;
	
	@Resource(name="loginRegisterService")
	private LoginRegisterService loginRegisterService;
	
	/**进入[企业信息]主页*/
	@RequestMapping("/index")
	public String index(HttpServletRequest request) {
		/**主页获取banner */
		List<Map<String,Object>> bannerImages=newsFileService.getFiles("MODULE_A", "N", "FILE_BANNER", 0, 0);
		request.setAttribute("bannerImages", (bannerImages==null || bannerImages.size()==0)?null:bannerImages.get(0));
		/**主页页面格式 显示最新7条新闻*/
		int NEWS_DEFAULT=7;
		List<Map<String, Object>> NewslistA=this.newsFileService.getNews( "NEWS_A","","",0, NEWS_DEFAULT);/**取最新7条新闻*/
		for (int i = 0; i < NewslistA.size(); i++) {
			try{String NEWS_TIME2 = new SimpleDateFormat("yyyy-MM-dd").format(NewslistA.get(i).get("NEWS_TIME")); 
			NewslistA.get(i).put("NEWS_TIME", NEWS_TIME2);}catch(Exception e){/*e.printStackTrace();*/}
		}
		request.setAttribute("NewslistA", NewslistA);
		/**主页页面展示N个滚动轮播企业图*/
		List<Map<String, Object>> Lunbo=this.newsFileService.getFiles("MODULE_A", "MODULE_A_MAIN", "FILE_SLIDER", 0, 0);
		request.setAttribute("Lunbo", Lunbo);
		/**主页展示N张统计图*/
		List<Map<String, Object>> TongJi=this.newsFileService.getFiles("MODULE_A", "MODULE_A_MAIN", "FILE_STATISTICS", 0, 0);
		request.setAttribute("TongJi", TongJi);
		/**主页展示N张logo滚动图*/
		List<Map<String, Object>> CPLogoLunbo=this.companyInfoService.getListCompRecommend("N","N",0, 0);
		request.setAttribute("CPLogoLunbo", CPLogoLunbo);
		/**广告N张*/
		List<Map<String,Object>> adImages=newsFileService.getFiles("MODULE_A", "N", "FILE_AD1", 0, 0);
		request.setAttribute("adImages", adImages);
		/**主页展示7个企业信息*/
		List<Map<String, Object>> CPList=this.companyInfoService.getListComp("", null, 0, 7);
		for (int i = 0; i < CPList.size(); i++) {
			try{String TIME2 = new SimpleDateFormat("yyyy-MM-dd").format(CPList.get(i).get("CREATE_TIME")); 
			CPList.get(i).put("CREATE_TIME", TIME2);}catch(Exception e){/*e.printStackTrace();*/}
			//获取 所属机构的名称 修正
			String BelongName="";
			try{ String BelongCode = (String) CPList.get(i).get("CP_BELONG"); 
			if(null!=BelongCode && !("".endsWith(BelongCode))){
				Map<String, Object> maps=loginRegisterService.getDicOneByCode(BelongCode);
				if(null!=maps){BelongName=(String) maps.get("NAME");}else{BelongName=BelongCode;}
			}
			CPList.get(i).put("CP_BELONG", BelongName); }catch(Exception e){/*e.printStackTrace();*/}
			//
		}
		request.setAttribute("CPList", CPList);
		request.setAttribute("pageStart", 0);
		request.setAttribute("pageEnd", 7);/**页面大小*/
		request.setAttribute("FirstPageSize", CPList.size());
		/**搜索条件 从字典表读取*/
		List<Map<String,Object>> searchkey1=this.loginRegisterService.getAreaList("CP_MARKET");
		/*List<Map<String,Object>> searchkey2=this.loginRegisterService.getAreaList("CP_MODEL");*/
		List<Map<String,Object>> searchkey3=this.loginRegisterService.getAreaList("CP_CUSTOMERTYPE");
		List<Map<String,Object>> searchkey4=this.loginRegisterService.getAreaList("CP_BELONGPART");
		request.setAttribute("searchkey1", searchkey1);
		/*request.setAttribute("searchkey2", searchkey2);*/
		request.setAttribute("searchkey3", searchkey3);
		request.setAttribute("searchkey4", searchkey4);
		/**需要此码标题栏激活*/
		request.setAttribute("moduleCode", "NEWS_A");
	    return "information/information";  
	} 
	/**点击[加载更多 公司]操作*/
	@RequestMapping("/loadcps")
	@ResponseBody
	public void loadcps(HttpServletRequest request,HttpServletResponse response,int pageStart, int pageEnd,
			String can1,String can2,String can3,String can4) {
		List<Object> values=new ArrayList<Object>();
		can1=(can1==null)?"":can1;values.add(can1);
		can2=(can2==null)?"":can2;values.add(can2);/**来自树形图code*/
		can3=(can3==null)?"":can3;values.add(can3);
		can4=(can4==null)?"":can4;values.add(can4);
		List<Map<String, Object>> CPList=this.companyInfoService.getListCompByParm(values.toArray(), pageStart, pageEnd);
		for (int i = 0; i < CPList.size(); i++) {
			try{ String TIME2 = new SimpleDateFormat("yyyy-MM-dd").format(CPList.get(i).get("CREATE_TIME")); 
			CPList.get(i).put("CREATE_TIME", TIME2); }catch(Exception e){/*e.printStackTrace();*/}
			//获取 所属机构的名称 修正
			String BelongName="";
			try{ String BelongCode = (String) CPList.get(i).get("CP_BELONG"); 
			if(null!=BelongCode && !("".endsWith(BelongCode))){
				Map<String, Object> maps=loginRegisterService.getDicOneByCode(BelongCode);
				if(null!=maps){BelongName=(String) maps.get("NAME");}else{BelongName=BelongCode;}
			}
			CPList.get(i).put("CP_BELONG", BelongName); }catch(Exception e){/*e.printStackTrace();*/}
			//
		}
		ObjectMapper mapper= new ObjectMapper();
		response.setCharacterEncoding("UTF-8");
		try {
			response.getWriter().write(mapper.writeValueAsString(CPList));
			//System.out.println(mapper.writeValueAsString("查询到"+CPList.size()));
		}catch (IOException e) {/*e.printStackTrace();*/}
	} 
	/**
	 * [搜素 企业] 操作 info/searchcps.do
	 * */
	@RequestMapping("/searchcps")
	public void searchcps(HttpServletRequest request,HttpServletResponse response,int pageStart, int pageEnd,
			String can1,String can2,String can3,String can4) {  
		List<Object> values=new ArrayList<Object>();
		can1=(can1==null)?"":can1;values.add(can1);
		can2=(can2==null)?"":can2;values.add(can2);/**来自树形图code*/
		can3=(can3==null)?"":can3;values.add(can3);
		can4=(can4==null)?"":can4;values.add(can4);
		List<Map<String, Object>> CPList=this.companyInfoService.getListCompByParm(values.toArray(), pageStart, pageEnd);
		for (int i = 0; i < CPList.size(); i++) {
			try{ String TIME2 = new SimpleDateFormat("yyyy-MM-dd").format(CPList.get(i).get("CREATE_TIME")); 
			CPList.get(i).put("CREATE_TIME", TIME2); }catch(Exception e){/*e.printStackTrace();*/}
			//获取 所属机构的名称 修正
			String BelongName="";
			try{ String BelongCode = (String) CPList.get(i).get("CP_BELONG"); 
			if(null!=BelongCode && !("".endsWith(BelongCode))){
				Map<String, Object> maps=loginRegisterService.getDicOneByCode(BelongCode);
				if(null!=maps){BelongName=(String) maps.get("NAME");}else{BelongName=BelongCode;}
			}
			CPList.get(i).put("CP_BELONG", BelongName); }catch(Exception e){/*e.printStackTrace();*/}
			//
		}
		//System.out.println("1 "+can1+"2 "+can2+"3 "+can3+"4 "+can4);
		ObjectMapper mapper= new ObjectMapper();
		response.setCharacterEncoding("UTF-8");
		try {
			response.getWriter().write(mapper.writeValueAsString(CPList));
			//System.out.println(mapper.writeValueAsString("查询到"+CPList.size()));
		}catch (IOException e) {/*e.printStackTrace();*/}
	} 
	
	/**
	 * 全站搜索企业
	 * @return
	 * @throws UnsupportedEncodingException 
	 */
	@RequestMapping("/quanSearchCp")
	public String quanSearchCp(HttpServletRequest request) throws Exception{
		String keyWord = request.getParameter("keyWord");
		String moduleCode = request.getParameter("moduleCode");
		keyWord  = URLDecoder.decode(keyWord, "UTF-8");;
		//keyWord = URLEncoder.encode(keyWord, "utf-8");
		String sql = "SELECT ((LENGTH(CP_NAME)-LENGTH(replace(CP_NAME,'"+keyWord+"','')))+(LENGTH(CP_PRODUCT)-LENGTH(replace(CP_PRODUCT,'"+keyWord+"',''))) "+
					" +(LENGTH(CP_LOCATION)-LENGTH(replace(CP_LOCATION,'"+keyWord+"','')))+(LENGTH(CP_ABSTRACT)-LENGTH(replace(CP_ABSTRACT,'"+keyWord+"',''))) " +     
					" +(LENGTH(COMMENTS)-LENGTH(replace(COMMENTS,'"+keyWord+"','')))) AS coun , company_info.* " +
					" FROM company_info WHERE IS_SHOW ='1' AND STATUS  = '2' AND CP_NAME LIKE '%"+keyWord+"%' OR CP_PRODUCT LIKE '%"+keyWord+"%' OR CP_LOCATION LIKE '%"+keyWord+"%' OR CP_ABSTRACT LIKE '%"+keyWord+"%' " +
					" OR COMMENTS LIKE '%"+keyWord+"%' ORDER BY coun DESC";
		List<Map<String, Object>> CPList=this.companyInfoService.getListCompSearch(sql, null, 0, 12);
		for (int i = 0; i < CPList.size(); i++) {
			//获取 所属机构的名称 修正
			String BelongName="";
			try{
				String TIME2 = new SimpleDateFormat("yyyy-MM-dd").format(CPList.get(i).get("CREATE_TIME")); 
				String BelongCode = (String) CPList.get(i).get("CP_BELONG"); 
				if(null!=BelongCode && !("".endsWith(BelongCode))){
				Map<String, Object> maps=loginRegisterService.getDicOneByCode(BelongCode);
					if(null!=maps){
						BelongName=(String) maps.get("NAME");
					}else{
						BelongName=BelongCode;
					}
				}
				
				String CP_NAME = (String)CPList.get(i).get("CP_NAME")==null?"":CPList.get(i).get("CP_NAME").toString();
				String CP_PRODUCT = (String)CPList.get(i).get("CP_PRODUCT")==null?"":CPList.get(i).get("CP_PRODUCT").toString();
				String CP_LOCATION = (String)CPList.get(i).get("CP_LOCATION")==null?"":CPList.get(i).get("CP_LOCATION").toString();
				String CP_ABSTRACT = (String)CPList.get(i).get("CP_ABSTRACT")==null?"":CPList.get(i).get("CP_ABSTRACT").toString();
				String COMMENTS = (String)CPList.get(i).get("COMMENTS")==null?"":CPList.get(i).get("COMMENTS").toString();
				//
				String CP_BELONG = (String)CPList.get(i).get("CP_BELONG")==null?"":CPList.get(i).get("CP_BELONG").toString();
				String CP_TYPE = (String)CPList.get(i).get("CP_TYPE")==null?"":CPList.get(i).get("CP_TYPE").toString();
				String CP_ADDRESS = (String)CPList.get(i).get("CP_ADDRESS")==null?"":CPList.get(i).get("CP_ADDRESS").toString();
				String CP_PHONE = (String)CPList.get(i).get("CP_PHONE")==null?"":CPList.get(i).get("CP_PHONE").toString();
				CPList.get(i).put("CP_BELONG", CP_BELONG); 
				CPList.get(i).put("CP_TYPE", CP_TYPE); 
				CPList.get(i).put("CP_ADDRESS", CP_ADDRESS); 
				CPList.get(i).put("CP_PHONE", CP_PHONE); 
				//
				CP_NAME = CP_NAME.replace(keyWord, "<font color='red'>"+keyWord+"</font>");
				CP_PRODUCT = CP_PRODUCT.replace(keyWord, "<font color='red'>"+keyWord+"</font>");
				CP_LOCATION = CP_LOCATION.replace(keyWord, "<font color='red'>"+keyWord+"</font>");
				CP_ABSTRACT = CP_ABSTRACT.replace(keyWord, "<font color='red'>"+keyWord+"</font>");
				COMMENTS = COMMENTS.replace(keyWord, "<font color='red'>"+keyWord+"</font>");
				
				CPList.get(i).put("CP_NAME", CP_NAME); 
				CPList.get(i).put("CP_PRODUCT", CP_PRODUCT); 
				CPList.get(i).put("CP_LOCATION", CP_LOCATION); 
				CPList.get(i).put("CP_ABSTRACT", CP_ABSTRACT); 
				CPList.get(i).put("COMMENTS", COMMENTS); 
				
				CPList.get(i).put("CP_BELONG", BelongName); 
				CPList.get(i).put("CREATE_TIME", TIME2);
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		//获取banner图片
		List<Map<String,Object>> bannerImages=newsFileService.getFiles("MODULE_A", "N", "FILE_BANNER", 0, 0);
		request.setAttribute("bannerImages", (bannerImages==null || bannerImages.size()==0)?null:bannerImages.get(0));
		
		request.setAttribute("keyWord", keyWord);
		request.setAttribute("CPList", CPList);
		request.setAttribute("pageStart", 0);
		request.setAttribute("pageEnd", 12);/**页面大小*/
		request.setAttribute("FirstPageSize", CPList.size());
		request.setAttribute("moduleCode", moduleCode);
		return "information/searchInfo"; 
	}
	
	/**
	 * 全站搜索企业   更多企业
	 * @param request
	 * @param response
	 * @param pageStart
	 * @param pageEnd
	 */
	@RequestMapping("/loadcpsBySearch")
	public void loadcpsBySearch(HttpServletRequest request,HttpServletResponse response,int pageStart, int pageEnd,String keyWord){
		String sql = "SELECT ((LENGTH(CP_NAME)-LENGTH(replace(CP_NAME,'"+keyWord+"','')))+(LENGTH(CP_PRODUCT)-LENGTH(replace(CP_PRODUCT,'"+keyWord+"',''))) "+
				" +(LENGTH(CP_LOCATION)-LENGTH(replace(CP_LOCATION,'"+keyWord+"','')))+(LENGTH(CP_ABSTRACT)-LENGTH(replace(CP_ABSTRACT,'"+keyWord+"',''))) " +     
				" +(LENGTH(COMMENTS)-LENGTH(replace(COMMENTS,'"+keyWord+"','')))) AS coun , company_info.* " +
				" FROM company_info WHERE IS_SHOW ='"+1+"' AND STATUS  = '"+2+"' AND CP_NAME LIKE '%"+keyWord+"%' OR CP_PRODUCT LIKE '%"+keyWord+"%' OR CP_LOCATION LIKE '%"+keyWord+"%' OR CP_ABSTRACT LIKE '%"+keyWord+"%' " +
				" OR COMMENTS LIKE '%"+keyWord+"%' ORDER BY coun DESC";
		List<Map<String, Object>> CPList=this.companyInfoService.getListCompSearch(sql, null, pageStart, pageEnd);
		for (int i = 0; i < CPList.size(); i++) {
			String BelongName="";
			try{ 
				String TIME2 = new SimpleDateFormat("yyyy-MM-dd").format(CPList.get(i).get("CREATE_TIME")); 
				CPList.get(i).put("CREATE_TIME", TIME2); 
				String BelongCode = (String) CPList.get(i).get("CP_BELONG"); 
				if(null!=BelongCode && !("".endsWith(BelongCode))){
					Map<String, Object> maps=loginRegisterService.getDicOneByCode(BelongCode);
					if(null!=maps){
						BelongName=(String) maps.get("NAME");
					}else{
						BelongName=BelongCode;
					}
				}
				
				String CP_NAME = (String)CPList.get(i).get("CP_NAME")==null?"":CPList.get(i).get("CP_NAME").toString();
				String CP_PRODUCT = (String)CPList.get(i).get("CP_PRODUCT")==null?"":CPList.get(i).get("CP_PRODUCT").toString();
				String CP_LOCATION = (String)CPList.get(i).get("CP_LOCATION")==null?"":CPList.get(i).get("CP_LOCATION").toString();
				String CP_ABSTRACT = (String)CPList.get(i).get("CP_ABSTRACT")==null?"":CPList.get(i).get("CP_ABSTRACT").toString();
				String COMMENTS = (String)CPList.get(i).get("COMMENTS")==null?"":CPList.get(i).get("COMMENTS").toString();
				//
				String CP_BELONG = (String)CPList.get(i).get("CP_BELONG")==null?"":CPList.get(i).get("CP_BELONG").toString();
				String CP_TYPE = (String)CPList.get(i).get("CP_TYPE")==null?"":CPList.get(i).get("CP_TYPE").toString();
				String CP_ADDRESS = (String)CPList.get(i).get("CP_ADDRESS")==null?"":CPList.get(i).get("CP_ADDRESS").toString();
				String CP_PHONE = (String)CPList.get(i).get("CP_PHONE")==null?"":CPList.get(i).get("CP_PHONE").toString();
				CPList.get(i).put("CP_BELONG", CP_BELONG); 
				CPList.get(i).put("CP_TYPE", CP_TYPE); 
				CPList.get(i).put("CP_ADDRESS", CP_ADDRESS); 
				CPList.get(i).put("CP_PHONE", CP_PHONE); 
				//load 方法使用 ajax拼装 可以不写一些“”
				CP_NAME = CP_NAME.replace(keyWord, "<font color=red>"+keyWord+"</font>");
				CP_PRODUCT = CP_PRODUCT.replace(keyWord, "<font color=red>"+keyWord+"</font>");
				CP_LOCATION = CP_LOCATION.replace(keyWord, "<font color=red>"+keyWord+"</font>");
				CP_ABSTRACT = CP_ABSTRACT.replace(keyWord, "<font color=red>"+keyWord+"</font>");
				COMMENTS = COMMENTS.replace(keyWord, "<font color=red>"+keyWord+"</font>");
				
				CPList.get(i).put("CP_NAME", CP_NAME); 
				CPList.get(i).put("CP_PRODUCT", CP_PRODUCT); 
				CPList.get(i).put("CP_LOCATION", CP_LOCATION); 
				CPList.get(i).put("CP_ABSTRACT", CP_ABSTRACT); 
				CPList.get(i).put("COMMENTS", COMMENTS); 
				
				CPList.get(i).put("CP_BELONG", BelongName); 
			}catch(Exception e){
				e.printStackTrace();
			}
			
		}
		ObjectMapper mapper= new ObjectMapper();
		response.setCharacterEncoding("UTF-8");
		try {
			response.getWriter().write(mapper.writeValueAsString(CPList));
		}catch (IOException e) {
			e.printStackTrace();
		}
	} 
	
	/**
	 * 点击更多查看新闻列表
	 * @param request
	 * @param pageStart 分页起始参数
	 * @param model
	 * @return
	 */
	@RequestMapping("/morenews")
	public String morenews(HttpServletRequest request,Model model) {
		
		
		//新闻所属模块编码
		String moduleCode=request.getParameter("moduleCode");
		//产业或园区的id(新闻)
		String parentCode=request.getParameter("parentCode");
		//新闻类型
		String moduleType=request.getParameter("moduleType");
		if("NEWS_L".equals(moduleCode)){
			moduleType = "GARDEN_A";
		}
		//图片所属模块编码
		String fModuleCode=request.getParameter("fModuleCode");
				
		//产业或园区的id(图片)
		String fParentCode=request.getParameter("fParentCode");
		
		//导航路径1
		String url1=request.getParameter("url1");
		//导航路径2
		String url2=request.getParameter("url2");
		//导航路径3
		String url3=request.getParameter("url3");
		//新闻详情路径
		String url4=request.getParameter("url4");
		
		List<Map<String, Object>> NewslistM=this.newsFileService.getNews(moduleCode,(parentCode==null || parentCode=="")?"N":parentCode,(moduleType==null || moduleType=="")?"N":moduleType,0, 10);/**继续获取n条新闻*/
		request.setAttribute("NewslistM", NewslistM);
	
		
		//获取推广图片
		List<Map<String,Object>> adImages=newsFileService.getFiles("", "", "FILE_AD3", 0, 0);
		model.addAttribute("adImages", adImages);
		//获取banner图片
		List<Map<String,Object>> bannerImages=newsFileService.getFiles(fModuleCode, (fParentCode==null || fParentCode=="")?"N":fParentCode, "FILE_BANNER", 0, 0);
		model.addAttribute("bannerImages", (bannerImages==null || bannerImages.size()==0) ?null:bannerImages.get(0));
				
		model.addAttribute("moduleCode", moduleCode);
		model.addAttribute("parentCodeName", (parentCode==null || parentCode=="")?"":industryGardenService.getIndustryGardenDetail(parentCode).get("NAME"));
		model.addAttribute("moduleType", moduleType);
		model.addAttribute("parentCode", (parentCode==null || parentCode=="")?"NO":parentCode);
		
		model.addAttribute("pageNo", 0);
		model.addAttribute("url1", url1);
		model.addAttribute("url2", url2);
		model.addAttribute("url3", url3);
		model.addAttribute("url4", url4);
		model.addAttribute("fModuleCode", fModuleCode);
		model.addAttribute("fParentCode", fParentCode);
		
		
	    return "news/articleList";  
	}
	
	
	/**
	 * 加载更多新闻
	 * @param request
	 * @param response
	 * @param pageStart 分页起始参数
	 */
	@RequestMapping("/loadnews")	
	public void loadnews(HttpServletRequest request,HttpServletResponse response) {
		    Integer pageNo=request.getParameter("pageNo")==null?0:Integer.parseInt(request.getParameter("pageNo"));
		    //新闻所属模块编码
			String moduleCode=request.getParameter("moduleCode");
			//产业或园区的id(新闻)
			String parentCode=request.getParameter("parentCode");
			//新闻类型
			String moduleType=request.getParameter("moduleType");
		
			List<Map<String, Object>> NewsLoad=this.newsFileService.getNews(moduleCode,parentCode,moduleType,(pageNo+1)*10, 10);
			//System.out.println(moduleCode+parentCode+moduleType+"");
			boolean stat=true;
			if(NewsLoad!=null && NewsLoad.size()>0){
				for (int i = 0; i < NewsLoad.size(); i++) {
					String NEWS_TIME2=null;
					if(NewsLoad.get(i).get("NEWS_TIME")!=null){
					     NEWS_TIME2 = new SimpleDateFormat("yyyy-MM-dd").format(NewsLoad.get(i).get("NEWS_TIME")); 
					}
					NewsLoad.get(i).put("NEWS_TIME", NEWS_TIME2);
				}
			}else{
				stat=false;
			}
			ObjectMapper mapper= new ObjectMapper();
			response.setCharacterEncoding("UTF-8");
			try {
				if(stat){
				     response.getWriter().write(mapper.writeValueAsString(NewsLoad));
				}else{
					 response.getWriter().write(mapper.writeValueAsString("nomore"));
				}
				//System.out.println(mapper.writeValueAsString(NewsLoad));
			}catch (IOException e) {/*e.printStackTrace();*/}
		
	}  


	/**
	 * 查询新闻详情
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping("/onenews")
	public String onenews(HttpServletRequest request,Model model) {
		String articleId=request.getParameter("articleId");
		//新闻所属模块编码
		String moduleCode=request.getParameter("moduleCode");
		//产业或园区的id(新闻)
		String parentCode=request.getParameter("parentCode");
		//新闻类型
		String moduleType=request.getParameter("moduleType");
		
		//图片所属模块编码
		String fModuleCode=request.getParameter("fModuleCode");
				
		//产业或园区的id(图片)
		String fParentCode=request.getParameter("fParentCode");
		
		//导航路径1
		String url1=request.getParameter("url1");
		//导航路径2
		String url2=request.getParameter("url2");
		//导航路径3
		String url3=request.getParameter("url3");
		//新闻详情路径
		String url4=request.getParameter("url4");
				
		
		Map<String, Object> NewsOne=newsFileService.getNewsDetail(articleId);
		model.addAttribute("NewsOne", NewsOne);
		
		//System.out.println(moduleCode+ " 12222  "+parentCode);
		/**上一条新闻*/
		Map<String, Object> NewsPre=newsFileService.getPreNews(moduleCode, (parentCode==null || parentCode=="")?"N":parentCode, (moduleType==null || moduleType=="")?"N":moduleType, NewsOne);
	    model.addAttribute("NewsPre", NewsPre);
	   
		
		/**下一条新闻*/
		Map<String, Object> NewsNext=newsFileService.getNextNews(moduleCode, (parentCode==null || parentCode=="")?"N":parentCode, (moduleType==null || moduleType=="")?"N":moduleType, NewsOne);
		model.addAttribute("NewsNext", NewsNext);
		
		
		//获取推广图片
		List<Map<String,Object>> adImages=newsFileService.getFiles("", "", "FILE_AD2", 0, 0);
		model.addAttribute("adImages", adImages);
		//获取banner图片
		List<Map<String,Object>> bannerImages=newsFileService.getFiles(fModuleCode, (fParentCode==null || fParentCode=="")?"N":fParentCode, "FILE_BANNER", 0, 0);
		model.addAttribute("bannerImages", (bannerImages==null || bannerImages.size()==0)?null:bannerImages.get(0));
		
		
		model.addAttribute("moduleCode", moduleCode);
		model.addAttribute("parentCodeName", (parentCode==null || parentCode=="")?"":industryGardenService.getIndustryGardenDetail(parentCode).get("NAME"));
		model.addAttribute("moduleType", moduleType);
		model.addAttribute("parentCode", (parentCode==null || parentCode=="")?"NO":parentCode);
		
		model.addAttribute("fModuleCode", fModuleCode);
		model.addAttribute("fParentCode", fParentCode);
		model.addAttribute("url1", url1);
		model.addAttribute("url2", url2);
		model.addAttribute("url3", url3);
		model.addAttribute("url4", url4);
		
	    return "news/article";  
	}
	/**
	 * 进入 [下载文件]  List页面
	 * */
	@RequestMapping("/fileList")
	public String fileList(HttpServletRequest request,Model model) {
		//新闻所属模块编码
		String moduleCode=request.getParameter("moduleCode");
		//产业或园区的id(新闻)
		String parentCode=request.getParameter("parentCode");
		//新闻类型
		String moduleType=request.getParameter("moduleType");
		//new
		String FILE_TYPE=request.getParameter("FILE_TYPE");
		//图片所属模块编码
		String fModuleCode=request.getParameter("fModuleCode");
				
		//产业或园区的id(图片)
		String fParentCode=request.getParameter("fParentCode");
		
		//导航路径1
		String url1=request.getParameter("url1");
		//导航路径2
		String url2=request.getParameter("url2");
		//导航路径3
		String url3=request.getParameter("url3");
		//新闻详情路径
		String url4=request.getParameter("url4");
		
		List<Map<String, Object>> NewslistM=this.newsFileService.getFiles(fModuleCode,(fParentCode==null || fParentCode=="")?"":fParentCode,(FILE_TYPE==null || FILE_TYPE=="")?"N":FILE_TYPE,0, 10);
		for (int i = 0; i < NewslistM.size(); i++) {
			String TIME2="";
			if(NewslistM.get(i).get("CREATE_TIME")!=null){
			   TIME2 = new SimpleDateFormat("yyyy-MM-dd").format(NewslistM.get(i).get("CREATE_TIME")); 
			}
			NewslistM.get(i).put("CREATE_TIME", TIME2);		}
		request.setAttribute("NewslistM", NewslistM);
	
		//获取推广图片
		List<Map<String,Object>> adImages=newsFileService.getFiles("", "", "FILE_AD3", 0, 0);
		model.addAttribute("adImages", adImages);
		//获取banner图片
		List<Map<String,Object>> bannerImages=newsFileService.getFiles(fModuleCode, (fParentCode==null || fParentCode=="")?"":fParentCode, "FILE_BANNER", 0, 0);
		
		
		model.addAttribute("bannerImages", (bannerImages==null || bannerImages.size()==0) ?null:bannerImages.get(0));
				
		model.addAttribute("moduleCode", moduleCode);
		try{
		model.addAttribute("parentCodeName", (fParentCode==null || fParentCode=="")?"":industryGardenService.getIndustryGardenDetail(fParentCode).get("NAME"));
		}catch (Exception e) {/*e.printStackTrace();*/		}
		model.addAttribute("parentCode", parentCode);
		model.addAttribute("moduleType", moduleType);
		model.addAttribute("FILE_TYPE", FILE_TYPE);
		model.addAttribute("pageNo", 0);
		model.addAttribute("url1", url1);
		model.addAttribute("url2", url2);
		model.addAttribute("url3", url3);
		model.addAttribute("url4", url4);
		model.addAttribute("fModuleCode", fModuleCode);
		model.addAttribute("fParentCode", fParentCode);
	    return "news/fileList";  
	}
	/**
	 * [继续加载] 下载文件列表
	 */
	@RequestMapping("/morefiles")	
	public void morefiles(HttpServletRequest request,HttpServletResponse response) {
		Integer pageNo=request.getParameter("pageNo")==null?0:Integer.parseInt(request.getParameter("pageNo"));
		String fModuleCode=request.getParameter("fModuleCode");
		String fParentCode=request.getParameter("fParentCode");
		String FILE_TYPE=request.getParameter("FILE_TYPE");
		//所属模块编码
		String moduleCode=request.getParameter("moduleCode");
		//产业或园区的id
		String parentCode=request.getParameter("parentCode");
		//类型
		String moduleType=request.getParameter("moduleType");

		List<Map<String, Object>> NewsLoad=this.newsFileService.getFiles(fModuleCode,(fParentCode==null || fParentCode=="")?"":fParentCode,FILE_TYPE,(pageNo+1)*10, 10);
		boolean stat=true;
		if(NewsLoad!=null && NewsLoad.size()>0){
			for (int i = 0; i < NewsLoad.size(); i++) {
				
				String TIME2="";
				if(NewsLoad.get(i).get("CREATE_TIME")!=null){
				     TIME2 = new SimpleDateFormat("yyyy-MM-dd").format(NewsLoad.get(i).get("CREATE_TIME")); 
				}
				NewsLoad.get(i).put("CREATE_TIME", TIME2);
			}
		}else{
			stat=false;
		}
		ObjectMapper mapper= new ObjectMapper();
		response.setCharacterEncoding("UTF-8");
		try {
			if(stat){
				response.getWriter().write(mapper.writeValueAsString(NewsLoad));
			}else{
				response.getWriter().write(mapper.writeValueAsString("nomore"));
			}
			//System.out.println(mapper.writeValueAsString(NewsLoad));
		}catch (IOException e) {/*e.printStackTrace();*/}

	}
	/**
	 * 查询所属行业 菜单节点列表
	 * @param request
	 * @param model
	 */
	@RequestMapping("/getBelongTypeTree")
	public void getBelongTypeTree(HttpServletRequest request,HttpServletResponse response){
		String parentCode=request.getParameter("id");
		List<Map<String,Object>> list=new ArrayList();
		//菜单节点列表
		List<Map<String,Object>> menuList=loginRegisterService.getDicListByParentCode(parentCode==null?"BELONGTREE":parentCode);
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

}





