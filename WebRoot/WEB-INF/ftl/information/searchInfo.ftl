<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
	 	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	    <meta name="viewport" content="width=device-width, initial-scale=1">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <meta http-equiv="keywords" content="中关村贵阳科技园,贵阳科技园">
	    <link href="${rc.contextPath}/plugins/images/favicon.ico" rel="shortcut icon">
	    <link rel="stylesheet" href="${rc.contextPath}/plugins/bootstrap/bootstrap.min.css">
	    <link rel="stylesheet" href="${rc.contextPath}/plugins/style/base.css" />
	    <link rel="stylesheet" href="${rc.contextPath}/plugins/style/iconfont.css" />
	    <link rel="stylesheet" href="${rc.contextPath}/plugins/style/header.css" />
	    <link rel="stylesheet" href="${rc.contextPath}/plugins/style/footer.css" />
	    <link rel="stylesheet" href="${rc.contextPath}/plugins/style/content.css" />
	    <link rel="stylesheet" href="${rc.contextPath}/plugins/style/animate-custom.css">
	    <link rel="stylesheet" href="${rc.contextPath}/plugins/ztree/css/zTreeStyle/zTreeStyle.css" type="text/css">
	    <script type="text/javascript" src="${rc.contextPath}/plugins/js/jquery.min.js"></script>
	    <script type="text/javascript" src="${rc.contextPath}/plugins/js/jquery.headshrinker.js"></script>
		<script type="text/javascript" src="${rc.contextPath}/plugins/js/rollSlide.js"></script>
	    <script type="text/javascript" src="${rc.contextPath}/plugins/js/slider.js"></script>
	    <script type="text/javascript" src="${rc.contextPath}/plugins/ztree/js/jquery.ztree.core.js"></script>
	    <script type="text/javascript" src="${rc.contextPath}/plugins/layer/layer.js"></script>
	</head>
	<body class="con_main_bg">
		<#include "/footerAndHeader/headers.ftl"/>
		<a href="${(bannerImages.URL)!'#'}" <#if bannerImages?? && bannerImages.URL??>target="_blank"<#else> style="cursor:default;"</#if>><div class="banner w" style="background: url(${rc.contextPath}/plugins/images/allImages/${(bannerImages.FILE_NAME)!''}) top center no-repeat;"></div></a>
		<div class="container mainbg mt20">
		<div class="clearfix mt20 nav_new">
	        <div class="bread-nav fl">
	            您的位置：<a href="${rc.contextPath}/index">首页</a><span>&gt;</span>企业信息
	        </div>
	        <div class="search fr search-xs" >
	            <div class="fl"><input type="text" class="search-text" id="searchCompany_text" value="${keyWord!''}" name="" placeholder="搜企业" /></div>
	            <div class="fr"><button class="search-but" onclick="searchCompany()" ><i class="iconfont f30">&#xe60a;</i></button></div>
	        </div>
	    </div>
		<div class="list-enterprises clearfix">
            <div class="row">
                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                	<!-- card 公司名片展示 模块 -->
                	<input id="hidepageStart" type="hidden" value="${(pageStart)!'0'}"></input>
					<input id="hidepageEnd" type="hidden" value="${(pageEnd)!'0'}"></input>
					<input id="FirstPageSize" type="hidden" value="${(FirstPageSize)!'0'}"></input>
					<input id="moduleCode" type="hidden" value="${(moduleCode)!'0'}"></input>
                    <div id="cardImages" class="card-box" style="display:none;">
                        <div class="card-close"><i class="iconfont">&#xe652;</i>关闭</div>
                        <div class="card-con">
                            <h3 id="card-cp-name">[公司名称]</h3>
                            <p class="f14 lh180" id="card-cp-abs">[公司简介]</p>
                        </div>
                    </div>
                    <!-- 产品图片展示 模块 -->
                    <div id="productImages" class="card-box pro-box" style="display:none;">
                        <div class="card-close"><i class="iconfont">&#xe652;</i>关闭</div>
                        <div class="card-scroll  sm-scroll">
                            <ul id="pt" class="card-c sm-c">
                            </ul>
