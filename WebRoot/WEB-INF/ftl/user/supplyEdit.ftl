<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link href="${rc.contextPath}/plugins/favicon.ico" rel="shortcut icon">
    <link rel="stylesheet" href="${rc.contextPath}/plugins/bootstrap/bootstrap.min.css">
    <link rel="stylesheet" href="${rc.contextPath}/plugins/style/base.css" />
    <link rel="stylesheet" href="${rc.contextPath}/plugins/style/iconfont.css" />
    <link rel="stylesheet" href="${rc.contextPath}/plugins/style/header.css" />
    <link rel="stylesheet" href="${rc.contextPath}/plugins/style/footer.css" />
    <link rel="stylesheet" href="${rc.contextPath}/plugins/style/content.css" />
    <link rel="stylesheet" href="${rc.contextPath}/plugins/style/animate-custom.css">
    <script type="text/javascript" src="${rc.contextPath}/plugins/js/jquery.min.js"></script>
    <script type="text/javascript" src="${rc.contextPath}/plugins/js/slider.js"></script>
    <script type="text/javascript" src="${rc.contextPath}/plugins/js/jquery.headshrinker.js"></script>

    <script type="text/javascript" src="${rc.contextPath}/plugins/js/jquery.validate.js"></script>
    <script type="text/javascript" src="${rc.contextPath}/plugins/layer/layer.js"></script>
    <script type="text/javascript" src="${rc.contextPath}/plugins/js/user.js"></script>
    <script type="text/javascript" src="${rc.contextPath}/plugins/bootstrap/bootstrap.min.js"></script>
    <!--[if lte IE 9]>
    <script src="${rc.contextPath}/plugins/js/respond.min.js"></script>
    <script src="${rc.contextPath}/plugins/js/html5shiv.js"></script>
    <![endif]-->
    <title>用户中心-中关村贵阳科技园产业云平台</title>
</head>
<body style="background:#f5f5f5;">
<!-- topbar -->
<#include "/footerAndHeader/headers.ftl"/>
<!-- banner -->
<div class="banner w banner_user">
    <div class="container">
        <div class="fr hidden-xs"><span class="f36 fb user-by">创新创业 共赢发展</span></div>
    </div>
</div>
<!-- bread -->
<div class="container clearfix mt10">
    <div class="bread-nav fl mt10">
        您的位置：<a href="${rc.contextPath}/index">首页</a><span>&gt;</span><a href="${rc.contextPath}/user/index">用户中心</a><span>&gt;</span>供应信息
    </div>
