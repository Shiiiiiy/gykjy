<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link href="${rc.contextPath}/plugins/images/favicon.ico" rel="shortcut icon">
    <link rel="stylesheet" href="${rc.contextPath}/plugins/bootstrap/bootstrap.min.css">
    <link rel="stylesheet" href="${rc.contextPath}/plugins/css/animate.min.css" />
    <link rel="stylesheet" href="${rc.contextPath}/plugins/css/cover.css" />
    <script type="text/javascript" src="${rc.contextPath}/plugins/js/jquery.min.js"></script>
    <script src="${rc.contextPath}/plugins/Scripts/swfobject_modified.js" type="text/javascript"></script>
    <title>中关村贵阳科技园产业云平台</title>
</head>

<body>
<div class="enter"><a href="${rc.contextPath}/index">跳过</a></div>
<div class="img-slide">
<div class="item1 boxcon" style="overflow:hidden;">
            <div class="logo"></div>
            <div class="bg1"></div>
        
        <div class="bg3"></div>
            <div class="navbg">
                <div class="nav cloud1"><p class="nav1"></p><a href="${rc.contextPath}/info">企业信息</a></div>
                <div class="nav cloud2"><p class="nav2"></p><a href="${rc.contextPath}/industry">产品服务</a></div>
                <div class="nav cloud3"><p class="nav3"></p><a href="${rc.contextPath}/prop">支柱产业</a></div>
                <div class="nav cloud4"><p class="nav4"></p><a href="${rc.contextPath}/garden">产业园区</a></div>
                <div class="nav cloud5"><p class="nav5"></p><a href="${rc.contextPath}/tech">技术创新</a></div>
                <div class="nav cloud6"><p class="nav6"></p><a href="${rc.contextPath}/innovate">创新创业</a></div>
                <div class="nav cloud7"><p class="nav7"></p><a href="${rc.contextPath}/policy">产业政策</a></div>
                <div class="nav cloud8"><p class="nav8"></p><a href="${rc.contextPath}/forum">对接服务</a></div>
            </div>
            <div class="bot-bg"></div>
			<div class="bot-bg-l"></div>
			<div class="bot-bg-r"></div>
            <div class="bg-animate">
                <object id="FlashID" classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" width="1920" height="1080">
                    <param name="movie" value="${rc.contextPath}/plugins/bg.swf" />
                    <param name="quality" value="high" />
                    <param name="wmode" value="transparent" />
                    <param name="swfversion" value="6.0.65.0" />
                    <!-- 此 param 标签提示使用 Flash Player 6.0 r65 和更高版本的用户下载最新版本的 Flash Player。如果您不想让用户看到该提示，请将其删除。 -->
                    <param name="expressinstall" value="${rc.contextPath}/plugins/Scripts/expressInstall.swf" />
                    <!-- 下一个对象标签用于非 IE 浏览器。所以使用 IECC 将其从 IE 隐藏。 -->
                    <!--[if !IE]>-->
                    <object type="application/x-shockwave-flash" data="${rc.contextPath}/plugins/bg.swf" width="1920" height="1080">
                        <!--<![endif]-->
                        <param name="quality" value="high" />
                        <param name="wmode" value="transparent" />
                        <param name="swfversion" value="6.0.65.0" />
                        <param name="expressinstall" value="${rc.contextPath}/plugins/Scripts/expressInstall.swf" />
                        <!-- 浏览器将以下替代内容显示给使用 Flash Player 6.0 和更低版本的用户。 -->
                        <div>
                            <h4>此页面上的内容需要较新版本的 Adobe Flash Player。</h4>
                            <p><a href="http://www.adobe.com/go/getflashplayer"><img src="http://www.adobe.com/images/shared/download_buttons/get_flash_player.gif" alt="获取 Adobe Flash Player" width="112" height="33" /></a></p>
                        </div>
                        <!--[if !IE]>-->
                    </object>
                    <!--<![endif]-->
                </object>
            </div>
