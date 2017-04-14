<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="keywords" content="贵阳产业科技云平台,云平台,贵阳">
    <link href="${rc.contextPath}/plugins/images/favicon.ico" rel="shortcut icon">
    <link rel="stylesheet" href="${rc.contextPath}/plugins/bootstrap/bootstrap.min.css">
    <link rel="stylesheet" href="${rc.contextPath}/plugins/style/base.css" />
    <link rel="stylesheet" href="${rc.contextPath}/plugins/style/iconfont.css" />
    <link rel="stylesheet" href="${rc.contextPath}/plugins/style/header.css" />
    <link rel="stylesheet" href="${rc.contextPath}/plugins/style/footer.css" />
    <link rel="stylesheet" href="${rc.contextPath}/plugins/style/index.css" />
    <link rel="stylesheet" href="${rc.contextPath}/plugins/style/edslider.css">
    <link rel="stylesheet" href="${rc.contextPath}/plugins/style/animate-custom.css">
    <script type="text/javascript" src="${rc.contextPath}/plugins/js/jquery.min.js"></script>
    <script type="text/javascript" src="${rc.contextPath}/plugins/js/jquery.edslider.js"></script>
    <script type="text/javascript" src="${rc.contextPath}/plugins/js/jquery.waypoints.min.js"></script>
    <script type="text/javascript" src="${rc.contextPath}/plugins/js/jquery.countup.min.js"></script>
    <script type="text/javascript" src="${rc.contextPath}/plugins/js/jquery.headshrinker.js"></script>
    <script type="text/javascript" src="${rc.contextPath}/plugins/js/slider.js"></script>
    <!--[if lte IE 9]>
    <script src="${rc.contextPath}/js/respond.min.js"></script>
    <script src="${rc.contextPath}/js/html5shiv.js"></script>
    <![endif]-->
    <title>中关村贵阳科技园产业云平台</title>
