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

    <script type="text/javascript" src="${rc.contextPath}/plugins/bootstrap/bootstrap.min.js"></script>
    <script type="text/javascript" src="${rc.contextPath}/plugins/js/jquery.validate.js"></script>

    <script type="text/javascript" src="${rc.contextPath}/plugins/js/ajaxfileupload.js"></script>
    <script type="text/javascript" src="${rc.contextPath}/plugins/js/user.js"></script>
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
        您的位置：<a href="${rc.contextPath}/index">首页</a><span>&gt;</span><a href="${rc.contextPath}/user/index">用户中心</a><span>&gt;</span>基本信息
    </div>
</div>
<!-- user -->
<div class="container mt20" style="min-height:500px">
    <div class="row">
        <#include "leftmenu.ftl"/>
        <div class="col-xs-12 col-sm-12 col-md-11 col-lg-11">
            <div class="user-box-w tab-box mb20">
                <div class="row">
                    <div class="col-xs-12 col-sm-8 col-md-9 col-lg-9">
                        <!---机构 --->
                        <ul class="nav nav-tabs" role="tablist">
                            <li role="presentation" class="active"><a href="#1" aria-controls="1" role="tab" data-toggle="tab">基本信息</a></li>
                            <li role="presentation"><a href="#2" aria-controls="2" role="tab" data-toggle="tab">完善信息</a></li>
                        </ul>
                        <div class="tab-content">
                            <div role="tabpanel" class="tab-pane active" id="1">
                                <div class="infor-con">
                                    <p><label>用&nbsp;&nbsp;&nbsp;&nbsp;户&nbsp;&nbsp;&nbsp;名</label><span>${(userInfo.USERNAME)!''}</span></p>
                                    <p><label>机&nbsp;构&nbsp;名&nbsp;称</label><span>${(ObjectC.NAME)!''}</span></p>
                                    <p><label>机构联系人</label><span>${(ObjectC.LINKMAN)!''}</span></p>
                                    <p><label>联系人邮箱</label><span>${(ObjectC.EMAIL)!''}</span></p>
                                    <button type="button" class="btn btn-primary edit-infor mt15">再次编辑</button>
                                </div>
                                <form id="infoA_1" name="infoA_1"  style="display:none;" class="basic">
                                    <input type="hidden" name="ID" value="${(userInfo.ID)!''}">
                                    <div class="row mb15">
                                        <div class="col-xs-12 col-sm-7 col-md-7 col-lg-7" style="height:45px;">
                                            <div class="input-group">
                                                <span class="input-group-addon">用&nbsp;&nbsp;&nbsp;&nbsp;户&nbsp;&nbsp;&nbsp;名<font color="red">&nbsp;</font></span>
                                                <input type="text"  name="USERNAME" value="${(userInfo.USERNAME)!''}" readOnly class="form-control" placeholder="" >
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row mb15">
                                        <div class="col-xs-12 col-sm-7 col-md-7 col-lg-7" style="height:45px;">
                                            <div class="input-group">
                                                <span class="input-group-addon">机&nbsp;构&nbsp;名&nbsp;称<font color="red">*</font></span>
                                                <input type="text"  name="NAME_IN" value="${(ObjectC.NAME)!''}" class="form-control" placeholder="" >
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row mb15">
                                        <div class="col-xs-12 col-sm-7 col-md-7 col-lg-7" style="height:45px;">
                                            <div class="input-group">
                                                <span class="input-group-addon">机构联系人<font color="red">*</font></span>
                                                <input type="text"  name="LINKMAN" value="${(ObjectC.LINKMAN)!''}" class="form-control" placeholder="" >
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row mb15">
                                        <div class="col-xs-12 col-sm-7 col-md-7 col-lg-7" style="height:45px;">
                                            <div class="input-group">
                                                <span class="input-group-addon">联系人邮箱<font color="red">*</font></span>
                                                <input type="text"  name="EMAIL_IN" value="${(ObjectC.EMAIL)!''}" class="form-control" placeholder="" >
                                            </div>
                                        </div>
                                    </div>
                                    <button type="button" class="btn btn-primary saveinfor" onclick="subTable1()">保存</button>
                                    <button type="button" class="btn btn-warning saveinfor" onclick="location.reload();">取消</button>
                                </form>
                            </div>
                            <div role="tabpanel" class="tab-pane" id="2">
                            	<div class="infor-con2">
                                    <p><label>手&nbsp;&nbsp;机&nbsp;&nbsp;&nbsp;号&nbsp;&nbsp;码</label><span>${(ObjectC.TEL)!''}</span></p>
                                    <p><label>座&nbsp;&nbsp;机&nbsp;&nbsp;&nbsp;号&nbsp;&nbsp;码</label><span>${(ObjectC.PHONE)!''}</span></p>
                                    <p><label>组织机构代码</label><span>${(ObjectC.ORGCODE)!''}</span></p>
                                    <p><label>社会信用代码</label><span>${(ObjectC.SOCIALCODE)!''}</span></p>
                                    <p><label>所&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;在&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;地</label><span>${(ObjectC.ADDRESS)!''}</span></p>
                                    <p><label>注&nbsp;&nbsp;册&nbsp;&nbsp;&nbsp;区&nbsp;&nbsp;域</label><span><#if mylist??><#list mylist as mt><#if (ObjectC.PROVINCE)?? && ObjectC.PROVINCE+""==mt.ID+"">${(mt.NAME)!""}</#if></#list></#if>
																	<#if mylist2??>
																		<#list mylist2 as mt>
																			<#if (ObjectC.CITY)?? && ObjectC.CITY+""==mt.ID+"">${(mt.NAME)!""}</#if>
																		</#list>
																	</#if>
																	<#if mylist3??>
																		<#list mylist3 as mt>
																			<#if (ObjectC.AREA)?? && ObjectC.AREA+""==mt.ID+"">${(mt.NAME)!""}</#if>
																		</#list>
																	</#if></span></p>
                                    <button type="button" class="btn btn-primary edit-infor2 mt15">再次编辑</button>
                                </div>
                                <form id="infoA_2" name="infoA_2"  class="basic2" style="display:none;">
                                    <input type="hidden" name="ID" value="${(userInfo.ID)!''}">
                                    <div class="row mb15">
                                        <div class="col-xs-12 col-sm-7 col-md-7 col-lg-7" style="height:45px;">
                                            <div class="input-group">
                                                <span class="input-group-addon">手&nbsp;&nbsp;机&nbsp;&nbsp;&nbsp;号&nbsp;&nbsp;码<font color="red">&nbsp;</font></span>
                                                <input type="text"  name="TEL_IN" value="${(ObjectC.TEL)!''}"  class="form-control" placeholder="" >
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row mb15">
                                        <div class="col-xs-12 col-sm-7 col-md-7 col-lg-7" style="height:45px;">
                                            <div class="input-group">
                                                <span class="input-group-addon">座&nbsp;&nbsp;机&nbsp;&nbsp;&nbsp;号&nbsp;&nbsp;码<font color="red">&nbsp;</font></span>
                                                <input type="text"  name="PHONE_IN" value="${(ObjectC.PHONE)!''}" class="form-control" placeholder="" >
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row mb15">
                                        <div class="col-xs-12 col-sm-7 col-md-7 col-lg-7" style="height:45px;">
                                            <div class="input-group">
                                                <span class="input-group-addon">组织机构代码<font color="red">&nbsp;</font></span>
                                                <input type="text"  name="ORGCODE" value="${(ObjectC.ORGCODE)!''}" class="form-control" placeholder="" >
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row mb15">
                                        <div class="col-xs-12 col-sm-7 col-md-7 col-lg-7" style="height:45px;">
                                            <div class="input-group">
                                                <span class="input-group-addon">社会信用代码<font color="red">&nbsp;</font></span>
                                                <input type="text"  name="SOCIALCODE" value="${(ObjectC.SOCIALCODE)!''}" class="form-control" placeholder="" >
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row mb15">
                                        <div class="col-xs-12 col-sm-7 col-md-7 col-lg-7" style="height:45px;">
                                            <div class="input-group">
                                                <span class="input-group-addon">所&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;在&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;地<font color="red">&nbsp;</font></span>
                                                <input type="text"  name="ADDRESS" value="${(ObjectC.ADDRESS)!''}" class="form-control" placeholder="" >
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row mb15">
                                        <div class="col-xs-12 col-sm-7 col-md-7 col-lg-7" style="height:45px;">
                                            <div class="input-group">
                                                <span class="input-group-addon">注&nbsp;&nbsp;册&nbsp;&nbsp;&nbsp;区&nbsp;&nbsp;域<font color="red">&nbsp;</font></span>
                                                <select class="form-control" style="width:33.33%;" name="CP_PROVINCE" id="CP_PROVINCE" onchange="getCityOrArea('A','CP_PROVINCE');">
                                                    <option value="">请选择</option>
                                                    <#if mylist??>
                                                        <#list mylist as mt>
                                                            <option value="${(mt.ID)!''}" grade="${(mt.CODE)!''}" <#if (ObjectC.PROVINCE)?? && ObjectC.PROVINCE+""==mt.ID+"">selected="true"</#if> >${(mt.NAME)!""}</option>
                                                        </#list>
                                                    </#if>
                                                </select>
                                                <select class="form-control" style="width:33.33%;" name="CP_CITY" id="CP_CITY" onchange="getCityOrArea('B','CP_CITY');">
                                                    <option value="">请选择</option>
                                                    <#if mylist2??>
                                                        <#list mylist2 as mt>
                                                            <option value="${(mt.ID)!''}" grade="${(mt.CODE)!''}" <#if (ObjectC.CITY)?? && ObjectC.CITY+""==mt.ID+"">selected="true"</#if> >${(mt.NAME)!""}</option>
                                                        </#list>
                                                    </#if>
                                                </select>
                                                <select class="form-control" style="width:33.33%;" name="CP_AREA">
                                                    <option value="">请选择</option>
                                                    <#if mylist3??>
                                                        <#list mylist3 as mt>
                                                            <option value="${(mt.ID)!''}" grade="${(mt.CODE)!''}" <#if (ObjectC.AREA)?? && ObjectC.AREA+""==mt.ID+"">selected="true"</#if> >${(mt.NAME)!""}</option>
                                                        </#list>
                                                    </#if>
                                                </select>
                                            </div>
                                        </div>
                                    </div>

                                    <button type="button" class="btn btn-primary" onclick="subTable2()">保存</button>
                                    <button type="button" class="btn btn-warning saveinfor" onclick="location.reload();">取消</button>
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-4 col-md-3 col-lg-3 hidden-xs">
                        <div class="tc user-img">
                            <p>
                                <#if (userInfo.IMAGE)?? && (userInfo.IMAGE+"")!="" >
                                    <img src="${rc.contextPath+'/plugins/images/allImages/'+(userInfo.IMAGE)!'/defaultUser.jpg'}" id="img1" class="img-circle" width="100" height="100"/>
                                    <#else>
                                        <img src="${rc.contextPath}/plugins/images/allImages/defaultUser.jpg" id="img1" class="img-circle" width="100" height="100"/>
                                </#if>
                            </p>
                            <div class="pr btn-img">
                                <input type="file" id="file1" name="file" class="btn" style="display:none;" onchange="ajaxFileUpload();"/>
                                <a class="btn btn-primary" id="" onclick="xuanze();" href="javascript:void(0);">上传头像</a>
                            </div>
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
        var users="${(userInfo.USERNAME)!''}";
        if(""==users){
            window.location.href="${rc.contextPath}/login";
        }
        //选项卡
        $('#myTab li:eq(0) a').tab('show');
    });
    //上传
    function xuanze(){
        $("#file1").click();
    }
    function ajaxFileUpload() {
        $.ajaxFileUpload
        (
                {
                    url: '${rc.contextPath}/files/uploadFiles.do', //用于文件上传的服务器端请求地址
                    secureuri: false, //是否需要安全协议，一般设置为false
                    async:false,
                    fileElementId: 'file1', //文件上传域的ID
                    dataType: 'json', //返回值类型 一般设置为json
                    success: function (data, status)  //服务器成功响应处理函数
                    {
                        $("#img1").attr("src", "${rc.contextPath}"+"/plugins/images/allImages/"+data.imgname);
                        changeUserImg( "${(userInfo.ID)!''}", data.imgname );
                    },
                    error: function (data, status)//服务器响应失败处理函数
                    {
                        //alert(12);
                    }
                }
        )
        return false;
    }
    function changeUserImg(id,imgname){
        $.ajax({
            type:"post",
            dataType: "json",
            async:false,
            data:{"id":id,"imgname":imgname},
            url:"${rc.contextPath}/user/changeUserImg.do",
            success: function(msg) {
                //alert('已更新');
            }
        });
    }
