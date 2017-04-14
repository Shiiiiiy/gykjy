package com.uws.controller;
import java.io.IOException;
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
import com.uws.service.InnovateService;
import com.uws.service.NewsFileService;
/**
 * F5 技术创新  控制层
 */
@Controller
@RequestMapping("/tech")
public class TechController {
	@Resource
	private NewsFileService newsFileService;
	@Resource
	private CompanyInfoService companyInfoService;
	@Resource
	private InnovateService innovateService;
	/**
	 * 进入 技术创新 主页  /prop/index.do
	 */
	@RequestMapping("/index")
	public String index(HttpServletRequest request) { 
		/**主页加载banner*/
		List<Map<String,Object>> bannerImages=newsFileService.getFiles("MODULE_G", "N", "FILE_BANNER", 0, 0);
		request.setAttribute("bannerImages", (bannerImages==null || bannerImages.size()==0)?null:bannerImages.get(0));
		/**主页N张主视觉图 */
		List<Map<String, Object>> Lunbo=this.newsFileService.getFiles("MODULE_G", "MODULE_G_MAIN", "FILE_SLIDER", 0, 0);
		request.setAttribute("Lunbo", Lunbo);
		/**主页7条技术创新动态新闻 */
		List<Map<String, Object>> NewslistA=this.newsFileService.getNews( "NEWS_C","","",0, 7);
		for (int i = 0; i < NewslistA.size(); i++) {
			try{ String NEWS_TIME2 = new SimpleDateFormat("yyyy-MM-dd").format(NewslistA.get(i).get("NEWS_TIME")); 
			NewslistA.get(i).put("NEWS_TIME", NEWS_TIME2);}catch(Exception e){/*e.printStackTrace();*/}
		} 
		request.setAttribute("NewslistA", NewslistA);
		/**主页12条技术创新成果 图片+文字*/
		List<Map<String, Object>> Tu1=this.newsFileService.getFiles("MODULE_G", "MODULE_G_MAIN", "FILE_RESULT",0, 0);
		request.setAttribute("Tu1", Tu1);
		/**主页12条技术创新平台 图片+文字 */
		List<Map<String, Object>> Tu2=this.newsFileService.getFiles("MODULE_G", "MODULE_G_MAIN", "FILE_STAGE",0, 0);
		request.setAttribute("Tu2", Tu2);
		/**主页需要N张技术创新人才实体*/
		List<Map<String, Object>> ManList=this.innovateService.getExcellentPersonList("1", "", 0, 0);
		for (int i = 0; i < ManList.size(); i++) {
			try{ String NEWS_TIME2 = new SimpleDateFormat("yyyy-MM-dd").format(ManList.get(i).get("PS_BIRTH")); 
			ManList.get(i).put("PS_BIRTH", NEWS_TIME2);}catch(Exception e){/*e.printStackTrace();*/}
		} 
		request.setAttribute("ManList", ManList);
		/**主页需要2张技术创新统计图表*/
		List<Map<String, Object>> TongJi=this.newsFileService.getFiles("MODULE_G", "MODULE_G_MAIN", "FILE_STATISTICS", 0, 0);
		request.setAttribute("TongJi", TongJi);
		/**主页需要7条产学研合作下载*/
		List<Map<String, Object>> XiaZai1=this.newsFileService.getFiles("MODULE_G", "MODULE_G_MAIN", "FILE_B", 0, 7);
		for (int i = 0; i < XiaZai1.size(); i++) {
			try{ String TIME2 = new SimpleDateFormat("yyyy-MM-dd").format(XiaZai1.get(i).get("CREATE_TIME")); 
			XiaZai1.get(i).put("CREATE_TIME", TIME2);}catch(Exception e){/*e.printStackTrace();*/}
		} 
		request.setAttribute("XiaZai1", XiaZai1);
		/**主页需要7条创新指数报告下载*/
		List<Map<String, Object>> XiaZai2=this.newsFileService.getFiles("MODULE_G", "MODULE_G_MAIN", "FILE_C", 0, 7);
		for (int i = 0; i < XiaZai2.size(); i++) {
			try{ String TIME2 = new SimpleDateFormat("yyyy-MM-dd").format(XiaZai2.get(i).get("CREATE_TIME")); 
			XiaZai1.get(i).put("CREATE_TIME", TIME2);}catch(Exception e){/*e.printStackTrace();*/}
		} 
		request.setAttribute("XiaZai2", XiaZai2);
		/**主页需要1张产学研合作图表*/
		List<Map<String, Object>> TongJi1=this.newsFileService.getFiles("MODULE_G", "MODULE_G_MAIN", "FILE_COOPERA", 0, 0);
		request.setAttribute("TongJi1", TongJi1);
		/**主页需要1张创新指数报告图表  作废
		List<Map<String, Object>> TongJi2=this.newsFileService.getFiles("MODULE_G", "MODULE_G_INNOVATION", "FILE_STATISTICS", 0, 1);
		request.setAttribute("TongJi2", TongJi2);*/
		/**需要此码标题栏激活*/
		request.setAttribute("moduleCode", "NEWS_C");
	    return "tech/tech";  
	}
	/**
	 * 进入 技术创新平台  2表格 主页  /tech/tables.do
	 */
	@RequestMapping("/tables")
	public String tables(HttpServletRequest request) { 
		String tablename=request.getParameter("tablename");
		request.setAttribute("tablename", tablename);
		if("table2".equals(tablename)){//技术创新平台
			/**获取10条表格信息*/
			List<Map<String, Object>> Tables=this.innovateService.getImmovateList("TECH_INNOVATION",0, 10);
			for (int i = 0; i < Tables.size(); i++) {
				try{ String TIME2 = new SimpleDateFormat("yyyy-MM-dd").format(Tables.get(i).get("START_TIME")); 
				Tables.get(i).put("START_TIME", TIME2);}catch(Exception e){/*e.printStackTrace();*/}
			} 
			request.setAttribute("Tables", Tables);
			//获取推广图片
			List<Map<String,Object>> adImages=newsFileService.getFiles("MODULE_Q", "N", "FILE__AD9", 0, 0);
			request.setAttribute("adImages", adImages);
			/**主页加载banner */
			List<Map<String,Object>> bannerImages=newsFileService.getFiles("MODULE_G", "N", "FILE_BANNER", 0, 0);
			request.setAttribute("bannerImages", (bannerImages==null || bannerImages.size()==0)?null:bannerImages.get(0));
			request.setAttribute("pageNo", 0);
			request.setAttribute("moduleCode", "NEWS_C");
			return "tech/table";
		}else if ("table1".equals(tablename)) {
			/**技术创新成果 发明专利**/
			List<Map<String, Object>> Tables1=this.innovateService.getImmovateListByType("TECH_ACHIEV","TYPE_A",0, 5);
			for (int i = 0; i < Tables1.size(); i++) {
				try{ String TIME2 = new SimpleDateFormat("yyyy-MM-dd").format(Tables1.get(i).get("CERT_TIME")); 
				Tables1.get(i).put("CERT_TIME", TIME2);  }catch(Exception e){/*e.printStackTrace();*/}
				try{ String TIME3 = new SimpleDateFormat("yyyy-MM-dd").format(Tables1.get(i).get("EFFECT_TIME")); 
				Tables1.get(i).put("EFFECT_TIME", TIME3);}catch(Exception e){/*e.printStackTrace();*/}
			} 
			/**技术创新成果 其他**/
			List<Map<String, Object>> Tables2=this.innovateService.getImmovateListByType("TECH_ACHIEV","TYPE_B",0, 5);
			for (int i = 0; i < Tables2.size(); i++) {
				try{ String TIME2 = new SimpleDateFormat("yyyy-MM-dd").format(Tables2.get(i).get("CERT_TIME")); 
				Tables2.get(i).put("CERT_TIME", TIME2);  }catch(Exception e){}
				try{ String TIME3 = new SimpleDateFormat("yyyy-MM-dd").format(Tables2.get(i).get("EFFECT_TIME")); 
				Tables2.get(i).put("EFFECT_TIME", TIME3);}catch(Exception e){}
			}
			request.setAttribute("Tables1", Tables1);
			request.setAttribute("Tables2", Tables2);
			//获取推广图片
			List<Map<String,Object>> adImages=newsFileService.getFiles("MODULE_P", "N", "FILE__AD9", 0, 0);
			request.setAttribute("adImages", adImages);
			/**主页加载banner */
			List<Map<String,Object>> bannerImages=newsFileService.getFiles("MODULE_G", "N", "FILE_BANNER", 0, 0);
			request.setAttribute("bannerImages", (bannerImages==null || bannerImages.size()==0)?null:bannerImages.get(0));
			request.setAttribute("pageNo1", 0);
			request.setAttribute("pageNo2", 0);
			request.setAttribute("moduleCode", "NEWS_C");
			return "tech/tables";
		}
		return "tech/tech";
	}
	/**
	 * 异步加载更多 技术创新平台  2表格 主页  /tech/moretables.do
	 */
	@RequestMapping("/moretables")
	@ResponseBody
	public void moretables(HttpServletRequest request,HttpServletResponse response) { 
		Integer pageNo=request.getParameter("pageNo")==null?0:Integer.parseInt(request.getParameter("pageNo"));
		String tablename=request.getParameter("tablename");
		String type=request.getParameter("type");
		boolean stat=true;
		List<Map<String, Object>> NewsLoad=new ArrayList<Map<String,Object>>();
		if("table2".equals(tablename)){
			NewsLoad=this.innovateService.getImmovateList("TECH_INNOVATION",(pageNo+1)*10, 10);
			if(NewsLoad!=null && NewsLoad.size()>0){
				for (int i = 0; i < NewsLoad.size(); i++) {
					try{ String TIME2 = new SimpleDateFormat("yyyy-MM-dd").format(NewsLoad.get(i).get("START_TIME")); 
					NewsLoad.get(i).put("START_TIME", TIME2);}catch(Exception e){/*e.printStackTrace();*/}
				} 
			}else{
				stat=false;
			}
		}else if("table1".equals(tablename)){
			NewsLoad=this.innovateService.getImmovateListByType("TECH_ACHIEV", type,(pageNo+1)*5, 5);
			if(NewsLoad!=null && NewsLoad.size()>0){
				for (int i = 0; i < NewsLoad.size(); i++) {
					if(NewsLoad.get(i).get("CERT_TIME")!=null || NewsLoad.get(i).get("CERT_TIME")!=""){
						try{ String TIME2 = new SimpleDateFormat("yyyy-MM-dd").format(NewsLoad.get(i).get("CERT_TIME")); 
						NewsLoad.get(i).put("CERT_TIME", TIME2);}catch(Exception e){}
					}
					if(NewsLoad.get(i).get("EFFECT_TIME")!="null" || NewsLoad.get(i).get("EFFECT_TIME")!=""){
						try{ String TIME3 = new SimpleDateFormat("yyyy-MM-dd").format(NewsLoad.get(i).get("EFFECT_TIME")); 
						NewsLoad.get(i).put("EFFECT_TIME", TIME3);}catch(Exception e){}
					}
				}
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
	
}