<!--                             <div class="slider-btn btn-black"><a class="prev" href="javascript:void(0);" style="left:-10px;"></a><a class="next" href="javascript:void(0);" style="right:-10px;"></a></div>
 -->                        </div>
                    </div>
                	<!---- 公司列表 --->
                	<div id="listmore">
                	<#if CPList??>
					<#list CPList as aa>
	                    <div class="row list-item" title="${(aa.CP_NAME)!''}">
	                        <div class="col-xs-12 col-sm-3 col-md-3 col-lg-2"><img src="${rc.contextPath}/plugins/images/allImages/${(aa.CP_VIEW)!''}" alt="" class="img-responsive" /></div>
	                        <div class="col-xs-12 col-sm-9 col-md-9 col-lg-10 infor mylist-item">
	                            <h3 class="f16 list-title"><span class="date fr f14">${((aa.CREATE_TIME)!'')}</span><span class="fb tt">${(aa.CP_NAME)!''}</span><a href="javascript:void(0);" onclick="showCard('${aa.ID}')" class="card-btn" title="名片"><i class="iconfont f20">&#xe62f;</i></a></h3>
	                            <ul>
	                                <li><label>所属行业</label>${(aa.CP_BELONG)!''}</li>
	                                <li><label>企业性质</label>${(aa.CP_TYPE)!''}</li>
	                                <li><label>所在地区</label>${(aa.CP_LOCATION)!''}</li>
	                                <li><label>经营产品</label><a href="javascript:void(0);"  onclick="showTU(this);"  name="${(aa.ID)!''}" class="card-btn pro-btn" title="产品图片">${(aa.CP_PRODUCT)!''}</a></li>
	                                <li><label>网址</label><a href="${(aa.CP_ADDRESS)!''}" class="link" target="_blank">${(aa.CP_ADDRESS)!''}</a></li>
	                                <li><label>电话</label><span class="font-en">${(aa.CP_PHONE)!''}</span></li>
	                            </ul>
	                            <input type="hidden" value="${(aa.CP_NAME)!''}" id="${'CPNAME'+aa.ID}"/>
	                            <input type="hidden" value="${(aa.CP_ABSTRACT)!''}" id="${'CPABS'+aa.ID}"/>
	                        </div>
	                    </div>
                    </#list>
					</#if>
					</div>
                    <!--page 加载更多--> 
                   <button onclick="GetMore()" <#if CPList?? && CPList?size lt 7>disabled</#if> id="tmore" type="button" class="btn btn-primary btn-block"><#if CPList?? && CPList?size lt 7>没有更多<#else><i class="iconfont mr5" style="vertical-align:middle">&#xe605;</i>加载更多</#if></button>  
                </div>
            </div>
        </div>
    </div>      
        <#include "/footerAndHeader/footers.ftl"/>
      
	</body>
	<script type="text/javascript">
	 
	$(function(){
		/**新框架加上 hover效果*/
	    $(".list-item").hover(function () {
	        $(this).find(".infor").css("height","auto");
	    }, function () {
	        $(this).find(".infor").css("height", "75px");
	    });
	})
	function showCard(aa){/**展示名片函数*/ 	
	    $("body").append("<div class='mask'></div>");
        if ($("#cardImages").css("display") == "none") {
        	//用参数改变展示用2个值
        	var id=aa;
        	var name=$("#CPNAME"+id).val();
        	var abs=""+$("#CPABS"+id).val();//最大300
        	//alert(abs);
        	if(abs.length > 300){
        		abs=abs.substring(0,300)+"...";
        	}
        	$("#card-cp-name").html(name);
        	$("#card-cp-abs").html(abs);
            $("#cardImages").show();
        } else {
            $("#cardImages").hide();
        }
    }
	
	 $(".card-close").click(function () {
         $("div.mask").remove();
         $("#cardImages").hide();
         $("#productImages").hide();
     });
	 
	/*function searchCompany(){
		var str = $("#searchCompany_text").val();
		var moduleCode = $("#moduleCode").val(); 
		if(str==""||str==null){
			return ;
		}else{
			window.location.href="${rc.contextPath}/info/quanSearchCp.do?keyWord="+encodeURI(encodeURI(str))+"&moduleCode="+moduleCode;
		}
	}*/
    function showTU(aa){/**展示产品图片*/
        $("body").append("<div class='mask'></div>");
        if ($("#productImages").css("display") == "none") {
        	//alert(aa.name);
        	getProductImages(aa.name);
            $("#productImages").show();
        } else {
            $("#productImages").hide();
        }
    }
    function getProductImages(aa){/**获取产品图片 不要修改*/
    	  $("#pt").html("");
          $.post("${rc.contextPath}/industry/getProductImages.do",{"compId":aa},function(objs) {
	        	if(objs=="nomore"){
		             //$("#productImages").hide();
	            }else{
	                 $.each(objs,function(index,value){
		                $("#pt").append(
		                    "<li><p class='txt'>"+value.FILE_TITLE+"</p><img src='${rc.contextPath}/plugins/images/allImages/"+value.FILE_NAME+"' alt='' class='img-responsive' /></li>"
		             );
	            });
            }
            
        },"json");
    }
	document.onkeydown=function(event){
         var e = event || window.event || arguments.callee.caller.arguments[0];
         if(e && e.keyCode==13){ // enter 键
        	 searchCompany();
         }
     };  
	function GetMore(){/*获取更多 公司*/
			var pageStart = $("#hidepageStart").val();
			var pageEnd   = $("#hidepageEnd").val();
			pageStart = Number($("#listmore .list-item").length);	
		
	    	var keyWord =  $("#searchCompany_text").val();
	    	
	        $.post("${rc.contextPath}/info/loadcpsBySearch.do",{"pageStart":pageStart,"pageEnd":pageEnd,"keyWord":keyWord},function(obj) {
	        	var shumu=0;
	            $.each(obj,function(index,value){
	                $("#listmore").append(
	                "<div class='row list-item' title='"+value.CP_NAME+"'>"+
                     "<div class='col-xs-12 col-sm-3 col-md-3 col-lg-2'><img src="+"${rc.contextPath}/plugins/images/allImages/"+ value.CP_VIEW +" class='img-responsive' /></div>"+
                     "<div class='col-xs-12 col-sm-9 col-md-9 col-lg-10 infor mylist-item'>"+
                         "<h3 class='f16 list-title'><span class='date fr f14'>"+value.CREATE_TIME+"</span><span class='fb tt'>"+value.CP_NAME+"</span><a href='javascript:void(0);' onclick=showCard('"+value.ID+"')  class='card-btn' title='名片'><i class='iconfont f20'>&#xe62f;</i></a></h3>"+
                         "<ul>"+
                             "<li><label>所属行业</label>"+value.CP_BELONG+"</li>"+
                             "<li><label>企业性质</label>"+value.CP_TYPE+"</li>"+
                             "<li><label>所在地区</label>"+value.CP_LOCATION+"</li>"+
                             "<li><label>经营产品</label><a title='产品图片' href='javascript:void(0);' onclick='showTU(this);' class='card-btn pro-btn' name="+value.ID+" >"+value.CP_PRODUCT+"</a></li>"+
                             "<li><label>网址</label><a href="+value.CP_ADDRESS+" class='link' target='_blank'>"+value.CP_ADDRESS+"</a></li>"+
                             "<li><label>电话</label><span class='font-en'>"+value.CP_PHONE+"</span></li>"+
                         "</ul>"+
                         "<textarea style='display:none' id=CPABS"+value.ID+" >"+value.CP_ABSTRACT+"</textarea>"+
                         "<input type='hidden' value='"+value.CP_NAME+"' id='CPNAME"+value.ID+"'/>"+
                     "</div>"+
                 "</div>"
	                );
	                /**新框架加上 hover效果*/
			        $(".list-item").hover(function () {
		                $(this).find(".infor").css("height","auto");
		            }, function () {
		                $(this).find(".infor").css("height", "75px");
		            });
	                shumu=shumu+1;
	            });
	            if(shumu < pageEnd){
	            	$("#tmore").html("没有更多");
	            	$("#tmore").removeAttr("onclick");
	            	$("#tmore").attr("disabled","disabled");
	            }
	            $("#hidepageStart").val(pageStart);
	        },"json");
		}
	</script>
</html>