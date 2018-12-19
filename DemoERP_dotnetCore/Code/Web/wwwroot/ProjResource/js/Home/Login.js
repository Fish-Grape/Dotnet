(function ($) {
    var ei, f, b, c, ci;
    $(function () {
        ei = $("#errorinfo");
        f = $("#frm_login");
        b = f.find("submit");
        c = $("#code");
        ci = $("#codeimg");
        f.validate({
            errorElement: "span",
            errorClass: "error",
            onfocusout: false,
            onkeyup: false,
            onclick: false,
            focusInvalid: false,
            rules: {
                UserCode: { required: true, all: true },
                UserPassword: { required: true, maxlength: 20 },
                Verifycode: { required: false }
            },
            messages: {
                UserCode: { required: "请输入用户名！", all: "您输入的用户名包含非法字符！" },
                UserPassword: { required: "请输入登录密码！", maxlength: jQuery.format("密码不能超过{0}个字符！") },
                Verifycode: { required: "请输入验证码！" }
            },
            submitHandler: function (form) {
                $.ajax({
                    type: "POST",
                    url: "home/dologin",
                    data: $(form).serializeArray(),
                    dataType: "json",
                    success: function (d) {
                        CheckIfNeedValidate(d.ifValidate);
                        if (d.state == 0) {
                            location.href = "/";
                        } else if (d.state == 2) {
                            ci.click();
                            c.val("")[0].focus();
                            err(d.message);
                            b.ButtonDo(false, "登 录");
                        } else {
                            ci.click();
                            err(d.message);
                            b.ButtonDo(false, "登 录");
                        }
                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                        var d = $.parseJSON(XMLHttpRequest.responseText);
                        var m = d.message != undefined ? d.message : d
                        err(m);
                        b.ButtonDo(false, "登 录");
                    }
                });
                return false;
            },
            showErrors: function (errorMap, errorList) {
                if (errorList[0] != undefined) {
                    err(errorList[0].message);
                    errorList[0].element.focus();
                }
            }
        });
        b.bind({
            ajaxStart: function () {
                ei.hide();
                b.ButtonDo(true, "正在登陆请稍候..");
            }
        });
        ci.click(function (e) {
            ci.attr("src", "home/doverifycode?" + new Date());
        });
        f.find("#usr").focus();
        //是否需要输入验证码
        CheckIfNeedValidate(false);
    });
    var err = function (msg) {
        ei.show();
        ei.find(".orange").html(msg);
    };
    //是否需要输入验证码
    function CheckIfNeedValidate(IfValidate) {
        if (IfValidate) {
            $("#codeAera").show();
            c.rules("add", { required: true });
        }
        else {
            $("#codeAera").hide();
            c.rules("add", { required: false });
        }
    }
})(jQuery);

//显示与隐藏眼睛图标
function ShowHideEyes() {
    var pwd = $("#pwd").val();
    if ($(".eyes i").hasClass("ico_eye-open")) {
        $("#pwdbox").html("<input type='text' name='UserPassword' id='pwd' placeholder='请输入密码' value='" + pwd + "'/>");
        $(".eyes i").removeClass("ico_eye-open").addClass("ico_eye-close");
    } else {
        $("#pwdbox").html("<input type='password' name='UserPassword' id='pwd' placeholder='请输入密码' value='" + pwd + "'/>");
        $(".eyes i").removeClass("ico_eye-close").addClass("ico_eye-open");
    }
}