</div>
<div class="boxcon section3">
	<div class="container">
		<div class="zs"><img src="${rc.contextPath}/plugins/images/s_3.png" alt="" class="img-responsive" style="margin:40px auto 0 auto;" /></div>
	</div>
</div>
<div class="boxcon section4">
	<div class="container">
		<div class="zs"><img src="${rc.contextPath}/plugins/images/s_4.png" alt="" class="img-responsive" style="margin:40px auto 0 auto;" /></div>
	</div>
</div>
<div class="boxcon section2">
	<div class="container">
		<div class="zs"><img src="${rc.contextPath}/plugins/images/s_2.png" alt="" class="img-responsive" style="margin:40px auto 0 auto;" /></div>
	</div>
</div>
<div class="boxcon section5">

</div>
</div>
    <!--<div id="fullpage">
        
        </div>
		<div class="section section3">
            <div class="container">
			<div class="zs"><img src="${rc.contextPath}/plugins/images/s_3.png" alt="" class="img-responsive" style="margin:auto;" /></div>
		</div>
        </div>
		<div class="section section4">
            <div class="container">
			<div class="zs"><img src="${rc.contextPath}/plugins/images/s_4.png" alt="" class="img-responsive" style="margin:auto;" /></div>
		</div>
        </div>
        <div class="section section2">
            <div class="container">
			<div class="zs"><img src="${rc.contextPath}/plugins/images/s_2.png" alt="" class="img-responsive" style="margin:auto;" /></div>
		</div>
        </div>
	<div class="section section5">
            
        </div>
    </div>-->
    <script type="text/javascript">
        swfobject.registerObject("FlashID");
        $(document).ready(function () {
            //轮播
    var len = $(".img-slide div.boxcon").length;
    var index = 0;  //图片序号
    var adTimer;
    var adHeight = $(".img-slide div.boxcon:first").height();
    //创建轮播焦点
    /*for (i = 0; i < len; i++) {
        $(".control").append("<li>" + i + "</li>");
    }
    $(".control li:first").addClass("on");*/
    //滑入停止动画，滑出开始动画.
     var adTimer = setInterval(function () {
            showImg(index)
            index++;
			if (index == len) {//最后一张图片之后，转到第一张
                index = 0;
            }
        }, 8000);
    //轮播动作
    function showImg(index) {
		$(".img-slide div.boxcon").eq(index).removeClass("deep");
		$(".img-slide div.boxcon").eq(index).siblings().addClass("deep");
        $(".img-slide div.boxcon").eq(index).stop(true, false).animate({
            "height": "100%"  //改变 marginLeft 属性的值达到轮播的效果
        }, 3000);
		$(".img-slide div.boxcon").eq(index).siblings().stop(true, false).animate({
            "height": "0"  //改变 marginLeft 属性的值达到轮播的效果
        }, 3000);
        /*$(".control li").removeClass("on")
            .eq(index).addClass("on");*/
    }
    //轮播焦点控制
    /*$(".control li").click(function () {
        index = $(this).index(".control li");
        showImg(index)
    });*/
	var zsimgH = $(".img-slide div.zs img").height();
	var bodyHs = $(window).height();
	var sumH = (bodyHs-zsimgH)/2;
    $(".img-slide div.zs img").css("margin-top",sumH);
    $(window).resize(function () {
        var zsimgH = $(".img-slide div.zs img").height();
		var bodyHs = $(window).height();
		var sumH = (bodyHs-zsimgH)/2;
        $(".img-slide div.zs img").css("margin-top",sumH);
    });
            var ss=setInterval(function () {
                xq()
            }, 2000);
            var sa=setInterval(function () {
                navbg()
            }, 3000);
            function xq() {
                $(".cloud1").animate({ left: "360px" }, 2247);
                $(".cloud1").animate({ left: "355px" }, 2247);
            }
            function navbg() {
                $(".line-go").animate({ opacity: "1.0" }, 2247);
                $(".line-go").animate({ opacity: "0.3" }, 2247);
            }
            $(".nav").hover(function () {
                $(this).find("p.name").show();
            }, function () {
                $(this).find("p.name").hide();
            });
        });
    </script>
</body>
</html>