</script>
<script>
    function subTable1(){//基础信息提交
        if( $("#infoA_1").valid() ){
            $("#infoA_1").attr("method","post");
            $("#infoA_1").attr("action","${rc.contextPath}/user/infoC1Save.do");
            $("#infoA_1").submit();}
    }
    function subTable2(){//详细信息提交
        if( $("#infoA_2").valid() ){
            $("#infoA_2").attr("method","post");
            $("#infoA_2").attr("action","${rc.contextPath}/user/infoC2Save.do");
            $("#infoA_2").submit(); }
    }
    function getCityOrArea(str,objs){//三级
        var zhi=$("#"+objs+" option:selected").attr("grade");
        var parentCode=zhi;
        $.ajax({
            type:"post",
            dataType: "json",
            url:"${rc.contextPath}/loginRegister/getCityOrArea.do?parentCode="+parentCode,
            success: function(msg) {
                var oj;
                var stat="";
                if(str=="A"){
                    oj=$("select[name='CP_CITY']");
                    $("select[name='CP_AREA']").html("<option value=''>请选择</option>");
                }else if(str=="B"){
                    oj=$("select[name='CP_AREA']");
                }
                $(oj).html("<option value=''>请选择</option>");
                if(msg!="nomore"){

                    $.each(msg,function(index,value){
                        $(oj).append(
                                        "<option value='"+value.ID+"' grade='"+value.CODE+"' "+stat+">"+value.NAME+"</option>"
                        );
                    });
                }
            }
        });
    }
