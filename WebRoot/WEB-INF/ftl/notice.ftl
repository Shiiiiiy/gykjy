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
    <title>法律声明-中关村贵阳科技园产业云平台</title>
</head>
<body class="con_main_bg">
	<#include "footerAndHeader/headers.ftl"/>
    <!-- banner -->
    <div class="banner w banner_05"></div>
    <div class="container mainbg mt20">
        <!-- bread -->
        <div class="clearfix mt20 nav_new">
            <div class="bread-nav fl">
                您的位置：<a href="${rc.contextPath}/index">首页</a><span>&gt;</span>法律声明
            </div>
	        <div class="search fr search-xs" >
	            <div class="fl"><input type="text" class="search-text" id="searchCompany_text" value="${keyWord!''}" name="" placeholder="搜企业" /></div>
	            <div class="fr"><button class="search-but" onclick="searchCompany()" ><i class="iconfont f30">&#xe60a;</i></button></div>
	        </div>
        </div>
        <!-- list -->
        <div class="mt20 mb20">
                    <div class="content-art white">
                        <h2 class="f30 tc">法律声明</h2>
                        <p class="tc f12 xx"></p>
                        <div class="con dp">
                           <p class="fb">规则及产业云平台访问条件</p>
                            <p>以下规则适用于所有访问本平台的个人、企业或机构，贵阳市工业和信息化委员会（简称贵阳工信委）保留随时修改这些规则的权利。访问本平台的权利由贵阳工信委根据以下条款授予。如果会员不同意下列任何条款、请停止使用本网址。对于违反这些规则的行为，贵阳工信委有权采取法律措施。</p>
                            <p class="fb">不承诺责任声明</p>
                            <p>平台中非贵阳工信委授权会员上载的材料和信息，包括但不限于文本、图片、数据、观点、建议、网页或链路，虽然贵阳市工信委力图在平台上提供准确的资料和信息，但贵阳工信委并不保证这些材料和内容的绝对准确、完整、充分和可靠性，并且明确声明不对这些材料和内容的错误或遗漏承担责任，不做任何担保或保证。</p>
					 <p class="fb">著作权说明</p>
                            <p>本平台所载的所有材料或内容受版权法保护，版权由贵阳工信委或获得平台授权认证可以上传资料的个人、企业或机构（注明引用其它方的内容除外）。未经贵阳工信委或其他方事先书面许可，任何人不得将本平台上的任何内容以任何方式进行复制、经销、翻印、播放、以超级链路连接或传送、以"镜像法"载入其他服务器上、存储于信息检索系统或者其他任何商业目的，但对于非商业目的、个人使用的下载、复制或打印（条件是不得修改，且须保留该材料中的版权说明或其他所有权的说明）除外。</p>
					<p class="fb">商标</p>
                            <p>本平台上使用和显示的所有商标、标志内容受版权法的保护，版权由贵阳工信委或获得平台授权认证可以上传资料的个人、企业或机构拥有（但注明属于其他方拥有的商标、标志除外）。平台所载的任何内容不应被视作未经贵阳工信委或其他方书面许可，以暗示、不反对或其他形式授予使用前述任何商标、标志的许可或权利。未经事先书面许可，任何人不得以任何方式使用平台所显示的商标、标记。</p>
					<p class="fb">第三方链接</p>
                            <p>本平台可能保留与第三方网站或网址的链接，访问这些链接将由平台访问者自己决定，贵阳工信委并不保证这些链接上所提供的任何信息、数据、观点、图片、陈述或建议的准确性、完整性、充分性和可靠性。贵阳产业云平台提供这些链接仅在于为广大企业提供方便，除了获得贵阳产业云平台诚信认证的机构网址外，针对其他网站和网址，并不表示贵阳工信委对这些信息的认可和推荐，也不是用于宣传或广告目的。</p>
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
