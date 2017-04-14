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
        您的位置：<a href="${rc.contextPath}/index">首页</a><span>&gt;</span><a href="${rc.contextPath}/user/index">用户中心</a><span>&gt;</span>招聘信息
    </div>
</div>
<div class="container mt20" style="min-height:500px">
    <div class="row">
        <#include "leftmenu.ftl"/>
        <div class="col-xs-12 col-sm-12 col-md-11 col-lg-11">
            <div class="user-box-w tab-box mb20">
                <div class="row">
                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                        <!-- Nav tabs -->
                        <ul class="nav nav-tabs" role="tablist">
                            <li role="presentation" class="active"><a href="#1" aria-controls="1" role="tab" data-toggle="tab">招聘信息</a></li>
                        </ul>
                        <!-- Tab panes -->
                        <div class="tab-content">
                            <form id="register" name="register"  >
                                <input type="hidden" id="RecruitOne_ID" value="${(RecruitOne.id)!''}">
                                <input type="hidden" name="USER_ID" value="${(userInfo.ID)!''}">
                                <input type="hidden" name="createTime" value="${(RecruitOne.createTime)!''}">
                                <div class="row">
                                    <div class="col-xs-12 col-sm-7 col-md-7 col-lg-7" style="height:55px;">
                                        <div class="input-group mb15">
                                            <span class="input-group-addon">岗位名称<font color="red">*</font></span>
                                            <input type="text" <#if ToView??>readonly</#if> name="JOB_NAME" value="${(RecruitOne.JOB_NAME)!''}" class="form-control" placeholder="请输入岗位名称" >
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-xs-12 col-sm-7 col-md-7 col-lg-7" style="height:55px;">
                                        <div class="input-group mb15">
                                            <span class="input-group-addon">薪酬福利<font color="red">*</font></span>
                                            <input type="text" <#if ToView??>readonly</#if> name="SALARY" value="${(RecruitOne.SALARY)!''}" class="form-control" placeholder="请输入薪酬福利" >
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-xs-12 col-sm-7 col-md-7 col-lg-7" style="height:55px;">
                                        <div class="input-group mb15">
                                            <span class="input-group-addon">工作性质<font color="red">*</font></span>
                                            <input type="text" <#if ToView??>readonly</#if> name="WORK_PROPERTY" value="${(RecruitOne.WORK_PROPERTY)!''}" class="form-control" placeholder="请输入工作性质" >
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-xs-12 col-sm-7 col-md-7 col-lg-7" style="height:55px;">
                                        <div class="input-group mb15">
                                            <span class="input-group-addon">工作地点<font color="red">*</font></span>
                                            <input type="text" <#if ToView??>readonly</#if> name="WORK_LOCATION" value="${(RecruitOne.WORK_LOCATION)!''}" class="form-control" placeholder="请输入工作地点" >
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-xs-12 col-sm-7 col-md-7 col-lg-7" style="height:55px;">
                                        <div class="input-group mb15">
                                            <span class="input-group-addon">招聘人数<font color="red">*</font></span>
                                            <input type="text" <#if ToView??>readonly</#if> name="NEED_NO" value="${(RecruitOne.NEED_NO)!''}" class="form-control" placeholder="请输入招聘人数" >
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-xs-12 col-sm-7 col-md-7 col-lg-7" style="height:55px;">
                                        <div class="input-group mb15">
                                            <span class="input-group-addon">投递邮箱<font color="red">*</font></span>
                                            <input type="text" <#if ToView??>readonly</#if> name="MAIL" value="${(RecruitOne.MAIL)!''}" class="form-control" placeholder="请输入投递邮箱" >
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-xs-12 col-sm-7 col-md-7 col-lg-7" style="height:55px;">
                                        <div class="input-group mb15">
                                            <span class="input-group-addon">联&nbsp;&nbsp;系&nbsp;&nbsp;人<font color="red">*</font></span>
                                            <input type="text" <#if ToView??>readonly</#if> name="LINK_MAN" value="${(RecruitOne.LINK_MAN)!''}" class="form-control" placeholder="请输入联系人" >
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-xs-12 col-sm-7 col-md-7 col-lg-7" style="height:55px;">
                                        <div class="input-group mb15">
                                            <span class="input-group-addon">电&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;话<font color="red">*</font></span>
                                            <input type="text" <#if ToView??>readonly</#if> name="PHONE" value="${(RecruitOne.PHONE)!''}" class="form-control" placeholder="请输入电话" >
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-xs-12 col-sm-7 col-md-7 col-lg-7" style="height:120px;">
                                        <div class="input-group mb15">
                                            <span class="input-group-addon">主要职责<font color="red">*</font></span>
                                            <textarea <#if ToView??>readonly</#if> name="DUTY"  class="form-control" placeholder="请输入主要职责" rows="4">${(RecruitOne.DUTY)!''}</textarea>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-xs-12 col-sm-7 col-md-7 col-lg-7" style="height:120px;">
                                        <div class="input-group mb15">
                                            <span class="input-group-addon">资格要求<font color="red">*</font></span>
                                            <textarea <#if ToView??>readonly</#if> name="TCONDITION"  class="form-control" placeholder="请输入资格要求" rows="4">${(RecruitOne.TCONDITION)!''}</textarea>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-xs-12 col-sm-7 col-md-7 col-lg-7" style="height:120px;">
                                        <div class="input-group mb15">
                                            <span class="input-group-addon">公司介绍<font color="red">*</font></span>
                                            <textarea <#if ToView??>readonly</#if> name="CP_BRIEF"  class="form-control" placeholder="请输入公司介绍" rows="4">${(RecruitOne.CP_BRIEF)!''}</textarea>
                                        </div>
                                    </div>
                                </div>
                                <#if !(ToView??)>
                                <button type="button" class="btn btn-primary" onclick="subRegisterInfo()">保存</button>
                                </#if>
                                <button type="button" class="btn btn-primary" onclick="theEsc()">返回</button>
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
    // 电话号码验证   - 联系方式
    jQuery.validator.addMethod("isTel", function(value, element) {
        var tel = /^\d{3,4}-?\d{7,9}$/;    //电话号码格式010-12345678
        return this.optional(element) || (tel.test(value));
    }, "<font color='red'>请正确填写您的电话号码</font>");
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
            JOB_NAME:{
                minlength:1,
                maxlength:32,
                required:true
            },
            SALARY:{
                minlength:1,
                maxlength:32,
                required:true,
            },
            WORK_PROPERTY:{
                minlength:1,
                maxlength:32,
                required:true,
            },
            WORK_LOCATION:{
                minlength:1,
                maxlength:32,
                required:true,
            },
            NEED_NO:{
                number:true,
                minlength:1,
                maxlength:32,
                required:true,
            },
            MAIL:{
                email:true,
                minlength:1,
                maxlength:32,
                required:true,
            },
            LINK_MAN:{
                minlength:1,
                maxlength:32,
                required:true,
            },
            PHONE:{
                isTel:true,
                minlength:1,
                maxlength:32,
                required:true,
            },
            DUTY:{
                minlength:1,
                maxlength:200,
                required:true,
            },
            TCONDITION:{
                minlength:1,
                maxlength:200,
                required:true,
            },
            CP_BRIEF:{
                minlength:1,
                maxlength:200,
                required:true,
            },
        },
        messages: {
            JOB_NAME:{required:"<font color='red'>此项为必填项</font>",minlength:"<font color='red'>长度不得少于1位字符</font>",maxlength:"<font color='red'>长度不得超过32位字符</font>"},
            SALARY:{required:"<font color='red'>此项为必填项</font>",minlength:"<font color='red'>长度不得少于1位字符</font>",maxlength:"<font color='red'>长度不得超过32位字符</font>"},
            WORK_PROPERTY:{required:"<font color='red'>此项为必填项</font>",minlength:"<font color='red'>长度不得少于1位字符</font>",maxlength:"<font color='red'>长度不得超过32位字符</font>"},
            WORK_LOCATION:{required:"<font color='red'>此项为必填项</font>",minlength:"<font color='red'>长度不得少于1位字符</font>",maxlength:"<font color='red'>长度不得超过32位字符</font>"},
            NEED_NO:{number:"<font color='red'>请输入数值</font>",required:"<font color='red'>此项为必填项</font>",minlength:"<font color='red'>长度不得少于1位字符</font>",maxlength:"<font color='red'>长度不得超过32位字符</font>"},
            MAIL:{email:"<font color='red'>请输入正确格式的邮箱号</font>",required:"<font color='red'>此项为必填项</font>",minlength:"<font color='red'>长度不得少于1位字符</font>",maxlength:"<font color='red'>长度不得超过32位字符</font>"},
            LINK_MAN:{required:"<font color='red'>此项为必填项</font>",minlength:"<font color='red'>长度不得少于1位字符</font>",maxlength:"<font color='red'>长度不得超过32位字符</font>"},
            PHONE:{required:"<font color='red'>此项为必填项</font>",minlength:"<font color='red'>长度不得少于1位字符</font>",maxlength:"<font color='red'>长度不得超过32位字符</font>"},
            DUTY:{required:"<font color='red'>此项为必填项</font>",minlength:"<font color='red'>长度不得少于1位字符</font>",maxlength:"<font color='red'>长度不得超过200位字符</font>"},
            TCONDITION:{required:"<font color='red'>此项为必填项</font>",minlength:"<font color='red'>长度不得少于1位字符</font>",maxlength:"<font color='red'>长度不得超过200位字符</font>"},
            CP_BRIEF:{required:"<font color='red'>此项为必填项</font>",minlength:"<font color='red'>长度不得少于1位字符</font>",maxlength:"<font color='red'>长度不得超过200位字符</font>"},
        }
    });
    function subRegisterInfo(){
        if($("#register").valid()){
            var id="${(RecruitOne.id)!''}";
            if(""!=id){
                $("#RecruitOne_ID").attr("name","id");
            }
            $("#register").attr("method","post");
            $("#register").attr("action","${rc.contextPath}/user/saveRecruit.do");
            $("#register").submit();
        }
    }
    function theEsc(){
        window.location="${rc.contextPath}/user/recruit";
    }
</script>
</body>
</html>
