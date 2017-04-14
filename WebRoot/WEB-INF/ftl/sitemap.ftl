<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
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
    <title>网站地图-中关村贵阳科技园产业云平台</title>
</head>
<body class="con_main_bg">
    <!-- topbar -->
    <#include "footerAndHeader/headers.ftl"/>
    <!-- banner -->
    <div class="banner w banner_05"></div>
    <div class="container mainbg mt20">
        <!-- bread -->
        <div class="clearfix mt20 nav_new">
            <div class="bread-nav fl">
                您的位置：<a href="${rc.contextPath}/index">首页</a><span>&gt;</span>网站地图
            </div>
	        <div class="search fr search-xs" >
	            <div class="fl"><input type="text" class="search-text" id="searchCompany_text" value="${keyWord!''}" name="" placeholder="搜企业" /></div>
	            <div class="fr"><button class="search-but" onclick="searchCompany()" ><i class="iconfont f30">&#xe60a;</i></button></div>
	        </div>
        </div>
        <!-- list -->
        <div class="mt20 mb20">
                    <div class="content-art white">
                        <h2 class="f30 tc">网站地图</h2>
                        <p class="tc f12 xx"></p>
                        <div class="clearfix">
                            <div class="map-list">
                                <a href="${rc.contextPath}/info" class="map-t">企业信息</a>
                                <ul>
                                    <li><a href="${rc.contextPath}/info/newsList/NEWS_A">企业资讯</a></li>
                                    <li><a href="${rc.contextPath}/info">统计分析</a></li>
                                    <li><a href="${rc.contextPath}/info">企业列表</a></li>
                                </ul>
                            </div>
                            <div class="map-list">
                                <a href="${rc.contextPath}/industry" class="map-t">产品服务</a>
                                <ul>
                                    <li><a href="${rc.contextPath}/industry/newsList/NEWS_B">产品资讯</a></li>
                                    <li><a href="${rc.contextPath}/industry">统计分析</a></li>
                                    <li><a href="${rc.contextPath}/industry">工业产品</a></li>
                                    <li><a href="${rc.contextPath}/industry">生产服务</a></li>
                                </ul>
                            </div>
                            <div class="map-list">
                                <a href="${rc.contextPath}/prop" class="map-t">支柱产业</a>
                                <ul>
                                    <li><a href="${rc.contextPath}/prop/newsList/NEWS_M">产业动态</a></li>
                                    <li><a href="${rc.contextPath}/prop">统计分析</a></li>
                                    <li><a href="${rc.contextPath}/prop">支柱产业</a></li>
                                </ul>
                            </div>
                            <div class="map-list">
                                <a href="${rc.contextPath}/garden" class="map-t">产业园区</a>
                                <ul>
                                    <li><a href="${rc.contextPath}/garden">园区概况</a></li>
                                    <li><a href="${rc.contextPath}/garden">园区动态</a></li>
                                    <li><a href="${rc.contextPath}/garden">统计分析</a></li>
                                    <li><a href="${rc.contextPath}/garden">园区分布</a></li>
                                </ul>
                            </div>
                            <div class="map-list">
                                <a href="${rc.contextPath}/tech" class="map-t">技术创新</a>
                                <ul>
                                    <li><a href="${rc.contextPath}/tech/newsList/NEWS_C">技术创新动态</a></li>
                                    <li><a href="${rc.contextPath}/tech/tables/table1">技术创新成果</a></li>
                                    <li><a href="${rc.contextPath}/tech/tables/table2">技术创新平台</a></li>
                                    <li><a href="${rc.contextPath}/tech">创新人才与创新投入</a></li>
                                    <li><a href="${rc.contextPath}/tech">统计分析</a></li>
                                    <li><a href="${rc.contextPath}/tech/fileList/FILE_B">产学研合作</a></li>
                                </ul>
                            </div>
                            <div class="map-list">
                                <a href="${rc.contextPath}/innovate" class="map-t">创新创业</a>
                                <ul>
                                    <li><a href="${rc.contextPath}/innovate/newsList/NEWS_D">创新创业动态</a></li>
                                    <li><a href="${rc.contextPath}/innovate/platformList">创新创业平台</a></li>
                                    <li><a href="${rc.contextPath}/innovate/financeList">产业金融环境</a></li>
                                    <li><a href="${rc.contextPath}/innovate/innovateResultList">创新创业成果</a></li>
                                    <li><a href="${rc.contextPath}/innovate/innovateCompList">创新创业示范企业</a></li>
                                    <li><a href="${rc.contextPath}/innovate">创新创业领军人物</a></li>
                                </ul>
                            </div>
                            <div class="map-list">
                                <a href="${rc.contextPath}/policy" class="map-t">产业政策</a>
                                <ul>
                                    <li><a href="${rc.contextPath}/policy/newsList/NEWS_E">政策动态</a></li>
                                    <li><a href="${rc.contextPath}/policy/newsList/NEWS_F">国家政策</a></li>
                                    <li><a href="${rc.contextPath}/policy/newsList/NEWS_G">省级政策</a></li>
                                    <li><a href="${rc.contextPath}/policy/newsList/NEWS_H">本市政策</a></li>
                                    <li><a href="${rc.contextPath}/policy/newsList/NEWS_I">政策解读</a></li>
                                </ul>
                            </div>
                            <div class="map-list">
                                <a href="${rc.contextPath}/forum" class="map-t">对接服务</a>
                                <ul>
                                    <li><a href="${rc.contextPath}/forum">产业研究</a></li>
                                    <li><a href="${rc.contextPath}/forum">培训学习</a></li>
                                    <li><a href="${rc.contextPath}/forum">招聘服务</a></li>
                                    <li><a href="${rc.contextPath}/forum">对接服务</a></li>
                                    <li><a href="${rc.contextPath}/forum">下载专区</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
    </div>
        <!-- footer -->
		<#include "footerAndHeader/footers.ftl"/>
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
                //tj-list-float
                $(window).scroll(function () {
                    if ($("body").scrollTop() > 250) {
                        $('#float-right').addClass('mfixed');
                    }
                    else {
                        $('#float-right').removeClass('mfixed');
                    }
                });
                var boxW = $(".tj-r").width();
                $("#float-right").width(boxW);
                $(window).resize(function () {
                    var boxW = $(".tj-r").width();
                    $("#float-right").width(boxW);
                });
            });
        </script>
</body>
</html>
