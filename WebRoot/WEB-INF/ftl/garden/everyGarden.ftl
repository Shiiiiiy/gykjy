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
    <script type="text/javascript" src="${rc.contextPath}/plugins/js/jquery.min.js"></script>
    <script type="text/javascript" src="${rc.contextPath}/plugins/js/jquery.headshrinker.js"></script>
    <script type="text/javascript" src="${rc.contextPath}/plugins/js/slider.js"></script>
    <!--[if lte IE 9]>
    <script src="${rc.contextPath}/plugins/js/respond.min.js"></script>
    <script src="${rc.contextPath}/plugins/js/html5shiv.js"></script>
    <![endif]-->
    <title>${(garden.NAME)!""}-中关村贵阳科技园产业云平台</title>
</head>
<body class="con_main_bg">
    <!-- topbar -->
    <#include "/footerAndHeader/headers.ftl"/>
    <!-- banner -->
    <a href="javascript:void(0)" style="cursor:default;"><div class="banner w" style="background: url(${rc.contextPath}/plugins/images/allImages/${(bannerImages.FILE_NAME)!''}) top center no-repeat;"></div></a>
    <div class="container mainbg mt20">
	<!-- bread -->
    <div class="clearfix mt20 nav_new">
        <div class="bread-nav fl">
            您的位置：<a href="${rc.contextPath}/index">首页</a><span>&gt;</span><a href="${rc.contextPath}/garden">产业园区&nbsp;&nbsp;</a>&gt;&nbsp;&nbsp;${(garden.NAME)!""}
        </div>
	        <div class="search fr search-xs" >
	            <div class="fl"><input type="text" class="search-text" id="searchCompany_text" value="${keyWord!''}" name="" placeholder="搜企业" /></div>
	            <div class="fr"><button class="search-but" onclick="searchCompany()" ><i class="iconfont f30">&#xe60a;</i></button></div>
	        </div>
    </div>
    <!-- news -->
        <div class="news-box clearfix">
            <div class="row">
                <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                    <div class="slider-box">
                        <ul class="slider-con">
                           <#if sliderImages??>
                            <#list sliderImages as si>
                                <li><p class="txt">${(si.FILE_TITLE)!""}</p><a href="${(si.URL)!'javascript:void(0)'}" <#if si?? && si.URL??>target="_blank"<#else> style="cursor:default;"</#if>><img src="${rc.contextPath}/plugins/images/allImages/${(si.FILE_NAME)!''}" class="img-responsive" alt="" /></a></li>
                            </#list>
                           </#if> 
                        </ul>
                        <div class="slider-btn btn-white"><a class="prev" href="javascript:void(0);"></a><a class="next" href="javascript:void(0);"></a></div>
                    </div>
                </div>
                <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
				<div class="border-box dtmin">
                    <h2 class="news-t"><span class="more fr"><a href="${rc.contextPath}/garden/newsList/${(garden.ID)!''}/GARDEN_A/NEWS_L">更多 &gt;</a></span><i class="iconfont mr10 f25 gray10">&#xe613;</i><span class="f18">园区动态</span></h2>
                    <dl class="newslist">
                        <#if newsList??>
	                        <#list newsList as nl>
	                             <#if nl_index==0>
			                        <dt>
			                            <a href="${rc.contextPath}/garden/newsDetail/${(garden.ID)!''}/GARDEN_A/${(nl.ID)!''}"  title="${(nl.NEWS_TITLE)!''}" >${(nl.NEWS_TITLE)!""}</a>
			                            <span class="fn f12" style="word-break: break-all;" ><#if nl.INTRODUCE?? && nl.INTRODUCE?length gt 79>${((nl.INTRODUCE)!"")?substring(0,79)}...<#else>${(nl.INTRODUCE)!""}</#if></span>
			                        </dt>
			                     <#else>   
			                        <dd><a href="${rc.contextPath}/garden/newsDetail/${(garden.ID)!''}/GARDEN_A/${(nl.ID)!''}"  title="${(nl.NEWS_TITLE)!''}" ><span class="date">${((nl.NEWS_TIME)!"")?string("yyyy-MM-dd")}</span>${(nl.NEWS_TITLE)!""}</a></dd>
			                     </#if>   
	                        </#list>
	                     </#if>
                    </dl>
					</div>
                </div>
            </div>
        </div>
    <!--about-->
    <div class="mt20 clearfix">
	<h2 class="f25 fb title-p"><span class="txt blue-b">园区简介</span><span class="line border-c"></span></h2>
        <div class="row">
            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                 <div style="padding:10px 30px;"><div style="max-height:500px;overflow:hidden;/*overflow-y:auto;*/"><img src="${rc.contextPath}/plugins/images/allImages/${(garden.STATUS)!''}" alt="" class="" width="40%" align="left" style="margin-left:10px;display:inline;float:right;" />${(garden.INTRODUCE)!''}</div></div>
            </div>
        </div>
    </div>
    <!-- card 公司名片展示 模块 -->
    <div id="card233" class="card-box" style="display:none;">
        <div class="card-close"><i class="iconfont">&#xe652;</i>关闭</div>
        <div class="card-con">
            <h3 id="card-cp-name">[公司名称]</h3>
            <p class="f14 lh180" id="card-cp-abs">[公司简介]</p>
        </div>
    </div>
    <!--quality-->
    <div class="mt20">
        <h2 class="f25 fb title-p"><span class="txt blue-b">龙头企业</span><span class="line border-c"></span></h2>
        <div class="row cxcg-list" style="min-height:150px;">
            <#if compList??>
                  <#list compList as cp>
                        <div class="col-xs-6 col-sm-4 col-md-3 col-lg-3">
                        	<a href="${(cp.URL)!'javascript:void(0)'}" target="_blank">
			                <img src="${rc.contextPath}/plugins/images/allImages/${(cp.FILE_NAME)!'no-image.jpg'}" alt="${(cp.FILE_TITLE)!''}" class="img-responsive" /></a>
			                <p class="tc lh180">
			                <#if (cp.FILE_TITLE)?? && (cp.FILE_TITLE)?length gt 11>${((cp.FILE_TITLE)!'')?substring(0,11)}<#else>${(cp.FILE_TITLE)!''}</#if>
			                </p>
			                <input type="hidden" value="${(cp.FILE_TITLE)!''}" id="${'CPNAME'+cp.ID}"/>
				            <input type="hidden" value="${(cp.FILE_TITLE)!''}" id="${'CPABS'+cp.ID}"/>
			            </div>
                  </#list>
            </#if>
        </div>
    </div>
    <!-- operation  -->
    <div class="mt20">
        <h2 class="f25 fb title-p"><span class="txt blue-b">统计图表</span><span class="line border-c"></span></h2>
		<div class="row">
        <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 mb10">
		<div class="border-box" style="min-height:330px;">
            <h3 class="f16 f-bar"><span class="more-s f12"><a href="${rc.contextPath}/garden/fileList/${(garden.ID)!''}">更多&gt;</a></span><span class="name-bor"><i class="iconfont f20 mr5">&#xe606;</i>经济运行分析报告</span></h3>
            <ul class="download-list mt10">
                 <#if reportList??>
	                        <#list reportList as rp>
	                             <li><a href="${rc.contextPath}/plugins/images/allFiles/${(rp.FILE_NAME)!''}" target="_blank"><span class="date">${((rp.CREATE_TIME)!"")?string("yyyy-MM-dd")}</span>${(rp.FILE_TITLE)!""}</a></li>
	                           
	                        </#list>
	             </#if>
            </ul>
			</div>
        </div>
        <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
		<div class="charts-box-new pr">
			<ul class="charts-scroll">
				<#if statistImages??><!--旁边配图---->
	        	<#list statistImages as aa>
	        		<li><a href="${(aa.URL)!'javascript:void(0)'}" <#if aa?? && aa.URL??>target="_blank"<#else> style="cursor:default;"</#if>><img src="${rc.contextPath}/plugins/images/allImages/${(aa.FILE_NAME)!''}" class="img-responsive" alt="${(aa.ID)!''}" /></a></li>
	        	</#list>
	        	</#if>
			</ul>
			<div class="slider-btn btn-black"><a class="prev" href="javascript:void(0);" style="left:-10px;"></a><a class="next" href="javascript:void(0);" style="right:-10px;"></a></div>
		</div>
		</div>
		</div>
    </div>
    <!--Infrastructure-->
    <div class="mt20">
        <h2 class="f25 fb title-p"><span class="txt blue-b">园区基础设施建设项目</span><span class="line border-c"></span></h2>
		<div class="row">
        <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4 mb10">
		<div class="border-box" style="min-height:217px;">
            <h3 class="f16 f-bar"><span class="more-s f12"><a href="${rc.contextPath}/garden/projectList/BASE/PROSTATUS_A/${(garden.ID)!''}">更多&gt;</a></span><span class="name-bor"><i class="iconfont f20 mr5">&#xe711;</i>拟建</span></h3>
            <ul class="download-list mt10">
                <#if projectList1??>
                     <#list projectList1 as p1>
                          <li><a href="javascript:void(0);" style="cursor:default;"><span class="date">${((p1.CREATE_TIME)!"")?string("yyyy-MM-dd")}</span>${(p1.PRO_NAME)!""}</a></li>
                     </#list>
                </#if>
            </ul>
			</div>
        </div>
        <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4 mb10">
		<div class="border-box" style="min-height:217px;">
            <h3 class="f16 f-bar"><span class="more-s f12"><a href="${rc.contextPath}/garden/projectList/BASE/PROSTATUS_B/${(garden.ID)!''}">更多&gt;</a></span><span class="name-bor"><i class="iconfont f20 mr5">&#xe7ec;</i>在建</span></h3>
            <ul class="download-list mt10">
                <#if projectList2??>
                     <#list projectList2 as p2>
                          <li><a href="javascript:void(0);" style="cursor:default;"><span class="date">${((p2.CREATE_TIME)!"")?string("yyyy-MM-dd")}</span>${(p2.PRO_NAME)!""}</a></li>
                     </#list>
                </#if>
            </ul>
         </div> 
        </div>
        <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4 mb10">
		<div class="border-box" style="min-height:217px;">
            <h3 class="f16 f-bar"><span class="more-s f12"><a href="${rc.contextPath}/garden/projectList/BASE/PROSTATUS_C/${(garden.ID)!''}">更多&gt;</a></span><span class="name-bor"><i class="iconfont f20 mr5">&#xe614;</i>竣工</span></h3>
            <ul class="download-list mt10">
                <#if projectList3??>
                     <#list projectList3 as p3>
                          <li><a href="javascript:void(0);" style="cursor:default;"><span class="date">${((p3.CREATE_TIME)!"")?string("yyyy-MM-dd")}</span>${(p3.PRO_NAME)!""}</a></li>
                     </#list>
                </#if>
            </ul>
		</div>
        </div>
		</div>
    </div>
    <!--industrial-->
    <div class="mt20">
        <h2 class="f25 fb title-p"><span class="txt blue-b">园区产业项目</span><span class="line border-c"></span></h2>
		<div class="row">
        <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4 mb10">
		<div class="border-box" style="min-height:217px;">
            <h3 class="f16 f-bar"><span class="more-s f12"><a href="${rc.contextPath}/garden/projectList/INDUSTRY/PROSTATUS_A/${(garden.ID)!''}">更多&gt;</a></span><span class="name-bor"><i class="iconfont f20 mr5">&#xe711;</i>拟建</span></h3>
            <ul class="download-list mt10">
                <#if projectList4??>
                     <#list projectList4 as p4>
                          <li><a href="javascript:void(0);" style="cursor:default;"><span class="date">${((p4.CREATE_TIME)!"")?string("yyyy-MM-dd")}</span>${(p4.PRO_NAME)!""}</a></li>
                     </#list>
                </#if>
            </ul>
			</div>
        </div>
        <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4 mb10">
		<div class="border-box" style="min-height:217px;">
            <h3 class="f16 f-bar"><span class="more-s f12"><a href="${rc.contextPath}/garden/projectList/INDUSTRY/PROSTATUS_B/${(garden.ID)!''}">更多&gt;</a></span><span class="name-bor"><i class="iconfont f20 mr5">&#xe7ec;</i>在建</span></h3>
            <ul class="download-list mt10">
                <#if projectList5??>
                     <#list projectList5 as p5>
                          <li><a href="javascript:void(0);" style="cursor:default;"><span class="date">${((p5.CREATE_TIME)!"")?string("yyyy-MM-dd")}</span>${(p5.PRO_NAME)!""}</a></li>
                     </#list>
                </#if>
            </ul>
			</div>
        </div>
        <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4 mb10">
		<div class="border-box" style="min-height:217px;">
            <h3 class="f16 f-bar"><span class="more-s f12"><a href="${rc.contextPath}/garden/projectList/INDUSTRY/PROSTATUS_C/${(garden.ID)!''}">更多&gt;</a></span><span class="name-bor"><i class="iconfont f20 mr5">&#xe614;</i>竣工</span></h3>
            <ul class="download-list mt10">
                <#if projectList6??>
                     <#list projectList6 as p6>
                          <li><a href="javascript:void(0);" style="cursor:default;"><span class="date">${((p6.CREATE_TIME)!"")?string("yyyy-MM-dd")}</span>${(p6.PRO_NAME)!""}</a></li>
                     </#list>
                </#if>
            </ul>
			</div>
        </div>
		</div>
    </div>
    <!--Park policy-->
    <div class="mt20 mb20">
        <h2 class="f25 fb title-p"><span class="txt blue-b">园区政策</span><span class="line border-c"></span></h2>
        <div class="list-enterprises clearfix">
            <div class="row">
                <div class="col-xs-12 col-sm-12 col-md-9 col-lg-9" style="min-height:700px;">
                    <div class="newslist-con">
                        <ul id="listmore">
                            <#if policyList??>
		                        <#list policyList as pl>
		                             <li><a href="${rc.contextPath}/garden/newsDetail/${(garden.ID)!''}/GARDEN_B/${(pl.ID)!''}"><span class="date">${((pl.NEWS_TIME)!"")?string("yyyy-MM-dd")}</span>${(pl.NEWS_TITLE)!""}</a></li>
		                              
		                        </#list>
		                   </#if>
		                   
                            

                            
                        </ul>
	                    <input type="hidden" id="pageNo" name="pageNo" value="${(pageNo)!'0'}" />
	                    <button type="button" id="addMore" <#if policyList?? && policyList?size lt 10>disabled</#if> onclick="GetMore()" class="btn btn-primary btn-block  mt10"> 
	                    <#if policyList?? && policyList?size lt 10>没有更多<#else><i class="iconfont mr5" style="vertical-align:middle">&#xe605;</i>加载更多</#if></button>
                            
                    </div>
                </div>
                <div class="col-md-3 col-lg-3 hidden-sm hidden-xs pr tj-r">
                    <div id="float-right">
                        <h3 class="f16 mt15"><i class="iconfont mr5">&#xe690;</i>推荐企业</h3>
                        <ul class="tj-list">
                            <#if adList??>
			                      <#list adList as ad>
			                              <li><a href="${(ad.URL)!''}" target="_blank"><img src="${rc.contextPath}/plugins/images/allImages/${(ad.FILE_NAME)!''}" alt="" class="img-responsive" /></a></li>
			                      </#list>
			                </#if>
                          
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
	</div>
    <!-- footer -->
    <#include "/footerAndHeader/footers.ftl"/>
    <script type="text/javascript">
        $(function () {
            //focus
            $(".prev,.next").hover(function () {
                $(this).stop().fadeTo("show", 0.9);
            }, function () {
                $(this).stop().fadeTo("show", 0.4);
            });
            jQuery(".slider-box").slide({ mainCell: ".slider-con", effect: "leftLoop", vis: 1, interTime: 4500, delayTime: 700, autoPlay: true });
			jQuery(".charts-box-new").slide({ mainCell: ".charts-scroll", effect: "fade", vis: 1, interTime: 4500, delayTime: 500, autoPlay: true });
            //floatNav
            jQuery('.navbg').headshrinker({ fontSize: "14px", mobileMenu: true });
            $(".nav-pc a.mobile-btn").click(function () {
                $(".nav-pc ul").slideToggle();
            });
            //tj-list-float
            /*$(window).scroll(function () {
			var scrollTop = document.documentElement.scrollTop || window.pageYOffset || document.body.scrollTop;//scrollTop兼容办法
                if (scrollTop > 2900) {
                    $('#float-right').addClass('mfixed');
                }
                else {
                    $('#float-right').removeClass('mfixed');
                }
            });*/
            var boxW = $(".tj-r").width();
            $("#float-right").width(boxW);
            $(window).resize(function () {
                var boxW = $(".tj-r").width();
                $("#float-right").width(boxW);
            });
            //关闭
            $(".card-close").click(function () {
                $("div.mask").remove();
                $(".card-box").hide();
                $("#card233").hide();
            });
        });
        
        
        function GetMore(){/*获取更多园区政策*/
			var pageNo = $("#pageNo").val();
			var gardenId ="${(garden.ID)!''}";
			var moduleCode = "NEWS_L";
			var parentCode = gardenId;
			var moduleType ="GARDEN_B";
			//alert(pageNo);
	        $.post("${rc.contextPath}/info/loadnews.do",{"pageNo":pageNo,"moduleCode":moduleCode,"parentCode":parentCode,"moduleType":moduleType},function(obj) {
	        
	        	if(obj=="nomore"){
		             $("#addMore").html("没有更多");
		             $("#addMore").removeAttr("onclick");
		             $("#addMore").attr("disabled","true");
	            }else{
	                 $.each(obj,function(index,value){
		                $("#listmore").append(
		                	"<li><a href='${rc.contextPath}/garden/newsDetail/"+gardenId+"/GARDEN_B/"+value.ID+"' ><span class='date'>"+value.NEWS_TIME+"</span>"+value.NEWS_TITLE+"</a></li>"
		                );
		               
		            });
		            $("#pageNo").val(parseInt(pageNo)+1);
	            }
	            
	        },"json");
		}
        function showCard(aa){/**展示公司名片函数*/ 	
    	    $("body").append("<div class='mask'></div>");
            if ($("#card233").css("display") == "none") {
            	//用参数改变展示用2个值
            	var id=aa;
            	var name=$("#CPNAME"+id).val();
            	var abs=""+$("#CPABS"+id).val();//最大300
            	if(abs.length > 300){
            		abs=abs.substring(0,300)+"...";
            	}
            	$("#card-cp-name").html(name);
            	$("#card-cp-abs").html(abs);
                $("#card233").show();
            } else {
                $("#card233").hide();
            }
        }
        
    </script>
</body>
</html>
