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
    <title>产业政策-中关村贵阳科技园产业云平台</title>
</head>
<body class="con_main_bg">
    <#include "/footerAndHeader/headers.ftl"/>
    <!-- banner -->
    <a href="javascript:void(0)" style="cursor:default;"><div class="banner w banner_07" style="background: url(${rc.contextPath}/plugins/images/allImages/${(bannerImages.FILE_NAME)!''}) top center no-repeat;"></div></a>
	<div class="container mainbg mt20">
	<!-- bread -->
    <div class="clearfix mt20 nav_new">
        <div class="bread-nav fl">
            您的位置：<a href="${rc.contextPath}/index">首页</a><span>&gt;</span>产业政策
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
                    <h2 class="news-t zc-bar"><span class="fr mr10 law-more"><a href="${rc.contextPath}/policy/newsList/NEWS_E">更多 &gt;</a></span><i class="iconfont ml10 mr10 f25">&#xe613;</i><span class="f18">政策动态</span></h2>
                    <dl class="newslist">
                       <#if newsList1??>
	                        <#list newsList1 as nl1>
	                             <#if nl1_index==0>
			                        <dt>
			                            <a href="${rc.contextPath}/policy/newsDetail/NEWS_E/${(nl1.ID)!''}"  title="${(nl1.NEWS_TITLE)!''}" >${(nl1.NEWS_TITLE)!""}</a>
			                            <span class="fn f12" style="word-break: break-all;" ><#if nl1.INTRODUCE?? && nl1.INTRODUCE?length gt 79>${((nl1.INTRODUCE)!"")?substring(0,79)}...<#else>${(nl1.INTRODUCE)!""}</#if></span>
			                        </dt>
			                     <#else>   
			                        <dd><a href="${rc.contextPath}/policy/newsDetail/NEWS_E/${(nl1.ID)!''}"  title="${(nl1.NEWS_TITLE)!''}" ><span class="date"><#if nl1?? && nl1.NEWS_TIME??>${((nl1.NEWS_TIME)!"")?string("yyyy-MM-dd")}</#if></span>${(nl1.NEWS_TITLE)!""}</a></dd>
			                     </#if>   
	                        </#list>
	                     </#if>
                    </dl>
                </div>
            </div>
        </div>
    <!---->
    <div class="mt20">
        <div class="row">
            <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 mylist-item zc">
                <div class="white zc-box">
                    <h2 class="news-t zc-bar"><span class="law-more fr mr10"><a href="${rc.contextPath}/policy/newsList/NEWS_F">更多 &gt;</a></span><i class="iconfont ml10 mr10 f25">&#xe608;</i><span class="f18">国家政策</span></h2>
                    <ul class="download-list mt10">
                    
                        <#if newsList2??>
	                        <#list newsList2 as nl2>
	                             <li><a href="${rc.contextPath}/policy/newsDetail/NEWS_F/${(nl2.ID)!''}"  title="${(nl2.NEWS_TITLE)!''}" ><span class="date"><#if nl2?? && nl2.NEWS_TIME??>${((nl2.NEWS_TIME)!"")?string("yyyy-MM-dd")}</#if></span>${(nl2.NEWS_TITLE)!""}</a></li>
	                              
	                        </#list>
	                   </#if>
                       
                    </ul>
                </div>
            </div>
            <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 mylist-item zc" style="padding-right:0;">
                <div class="white zc-box">
                    <h2 class="news-t zc-bar"><span class="law-more fr mr10"><a href="${rc.contextPath}/policy/newsList/NEWS_G">更多 &gt;</a></span><i class="iconfont ml10 mr10 f25">&#xe62e;</i><span class="f18">省级政策</span></h2>
                    <ul class="download-list mt10">
                        <#if newsList3??>
	                        <#list newsList3 as nl3>
	                             <li><a href="${rc.contextPath}/policy/newsDetail/NEWS_G/${(nl3.ID)!''}"  title="${(nl3.NEWS_TITLE)!''}" ><span class="date"><#if nl3?? && nl3.NEWS_TIME??>${((nl3.NEWS_TIME)!"")?string("yyyy-MM-dd")}</#if></span>${(nl3.NEWS_TITLE)!""}</a></li>
	                              
	                        </#list>
	                    </#if>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!---->
    <div class="mt20 mb20">
        <div class="row">
            <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 mylist-item zc">
                <div class="white zc-box">
                    <h2 class="news-t zc-bar"><span class="law-more fr mr10"><a href="${rc.contextPath}/policy/newsList/NEWS_H">更多 &gt;</a></span><i class="iconfont ml10 mr10 f25">&#xe749;</i><span class="f18">本市政策</span></h2>
                    <ul class="download-list mt10">
                        <#if newsList4??>
	                        <#list newsList4 as nl4>
	                             <li><a href="${rc.contextPath}/policy/newsDetail/NEWS_H/${(nl4.ID)!''}"  title="${(nl4.NEWS_TITLE)!''}" ><span class="date"><#if nl4?? && nl4.NEWS_TIME??>${((nl4.NEWS_TIME)!"")?string("yyyy-MM-dd")}</#if></span>${(nl4.NEWS_TITLE)!""}</a></li>
	                              
	                        </#list>
	                    </#if>
                    </ul>
                </div>
            </div>
            <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 mylist-item zc" style="padding-right:0;">
                <div class="white zc-box">
                    <h2 class="news-t zc-bar"><span class="law-more fr mr10"><a href="${rc.contextPath}/policy/newsList/NEWS_I">更多 &gt;</a></span><i class="iconfont ml10 mr10 f25">&#xe6d7;</i><span class="f18">政策解读</span></h2>
                    <ul class="download-list mt10">
                        <#if newsList5??>
	                        <#list newsList5 as nl5>
	                             <li><a href="${rc.contextPath}/policy/newsDetail/NEWS_I/${(nl5.ID)!''}" title="${(nl5.NEWS_TITLE)!''}" ><span class="date"><#if nl5?? && nl5.NEWS_TIME??>${((nl5.NEWS_TIME)!"")?string("yyyy-MM-dd")}</#if></span>${(nl5.NEWS_TITLE)!""}</a></li>
	                              
	                        </#list>
	                    </#if>
                    </ul>
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
            //logoScroll
            jQuery(".scroll-logo").slide({ mainCell: ".logo-list", effect: "leftLoop", vis: 7, interTime: 4500, delayTime: 500, autoPlay: true });
            //floatNav
            jQuery('.navbg').headshrinker({ fontSize: "14px", mobileMenu: true });
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
    </script>
</body>
</html>