</div>
<!---user--->
<div class="container mt20" style="min-height:500px">
    <div class="row">
        <#include "leftmenu.ftl"/>
        <div class="col-xs-12 col-sm-12 col-md-11 col-lg-11">
            <div class="user-box-w tab-box mb20">
                <div class="row">
                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" >
                        <!-- Nav tabs -->
                        <ul class="nav nav-tabs" role="tablist">
                            <li role="presentation" class="active"><a href="#1" aria-controls="1" role="tab" data-toggle="tab">供应信息</a></li>
                        </ul>
                        <!-- Tab panes -->
                        <div class="tab-content">
                            <form id="register" name="register"  >
                                <input type="hidden" id="ObjectOne_ID" value="${(ObjectOne.id)!''}">
                                <input type="hidden" name="USER_ID" value="${(userInfo.ID)!''}">
                                <input type="hidden" name="createTime" value="${(ObjectOne.createTime)!''}">
                                <div class="row">
                                    <div class="col-xs-12 col-sm-7 col-md-7 col-lg-7" style="height:55px;">
                                        <div class="input-group mb15">
                                            <span class="input-group-addon">供&nbsp;&nbsp;应&nbsp;&nbsp;方<font color="red">*</font></span>
                                            <input type="text" <#if ToView??>readonly</#if> name="NAME" value="${(ObjectOne.NAME)!''}" class="form-control" placeholder="请输入供应方" >
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-xs-12 col-sm-7 col-md-7 col-lg-7" style="height:55px;">
                                        <div class="input-group mb15">
                                            <span class="input-group-addon">销售内容<font color="red">*</font></span>
                                            <input type="text" <#if ToView??>readonly</#if> name="DETAIL" value="${(ObjectOne.DETAIL)!''}" class="form-control" placeholder="请输入销售内容" >
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-xs-12 col-sm-7 col-md-7 col-lg-7" style="height:55px;">
                                        <div class="input-group mb15">
                                            <span class="input-group-addon">销售时间<font color="red">*</font></span>
                                            <input type="text" <#if ToView??>readonly</#if> name="START_TIME" value="${(ObjectOne.START_TIME)!''}" class="form-control" placeholder="请输入销售时间" >
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-xs-12 col-sm-7 col-md-7 col-lg-7" style="height:55px;">
                                        <div class="input-group mb15">
                                            <span class="input-group-addon">联&nbsp;&nbsp;系&nbsp;&nbsp;人<font color="red">*</font></span>
                                            <input type="text" <#if ToView??>readonly</#if> name="LINKMAN" value="${(ObjectOne.LINKMAN)!''}" class="form-control" placeholder="请输入联系人" >
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-xs-12 col-sm-7 col-md-7 col-lg-7" style="height:55px;">
                                        <div class="input-group mb15">
                                            <span class="input-group-addon">联系方式<font color="red">*</font></span>
                                            <input type="text" <#if ToView??>readonly</#if> name="PHONE" value="${(ObjectOne.PHONE)!''}" class="form-control" placeholder="请输入联系方式" >
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-xs-12 col-sm-7 col-md-7 col-lg-7" style="height:55px;">
                                        <div class="input-group mb15">
                                            <span class="input-group-addon">手&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;机<font color="red">*</font></span>
                                            <input type="text" <#if ToView??>readonly</#if> name="TEL" value="${(ObjectOne.TEL)!''}" class="form-control" placeholder="请输入手机" >
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-xs-12 col-sm-7 col-md-7 col-lg-7" style="height:55px;">
                                        <div class="input-group mb15">
                                            <span class="input-group-addon">邮&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;箱<font color="red">*</font></span>
                                            <input type="text" <#if ToView??>readonly</#if> name="MAIL" value="${(ObjectOne.MAIL)!''}" class="form-control" placeholder="请输入邮箱" >
                                        </div>
                                    </div>
                                </div>
                                <#if !(ToView??)>
                                    <button type="button" class="btn btn-primary" onclick="subRegisterInfo()">保存</button>
                                </#if>
                                <button type="button" class="btn btn-primary" onclick="theEsc()">返回</button>
                                <B color="red" id="errorMsg" style="display:none;color:red;">保存失败</B> 
                            </form>
                        </div>
                    </div>
                </div>
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
        //
        var users="${(userInfo.USERNAME)!''}";
        if(""==users){
            window.location.href="${rc.contextPath}/login";
        }
        //ToView
        var ToView="${(ToView)!''}";
        if(""!=ToView){
            $('.input-group-addon font').css("display","none");
        }
    });

</script>
<script type="text/javascript">
    //校验
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
    }, "<font color='red'>日期格式:1990-01-01</font>");
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
                minlength:1,
                maxlength:32,
                required:true
            },
            DETAIL:{
                minlength:1,
                maxlength:200,
                required:true
            },
            START_TIME:{
                required:true,
                checkTIME:true
            },
            LINKMAN:{
                minlength:1,
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
                minlength:1,
                maxlength:32,
                required:true
            },
        },
        messages: {
            NAME:{required:"<font color='red'>此项为必填项</font>",minlength:"<font color='red'>长度不得少于1位字符</font>",maxlength:"<font color='red'>长度不得超过32位字符</font>"},
            DETAIL:{required:"<font color='red'>此项为必填项</font>",minlength:"<font color='red'>长度不得少于1位字符</font>",maxlength:"<font color='red'>长度不得超过200位字符</font>"},
            LINKMAN:{required:"<font color='red'>此项为必填项</font>",minlength:"<font color='red'>长度不得少于1位字符</font>",maxlength:"<font color='red'>长度不得超过32位字符</font>"},
            TEL:{required:"<font color='red'>此项为必填项</font>"},
            PHONE:{required:"<font color='red'>此项为必填项</font>"},
            START_TIME:{required:"<font color='red'>此项为必填项</font>"},
            MAIL:{email:"<font color='red'>请输入正确格式的邮箱号</font>",required:"<font color='red'>此项为必填项</font>"},
        }
    });
    function subRegisterInfo(){
        if($("#register").valid()){
            var id="${(ObjectOne.id)!''}";
            if(""!=id){
                $("#ObjectOne_ID").attr("name","id");
            }
            $("#register").attr("method","post");
            $("#register").attr("action","${rc.contextPath}/user/saveSupply.do");
            $("#register").submit();
        }
    }
    function theEsc(){
        window.location="${rc.contextPath}/user/supply";
    }
</script>
</body>
</html>
