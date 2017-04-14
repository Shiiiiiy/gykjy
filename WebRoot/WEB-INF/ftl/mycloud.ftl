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
    <title>我的产业云-中关村贵阳科技园产业云平台</title>
</head>
<body class="con_main_bg">
	<#include "footerAndHeader/headers.ftl"/>
    <!-- banner -->
    <div class="banner w banner_05"></div>
    <div class="container mainbg mt20">
        <!-- bread -->
        <div class="clearfix mt20 nav_new">
            <div class="bread-nav fl">
                您的位置：<a href="${rc.contextPath}/index">首页</a><span>&gt;</span>我的产业云
            </div>
	        <div class="search fr search-xs" >
	            <div class="fl"><input type="text" class="search-text" id="searchCompany_text" value="${keyWord!''}" name="" placeholder="搜企业" /></div>
	            <div class="fr"><button class="search-but" onclick="searchCompany()" ><i class="iconfont f30">&#xe60a;</i></button></div>
	        </div>
        </div>
        <!-- list -->
        <div class="mt20 mb20">
                    <div class="content-art white">
                        <h2 class="f30 tc">我的产业云</h2>
                        <p class="tc f12 xx"></p>
                        <div class="con dp">
                           <p>中关村贵阳科技园产业云平台是贵阳市工业企业综合推广和服务平台，平台搭建的核心目标在于为广大企业构建互联网传播推广、对接交易、学习成长的软环境，有效带动全市工业企业互联网、大数据应用水平，切实推进两化融合。另外，在贵阳市工业大数据生态系统中，中关村贵阳科技园产业云平台也是其中的核心组成部分，是贵阳市工业大数据生态系统建设的引擎和基础。</p>
                            <p>从系统架构来看，中关村贵阳科技园产业云平台体现为“1+8”架构体系，即在一个统一云平台下，下辖“企业信息、产品服务信息、支柱产业、产业园区、技术创新、创新创业、产业政策、对接服务”8朵云，通过8多云的专业化建设，从不同角度实现对全市工业企业、生产性服务业的全方位支持和服务，有效实现政府资源、企业资源、市场化服务资源的整合和对接，逐步以大数据、云计算等深层技术手段助推贵阳工业经济的创新和发展，打造线上线下完美统一的工业体系。</p>
                            <p>从功能定位来看，中关村贵阳科技园产业云平台主要包括以下四个层面：</p>
                            <p>从企业角度来说，是企业品牌产品展示推广平台，企业市场资讯、产业资讯、政策资讯获取平台，企业彼此学习交流、资源共享平台，更长远一点儿会成为企业服务和需求对接，商务洽谈与市场化交易平台。</p>
                            <p>从政府角度说，是实体产业发展扶植平台，产业经济运行状态监测平台，政府产业政策发布、沟通平台，政府政策制定、调整优化指引平台，产业政策和企业服务成果展示平台，区域经济活力、产业创新活力展示平台。</p>
                            <p>从产业园区角度来说，是园区产业经济运行状态监测平台，园区产业政策和企业服务效果展示平台 ，园区间学习交流、资源共享平台。</p>
                            <p>从市场和社会角度来说，是市场化机构、社会机构了解贵阳，了解西部，获取区域经济运行数据、产业数据获取平台，是区域市场、产品品牌资讯查询对接平台，是区域产业发展模式、政策经验借鉴平台。</p>
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
