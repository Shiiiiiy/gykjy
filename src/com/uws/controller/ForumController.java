package com.uws.controller;
import java.io.IOException;
import java.text.SimpleDateFormat;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import org.codehaus.jackson.map.ObjectMapper;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.uws.model.DemandSupplyModel;
import com.uws.model.ProvideSupplyModel;
import com.uws.model.Recruit;
import com.uws.model.RegisterParamModel;
import com.uws.service.CompanyInfoService;
import com.uws.service.ForumService;
import com.uws.service.IndustryGardenService;
import com.uws.service.InnovateService;
import com.uws.service.LoginRegisterService;
import com.uws.service.NewsFileService;
/**
 * F8 产业论坛  控制层
 */
@Controller
@RequestMapping("/forum")
public class ForumController {
	@Resource
	private NewsFileService newsFileService;
	@Resource
	private CompanyInfoService companyInfoService;
	@Resource
	private InnovateService innovateService;
	@Resource
	private ForumService forumService;
	@Resource(name="loginRegisterService")
	private LoginRegisterService loginRegisterService;
	/**
	 * 进入 产业论坛 主页  /prop/index.do
	 */
	@RequestMapping("/index")
	public String index(HttpServletRequest request) {  
		/**主页获取banner */
		List<Map<String,Object>> bannerImages=newsFileService.getFiles("MODULE_J", "N", "FILE_BANNER", 0, 0);
		request.setAttribute("bannerImages", (bannerImages==null || bannerImages.size()==0)?null:bannerImages.get(0));
		/**产业研究报告5条pdf新闻*/
		List<Map<String, Object>> XiaZai1=this.newsFileService.getFiles("MODULE_J", "MODULE_J_MAIN", "FILE_E1", 0, 5);
		for (int i = 0; i < XiaZai1.size(); i++) {
			try{ String TIME2 = new SimpleDateFormat("yyyy-MM-dd").format(XiaZai1.get(i).get("CREATE_TIME")); 
			XiaZai1.get(i).put("CREATE_TIME", TIME2); }catch(Exception e){/*e.printStackTrace();*/}
		} 
		request.setAttribute("XiaZai1", XiaZai1);
		/**产业成功案例5条pdf新闻*/
		List<Map<String, Object>> XiaZai2=this.newsFileService.getFiles("MODULE_J", "MODULE_J_MAIN", "FILE_E2", 0, 5);
		for (int i = 0; i < XiaZai2.size(); i++) {
			try{ String TIME2 = new SimpleDateFormat("yyyy-MM-dd").format(XiaZai2.get(i).get("CREATE_TIME")); 
			XiaZai2.get(i).put("CREATE_TIME", TIME2);}catch(Exception e){/*e.printStackTrace();*/}
		}
		request.setAttribute("XiaZai2", XiaZai2);
		/**线上培训 5条外链 file*/
		List<Map<String, Object>> Links=this.newsFileService.getFiles("MODULE_J", "MODULE_J_MAIN", "FILE_URL", 0, 5);
		for (int i = 0; i < Links.size(); i++) {
			try{ String TIME2 = new SimpleDateFormat("yyyy-MM-dd").format(Links.get(i).get("CREATE_TIME")); 
			Links.get(i).put("CREATE_TIME", TIME2);}catch(Exception e){/*e.printStackTrace();*/}
		}
		request.setAttribute("Links", Links);
		/**[线下培训] 5条主页类 新闻*/
		List<Map<String, Object>> NewslistA1=this.newsFileService.getNews( "NEWS_P","","",0, 5);
		for (int i = 0; i < NewslistA1.size(); i++) {
			try{ String NEWS_TIME2 = new SimpleDateFormat("yyyy-MM-dd").format(NewslistA1.get(i).get("NEWS_TIME")); 
			NewslistA1.get(i).put("NEWS_TIME", NEWS_TIME2);}catch(Exception e){/*e.printStackTrace();*/}
		}
		request.setAttribute("NewslistA1", NewslistA1);
		/**展示N个企业logo 这里只是单独的N张带连接的图片*/
		//List<Map<String, Object>> CPLogoLunbo=this.companyInfoService.getListComp("", null, 0, 20);
		List<Map<String,Object>> CPLogoLunbo=newsFileService.getFiles("MODULE_J", "N", "FILE_ZHONGJIE", 0, 0);
		request.setAttribute("CPLogoLunbo", CPLogoLunbo);
		
		/**[职位信息] 5条 招聘信息 2期*/
		List<Map<String, Object>> NewslistA2=this.innovateService.getTableByName("RECRUIT",0, 5);
		for (int i = 0; i < NewslistA2.size(); i++) {
			try{ String NEWS_TIME2 = new SimpleDateFormat("yyyy-MM-dd").format(NewslistA2.get(i).get("REC_TIME")); 
			NewslistA2.get(i).put("REC_TIME", NEWS_TIME2);}catch(Exception e){/*e.printStackTrace();*/}
		}
		request.setAttribute("NewslistA2", NewslistA2);
		/**[简历信息] 5条个人简历 2期*/
		List<Map<String, Object>> NewslistA3=this.innovateService.getTableByName("RESUME",0, 5);
		for (int i = 0; i < NewslistA3.size(); i++) {
			try{ String NEWS_TIME2 = new SimpleDateFormat("yyyy-MM-dd").format(NewslistA3.get(i).get("REC_TIME")); 
			NewslistA3.get(i).put("REC_TIME", NEWS_TIME2);}catch(Exception e){/*e.printStackTrace();*/}
		}
		request.setAttribute("NewslistA3", NewslistA3);

		//
		/**[诚信认证服务机构 LOGO 单独的file表] logo N个**/
		List<Map<String,Object>> chengxinlogo=newsFileService.getFiles("MODULE_J", "N", "FILE_CHENGXIN", 0, 0);
		request.setAttribute("chengxinlogo", chengxinlogo);
		/**[诚信认证服务机构] 新闻2条*/
		List<Map<String, Object>> NewslistA4=this.innovateService.getImmovateListByType("INTEGRITY_AGENCY","",0, 2);
		for (int i = 0; i < NewslistA4.size(); i++) {
			try{ String NEWS_TIME2 = new SimpleDateFormat("yyyy-MM-dd").format(NewslistA4.get(i).get("CREATE_TIME")); 
			NewslistA4.get(i).put("CREATE_TIME", NEWS_TIME2);}catch(Exception e){/*e.printStackTrace();*/}
		}
		request.setAttribute("NewslistA4", NewslistA4);
		/**[行业协会]  新闻5条*/
		List<Map<String, Object>> NewslistA5=this.innovateService.getImmovateListByType("INDUSTRY_GUILD","",0, 5);
		for (int i = 0; i < NewslistA5.size(); i++) {
			try{ String NEWS_TIME2 = new SimpleDateFormat("yyyy-MM-dd").format(NewslistA5.get(i).get("CREATE_TIME")); 
			NewslistA5.get(i).put("CREATE_TIME", NEWS_TIME2);}catch(Exception e){/*e.printStackTrace();*/}
		}
		request.setAttribute("NewslistA5", NewslistA5);
		/**[需求信息]  表格咨询5条*/
		List<Map<String, Object>> NeedsList=this.innovateService.getImmovateList("DEMAND_SUPPLY",0, 5);
		for (int i = 0; i < NeedsList.size(); i++) {
			try{ String NEWS_TIME2 = new SimpleDateFormat("yyyy-MM-dd").format(NeedsList.get(i).get("CREATE_TIME")); 
			NeedsList.get(i).put("CREATE_TIME", NEWS_TIME2);}catch(Exception e){/*e.printStackTrace();*/}
		}
		request.setAttribute("NeedsList", NeedsList);
		/**[供应信息]  表格咨询5条*/
		List<Map<String, Object>> SupplyList=this.innovateService.getImmovateList("PROVIDE_SUPPLY",0, 5);
		for (int i = 0; i < SupplyList.size(); i++) {
			try{ String NEWS_TIME2 = new SimpleDateFormat("yyyy-MM-dd").format(SupplyList.get(i).get("CREATE_TIME")); 
			SupplyList.get(i).put("CREATE_TIME", NEWS_TIME2);}catch(Exception e){/*e.printStackTrace();*/}
		}
		request.setAttribute("SupplyList", SupplyList);
		//

		/**下载专区 培训课件3、研究报告4、管理案例5、技术创新案例6、财经评论7、其它8  类的 下载5条*/
		List<Map<String, Object>> XiaZai3=this.newsFileService.getFiles("MODULE_J", "MODULE_J_MAIN", "FILE_D", 0, 5);
		for (int i = 0; i < XiaZai3.size(); i++) {
			try{ String TIME2 = new SimpleDateFormat("yyyy-MM-dd").format(XiaZai3.get(i).get("CREATE_TIME")); 
			XiaZai3.get(i).put("CREATE_TIME", TIME2);}catch(Exception e){/*e.printStackTrace();*/}
		}
		request.setAttribute("XiaZai3", XiaZai3);
		List<Map<String, Object>> XiaZai4=this.newsFileService.getFiles("MODULE_J", "MODULE_J_MAIN", "FILE_E", 0, 5);
		for (int i = 0; i < XiaZai4.size(); i++) {
			try{ String TIME2 = new SimpleDateFormat("yyyy-MM-dd").format(XiaZai4.get(i).get("CREATE_TIME")); 
			XiaZai4.get(i).put("CREATE_TIME", TIME2);}catch(Exception e){/*e.printStackTrace();*/}
		}
		request.setAttribute("XiaZai4", XiaZai4);
		List<Map<String, Object>> XiaZai5=this.newsFileService.getFiles("MODULE_J", "MODULE_J_MAIN", "FILE_F", 0, 5);
		for (int i = 0; i < XiaZai5.size(); i++) {
			try{ String TIME2 = new SimpleDateFormat("yyyy-MM-dd").format(XiaZai5.get(i).get("CREATE_TIME")); 
			XiaZai5.get(i).put("CREATE_TIME", TIME2);}catch(Exception e){/*e.printStackTrace();*/}
		}
		request.setAttribute("XiaZai5", XiaZai5);
		List<Map<String, Object>> XiaZai6=this.newsFileService.getFiles("MODULE_J", "MODULE_J_MAIN", "FILE_G", 0, 5);
		for (int i = 0; i < XiaZai6.size(); i++) {
			try{ String TIME2 = new SimpleDateFormat("yyyy-MM-dd").format(XiaZai6.get(i).get("CREATE_TIME")); 
			XiaZai6.get(i).put("CREATE_TIME", TIME2);}catch(Exception e){/*e.printStackTrace();*/}
		}
		request.setAttribute("XiaZai6", XiaZai6);
//		List<Map<String, Object>> XiaZai7=this.newsFileService.getFiles("MODULE_J", "MODULE_J_MAIN", "FILE_H", 0, 5);
//		for (int i = 0; i < XiaZai7.size(); i++) {
//			try{ String TIME2 = new SimpleDateFormat("yyyy-MM-dd").format(XiaZai7.get(i).get("CREATE_TIME")); 
//			XiaZai7.get(i).put("CREATE_TIME", TIME2);}catch(Exception e){/*e.printStackTrace();*/}
//		}
//		request.setAttribute("XiaZai7", XiaZai7);//领导表示不要了
		List<Map<String, Object>> XiaZai8=this.newsFileService.getFiles("MODULE_J", "MODULE_J_MAIN", "FILE_I", 0, 5);
		for (int i = 0; i < XiaZai8.size(); i++) {
			try{ String TIME2 = new SimpleDateFormat("yyyy-MM-dd").format(XiaZai8.get(i).get("CREATE_TIME")); 
			XiaZai8.get(i).put("CREATE_TIME", TIME2);}catch(Exception e){/*e.printStackTrace();*/}
		}
		request.setAttribute("XiaZai8", XiaZai8);
		//主页需要4条横幅广告
		List<Map<String,Object>> bannerAd=newsFileService.getFiles("MODULE_J", "N", "FILE__AD11", 0, 4);
		request.setAttribute("bannerAd", bannerAd);
		/**激活使用*/
		request.setAttribute("moduleCode", "NEWS_K");
		return "forum/forum";  
	}
	/**
	 * 进入table页面
	 * table1 诚信认证服务机构
	 * table2 行业协会
	 * */
	@RequestMapping("/tables")
	public String tables(HttpServletRequest request) { 
		String tablename=request.getParameter("tablename");
		request.setAttribute("tablename", tablename);
		if("table2".equals(tablename)){/**行业协会*/
			request.setAttribute("tablenameCh", "行业协会");
			List<Map<String, Object>> Tables=this.innovateService.getImmovateList("INDUSTRY_GUILD",0, 10);/**获取10条表格信息*/
			for (int i = 0; i < Tables.size(); i++) {
				try{ String TIME2 = new SimpleDateFormat("yyyy-MM-dd").format(Tables.get(i).get("START_TIME")); 
				Tables.get(i).put("START_TIME", TIME2);}catch(Exception e){Tables.get(i).put("START_TIME", "");}
			} 
			request.setAttribute("Tables", Tables);
			//获取推广图片
			List<Map<String,Object>> adImages=newsFileService.getFiles("MODULE_J", "N", "FILE__AD10", 0, 0);
			request.setAttribute("adImages", adImages);
			/**主页加载banner */
			List<Map<String,Object>> bannerImages=newsFileService.getFiles("MODULE_J", "N", "FILE_BANNER", 0, 0);
			request.setAttribute("bannerImages", (bannerImages==null || bannerImages.size()==0)?null:bannerImages.get(0));
			request.setAttribute("pageNo", 0);
			request.setAttribute("moduleCode", "NEWS_K");
			return "forum/table2";
		}else if ("table1".equals(tablename)) {/**诚信认证服务机构*/
			request.setAttribute("tablenameCh", "诚信认证服务机构");
			List<Map<String, Object>> Tables=this.innovateService.getImmovateList("INTEGRITY_AGENCY",0, 10);
			request.setAttribute("Tables", Tables);
			//获取推广图片
			List<Map<String,Object>> adImages=newsFileService.getFiles("MODULE_J", "N", "FILE__AD10", 0, 0);
			request.setAttribute("adImages", adImages);
			/**主页加载banner */
			List<Map<String,Object>> bannerImages=newsFileService.getFiles("MODULE_J", "N", "FILE_BANNER", 0, 0);
			request.setAttribute("bannerImages", (bannerImages==null || bannerImages.size()==0)?null:bannerImages.get(0));
			request.setAttribute("pageNo", 0);
			request.setAttribute("moduleCode", "NEWS_K");
			return "forum/table1";
		}
		return "forum/"+tablename;
	}
	/**
	 * 异步加载更多   2表格 主页  /forum/moretables.do
	 */
	@RequestMapping("/moretables")
	@ResponseBody
	public void moretables(HttpServletRequest request,HttpServletResponse response) { 
		Integer pageNo=request.getParameter("pageNo")==null?0:Integer.parseInt(request.getParameter("pageNo"));
		String tablename=request.getParameter("tablename");
		boolean stat=true;
		List<Map<String, Object>> NewsLoad=new ArrayList<Map<String,Object>>();
		if("table2".equals(tablename)){/**诚信认证服务机构*/
			NewsLoad=this.innovateService.getImmovateList("INDUSTRY_GUILD",(pageNo+1)*10, 10);
			if(NewsLoad!=null && NewsLoad.size()>0){
				for (int i = 0; i < NewsLoad.size(); i++) {
					try{ String TIME2 = new SimpleDateFormat("yyyy-MM-dd").format(NewsLoad.get(i).get("START_TIME")); 
					NewsLoad.get(i).put("START_TIME", TIME2);}catch(Exception e){NewsLoad.get(i).put("START_TIME", "");}
				} 
			}else{
				stat=false;
			}
		}else if("table1".equals(tablename)){/**诚信认证服务机构*/
			NewsLoad=this.innovateService.getImmovateList("INTEGRITY_AGENCY",(pageNo+1)*10, 10);
			if(NewsLoad!=null && NewsLoad.size()>0){
				//
			}else{
				stat=false;
			}
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
	//------------------------------------------------------------------------------------//
	/**
	 * 进入供给supply 发布 页面
	 * */
	@RequestMapping("/supplypub")
	public String supplypub(HttpServletRequest request) { 
		request.setAttribute("moduleCode", "NEWS_K");
		/**主页获取banner */
		List<Map<String,Object>> bannerImages=newsFileService.getFiles("MODULE_J", "N", "FILE_BANNER", 0, 0);
		request.setAttribute("bannerImages", (bannerImages==null || bannerImages.size()==0)?null:bannerImages.get(0));
		return "forum/supplyEdit";
	}
	/**
	 * 进行供给 发布内容保存操作 页面
	 * */
	@RequestMapping("/supplysave")
	public void supplysave(HttpServletRequest request,HttpServletResponse resp,HttpSession session,ProvideSupplyModel param) { 
		//生成32位id
		param.setId(UUID.randomUUID().toString().replace("-", ""));
		String msg="ok";
		try {//进行数据库保存操作
			this.forumService.addProvideSupply(param);msg="ok";
		} catch (Exception e) {
			e.printStackTrace();msg="error";
		}
		try {
			resp.getWriter().println(msg);
		} catch (IOException e) {/*e.printStackTrace();*/}
	}
	/**
	 * 准备 进入 供给 List 页面
	 * */
	@RequestMapping("/supplylist")
	public String supplylist(HttpServletRequest request) {
		/**主页获取banner */
		List<Map<String,Object>> bannerImages=newsFileService.getFiles("MODULE_J", "N", "FILE_BANNER", 0, 0);
		request.setAttribute("bannerImages", (bannerImages==null || bannerImages.size()==0)?null:bannerImages.get(0));
		/**[需求供应]  表格咨询10条*/
		List<Map<String, Object>> NeedsList=this.innovateService.getImmovateList("PROVIDE_SUPPLY",0, 10);
		for (int i = 0; i < NeedsList.size(); i++) {
			try{ String NEWS_TIME2 = new SimpleDateFormat("yyyy-MM-dd").format(NeedsList.get(i).get("CREATE_TIME")); 
			NeedsList.get(i).put("CREATE_TIME", NEWS_TIME2);}catch(Exception e){/*e.printStackTrace();*/}
		}
		request.setAttribute("NeedsList", NeedsList);
		//获取推广图片
		List<Map<String,Object>> adImages=newsFileService.getFiles("MODULE_J", "N", "FILE__AD10", 0, 0);
		request.setAttribute("adImages", adImages);
		//
		request.setAttribute("moduleCode", "NEWS_K");
		return "forum/supplyList";
	}
	/**
	 * 供给 List 页面 加载更多
	 * */
	@RequestMapping("/loadsupply")
	public void loadsupply(HttpServletRequest request,HttpServletResponse response,int pageNo) {
		/**[需求供应]  表格咨询10条*/
		List<Map<String, Object>> NeedsList=this.innovateService.getImmovateList("PROVIDE_SUPPLY",pageNo, 10);
		boolean stat=true;
		for (int i = 0; i < NeedsList.size(); i++) {
			try{ String NEWS_TIME2 = new SimpleDateFormat("yyyy-MM-dd").format(NeedsList.get(i).get("CREATE_TIME")); 
			NeedsList.get(i).put("CREATE_TIME", NEWS_TIME2);}catch(Exception e){/*e.printStackTrace();*/}
		}
		ObjectMapper mapper= new ObjectMapper();
		response.setCharacterEncoding("UTF-8");
		try {
			if(stat){
				response.getWriter().write(mapper.writeValueAsString(NeedsList));
			}else{
				response.getWriter().write(mapper.writeValueAsString("nomore"));
			}
		}catch (IOException e) {/*e.printStackTrace();*/}

	}
	/**
	 * 进入 供给  单个详情 查看页面
	 * */
	@RequestMapping("/supplyview")
	public String supplyview(HttpServletRequest request) { 
		/**主页获取banner */
		List<Map<String,Object>> bannerImages=newsFileService.getFiles("MODULE_J", "N", "FILE_BANNER", 0, 0);
		request.setAttribute("bannerImages", (bannerImages==null || bannerImages.size()==0)?null:bannerImages.get(0));
		String id=request.getParameter("id");
		if(null==id){id="";}
		Map<String, Object> NeedsOne=this.forumService.getProvideSupplyById(id);
		request.setAttribute("NeedsOne", NeedsOne);
		//
		request.setAttribute("moduleCode", "NEWS_K");
		return "forum/supplyView";
	}
	//-----------------------------------------------------------//
	/**
	 * 进入 需求发布 页面
	 * */
	@RequestMapping("/needspub")
	public String needspub(HttpServletRequest request) { 
		request.setAttribute("moduleCode", "NEWS_K");
		/**主页获取banner */
		List<Map<String,Object>> bannerImages=newsFileService.getFiles("MODULE_J", "N", "FILE_BANNER", 0, 0);
		request.setAttribute("bannerImages", (bannerImages==null || bannerImages.size()==0)?null:bannerImages.get(0));
		return "forum/needsEdit";
	}
	/**
	 * 进行 需求 发布内容保存操作 页面
	 * */
	@RequestMapping("/needssave")
	public void needssave(HttpServletRequest request,HttpServletResponse resp,HttpSession session,DemandSupplyModel param) { 
		//生成32位id
		param.setId(UUID.randomUUID().toString().replace("-", ""));
		String msg="ok";
		try {//进行数据库保存操作
			this.forumService.addDemandSupply(param);msg="ok";
		} catch (Exception e) {
			e.printStackTrace();msg="error";
		}
		try {
			resp.getWriter().println(msg);
		} catch (IOException e) {/*e.printStackTrace();*/}
	}
	/**
	 * 进入 需求List 页面
	 * */
	@RequestMapping("/needslist")
	public String needslist(HttpServletRequest request) {
		/**主页获取banner */
		List<Map<String,Object>> bannerImages=newsFileService.getFiles("MODULE_J", "N", "FILE_BANNER", 0, 0);
		request.setAttribute("bannerImages", (bannerImages==null || bannerImages.size()==0)?null:bannerImages.get(0));
		/**[需求供应]  表格咨询10条*/
		List<Map<String, Object>> NeedsList=this.innovateService.getImmovateList("DEMAND_SUPPLY",0, 10);
		for (int i = 0; i < NeedsList.size(); i++) {
			try{ String NEWS_TIME2 = new SimpleDateFormat("yyyy-MM-dd").format(NeedsList.get(i).get("CREATE_TIME")); 
			NeedsList.get(i).put("CREATE_TIME", NEWS_TIME2);}catch(Exception e){/*e.printStackTrace();*/}
		}
		request.setAttribute("NeedsList", NeedsList);
		//获取推广图片
		List<Map<String,Object>> adImages=newsFileService.getFiles("MODULE_J", "N", "FILE__AD10", 0, 0);
		request.setAttribute("adImages", adImages);
		//
		request.setAttribute("moduleCode", "NEWS_K");
		return "forum/needsList";
	}
	/**
	 * 需求List 加载更多
	 * */
	@RequestMapping("/loadneeds")
	public void loadneeds(HttpServletRequest request,HttpServletResponse response,int pageNo) {
		/**[需求供应]  表格咨询10条*/
		List<Map<String, Object>> NeedsList=this.innovateService.getImmovateList("DEMAND_SUPPLY",pageNo, 10);
		boolean stat=true;
		for (int i = 0; i < NeedsList.size(); i++) {
			try{ String NEWS_TIME2 = new SimpleDateFormat("yyyy-MM-dd").format(NeedsList.get(i).get("CREATE_TIME")); 
			NeedsList.get(i).put("CREATE_TIME", NEWS_TIME2);}catch(Exception e){/*e.printStackTrace();*/}
		}
		ObjectMapper mapper= new ObjectMapper();
		response.setCharacterEncoding("UTF-8");
		try {
			if(stat){
				response.getWriter().write(mapper.writeValueAsString(NeedsList));
			}else{
				response.getWriter().write(mapper.writeValueAsString("nomore"));
			}
		}catch (IOException e) {/*e.printStackTrace();*/}
	}
	/**
	 * 进入 需求单个详情 查看页面
	 * */
	@RequestMapping("/needsview")
	public String needsview(HttpServletRequest request) {
		/**主页获取banner */
		List<Map<String,Object>> bannerImages=newsFileService.getFiles("MODULE_J", "N", "FILE_BANNER", 0, 0);
		request.setAttribute("bannerImages", (bannerImages==null || bannerImages.size()==0)?null:bannerImages.get(0));
		String id=request.getParameter("id");
		if(null==id){id="";}
		Map<String, Object> NeedsOne=this.forumService.getDemandSupplyById(id);
		request.setAttribute("NeedsOne", NeedsOne);
		//
		request.setAttribute("moduleCode", "NEWS_K");
		return "forum/needsView";
	}
	/**---------------------------------------------------------------------------*/
	/**
	 * 进入 简历list页面
	 * */
	@RequestMapping("/resumelist")
	public String resumelist(HttpServletRequest request) {
		//主页获取banner
		List<Map<String,Object>> bannerImages=newsFileService.getFiles("MODULE_J", "N", "FILE_BANNER", 0, 0);
		request.setAttribute("bannerImages", (bannerImages==null || bannerImages.size()==0)?null:bannerImages.get(0));
		//获取10条简历信息
		List<Map<String, Object>> NewslistA3=this.innovateService.getTableByName("RESUME",0, 10);
		for (int i = 0; i < NewslistA3.size(); i++) {
			String MARKET_TIME="";
			if(NewslistA3.get(i).get("REC_TIME")!=null){
				MARKET_TIME= new SimpleDateFormat("yyyy-MM-dd").format(NewslistA3.get(i).get("REC_TIME")); 
			}
			NewslistA3.get(i).put("REC_TIME", MARKET_TIME);
		}
		request.setAttribute("NewslistM", NewslistA3);
		//获取推广图片
		List<Map<String,Object>> adImages=newsFileService.getFiles("", "", "FILE_AD3", 0, 0);
		request.setAttribute("adImages", adImages);
		//
		request.setAttribute("moduleCode", "NEWS_K");
		return "forum/resumelist";
	}	
	/**
	 * 简历 List 加载更多
	 * */
	@RequestMapping("/moreResume")
	public void moreResume(HttpServletRequest request,HttpServletResponse response,int pageNo) {
		/**[简历]  表格咨询10条*/
		
		List<Map<String, Object>> NeedsList=this.innovateService.getTableByName("RESUME",(pageNo+1)*10,10);
		boolean stat=true;
		for (int i = 0; i < NeedsList.size(); i++) {
			String MARKET_TIME="";
			if(NeedsList.get(i).get("REC_TIME")!=null){
				MARKET_TIME= new SimpleDateFormat("yyyy-MM-dd").format(NeedsList.get(i).get("REC_TIME")); 
			}
			NeedsList.get(i).put("REC_TIME", MARKET_TIME);
		}
		ObjectMapper mapper= new ObjectMapper();
		response.setCharacterEncoding("UTF-8");
		try {
			if(stat){
				response.getWriter().write(mapper.writeValueAsString(NeedsList));
			}else{
				response.getWriter().write(mapper.writeValueAsString("nomore"));
			}
		}catch (IOException e) {}
	}
	/**---------------------------------------------------------------------------*/
	/**
	 * 进入 招聘list页面
	 * */
	@RequestMapping("/recruitlist")
	public String recruitlist(HttpServletRequest request) {
		//主页获取banner
		List<Map<String,Object>> bannerImages=newsFileService.getFiles("MODULE_J", "N", "FILE_BANNER", 0, 0);
		request.setAttribute("bannerImages", (bannerImages==null || bannerImages.size()==0)?null:bannerImages.get(0));
		//获取10条简历信息
		List<Map<String, Object>> NewslistA3=this.innovateService.getTableByName("RECRUIT",0, 10);
		for (int i = 0; i < NewslistA3.size(); i++) {
			String MARKET_TIME="";
			if(NewslistA3.get(i).get("REC_TIME")!=null){
				MARKET_TIME= new SimpleDateFormat("yyyy-MM-dd").format(NewslistA3.get(i).get("REC_TIME")); 
			}
			NewslistA3.get(i).put("REC_TIME", MARKET_TIME);
		}
		request.setAttribute("NewslistM", NewslistA3);
		//获取推广图片
		List<Map<String,Object>> adImages=newsFileService.getFiles("", "", "FILE_AD2", 0, 0);
		request.setAttribute("adImages", adImages);
		//
		request.setAttribute("moduleCode", "NEWS_K");
		return "forum/recruitlist";
	}	
	/**
	 * 招聘 List 加载更多
	 * */
	@RequestMapping("/moreRecruit")
	public void moreRecruit(HttpServletRequest request,HttpServletResponse response,int pageNo) {
		/**[招聘]  表格咨询10条*/
		
		List<Map<String, Object>> NeedsList=this.innovateService.getTableByName("RECRUIT",(pageNo+1)*10,10);
		boolean stat=true;
		for (int i = 0; i < NeedsList.size(); i++) {
			String MARKET_TIME="";
			if(NeedsList.get(i).get("REC_TIME")!=null){
				MARKET_TIME= new SimpleDateFormat("yyyy-MM-dd").format(NeedsList.get(i).get("REC_TIME")); 
			}
			NeedsList.get(i).put("REC_TIME", MARKET_TIME);
		}
		ObjectMapper mapper= new ObjectMapper();
		response.setCharacterEncoding("UTF-8");
		try {
			if(stat){
				response.getWriter().write(mapper.writeValueAsString(NeedsList));
			}else{
				response.getWriter().write(mapper.writeValueAsString("nomore"));
			}
		}catch (IOException e) {}
	}
	
	/**
	 * 进入 单个招聘 页面
	 * */
	@RequestMapping("/recruitOne")
	public String recruitOne(HttpServletRequest request) {
		String id=request.getParameter("id");
		//主页获取banner
		List<Map<String,Object>> bannerImages=newsFileService.getFiles("MODULE_J", "N", "FILE_BANNER", 0, 0);
		request.setAttribute("bannerImages", (bannerImages==null || bannerImages.size()==0)?null:bannerImages.get(0));
		//获取1条信息
		Recruit NewsOne=loginRegisterService.getRecruitByID(id);
		request.setAttribute("NewsOne", NewsOne);
		//获取推广图片
		List<Map<String,Object>> adImages=newsFileService.getFiles("", "", "FILE_AD2", 0, 0);
		request.setAttribute("adImages", adImages);
		/**上一条*/
		Map<String, Object> NewsPre=loginRegisterService.getPreRecruitByID(id);
		request.setAttribute("NewsPre", NewsPre);
		/**下一条*/
		Map<String, Object> NewsNext=loginRegisterService.getNextRecruitByID(id);
		request.setAttribute("NewsNext", NewsNext);
		//
		request.setAttribute("moduleCode", "NEWS_K");
		return "forum/recruitView";
	}
}
