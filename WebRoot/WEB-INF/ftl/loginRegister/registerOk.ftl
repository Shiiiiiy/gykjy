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
    <script type="text/javascript" src="${rc.contextPath}/plugins/js/slider.js"></script>
    <!--[if lte IE 9]>
    <script src="${rc.contextPath}/plugins/js/respond.min.js"></script>
    <script src="${rc.contextPath}/plugins/js/html5shiv.js"></script>
    <![endif]-->
    <title>注册-中关村贵阳科技园产业云平台</title>
</head>
<body class="con_main_bg">
    <!-- topbar -->
    <div class="topbar w">
        <div class="container">
            <div class="welcome f12 fl">您好，欢迎来到贵阳科技园产业云平台！请 <a href="${rc.contextPath}/login" target="_blank">[登录]</a> / <a href="${rc.contextPath}/register">注册</a></div>
            <div class="topnav fr f12 hidden-xs"><a href="${rc.contextPath}/cloud"><i class="iconfont">&#xe609;</i>我的产业云</a><a href="${rc.contextPath}/map"><i class="iconfont">&#xe6b5;</i>网站地图</a><a href="${rc.contextPath}"><i class="iconfont">&#xe67f;</i>网站说明</a></div>
        </div>
    </div>
    <!-- nav -->
    <div class="navbg white w">
        <div class="container clearfix pr">
            <div class="logo fl"><a href="${rc.contextPath}/index"><img src="${rc.contextPath}/plugins/images/logo.png" alt="中关村贵阳科技园产业云平台" class="img-responsive" /></a></div>
        </div>
    </div>
    <!-- banner -->
    <div class="banner w banner_01"></div>
    <div class="container mainbg mt20">
    <!-- bread -->
    <div class="clearfix mt20 nav_new">
        <div class="bread-nav fl">
            您的位置：<a href="${rc.contextPath}/index">首页</a><span>&gt;</span>注册
        </div>
        <div class="search fr search-xs" style="display:none;">
            <div class="fl"><input type="text" class="search-text" name="" placeholder="搜企业、找产品、查资料、看报告" /></div>
            <div class="fr"><button class="search-but"><i class="iconfont f30">&#xe60a;</i></button></div>
        </div>
    </div>
    <!-- register -->
    <div class="mt20 mb20 spacing">
        <div class="tc reg-ok f36">
            <div class="green">
                <i class="iconfont f45  mr10" style="vertical-align:middle;">&#xe640;</i>恭喜您，注册成功!<br /><span class="f14 gray10">页面将在5秒后跳转...还剩<b id="num fn">5</b>秒,如没跳转，请<a href="login">点击这里&gt;</a></span>
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
            //Jump
            function jump(count) {
                window.setTimeout(function () {
                    count--;
                    if (count > 0) {
                        $('#num').attr('innerHTML', count);
                        jump(count);
                    } else {
                        location.href = "${rc.contextPath}/login";
                    }
                }, 1000);
            }
            jump(5);
        });
    </script>
</body>
</html>