</script>
<script>
    // 手机号码验证
    jQuery.validator.addMethod("isMobile", function(value, element) {
        var length = value.length;
        var mobile =/^[1][3-8]+\d{9}$/;
        return this.optional(element) || (length == 11 && mobile.test(value));
    }, "<font color='red'>请正确填写您的手机号码</font>");

    // 电话号码验证
    jQuery.validator.addMethod("isTel", function(value, element) {
        var tel = /^\d{3,4}-?\d{7,9}$/;    //电话号码格式010-12345678
        return this.optional(element) || (tel.test(value));
    }, "<font color='red'>请正确填写您的座机号码</font>");
    $("#infoA_1").validate({
        onkeyup: false,
        errorClass: 'error',
        validClass: 'valid',
        focusCleanup:true,
        focusInvalid:false,
        highlight: function(element) {$(element).closest('div').addClass("f_error");},
        unhighlight: function(element) {$(element).closest('div').removeClass("f_error");},
        errorPlacement: function(error, element) {$(element).closest('div').append(error); },
        rules:{
            NAME_IN:{
                minlength:2,
                required:true,
                maxlength:20
            },
            LINKMAN:{
                minlength:2,
                required:true,
                maxlength:20
            },
            EMAIL_IN:{
                email:true,
                required:true
            },
        },
        messages: {
            NAME_IN:{required:"<font color='red'>此项为必填项</font>",minlength:"<font color='red'>机构名称长度不得少于2位字符!</font>",maxlength:"<font color='red'>机构名称长度不得超过20位字符!</font>"},
            LINKMAN:{required:"<font color='red'>此项为必填项</font>",minlength:"<font color='red'>联系人名字长度不得少于2位字符!</font>",maxlength:"<font color='red'>联系人名字不得超过20位字符!</font>"},
            EMAIL_IN:{email:"<font color='red'>请填入正确格式的邮箱号!</font>",required:"<font color='red'>此项为必填项</font>"},

        }
    });
    $("#infoA_2").validate({
        onkeyup: false,
        errorClass: 'error',
        validClass: 'valid',
        focusCleanup:true,
        focusInvalid:false,
        highlight: function(element) {$(element).closest('div').addClass("f_error");},
        unhighlight: function(element) {$(element).closest('div').removeClass("f_error");},
        errorPlacement: function(error, element) {$(element).closest('div').append(error); },
        rules:{
            TEL_IN:{
                isMobile:true
            },
            PHONE_IN:{
                isTel:true
            },
            ORGCODE:{
                minlength:10,
                maxlength:40
            },
            SOCIALCODE:{
                minlength:10,
                maxlength:40
            },
            ADDRESS:{
                minlength:2,
                maxlength:50
            }
        },
        messages: {
            ORGCODE:{minlength:"<font color='red'>组织机构代码长度不得少于10位字符!</font>",maxlength:"<font color='red'>组织机构代码长度不得超过40位字符!</font>"},
            SOCIALCODE:{minlength:"<font color='red'>社会信用代码长度不得少于10位字符!</font>",maxlength:"<font color='red'>社会信用代码长度不得超过40位字符!</font>"},
            ADDRESS:{minlength:"<font color='red'>所在地长度不得少于2位字符!</font>",maxlength:"<font color='red'>所在地长度不得超过50位字符!</font>"}
        }
    });
</script>
</body>
</html>
