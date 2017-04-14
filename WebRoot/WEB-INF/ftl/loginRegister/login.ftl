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
    <link rel="stylesheet" href="${rc.contextPath}/plugins/style/login.css" />
    <link rel="stylesheet" href="${rc.contextPath}/plugins/style/animate-custom.css">
    <script type="text/javascript" src="${rc.contextPath}/plugins/js/jquery.min.js"></script>
    <script type="text/javascript" src="${rc.contextPath}/plugins/js/jquery.headshrinker.js"></script>
    <script type="text/javascript" src="${rc.contextPath}/plugins/js/slider.js"></script>
    <script type="text/javascript" src="${rc.contextPath}/plugins/js/jquery.validate.js"></script>
    <!--[if lte IE 9]>
    <script src="${rc.contextPath}/plugins/js/respond.min.js"></script>
    <script src="${rc.contextPath}/plugins/js/html5shiv.js"></script>
    <![endif]-->
    <title>请登录-中关村贵阳科技园产业云平台</title>
</head>
<body>
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
    <!-- login -->
    <div class="w white" id="login-content">
        <div class="container pr" id="set-login">
            <div class="login_box">
                <div class="login-nav clearfix">
                    <ul>
                        <li class="active" type="PERSON"><i class="iconfont mr5"  type="PERSON">&#xec4d;</i>个人</li>
                        <li type="COMPANY"><i class="iconfont mr5" type="COMPANY">&#xe611;</i>企业</li>
                        <li type="INSTITUTION"><i class="iconfont mr5" type="INSTITUTION">&#xe722;</i>机构</li>
                    </ul>
                </div>
                    <div class="login-c">
                    
                       <form id="f1" name="ff" class="on-con">
	                        <div>
	                        	<input type="hidden" id="usertype" name="usertype" value="PERSON"/>
		                        <div class="item">
		                           <input type="text"   name="username" placeholder="用户" class="input-login"  />
		                        </div>
		                        <div class="item">
		                            <input type="password"  name="password" placeholder="密码" class="input-login" />
		                        </div>
		                        <div class="item">
		                            <input type="text" id="checkCode" name="checkCode" placeholder="验证码" class="input-login yanz" /><span class="yz-img"><a href="javascript:void(0);"><img id="s1" onclick="getNewCheckCode('s1')" src="${rc.contextPath}/loginRegister/checkCode.do" class="img-responsive" /></a></span>
		                        </div>
		                        <div class="item">
		                            <a href="#" class="fr"></a>还没注册？请<a id="toRegister" href="#">注册</a>
		                        </div>
		                        <div class="item">
		                           	<button type="button" id="btn_PERSON" onclick="subLogin('A')" class="btn btn-primary btn-block login-btn3">登录</button>
		                           	<button type="button" id="btn_COMPANY"  onclick="subLogin('B')" class="btn btn-primary btn-block login-btn2" style="display:none;">登录</button>
		                           	<button type="button" id="btn_INSTITUTION"  onclick="subLogin('C')" class="btn btn-primary btn-block login-btn" style="display:none;">登录</button>
		                        </div>
	                        </div>
                       </form>
                    </div>
            </div>
        </div>
    </div>
    
    <!-- footer   -->
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
            //login-content
            var boxH = $("#login-content").height();
            var bodyH = $(window).height();
            boxH = bodyH - 120 - 182;
            $("#login-content, #set-login").height(boxH);
            $(window).resize(function () {
                var boxH = $("#login-content").height();
                var bodyH = $(window).height();
                boxH = bodyH - 120 - 182;
                $("#login-content, #set-login").height(boxH);
            });
            //loginTab
            $(".login-nav li").click(function (){
            	$("#usertype").val($(this).attr("type"));
                $(".login-nav li").eq($(this).index()).addClass("active").siblings().removeClass('active');
                $(".login-c form").eq($(".login-nav li").index(this)).removeClass("tabcon").siblings().addClass('tabcon');
                $(".login-c form").eq($(".login-nav li").index(this)).addClass("on-con").siblings().removeClass('on-con');
                
                
                $("#btn_PERSON").hide();
                $("#btn_COMPANY").hide();
                $("#btn_INSTITUTION").hide();
                $("#btn_"+$(this).attr("type")).show();
                
                
            });
            $("#toRegister").click(function (){
                window.location.href="${rc.contextPath}/register/"+$("#usertype").val()+"";
            });
            
            
        });
		
        $("[name='ff']").validate({
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
					username:{
						minlength:2,
						maxlength:20,
						required:true
					},
					password:{
						minlength:6,
						maxlength:16,
						required:true
					},
					checkCode:{
					    minlength:4,
						maxlength:4,
						required:true
					}
				},
				messages: {
					username:{required:"<font color='red'>请输入用户名!</font>",minlength:"<font color='red'>用户名长度不得少于2位字符!</font>",maxlength:"<font color='red'>用户名长度不得超过20位字符!</font>"},
					password:{required:"<font color='red'>请输入密码!</font>",minlength:"<font color='red'>密码长度不得少于6位字符!</font>",maxlength:"<font color='red'>密码长度不得超过16位字符!</font>"},
					checkCode:{required:"<font color='red'>请输入验证码!</font>",minlength:"<font color='red'>验证码长度为4位字符!</font>",maxlength:"<font color='red'>验证码长度为4位字符!</font>"}
				}
        });
        
        
        function getNewCheckCode(str){
             
             $("#"+str).attr("src","${rc.contextPath}/loginRegister/checkCode.do?refresh=y"+Math.random());
             
        }
        
        
        function subLogin(str){
             var data=$("#f1").serialize();
             var checkStr=$("#checkCode").val();
             var idstr;
             
           if($("#f1").valid()){//主动验证
               $.ajax({
			        type:"post",
			        dataType: "text",
			        url:"${rc.contextPath}/loginRegister/checkCode.do?refresh=submit&checkStr="+checkStr,
				    data:data,
				    success: function(result) {
				        if(result.indexOf("ok")>-1){
		                    $.ajax({
						        type:"post",
						        dataType: "text",
						        url:"${rc.contextPath}/loginRegister/subLoginInfo.do",
							    data:data,
							    success: function(msg) {
							        if(msg.indexOf("ok")>-1){
					                    //window.location="${rc.contextPath}/index";
					                    window.location="${rc.contextPath}/user/index";//成功时跳转到用户中心              
					                }else if(msg.indexOf("error")>-1){
					                   alert("用户名与密码不一致");
					                   $("#s1").attr("src","${rc.contextPath}/loginRegister/checkCode.do?refresh=y"+Math.random());
					                }
							    
							    }
						   });                
		                }else if(result.indexOf("error")>-1){
		                 	alert("验证码输入有误");
		                }
				    
				    }
			   });
             
           }  
           
        }
        
    </script>
</body>
</html>
