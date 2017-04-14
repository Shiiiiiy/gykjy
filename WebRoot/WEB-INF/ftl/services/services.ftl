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
    <title>产品服务-中关村贵阳科技园产业云平台</title>
</head>
<body class="con_main_bg">
    <#include "/footerAndHeader/headers.ftl"/>
    <!-- banner -->
    <a href="javascript:void(0)" style="cursor:default;"><div class="banner w" style="background: url(${rc.contextPath}/plugins/images/allImages/${(bannerImages.FILE_NAME)!''}) top center no-repeat;"></div></a> 
	<div class="container mainbg mt20">
	<!-- bread -->
    <div class="clearfix mt20 nav_new">
        <div class="bread-nav fl">
            您的位置：<a href="${rc.contextPath}/index">首页</a><span>&gt;</span>产品服务
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
                    <h2 class="news-t"><span class="more fr"><a href="${rc.contextPath}/industry/newsList/NEWS_B" >更多 &gt;</a></span><i class="iconfont mr10 f25 blue-n">&#xe613;</i><span class="f16 blue-n fb">产品资讯</span></h2>
                    <dl class="newslist">
                      <#if newsList??>
                        <#list newsList as nl>
                             <#if nl_index==0>
		                        <dt>
		                            <a href="${rc.contextPath}/industry/newsDetail/${(nl.ID)!''}" title="${(nl.NEWS_TITLE)!''}" >${(nl.NEWS_TITLE)!""}</a>
		                            <span class="fn f12" style="word-break: break-all;" ><#if nl.INTRODUCE?? && nl.INTRODUCE?length gt 79>${((nl.INTRODUCE)!"")?substring(0,79)}...<#else>${(nl.INTRODUCE)!""}</#if></span>
		                        </dt>
		                     <#else>   
		                        <dd><a href="${rc.contextPath}/industry/newsDetail/${(nl.ID)!''}" title="${(nl.NEWS_TITLE)!''}" ><span class="date">${((nl.NEWS_TIME)!"")?string("yyyy-MM-dd")}</span>${(nl.NEWS_TITLE)!""}</a></dd>
		                     </#if>   
                        </#list>
                     </#if>
                    </dl>
					</div>
                </div>
            </div>
        </div>
    <!--charts-->
    <div class="mt20">
        <div class="row">
            <#if statistImages??>
	            <#list statistImages as st>
	                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6"><div class="border-box mt20"><img src="${rc.contextPath}/plugins/images/allImages/${(st.FILE_NAME)!''}" alt="" class="img-responsive" /></div></div>
	            </#list>
            </#if> 
            
        </div>
    </div>
    <!-- product -->
    <div class="mt20" style="padding-left:15px;padding-right:15px;">
        <div class="row">
            <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4 square-box mylist-item-no square-box-prop s-title">
                <div class="con-txt"><h3 class="f30 fb">工业产品</h3><small class="caps">industrial product</small></div>
            </div>
            
            <#if industryList1??>
	            <#list industryList1 as il>
	                <div class="col-xs-6 col-sm-6 col-md-2 col-lg-2 square-box mylist-item-no square-box-prop">
		                <a href="${rc.contextPath}/industry/every/${(il.ID)!''}" title="${(il.NAME)!''}" >
		                    <div class="con-icon"><i class="iconfont">${(il.COMMENTS)!""}</i><p>${(il.NAME)!""}</p></div>
		                    <div class="con-img"><img src="${rc.contextPath}/plugins/images/${(il.LOGO_IMAGE)!''}" alt="" class="img-responsive" /></div>
		                </a>
		            </div>
	            </#list>
            </#if> 
            
            
        </div>
    </div>
     <div class="mt20 mb20" style="padding-left:15px;padding-right:15px;">
       
        <div class="row">
            <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4 square-box mylist-item-no square-box-prop s-title">
                <div class="con-txt"><h3 class="f30 fb">生产服务</h3><small class="caps">Production service</small></div>
            </div>
            
            <#if industryList2??>
	            <#list industryList2 as il2>
	                <div class="col-xs-6 col-sm-6 col-md-2 col-lg-2 square-box mylist-item-no square-box-prop">
		                <a href="${rc.contextPath}/industry/every/${(il2.ID)!''}" title="${(il2.NAME)!''}">
		                    <div class="con-icon"><i class="iconfont">${(il2.COMMENTS)!""}</i><p>${(il2.NAME)!""}</p></div>
		                    <div class="con-img"><img src="${rc.contextPath}/plugins/images/${(il2.LOGO_IMAGE)!''}" alt="" class="img-responsive" /></div>
		                </a>
		            </div>
	            </#list>
            </#if> 
            
           
           
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
            //floatNav
            jQuery('.navbg').headshrinker({ fontSize: "14px", mobileMenu: true});
            $(".nav-pc a.mobile-btn").click(function () {
                $(".nav-pc ul").slideToggle();
            });
            //classify
            $(".square-box").hover(function () {
                $(this).find(".con-img").fadeIn(100);
                $(this).find(".con-icon").fadeOut(100);
            }, function () {
                $(this).find(".con-img").fadeOut(100);
                $(this).find(".con-icon").fadeIn(100);
            });
        });
        
        /*function searchCompany(){
			var str = $("#searchCompany_text").val();
			if(str==""||str==null){
				return ;
			}else{
				window.location.href="${rc.contextPath}/info/quanSearchCp.do?keyWord="+encodeURI(encodeURI(str))+"&moduleCode=NEWS_B";
			}
		}*/
      
        document.onkeydown=function(event){
            var e = event || window.event || arguments.callee.caller.arguments[0];
            if(e && e.keyCode==13){ // enter 键
           	 searchCompany();
            }
        }; 
    </script>
</body>
</html>
