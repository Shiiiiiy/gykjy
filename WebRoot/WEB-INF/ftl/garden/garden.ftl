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
    <script type="text/javascript" src="${rc.contextPath}/plugins/js/jquery.easing.js"></script>
    <script type="text/javascript" src="${rc.contextPath}/plugins/js/jquery.rotate.min.js"></script>
    <script type="text/javascript" src="${rc.contextPath}/plugins/js/park.js"></script>
    <!--[if lte IE 9]>
    <script src="${rc.contextPath}/plugins/js/respond.min.js"></script>
    <script src="${rc.contextPath}/plugins/js/html5shiv.js"></script>
    <![endif]-->
    <title>产业园区-中关村贵阳科技园产业云平台</title>
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
            您的位置：<a href="${rc.contextPath}/index">首页</a><span>&gt;</span>产业园区
        </div>
	        <div class="search fr search-xs" >
	            <div class="fl"><input type="text" class="search-text" id="searchCompany_text" value="${keyWord!''}" name="" placeholder="搜企业" /></div>
	            <div class="fr"><button class="search-but" onclick="searchCompany()" ><i class="iconfont f30">&#xe60a;</i></button></div>
	        </div>
    </div>
    <!--  -->
    <div class="p15">
        <div class="pic-park"><img src="${rc.contextPath}/plugins/images/allImages/${(gardenList[0].STATUS)!'park.jpg'}" alt="" class="img-responsive" /></div>
        <div class="park-infor">
            <h3 class="tc f20 fb mb10">中关村贵阳科技园园区概况</h3>
            <p class="lh180 pr">
                <i class="iconfont f30">&#xe645;</i>${(gardenList[0].INTRODUCE)!''}
            </p>
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
                    <h2 class="news-t"><span class="more fr"><a href="${rc.contextPath}/garden/newsList/NEWS_L">更多 &gt;</a></span><i class="iconfont mr10 f25 blue-n">&#xe613;</i><span class="f16 blue-n fb">园区动态</span></h2>
                    <dl class="newslist">
                        <#if newsList??>
	                        <#list newsList as nl>
	                             <#if nl_index==0>
			                        <dt>
			                            <a href="${rc.contextPath}/garden/newsDetail/${(nl.ID)!''}"  title="${(nl.NEWS_TITLE)!''}" >${(nl.NEWS_TITLE)!""}</a>
			                            <span class="fn f12" style="word-break: break-all;" ><#if nl.INTRODUCE?? && nl.INTRODUCE?length gt 79>${((nl.INTRODUCE)!"")?substring(0,79)}...<#else>${(nl.INTRODUCE)!""}</#if></span>
			                        </dt>
			                     <#else>   
			                        <dd><a href="${rc.contextPath}/garden/newsDetail/${(nl.ID)!''}"  title="${(nl.NEWS_TITLE)!''}" ><span class="date">${((nl.NEWS_TIME)!"")?string("yyyy-MM-dd")}</span>${(nl.NEWS_TITLE)!""}</a></dd>
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
	                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6"><div class="border-box"><img src="${rc.contextPath}/plugins/images/allImages/${(st.FILE_NAME)!''}" alt="" class="img-responsive" /></div></div>
	            </#list>
            </#if> 
        </div>
    </div>
    
     <!-- park -->
    <div class="mt20 mb20 clearfix">
        <h2 class="f25 fb title-p"><span class="txt blue-b">园区分布</span><span class="line border-c"></span></h2>
        <#if gardenList?? && gardenList?size gt 0>
        <div class="gear pr" style="min-height:470px;">
            <div class="list-txt pa">
                <ul>
                    <li><a href="${rc.contextPath}/garden/every/${(gardenList[1].ID)!''}" class="redlink"><span class="xlh f20">01.</span>${gardenList[1].NAME}</a></li>
                    <li><a href="${rc.contextPath}/garden/every/${(gardenList[2].ID)!''}" class="redlink"><span class="xlh f20">02.</span>${gardenList[2].NAME}</a></li>
                    <li><a href="${rc.contextPath}/garden/every/${(gardenList[3].ID)!''}" class="redlink"><span class="xlh f20">03.</span>${gardenList[3].NAME}</a></li>
                    <li><a href="${rc.contextPath}/garden/every/${(gardenList[4].ID)!''}" class="redlink"><span class="xlh f20">04.</span>${gardenList[4].NAME}</a></li>
                    <li><a href="${rc.contextPath}/garden/every/${(gardenList[5].ID)!''}"><span class="xlh f20">05.</span>${gardenList[5].NAME}</a></li>
                    <li><a href="${rc.contextPath}/garden/every/${(gardenList[6].ID)!''}"><span class="xlh f20">06.</span>${gardenList[6].NAME}</a></li>
                    <li><a href="${rc.contextPath}/garden/every/${(gardenList[7].ID)!''}"><span class="xlh f20">07.</span>${gardenList[7].NAME}</a></li>
                    <li><a href="${rc.contextPath}/garden/every/${(gardenList[8].ID)!''}"><span class="xlh f20">08.</span>${gardenList[8].NAME}</a></li>
                    <li><a href="${rc.contextPath}/garden/every/${(gardenList[9].ID)!''}"><span class="xlh f20">09.</span>${gardenList[9].NAME}</a></li>
                    <li><a href="${rc.contextPath}/garden/every/${(gardenList[10].ID)!''}"><span class="xlh f20">10.</span>${gardenList[10].NAME}</a></li>
                    <li><a href="${rc.contextPath}/garden/every/${(gardenList[11].ID)!''}"><span class="xlh f20">11.</span>${gardenList[11].NAME}</a></li>
                    <li><a href="${rc.contextPath}/garden/every/${(gardenList[12].ID)!''}"><span class="xlh f20">12.</span>${gardenList[12].NAME}</a></li>
                    <li><a href="${rc.contextPath}/garden/every/${(gardenList[13].ID)!''}"><span class="xlh f20">13.</span>${gardenList[13].NAME}</a></li>
                </ul>
            </div>
            <div class="animate-park">
			<div class="pa box-rotate1" style="z-index:9; margin-left:250px; margin-top:60px;">
                        <div class="pa items p-img1">
                            <a href="${rc.contextPath}/garden/every/${(gardenList[0+1].ID)!''}">
                                <p class="pa txt">高新技术</p>
                                <img src="${rc.contextPath}/plugins/images/pa1.png" class="park-img" alt="高新技术" />
                            </a>
                        </div>
                        <div class="pa items p-img2">
                            <a href="${rc.contextPath}/garden/every/${(gardenList[1+1].ID)!''}">
                                <p class="pa txt">经济开发</p>
                                <img src="${rc.contextPath}/plugins/images/pa2.png" class="park-img" alt="经济开发" />
                            </a>
                        </div>
                        <div class="pa items p-img3">
                            <a href="${rc.contextPath}/garden/every/${(gardenList[2+1].ID)!''}">
                                <p class="pa txt">综合保税</p>
                                <img src="${rc.contextPath}/plugins/images/pa3.png" class="park-img" alt="综合保税" />
                            </a>
                        </div>
                        <div class="pa items p-img4">
                            <a href="${rc.contextPath}/garden/every/${(gardenList[3+1].ID)!''}">
                                <p class="pa txt">航空港</p>
                                <img src="${rc.contextPath}/plugins/images/pa4.png" class="park-img" alt="航空港" />
                            </a>
                        </div>
                    </div>
                <div class="gear-head pa" id="img1"></div>
                <div class="gear-item1 gear-item1-1 pa" id="img2"></div>
				<div class="pa box-rotate2" style="z-index:10; margin-left:50px; margin-top:250px;">
                        <div class="pa items p-img6">
                            <a href="${rc.contextPath}/garden/every/${(gardenList[5+1].ID)!''}">
                                <p class="pa txt">观山湖</p>
                                <img src="${rc.contextPath}/plugins/images/pa5.png" class="park-img" alt="观山湖" />
                            </a>
                        </div>
                </div>
                <div class="gear-item1 gear-item1-2 pa" id="img3"></div>
				<div class="pa box-rotate2" style="z-index:9; margin-left:175px; margin-top:13px;">
                        <div class="pa items-s p-img6">
                            <a href="${rc.contextPath}/garden/every/${(gardenList[4+1].ID)!''}">
                                <p class="pa txt">乌当</p>
                                <img src="${rc.contextPath}/plugins/images/pa6.png" class="park-img park-img-s" alt="乌当" />
                            </a>
                        </div>
                    </div>
                <div class="gear-item1 gear-item1-3 pa" id="img4"></div>
				<div class="pa box-rotate2" style="z-index:9; margin-left:87px; margin-top:107px;">
                        <div class="pa items-s p-img6">
                            <a href="${rc.contextPath}/garden/every/${(gardenList[6+1].ID)!''}">
                                <p class="pa txt">云岩</p>
                                <img src="${rc.contextPath}/plugins/images/pa7.png" class="park-img park-img-s" alt="云岩" />
                            </a>
                        </div>
                    </div>
                <div class="gear-item1 gear-item1-4 pa" id="img5"></div>
				<div class="pa box-rotate2" style="z-index:9; margin-left:204px; margin-top:346px;">
                        <div class="pa items-s p-img7">
                            <a href="${rc.contextPath}/garden/every/${(gardenList[7+1].ID)!''}">
                                <p class="pa txt">白云</p>
                                <img src="${rc.contextPath}/plugins/images/pa8.png" class="park-img park-img-s" alt="白云" />
                            </a>
                        </div>
                    </div>
                <div class="gear-item2 gear-item2-1 pa" id="img6"></div>
				<div class="pa box-rotate2" style="z-index:9; margin-left:13px; margin-top:183px;">
                        <div class="pa items-s p-img8">
                            <a href="${rc.contextPath}/garden/every/${(gardenList[8+1].ID)!''}">
                                <p class="pa txt">花溪</p>
                                <img src="${rc.contextPath}/plugins/images/pa9.png" class="park-img park-img-s" alt="花溪" />
                            </a>
                        </div>
                    </div>
                <div class="gear-item1 gear-item1-5 pa" id="img7"></div>
				<div class="pa box-rotate2" style="z-index:9; margin-left:545px; margin-top:-15px;">
                        <div class="pa items p-img9">
                            <a href="${rc.contextPath}/garden/every/${(gardenList[9+1].ID)!''}">
                                <p class="pa txt">息烽</p>
                                <img src="${rc.contextPath}/plugins/images/pa10.png" class="park-img" alt="息烽" />
                            </a>
                        </div>
                    </div>
                <div class="gear-item2 gear-item2-2 pa" id="img8"></div>
				<div class="pa box-rotate2" style="z-index:9; margin-left:617px; margin-top:144px;">
                        <div class="pa items-s p-img8">
                            <a href="${rc.contextPath}/garden/every/${(gardenList[10+1].ID)!''}">
                                <p class="pa txt">清镇</p>
                                <img src="${rc.contextPath}/plugins/images/pa11.png" class="park-img park-img-s" alt="清镇" />
                            </a>
                        </div>
                    </div>
                <div class="gear-item1 gear-item1-6 pa" id="img9"></div>
				<div class="pa box-rotate2" style="z-index:9; margin-left:626px; margin-top:228px;">
                        <div class="pa items p-img10">
                            <a href="${rc.contextPath}/garden/every/${(gardenList[11+1].ID)!''}">
                                <p class="pa txt">修文</p>
                                <img src="${rc.contextPath}/plugins/images/pa12.png" class="park-img" alt="修文" />
                            </a>
                        </div>
                    </div>
                <div class="gear-item1 gear-item1-7 pa" id="img10"></div>
				<div class="pa box-rotate2" style="z-index:9; margin-left:555px; margin-top:348px;">
                        <div class="pa items-s p-img11">
                            <a href="${rc.contextPath}/garden/every/${(gardenList[12+1].ID)!''}">
                                <p class="pa txt">开阳</p>
                                <img src="${rc.contextPath}/plugins/images/pa13.png" class="park-img  park-img-s" alt="开阳" />
                            </a>
                        </div>
                    </div>
            </div>
        </div>
        </#if>
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
            jQuery('.navbg').headshrinker({ fontSize: "14px", mobileMenu: true });
            $(".nav-pc a.mobile-btn").click(function () {
                $(".nav-pc ul").slideToggle();
            });
			/*$(".animate-park div.items, .animate-park div.items-s").hover(function () {
                $(this).find("p.txt").fadeOut(100);
            }, function () {
                $(this).find("p.txt").fadeIn(100);
            });*/
        });
    </script>
</body>
</html>
