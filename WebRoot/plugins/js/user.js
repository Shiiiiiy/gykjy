$(function () {
    //左菜单效果
    var bodyWidths = $(window).width();
    function timer() {
        setTimeout(function () {
            $('#leftnav').animate({ left: "-86px" }, 500);
            $('#leftnav .left-arrow').html("<i class='iconfont'>&#xe601;</i>");
        }, 1000);
    }
    //页面小于1200时菜单浮动并隐藏
    if (bodyWidths < 1200) {
        $(".user-left").addClass("fixed-nav");
        $(".left-arrow").show();
        timer();
    } else {
        $(".user-left").removeClass("fixed-nav");
        $(".left-arrow").hide();
    }
    $(window).resize(function () {
        var bodyWidths = $(window).width();
        if (bodyWidths < 1200) {
            $(".user-left").addClass("fixed-nav");
            $(".left-arrow").show();
            timer();
        } else {
            $(".user-left").removeClass("fixed-nav");
            $(".left-arrow").hide();
        }
    });
    //页面小于1200时按钮控制菜单显示隐藏
    $(".left-arrow").click(function () {
        if ($("#leftnav").css("left") == "-86px") {
            $('#leftnav').animate({ left: "0px" }, 500);
            $(this).html("<i class='iconfont'>&#xe652;</i>");
        } else {
            $(this).html("<i class='iconfont'>&#xe601;</i>");
            $('#leftnav').animate({ left: "-86px" }, 500);
        }
    });
    $(".edit-infor").click(function () {
        $("div.infor-con").hide();
        $("form.basic").show();
    });
    $(".edit-infor2").click(function () {
        $("div.infor-con2").hide();
        $("form.basic2").show();
    });
    $(".saveinfor").click(function () {
        var IDname = $("#IDname").val();
        var username = $("#username").val();
        var contacts = $("#contacts").val();
        var email = $("#email").val();
        $("div.infor-con p").eq(0).find("span").html(IDname);
        $("div.infor-con p").eq(1).find("span").html(username);
        $("div.infor-con p").eq(2).find("span").html(contacts);
        $("div.infor-con p").eq(3).find("span").html(email);
    });
    //表格显示
    $(document).on("mouseover", ".my-table .zjh", function () {
        $(this).addClass("zd");
    });
    $(document).on("mouseout", ".my-table .zjh", function () {
        $(this).removeClass("zd");
    });
    //head
    //做个下简易的验证  大小 格式 
    $('#avatarInput').on('change', function (e) {
        var filemaxsize = 1024 * 5;//5M
        var target = $(e.target);
        var Size = target[0].files[0].size / 1024;
        if (Size > filemaxsize) {
            alert('图片过大，请重新选择!');
            $(".avatar-wrapper").childre().remove;
            return false;
        }
        if (!this.files[0].type.match(/image.*/)) {
            alert('请选择正确的图片!')
        } else {
            var filename = document.querySelector("#avatar-name");
            var texts = document.querySelector("#avatarInput").value;
            var teststr = texts; //你这里的路径写错了
            testend = teststr.match(/[^\\]+\.[^\(]+/i); //直接完整文件名的
            filename.innerHTML = testend;
        }

    });

    $(".avatar-save").on("click", function () {
        var img_lg = document.getElementById('imageHead');
        // 截图小的显示框内的内容
        html2canvas(img_lg, {
            allowTaint: true,
            taintTest: false,
            onrendered: function (canvas) {
                canvas.id = "mycanvas";
                //生成base64图片数据
                var dataUrl = canvas.toDataURL("image/jpeg");
                var newImg = document.createElement("img");
                newImg.src = dataUrl;
                imagesAjax(dataUrl)
            }
        });
    })

    function imagesAjax(src) {
        var data = {};
        data.img = src;
        data.jid = $('#jid').val();
        $.ajax({
            url: "upload-logo.php",
            data: data,
            type: "POST",
            dataType: 'json',
            success: function (re) {
                if (re.status == '1') {
                    $('.user_pic img').attr('src', src);
                }
            }
        });
    }
});