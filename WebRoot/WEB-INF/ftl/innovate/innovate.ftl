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
	<script type="text/javascript" src="${rc.contextPath}/plugins/js/rollSlide.js"></script>
    <script type="text/javascript" src="${rc.contextPath}/plugins/js/slider.js"></script>
    <!--[if lte IE 9]>
    <script src="${rc.contextPath}/plugins/js/respond.min.js"></script>
    <script src="${rc.contextPath}/plugins/js/html5shiv.js"></script>
    <![endif]-->
    <title>创新创业-中关村贵阳科技园产业云平台</title>
</head>
<body class="con_main_bg">
     <#include "/footerAndHeader/headers.ftl"/>
    <!-- banner -->
    <a href="javascript:void(0)" style="cursor:default;"><div class="banner w" style="background: url(${rc.contextPath}/plugins/images/allImages/${(bannerImages.FILE_NAME)!''}) top center no-repeat;"></div></a>
    <div class="container mainbg mt20">
	<!-- bread -->
    <div class="clearfix mt20 nav_new">
        <div class="bread-nav fl">
            您的位置：<a href="${rc.contextPath}/index">首页</a><span>&gt;</span>创新创业
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
	                                <li><p class="txt">${(si.FILE_TITLE)!""}</p><a href="${(si.URL)!'javascript:void(0)'}" <#if si?? && si.URL??>target="_blank"<#else> style="cursor:default;"</#if>><img src="${rc.contextPath}/plugins/images/allImages/${(si.FILE_NAME)!''}" class="img-responsive" alt="${(si.STATUS)!''}" /></a></li>
	                            </#list>
	                          </#if>
                        </ul>
                        <div class="slider-btn btn-white"><a class="prev" href="javascript:void(0);"></a><a class="next" href="javascript:void(0);"></a></div>
                    </div>
                </div>
                <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
				<div class="border-box dtmin">
                    <h2 class="news-t"><span class="more fr"><a href="${rc.contextPath}/innovate/newsList/NEWS_D">更多 &gt;</a></span><i class="iconfont mr10 f25 blue-n">&#xe613;</i><span class="f16 blue-n fb">创新创业动态</span></h2>
                    <dl class="newslist">
                       <#if newsList??>
                        <#list newsList as nl>
                             <#if nl_index==0>
		                        <dt>
		                            <a href="${rc.contextPath}/innovate/newsDetail/${(nl.ID)!''}"  title="${(nl.NEWS_TITLE)!''}" >${(nl.NEWS_TITLE)!""}</a>
		                            <span class="fn f12" style="word-break: break-all;" ><#if nl.INTRODUCE?? && nl.INTRODUCE?length gt 79>${((nl.INTRODUCE)!"")?substring(0,79)}...<#else>${(nl.INTRODUCE)!""}</#if></span>
		                        </dt>
		                     <#else>   
		                        <dd><a href="${rc.contextPath}/innovate/newsDetail/${(nl.ID)!''}"  title="${(nl.NEWS_TITLE)!''}" ><span class="date">${((nl.NEWS_TIME)!"")?string("yyyy-MM-dd")}</span>${(nl.NEWS_TITLE)!""}</a></dd>
		                     </#if>   
                        </#list>
                     </#if>
                    </dl>
				</div>
                </div>
            </div>
        </div>
    <!--platforms-->
    <div class="mt20">
        <h2 class="f25 fb title-p"><small class="caps f12 fr"><a href="${rc.contextPath}/innovate/platformList" class="ml5">更多+</a></small><span class="txt blue-b">创新创业平台</span><span class="line border-c"></span></h2>
        <div class="row cxcg-list">
            <#if platformList??>
	            <#list platformList as pf>
	                 <div class="col-xs-6 col-sm-4 col-md-3 col-lg-3">
		                <img src="${rc.contextPath}/plugins/images/allImages/${(pf.FILE_NAME)!'images/no-image.jpg'}" alt="${(pf.FILE_TITLE)!''}" class="img-responsive" />
		                <p class="tc lh180"><#if pf?? && pf.FILE_TITLE?? && (pf.FILE_TITLE)?length gt 10>${((pf.FILE_TITLE)!"")?substring(0,10)}<#else> ${(pf.FILE_TITLE)!""}</#if></p>
		             </div>
	            </#list>
            </#if>
        </div>
    </div>
    <!-- Science -->
    <div class="mt20">
        <h2 class="f25 fb title-p"><small class="caps f12 fr"><a href="${rc.contextPath}/innovate/financeList" class="ml5">更多+</a></small><span class="txt blue-b">产业金融环境</span><span class="line border-c"></span></h2>
        <div class="row cxcg-list">
            
            <#if financeList??>
	            <#list financeList as fl>
	                 <div class="col-xs-6 col-sm-4 col-md-3 col-lg-3">
		                <img src="${rc.contextPath}/plugins/images/allImages/${(fl.FILE_NAME)!'images/no-image.jpg'}" alt="${(fl.FILE_TITLE)!''}" class="img-responsive" />
		                <p class="tc lh180"><#if (fl.FILE_TITLE)?? && (fl.FILE_TITLE)?length gt 10>${((fl.FILE_TITLE)!"")?substring(0,10)}<#else>${(fl.FILE_TITLE)!""}</#if></p>
		            </div>
	            </#list>
            </#if>
        </div>
    </div>
    <!--Results-->
    <div class="mt20">
        <h2 class="f25 fb title-p"><small class="caps f12 fr"><a href="${rc.contextPath}/innovate/innovateResultList" class="ml5">更多+</a></small><span class="txt blue-b">创新创业成果</span><span class="line border-c"></span></h2>
        <div class="row charts">
            <#if statistImages??>
	            <#list statistImages as st>
	                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6"><div class="border-box mb20"><img src="${rc.contextPath}/plugins/images/allImages/${(st.FILE_NAME)!''}" alt="${(st.FILE_TITLE)!''}" class="img-responsive" /></div></div>
	            </#list>
            </#if>
          
        </div>
    </div>
    <!-- card 公司名片展示 模块 -->
    <div id="card233" class="card-box" style="display:none;">
        <div class="card-close"><i class="iconfont">&#xe652;</i>关闭</div>
        <div class="card-con">
            <h3 id="card-cp-name">[公司名称]</h3>
            <p class="f14 lh180" id="card-cp-abs">[公司简介]</p>
        </div>
    </div> 
    <!-- demonstration  -->
    <div class="mt20">
        <h2 class="f25 fb title-p"><small class="caps f12 fr"><a href="${rc.contextPath}/innovate/innovateCompList" class="ml5">更多+</a></small><span class="txt blue-b">创新创业示范企业</span><span class="line border-c"></span></h2>
        <div class="row cxcg-list">
            
            <#if innovateCompList??>
	            <#list innovateCompList as ic>
	                    <div class="col-xs-6 col-sm-4 col-md-3 col-lg-2">
			                <a href="javascript:void(0);" onclick="showCard('${ic.ID}')" title="${(ic.CP_NAME)!''}">
			                <img src="${rc.contextPath}/plugins/images/allImages/${(ic.CP_VIEW)!''}" alt="${(ic.CP_NAME)!''}" class="img-responsive" /></a>
			                <p class="tc lh180"><#if (ic.CP_NAME)?? && (ic.CP_NAME)?length gt 11>${((ic.CP_NAME)!'')?substring(0,11)}<#else>${(ic.CP_NAME)!''}</#if>
			                </p>
						    <input type="hidden" value="${(ic.CP_NAME)!''}" id="${'CPNAME'+ic.ID}"/>
				            <input type="hidden" value="${(ic.CP_ABSTRACT)!''}" id="${'CPABS'+ic.ID}"/>
			            </div>
	            </#list>
            </#if>
        </div>
    </div>
    <!-- character -->
    <div class="mt20 mb20">
        <h2 class="f25 fb title-p"><span class="txt blue-b">创新创业领军人物</span><span class="line border-c"></span></h2>
        <div class="scroll-logo roll_row pr" id="logoscroll" style="margin-top:15px;padding-bottom:15px;min-height:192px;border-bottom:none;">
            <ul class="logo-list roll__list human_list clearfix" id="pers" style="position: absolute; left: 0; top: 0;">
            <#if leaderManList??>
	            <#list leaderManList as ld>
	                    <li title="${(ld.PS_NAME)!''}">
				        	<a href="javascript:void(0);" name="${(ld.ID)!''}" class="card-233" onclick="newShowCard(this);">
				        	<img src="${rc.contextPath}/plugins/images/allImages/${(ld.PS_IMAGE)!''}"/></a>
			        	</li>

	            </#list>
            </#if>
            </ul>
		 <div class="slider-btn btn-black"><a class="prev" href="javascript:void(0);" style="left:-15px;"></a><a class="next" href="javascript:void(0);" style="right:-15px;"></a></div>
        </div>
    </div>
	</div>
    <!-- card 人物名片-->
    <div class="card-box rw-box" style="display:none;" id="card234">
        <div class="card-close"><i class="iconfont">&#xe652;</i>关闭</div>
        <div class="card-scroll sm-scroll">
            <div class="fl rw-img p10" id="p07" title=""><img id="p06" src="${rc.contextPath}/plugins/images/r4.jpg" class="img-responsive" alt="" /><p id="p01" class="tc lh200"></p></div>
            <div class="fl rw-jj">
                <ul class="rw-list p15">
                    <li id="p02"><label>姓名</label></li>
                    <li id="p04"><label>职务</label></li>
                    <li id="p03"><label>所在单位</label></li>
                    <li id="p09"><label>联系方式</label></li>
                </ul>
                <p class="lh180 mt10" id="p05">
                
                </p>
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
            $('#logoscroll').rollSlide({
                orientation: 'left',
                num: 1,
                v: 1500,
                space: 3000,
                isRoll: true
            });
            //floatNav
            jQuery('.navbg').headshrinker({ fontSize: "14px", mobileMenu: true});
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
            //card名片卡 有bug禁用了 使用newShowCard方法
            /*$("#pers li a").click(function () {
                $("body").append("<div class='mask'></div>");
                if ($(".card-box").css("display") == "none") {
                    getPerson(this);
                    $(".card-box").show();
                } else {
                    $(".card-box").hide();
                }
            });*/
            $(".card-close").click(function () {
                $("div.mask").remove();
                $(".card-box").hide();
                $("#card233").hide();
                $("#card234").hide();
                $("#p01").text("");
	            $("#p02").text("");
	            $("#p03").text("");
	            $("#p04").text("");
	            $("#p05").text("");
	            $("#p09").text("");
            });
        });
        
        function newShowCard(obj){
    	    $("body").append("<div class='mask'></div>");
            if ($(".card-box").css("display") == "none") {
                getPerson(obj);
                $(".card-box").show();
            } else {
                $(".card-box").hide();
            }
        }
        function getPerson(objs){
            var personId=$(objs).attr("name");
        
            
            $.post("${rc.contextPath}/innovate/getPerson.do",{"personId":personId},function(obj) {
	        
	        	if(obj=="nomore"){
		             
	            }else{
	                    var st="";
	                    if(obj.PS_INTRODUCE.length>150){
	                        st="......";
	                    }
		                $("#p01").text(obj.PS_NAME);
			            $("#p02").html("<label>姓名</label>"+obj.PS_NAME);
			            $("#p03").html("<label>所在单位</label>"+obj.PS_BELONG);
			            $("#p04").html("<label>职务</label>"+obj.PS_JOB);
			            $("#p09").html("<label>联系方式</label>"+obj.PS_TEL);
			            $("#p05").text((obj.PS_INTRODUCE).substring(0,150)+st);
			            $("#p06").attr("src","${rc.contextPath}/plugins/images/allImages/"+obj.PS_IMAGE);
			            $("#p07").attr("title",obj.PS_INTRODUCE);
	            }
	            
	        },"json");
        }
        function showCard(aa){/**展示公司名片函数*/ 	
    	    $("body").append("<div class='mask'></div>");
            if ($("#card233").css("display") == "none") {
            	//用参数改变展示用2个值
            	var id=aa;
            	var name=$("#CPNAME"+id).val();
            	var abs=""+$("#CPABS"+id).val();//最大300
            	if(abs.length > 300){
            		abs=abs.substring(0,300)+"...";
            	}
            	$("#card-cp-name").html(name);
            	$("#card-cp-abs").html(abs);
                $("#card233").show();
            } else {
                $("#card233").hide();
            }
        }
    </script>
</body>
</html>