</head>
<body class="index_bg">
    <#include "/footerAndHeader/headers.ftl"/>
    <!-- banner -->
    <div class="banner w">
        <ul class="mySlideshow">
            <li class="first"><div class="container pr"><img src="${rc.contextPath}/plugins/images/txt1.png" class="animated fadeInRight img-responsive hidden-xs" alt=""></div></li>
            <li class="second"><div class="container pr"><img src="${rc.contextPath}/plugins/images/txt1.png" class="animated fadeInRight img-responsive hidden-xs" alt=""></div></li>
        </ul>
    </div>
	<div class="container mt20 con_index_bg" style="margin-top:-98px; z-index:9;position:relative;">
    <!-- data -->
    <div class="bigdata clearfix">
		<div class="row">
			<div class="col-xs-12 col-sm-4 col-md-4 col-lg-4" style="background:#f2f2f2;padding:0;">
				<div class="content" style="border-right: #e8e8e8 solid 1px;">
					<h2 class="clearfix"><span class="counter">${compTotal!"0"}</span><b class="f20 font-yh ml10">家</b></h2>
					<p class="f20"><i class="iconfont mr5">&#xe629;</i><b>入驻企业</b></p>
				</div>
			</div>
			<div class="col-xs-12 col-sm-4 col-md-4 col-lg-4" style="background:#fff;padding:0;">
				<div class="content" style="border-right: #e8e8e8 solid 1px;">
					<h2 class="clearfix"><span class="counter">${productTotal!"0"}</span><b class="f20 font-yh ml10">种</b></h2>
					<p class="f20"><i class="iconfont mr5">&#xe649;</i><b>采集产品</b></p>
				</div>
			</div>
			<div class="col-xs-12 col-sm-4 col-md-4 col-lg-4" style="background:#f2f2f2;padding:0;">
				<div class="content">
					<h2 class="clearfix"><span class="counter">1234</span><b class="f20 font-yh ml10">人</b></h2>
					<p class="f20"><i class="iconfont mr5">&#xe646;</i><b>访问人数</b></p>
				</div>
			</div>
		</div>
    </div>
    <!-- news -->
    <div class="newsbg clearfix mt20" style="border-top:#eaeaea solid 1px;border-bottom:#eaeaea solid 1px;">
        <div class="news-scroll fl clearfix hidden-xs hidden-sm">
            <div class="fl"><i class="iconfont f30 mr5">&#xe628;</i><span class="f16"><a href="${rc.contextPath}/firstPage/newsList/NEWS_N">网站公告</a></span><em class="fg">|</em></div>
            <div class="fl slider-box">
                <ul class="slider-con">
                <#if list1??>
                    <#list list1 as t1>
                         <li><a href="${rc.contextPath}/firstPage/newsDetail/${(t1.ID)!''}" title="${(t1.NEWS_TITLE)!''}"><span class="date"><#if t1?? && t1.NEWS_TIME??>${(t1.NEWS_TIME)?string("yyyy-MM-dd")}</#if></span><#if t1.NEWS_TITLE?? && t1.NEWS_TITLE?length gt 25>${(t1.NEWS_TITLE)?substring(0,25)}<#else>${(t1.NEWS_TITLE)!''}</#if></a></li>
                    </#list>
                </#if>
                </ul>
            </div>
            
        </div>
        <div class="search fr search-xs" style="display:none;">
            <div class="fl"><input type="text" class="search-text" name="" placeholder="搜企业、找产品、查资料、看报告" /></div>
            <div class="fr"><button class="search-but"><i class="iconfont f30">&#xe60a;</i></button></div>
        </div>
    </div>
    <!-- grid -->
    <div class="clearfix mt20">
        <div class="row">
            <div class="col-xs-12 col-sm-12 col-md-6 col-lg-3 list-default">
                <div class="white news-title-bg-1">
                    <p class="tc icon-list"><a href="${rc.contextPath}/info"><i class="iconfont color-icon-1">&#xe631;</i><br /><span class="fon-yh f18 fb color-icon-1">企业信息</span></a></p>
                    <h3 class="news-title news-title-bg-white">企业资讯</h3>
                    <ul class="news-list" style="min-height:72px;" >
                    <#if list2??>
                         <#list list2 as t2>
                             <li><a href="${rc.contextPath}/info/newsDetail/${(t2.ID)!''}" title="${(t2.NEWS_TITLE)!''}"><#if t2.NEWS_TITLE?? && t2.NEWS_TITLE?length gt 12>${(t2.NEWS_TITLE)?substring(0,12)}<#else>${(t2.NEWS_TITLE)!''}</#if></a></li>
                         </#list>
                    </#if>
                    </ul>
                    <p class="more"><a href="${rc.contextPath}/info/newsList/NEWS_A" >更多&gt;</a></p>
                </div>
            </div>
            <div class="col-xs-12 col-sm-12 col-md-6 col-lg-3 list-default">
                <div class="white news-title-bg-8">
                    <p class="tc icon-list"><a href="${rc.contextPath}/industry"><i class="iconfont color-icon-8">&#xe6e4;</i><br /><span class="fon-yh f18 fb color-icon-8">产品服务</span></a></p>
                    <h3 class="news-title news-title-bg-an">产品资讯</h3>
                    <ul class="news-list" style="min-height:72px;">
                    <#if list3??>
                        <#list list3 as t3>
                             <li><a href="${rc.contextPath}/industry/newsDetail/${(t3.ID)!''}" title="${(t3.NEWS_TITLE)!''}"><#if t3.NEWS_TITLE?? && t3.NEWS_TITLE?length gt 12>${(t3.NEWS_TITLE)?substring(0,12)}<#else>${(t3.NEWS_TITLE)!''}</#if></a></li>
                         </#list>
                    </#if>
                    </ul>
                    <p class="more"><a href="${rc.contextPath}/industry/newsList/NEWS_B">更多&gt;</a></p>
                </div>
            </div>
            <div class="col-xs-12 col-sm-12 col-md-6 col-lg-3 list-default">
                <div class="white news-title-bg-8">
                    <p class="tc icon-list"><a href="${rc.contextPath}/prop"><i class="iconfont color-icon-8">&#xe644;</i><br /><span class="fon-yh f18 fb color-icon-8">支柱产业</span></a></p>
                    <h3 class="news-title news-title-bg-an">产业动态</h3>
                    <ul class="news-list" style="min-height:72px;">
                    <#if list4??>
                        <#list list4 as t4>
                             <li><a href="${rc.contextPath}/prop/newsDetail/${(t4.ID)!''}" title="${(t4.NEWS_TITLE)!''}"><#if t4.NEWS_TITLE?? && t4.NEWS_TITLE?length gt 12>${(t4.NEWS_TITLE)?substring(0,12)}<#else>${(t4.NEWS_TITLE)!''}</#if></a></li>
                         </#list>
                    </#if>     
                    </ul>
                    <p class="more"><a href="${rc.contextPath}/prop/newsList/NEWS_M">更多&gt;</a></p>
                </div>
            </div>
            <div class="col-xs-12 col-sm-12 col-md-6 col-lg-3 list-default">
                <div class="white news-title-bg-1">
                    <p class="tc icon-list"><a href="${rc.contextPath}/garden"><i class="iconfont color-icon-1">&#xe64f;</i><br /><span class="fon-yh f18 fb color-icon-1">产业园区</span></a></p>
                    <h3 class="news-title news-title-bg-white">园区动态</h3>
                    <ul class="news-list" style="min-height:72px;" >
                    <#if list5??>
                        <#list list5 as t5>
                             <li><a href="${rc.contextPath}/garden/newsDetail/${(t5.ID)!''}" title="${(t5.NEWS_TITLE)!''}"><#if t5.NEWS_TITLE?? && t5.NEWS_TITLE?length gt 12>${(t5.NEWS_TITLE)?substring(0,12)}<#else>${(t5.NEWS_TITLE)!''}</#if></a></li>
                         </#list>
                    </#if>
                    </ul>
                    <p class="more"><a href="${rc.contextPath}/garden/newsList/NEWS_L" >更多&gt;</a></p>
                </div>
            </div>
            <div class="col-xs-12 col-sm-12 col-md-6 col-lg-3 list-default">
                <div class="white news-title-bg-8">
                    <p class="tc icon-list"><a href="${rc.contextPath}/tech"><i class="iconfont color-icon-8">&#xe6d6;</i><br /><span class="fon-yh f18 fb color-icon-8">技术创新</span></a></p>
                    <h3 class="news-title news-title-bg-an">技术创新动态</h3>
                    <ul class="news-list" style="min-height:72px;">
                    <#if list6??>
                        <#list list6 as t6>
                             <li><a href="${rc.contextPath}/tech/newsDetail/${(t6.ID)!''}" title="${(t6.NEWS_TITLE)!''}"><#if t6.NEWS_TITLE?? && t6.NEWS_TITLE?length gt 12>${(t6.NEWS_TITLE)?substring(0,12)}<#else>${(t6.NEWS_TITLE)!''}</#if></a></li>
                         </#list>
                    </#if>
                    </ul>
                    <p class="more"><a href="${rc.contextPath}/tech/newsList/NEWS_C" >更多&gt;</a></p>
                </div>
            </div>
            <div class="col-xs-12 col-sm-12 col-md-6 col-lg-3 list-default">
                <div class="white news-title-bg-1">
                    <p class="tc icon-list"><a href="${rc.contextPath}/innovate"><i class="iconfont color-icon-1">&#xe600;</i><br /><span class="fon-yh f18 fb color-icon-1">创新创业</span></a></p>
                    <h3 class="news-title news-title-bg-white">创新创业动态</h3>
                    <ul class="news-list" style="min-height:72px;">
                    <#if list7??> 
                        <#list list7 as t7>
                             <li><a href="${rc.contextPath}/innovate/newsDetail/${(t7.ID)!''}" title="${(t7.NEWS_TITLE)!''}"><#if t7.NEWS_TITLE?? && t7.NEWS_TITLE?length gt 12>${(t7.NEWS_TITLE)?substring(0,12)}<#else>${(t7.NEWS_TITLE)!''}</#if></a></li>
                         </#list>
                    </#if>
                    </ul>
                    <p class="more"><a href="${rc.contextPath}/innovate/newsList/NEWS_D" >更多&gt;</a></p>
                </div>
            </div>
            <div class="col-xs-12 col-sm-12 col-md-6 col-lg-3 list-default">
                <div class="white news-title-bg-1">
                    <p class="tc icon-list"><a href="${rc.contextPath}/policy"><i class="iconfont color-icon-1">&#xe604;</i><br /><span class="fon-yh f18 fb color-icon-1">产业政策</span></a></p>
                    <h3 class="news-title news-title-bg-white">政策动态</h3>
                    <ul class="news-list" style="min-height:72px;">
                    <#if list8??>
                        <#list list8 as t8>
                             <li><a href="${rc.contextPath}/policy/newsDetail/NEWS_E/${(t8.ID)!''}" title="${(t8.NEWS_TITLE)!''}"><#if t8.NEWS_TITLE?? && t8.NEWS_TITLE?length gt 12>${(t8.NEWS_TITLE)?substring(0,12)}<#else>${(t8.NEWS_TITLE)!''}</#if></a></li>
                         </#list>
                    </#if>
                    </ul>
                    <p class="more"><a href="${rc.contextPath}/policy/newsList/NEWS_E">更多&gt;</a></p>
                </div>
            </div>
            <div class="col-xs-12 col-sm-12 col-md-6 col-lg-3 list-default">
                <div class="white news-title-bg-8">
                    <p class="tc icon-list"><a href="${rc.contextPath}/forum"><i class="iconfont color-icon-8">&#xe620;</i><br /><span class="fon-yh f18 fb color-icon-8">对接服务</span></a></p>
                    <h3 class="news-title news-title-bg-an">产业研究报告</h3>
                    <ul class="news-list" style="min-height:72px;">
                    <#if list9??>
                         <#list list9 as t9>
                             <li><a href="${rc.contextPath}/plugins/images/allFiles/${(t9.FILE_NAME)!''}" title="${(t9.FILE_TITLE)!''}" target="_blank"><#if t9.FILE_TITLE?? && t9.FILE_TITLE?length gt 12>${(t9.FILE_TITLE)?substring(0,12)}<#else>${(t9.FILE_TITLE)!''}</#if></a></li>
                         </#list>
                    </#if>
                    </ul>
                    <p class="more"><a href="${rc.contextPath}/forum/fileList/FILE_E2">更多&gt;</a></p>
                </div>
            </div>
        </div>
    </div>
    <!-- charts -->
