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
    <script type="text/javascript" src="${rc.contextPath}/plugins/js/jquery.validate.js"></script>
    
    <!--[if lte IE 9]>
    <script src="${rc.contextPath}/plugins/js/respond.min.js"></script>
    <script src="${rc.contextPath}/plugins/js/html5shiv.js"></script>
    <![endif]-->
    <title>信息发布-中关村贵阳科技园产业云平台</title>
</head>
<body class="con_main_bg">
	<#include "/footerAndHeader/headers.ftl"/>
    <!-- banner -->
    <a href="javascript:void(0)" style="cursor:default;"><div class="banner w" style="background: url(${rc.contextPath}/plugins/images/allImages/${(bannerImages.FILE_NAME)!''}) top center no-repeat;"></div></a>
    <div class="container mainbg mt20">
        <!-- bread -->
        <div class="clearfix mt20 nav_new">
            <div class="bread-nav fl">
                您的位置：<a href="${rc.contextPath}/index">首页</a><span>&gt;&nbsp;<a href="${rc.contextPath}/forum">对接服务</a><span>&gt;</span>需求信息
            </div>
            <div class="search fr search-xs" >
	            <div class="fl"><input type="text" class="search-text" id="searchCompany_text" value="${keyWord!''}" name="" placeholder="搜企业" /></div>
	            <div class="fr"><button class="search-but" onclick="searchCompany()" ><i class="iconfont f30">&#xe60a;</i></button></div>
	        </div>
        </div>
        <!-- list -->
        <div class="mt20 mb20" style="min-height:600px;">
            <h2 class="f25 fb title-p"><span class="txt">信息查看
            </span><span class="line border-c"></span></h2>
            <form id="register" name="register">
                <div class="row">
                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                        <div class="input-group mb15">
                            <span class="input-group-addon"><font color="red"></font>需&nbsp;求&nbsp;方&nbsp;名&nbsp;称</span>
                            <input type="text" name="NAME" class="form-control" value="${(NeedsOne.NAME)!''}"  disabled  >
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                        <div class="input-group mb15">
                            <span class="input-group-addon"><font color="red"></font>采&nbsp;&nbsp;购&nbsp;&nbsp;&nbsp;内&nbsp;&nbsp;容</span>
                            <textarea name="DETAIL" class="form-control"  disabled >${(NeedsOne.DETAIL)!''}</textarea>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                        <div class="input-group mb15">
                            <span class="input-group-addon"><font color="red"></font>计划采购时间</span>
                            <input type="text" name="START_TIME" class="form-control" value="${(NeedsOne.START_TIME)!''}" disabled >
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                        <div class="input-group mb15">
                            <span class="input-group-addon"><font color="red"></font>联&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;系&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;人</span>
                            <input type="text" name="LINKMAN" class="form-control" value="${(NeedsOne.LINKMAN)!''}" disabled >
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                        <div class="input-group mb15">
                            <span class="input-group-addon"><font color="red"></font>电&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;话</span>
                            <input type="text" name="PHONE" class="form-control" value="${(NeedsOne.PHONE)!''}" disabled >
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                        <div class="input-group mb15">
                            <span class="input-group-addon"><font color="red"></font>手&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;机</span>
                            <input type="text" name="TEL" class="form-control" value="${(NeedsOne.TEL)!''}" disabled >
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                        <div class="input-group mb15">
                            <span class="input-group-addon"><font color="red"></font>邮&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;箱</span>
                            <input type="text" name="MAIL" class="form-control" value="${(NeedsOne.MAIL)!''}" disabled >
                        </div>
                    </div>
                    </div>
			</form>
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
                //tj-list-float
                /*$(window).scroll(function () {
                    if ($("body").scrollTop() > 250) {
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
            });
        </script>
</body>
</html>
