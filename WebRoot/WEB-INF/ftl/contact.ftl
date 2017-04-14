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
    <title>联系我们-中关村贵阳科技园产业云平台</title>
</head>
<body class="con_main_bg">
	<#include "footerAndHeader/headers.ftl"/>
    <!-- banner -->
    <div class="banner w banner_05"></div>
    <div class="container mainbg mt20">
        <!-- bread -->
        <div class="clearfix mt20 nav_new">
            <div class="bread-nav fl">
                您的位置：<a href="${rc.contextPath}/index">首页</a><span>&gt;</span>联系我们
            </div>
	        <div class="search fr search-xs" >
	            <div class="fl"><input type="text" class="search-text" id="searchCompany_text" value="${keyWord!''}" name="" placeholder="搜企业" /></div>
	            <div class="fr"><button class="search-but" onclick="searchCompany()" ><i class="iconfont f30">&#xe60a;</i></button></div>
	        </div>
        </div>
        <!-- list -->
        <div class="mt20 mb20">
                    <div class="content-art white">
                        <h2 class="f30 tc">联系我们</h2>
                        <p class="tc f12 xx"></p>
                        <div class="con dp">
                           <p>平台负责机构：贵阳市工业和信息化委员会</p>
                            <p>地    址：贵阳市金阳新区迎宾东路市级行政中心“一期”综合办公楼A区</p>
                            <p>邮    编：550081</p>
                            <p>电    话：0851-87989051</p>
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