</div>

    <!-- partner -->
    <div class="link w white mt20">
        <div class="container">
            <h2 class="f16 fb lh200">合作伙伴</h2>
            <div class="row patner-list">
                <div class="col-xs-4 col-sm-3 col-md-2 col-lg-2"><img src="${rc.contextPath}/plugins/images/allImages/hzhb-1.jpg" class="img-responsive" style="width:150px;height:50px;" alt="" /></div>
                <div class="col-xs-4 col-sm-3 col-md-2 col-lg-2"><img src="${rc.contextPath}/plugins/images/allImages/hzhb-2.jpg" class="img-responsive" style="width:150px;height:50px;" alt="" /></div>
                <div class="col-xs-4 col-sm-3 col-md-2 col-lg-2"><img src="${rc.contextPath}/plugins/images/allImages/hzhb-3.jpg" class="img-responsive" style="width:150px;height:50px;" alt="" /></div>
                <div class="col-xs-4 col-sm-3 col-md-2 col-lg-2"><img src="${rc.contextPath}/plugins/images/allImages/hzhb-4.jpg" class="img-responsive" style="width:150px;height:50px;" alt="" /></div>
                <div class="col-xs-4 col-sm-3 col-md-2 col-lg-2"><img src="${rc.contextPath}/plugins/images/allImages/hzhb-5.jpg" class="img-responsive" style="width:150px;height:50px;" alt="" /></div>
                <div class="col-xs-4 col-sm-3 col-md-2 col-lg-2"><img src="${rc.contextPath}/plugins/images/allImages/hzhb-6.jpg" class="img-responsive" style="width:150px;height:50px;" alt="" /></div>
                </br>
                <div class="col-xs-4 col-sm-3 col-md-2 col-lg-2"><img src="${rc.contextPath}/plugins/images/allImages/hzhb-7.jpg" class="img-responsive" style="width:150px;height:50px;" alt="" /></div>
                <div class="col-xs-4 col-sm-3 col-md-2 col-lg-2"><img src="${rc.contextPath}/plugins/images/allImages/hzhb-8.jpg" class="img-responsive" style="width:150px;height:50px;" alt="" /></div>
                <div class="col-xs-4 col-sm-3 col-md-2 col-lg-2"><img src="${rc.contextPath}/plugins/images/allImages/hzhb-9.jpg" class="img-responsive" style="width:150px;height:50px;" alt="" /></div>
                <div class="col-xs-4 col-sm-3 col-md-2 col-lg-2"><img src="${rc.contextPath}/plugins/images/allImages/hzhb-10.jpg" class="img-responsive" style="width:150px;height:50px;" alt="" /></div>
                <div class="col-xs-4 col-sm-3 col-md-2 col-lg-2"><img src="${rc.contextPath}/plugins/images/allImages/hzhb-11.jpg" class="img-responsive" style="width:150px;height:50px;" alt="" /></div>
            </div>
        </div>
    </div>
    
    <!-- 网站公告详情 -->
   <form id="myparam0" action="" method="post">   
                    <input name="articleId"  type="hidden" value=""></input>
                    <input name="moduleCode" type="hidden" value="NEWS_N"></input>
                    <input name="fModuleCode" type="hidden" value="MODULE_A"></input>
                    <input name="url1" type="hidden" value=""></input>
                    <input name="url2" type="hidden" value=""></input>
                    <input name="url3" type="hidden" value=""></input>
   </form>
    
    
   <!-- 企业信息 -->
   <form id="myparam1" action="" method="post">   
                    <input name="articleId"  type="hidden" value=""></input>
                    <input name="moduleCode" type="hidden" value="NEWS_A"></input>
                    <input name="parentCode" type="hidden" value=""></input>
                    <input name="moduleType" type="hidden" value=""></input>
                    <input name="fModuleCode" type="hidden" value="MODULE_A"></input>
                    <input name="fParentCode" type="hidden" value=""></input>
                    <input name="url1" type="hidden" value=""></input>
                    <input name="url2" type="hidden" value=""></input>
   </form>
   
   <!-- 产品服务-->
   <form id="myparam2" action="" method="post">   
                    <input name="articleId"  type="hidden" value=""></input>
                    <input name="moduleCode" type="hidden" value="NEWS_B"></input>
                    <input name="fModuleCode" type="hidden" value="MODULE_D"></input>
                    <input name="url1" type="hidden" value=""></input>
                    <input name="url2" type="hidden" value=""></input>
   </form>
   
   <!-- 支柱产业-->
   <form id="myparam3" action="" method="post">   
                    <input name="articleId"  type="hidden" value=""></input>
                    <input name="moduleCode" type="hidden" value="NEWS_M"></input>
                    <input name="fModuleCode" type="hidden" value="MODULE_E"></input>
                    <input name="url1" type="hidden" value=""></input>
                    <input name="url2" type="hidden" value=""></input>
   </form>
   
   <!-- 产业园区-->
   <form id="myparam4" action="" method="post">   
                    <input name="articleId"  type="hidden" value=""></input>
                    <input name="moduleCode" type="hidden" value="NEWS_L"></input>
                    <input name="fModuleCode" type="hidden" value="MODULE_F"></input>
                    <input name="url1" type="hidden" value=""></input>
                    <input name="url2" type="hidden" value=""></input>
   </form>
    
   <!-- 技术创新-->
   <form id="myparam5" action="" method="post">   
                    <input name="articleId"  type="hidden" value=""></input>
                    <input name="moduleCode" type="hidden" value="NEWS_C"></input>
                    <input name="fModuleCode" type="hidden" value="MODULE_G"></input>
                    <input name="url1" type="hidden" value=""></input>
                    <input name="url2" type="hidden" value=""></input>
   </form>
    
   <!-- 创新创业-->
   <form id="myparam6" action="" method="post">   
                    <input name="articleId"  type="hidden" value=""></input>
                    <input name="moduleCode" type="hidden" value="NEWS_D"></input>
                    <input name="fModuleCode" type="hidden" value="MODULE_H"></input>
                    <input name="url1" type="hidden" value=""></input>
                    <input name="url2" type="hidden" value=""></input>
   </form>
   
   <!-- 产业政策-->
   <form id="myparam7" action="" method="post">   
                    <input name="articleId"  type="hidden" value=""></input>
                    <input name="moduleCode" type="hidden" value="NEWS_E"></input>
                    <input name="fModuleCode" type="hidden" value="MODULE_I"></input>
                    <input name="url1" type="hidden" value=""></input>
                    <input name="url2" type="hidden" value=""></input>
   </form>
   
   <!-- 产业论坛-->
   <form id="myparam8" action="" method="post">   
                    <input name="articleId"  type="hidden" value=""></input>
                    <input name="moduleCode" type="hidden" value="NEWS_K"></input>
                    <input name="fModuleCode" type="hidden" value="MODULE_J"></input>
                    <input name="url1" type="hidden" value=""></input>
                    <input name="url2" type="hidden" value=""></input>
   </form>
    
    
    <!-- footer -->
    <#include "/footerAndHeader/footers.ftl"/>
    <script type="text/javascript">
        $(function () {
            //banner
            $('.mySlideshow').edslider({
                width: '100%',
            });
            //bigdata
            $('.counter').countUp({
                delay: 50,
                time: 2000,
            });
            //news
            jQuery(".slider-box").slide({ mainCell: ".slider-con", effect: "topLoop", vis: 1, interTime: 4500, delayTime: 500, autoPlay: true });
            //chartsTab
            $(".tabnav-charts li").click(function () {
                $(".tabnav-charts li").eq($(this).index()).addClass("active").siblings().removeClass('active');
                $(".con-charts div").eq($(".tabnav-charts li").index(this)).removeClass("tabcon").siblings().addClass('tabcon');
                $(".con-charts div").eq($(".tabnav-charts li").index(this)).addClass("on-con").siblings().removeClass('on-con');
            });
            //floatNav
            jQuery('.navbg').headshrinker({ fontSize: "14px", mobileMenu: true });
            $(".nav-pc a.mobile-btn").click(function () {
                $(".nav-pc ul").slideToggle();
            });
        });
        
     
    </script>
</body>
</html>
