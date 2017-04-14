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
    <div class="banner w banner_05"></div>
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
            <h2 class="f25 fb title-p"><span class="txt">信息发布
            </span><span class="line border-c"></span></h2>
            <form id="register" name="register">
                <div class="row">
                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                        <div class="input-group mb15">
                            <span class="input-group-addon"><font color="red">*</font>需求方名称</span>
                            <input type="text" name="NAME" class="form-control" placeholder="请输入名称" >
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                        <div class="input-group mb15">
                            <span class="input-group-addon"><font color="red">*</font>采购内容</span>
                            <textarea name="DETAIL" class="form-control" placeholder="采购内容"></textarea>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                        <div class="input-group mb15">
                            <span class="input-group-addon"><font color="red">*</font>计划执行采购时间</span>
                            <input type="text" name="START_TIME" class="form-control" placeholder="计划执行采购时间(格式:2016-01-01)">
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                        <div class="input-group mb15">
                            <span class="input-group-addon"><font color="red">*</font>联系人</span>
                            <input type="text" name="LINKMAN" class="form-control" placeholder="联系人">
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                        <div class="input-group mb15">
                            <span class="input-group-addon"><font color="red">*</font>电话</span>
                            <input type="text" name="PHONE" class="form-control" placeholder="电话" >
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                        <div class="input-group mb15">
                            <span class="input-group-addon"><font color="red">*</font>手机</span>
                            <input type="text" name="TEL" class="form-control" placeholder="手机">
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                        <div class="input-group mb15">
                            <span class="input-group-addon"><font color="red">*</font>邮箱</span>
                            <input type="text" name="MAIL" class="form-control" placeholder="邮箱">
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                        <button type="button" class="btn btn-primary btn-block reg-btn" onclick="subRegisterInfo()">发布信息</button>
                        <B color="red" id="errorMsg" style="display:none;color:red;">发布失败</B>
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
        <script>
		// 手机号码验证   - 手机    
		jQuery.validator.addMethod("isMobile", function(value, element) {       
		     var length = value.length;  
		     var mobile =/^[1][3-8]+\d{9}$/;   
		     return this.optional(element) || (length == 11 && mobile.test(value));       
		}, "<font color='red'>请正确填写您的手机号码</font>");       
		  
		
		// 电话号码验证   - 联系方式
		jQuery.validator.addMethod("isTel", function(value, element) {       
		     var tel = /^\d{3,4}-?\d{7,9}$/;    //电话号码格式010-12345678   
		     return this.optional(element) || (tel.test(value));       
		}, "<font color='red'>请正确填写您的电话号码</font>"); 
		// 日期验证   - 联系方式
		jQuery.validator.addMethod("checkTIME", function(value, element) {       
		     var tel = /^\d{4}-?\d{2}-?\d{2}$/;    //格式2001-01-01   
		     return this.optional(element) || (tel.test(value));       
		}, "<font color='red'>请正确填写您的采购日期</font>");  
		
        
        $("#register").validate({
				onkeyup: false,
				errorClass: 'error',
				validClass: 'valid',
				focusCleanup:true,
				focusInvalid:false,
				highlight: function(element) {
					$(element).closest('div').addClass("f_error");
				},
				unhighlight: function(element) {
					$(element).closest('div').removeClass("f_error");
				},
                errorPlacement: function(error, element) {
                    $(element).closest('div').append(error);
                },
                rules: {
					NAME:{
						minlength:2,
						maxlength:50,
						required:true
					},
					DETAIL:{
						minlength:2,
						maxlength:300,
						required:true
					},
					START_TIME:{
						required:true,
						checkTIME:true
					},
					LINKMAN:{
						minlength:2,
						maxlength:32,
						required:true
					},
					PHONE:{
						isTel:true,
						required:true
					},
					TEL:{
						isMobile:true,
						required:true
					},
					MAIL:{
						email:true,
					    minlength:2,
						maxlength:32,
						required:true
					},
				},
				messages: {
					NAME:{required:"<font color='red'>此项必填!</font>",minlength:"<font color='red'>用户名长度不得少于2位字符!</font>",maxlength:"<font color='red'>用户名长度不得超过50位字符!</font>"},
					DETAIL:{required:"<font color='red'>此项必填!</font>",minlength:"<font color='red'>采购内容长度不得少于2位字符!</font>",maxlength:"<font color='red'>采购内容长度不得超过300位字符!</font>"},
					LINKMAN:{required:"<font color='red'>此项必填!</font>",minlength:"<font color='red'>内容长度不得少于2位字符!</font>",maxlength:"<font color='red'>内容长度不得超过32位字符!</font>"},
				    TEL:{required:"<font color='red'>此项必填!</font>"},
				    PHONE:{required:"<font color='red'>此项必填!</font>"},
				    START_TIME:{required:"<font color='red'>此项必填!</font>"},
				    MAIL:{email:"<font color='red'>请填入正确格式的邮箱号!</font>",required:"<font color='red'>此项必填!</font>"},				
				}
        }); 
       function subRegisterInfo(){
          var data=$("#register").serialize();
          if($("#register").valid()){ //主动验证
         	  
              $.ajax({
			        type:"post",
			        dataType: "text",
			        url:"${rc.contextPath}/forum/needssave.do",
				    data:data,
				    success: function(msg) {
				        if(msg.indexOf("ok")>-1){
				        	$("#errorMsg").html("发布成功");
				        	$("#errorMsg").show();
				        	setTimeout(function(){
				        	 	window.location="${rc.contextPath}/forum";
				        	}, 1500);             
		                }else if(msg.indexOf("error")>-1){
		                	$("#errorMsg").html("发布失败");
		                    $("#errorMsg").show();
		                }
				    }
			   });  
		   }
        }  
    </script>
</body>
</html>
