(function ($) {
    $.extend($.validator.messages, {
        required: "必选字段",
        remote: "请修正该字段",
        email: "请输入正确格式的电子邮件",
        url: "请输入合法的网址",
        date: "请输入合法的日期",
        dateISO: "请输入合法的日期 (ISO).",
        number: "请输入合法的数字",
        digits: "只能输入整数",
        creditcard: "请输入合法的信用卡号",
        equalTo: "请再次输入相同的值",
        accept: "请输入拥有合法后缀名的字符串",
        maxlength: $.validator.format("请输入一个长度最多是 {0} 的字符串"),
        minlength: $.validator.format("请输入一个长度最少是 {0} 的字符串"),
        rangelength: $.validator.format("请输入一个长度介于 {0} 和 {1} 之间的字符串"),
        range: $.validator.format("请输入一个介于 {0} 和 {1} 之间的值"),
        max: $.validator.format("请输入一个最大为 {0} 的值"),
        min: $.validator.format("请输入一个最小为 {0} 的值")
    });
    jQuery.validator.addMethod("int",
    function (value, element, params) {
        return this.optional(element) || params == false || (/^-?[0-9]\d*$/.test(value))
    },
    "非法的整数！");
    jQuery.validator.addMethod("pint",
    function (value, element, params) {
        return this.optional(element) || params == false || (/^[0-9]\d*$/.test(value))
    },
    "非法的正整数！");
    jQuery.validator.addMethod("nint",
    function (value, element, params) {
        return this.optional(element) || params == false || (/^-[0-9]\d*$/.test(value))
    },
    "非法的负整数！");
    jQuery.validator.addMethod("decmal",
    function (value, element, params) {
        return this.optional(element) || params == false || (/^(([+-]?)([1-9]\d*(\.\d+)*|0(.\d+)*)+)$/.test(value))
    },
    "非法的浮点数！");
    jQuery.validator.addMethod("pdecmal",
    function (value, element, params) {
        return this.optional(element) || params == false || (/^([0-9]\d*(\.\d+)*|0(.\d+)+)$/.test(value))
    },
    "非法的正浮点数！");
    jQuery.validator.addMethod("ndecmal",
    function (value, element, params) {
        return this.optional(element) || params == false || (/^-((\d*(\.\d+)*|0(\.\d+)+)*)$/.test(value))
    },
    "非法的负浮点数！");
    jQuery.validator.addMethod("color",
    function (value, element, params) {
        return this.optional(element) || params == false || (/^[a-fA-F0-9]{6}$/.test(value))
    },
    "非法的颜色编码！");
    jQuery.validator.addMethod("chinese",
    function (value, element, params) {
        return this.optional(element) || params == false ||  (/^[\u4E00-\u9FA5\uF900-\uFA2D]+$/.test(value))
    },
    "非法的中文！");
    jQuery.validator.addMethod("ascii",
    function (value, element, params) {
        return this.optional(element) || params == false || (/^[\x00-\xFF]+$/.test(value))
    },
    "非法的ascii字符！");
    jQuery.validator.addMethod("zipcode",
    function (value, element, params) {
        return this.optional(element) || params == false ||  (/^\d{6}$/.test(value))
    },
    "非法的邮政编码！");
    jQuery.validator.addMethod("mobile",
    function (value, element, params) {
        return this.optional(element) || params == false || (/^(13|14|15|17|18|19)[0-9]{9}$/.test(value))
    },
    "非法的手机号码！");
    jQuery.validator.addMethod("mobiletel",
    function (value, element, params) {
        return this.optional(element) || params == false || (/^((13|14|15|17|18)[0-9]{9}|(\d{3,4}-?)?\d{7,8}(-\d{1,6})?)$/.test(value))
    },
    "非法的手机或电话号码！");
    jQuery.validator.addMethod("ip",
    function (value, element, params) {
        return this.optional(element) || params == false || (/^(25[0-5]|2[0-4]\d|[0-1]\d{2}|[1-9]?\d)\.(25[0-5]|2[0-4]\d|[0-1]\d{2}|[1-9]?\d)\.(25[0-5]|2[0-4]\d|[0-1]\d{2}|[1-9]?\d)\.(25[0-5]|2[0-4]\d|[0-1]\d{2}|[1-9]?\d)$/.test(value))
    },
    "非法的IP地址！");
    jQuery.validator.addMethod("picture",
    function (value, element, params) {
        return this.optional(element) || params == false || (/^(.*)\.(jpg|bmp|gif|ico|pcx|jpeg|tif|png|raw|tga)$/.test(value))
    },
    "非法的图片文件后缀！");
    jQuery.validator.addMethod("rar",
    function (value, element, params) {
        return this.optional(element) || params == false || (/^(.*)\.(rar|zip|7zip|tgz)$/.test(value))
    },
    "非法的压缩文件后缀！");
    jQuery.validator.addMethod("qq",
    function (value, element, params) {
        return this.optional(element) || params == false || (/^[1-9]*[1-9][0-9]*$/.test(value))
    },
    "非法的QQ号码！");
    jQuery.validator.addMethod("tel",
    function (value, element, params) {
        return this.optional(element) || params == false || (/^((\d{4})|\d{4}-|\d{3}|\d{3}-)?\d{7,8}(-\d{1,6})?$/.test(value))
    },
    "非法的电话号码！");
    jQuery.validator.addMethod("letter",
    function (value, element, params) {
        return this.optional(element) || params == false || (/^[A-Za-z]+$/.test(value))
    },
    "非法的英文字母！");
    jQuery.validator.addMethod("letter_u",
    function (value, element, params) {
        return this.optional(element) || params == false || (/^[A-Z]+$/.test(value))
    },
    "非法的大写英文字母！");
    jQuery.validator.addMethod("letter_l",
    function (value, element, params) {
        return this.optional(element) || params == false || (/^[a-z]+$/.test(value))
    },
    "非法的小写英文字母！");
    jQuery.validator.addMethod("idcard",
    function (value, element, params) {
        return this.optional(element) || params == false || (/^([1-9]([0-9]{13}[A-Za-z0-9]{1}|[0-9]{16}[A-Za-z0-9]{1})|[A-Z][0-9]{6}|[A-Z][0-9]{6}\([0-9A]\)|[157][0-9]{6}\([0-9]\)|[0-9]{12}|[A-Z][0-9]{10})$/.test(value))
    },
    "非法的身份证号码！");
    jQuery.validator.addMethod("acc",
    function (value, element, params) {
        return this.optional(element) || params == false || (/^(([a-zA-Z0-9_])|([\u4e00-\u9fa5])|([^\x00-\xff]))+$/.test(value))
    },
    "非法的数字字母汉字下划线！");
    jQuery.validator.addMethod("ac",
    function (value, element, params) {
        return this.optional(element) || params == false || (/^([a-zA-Z0-9_@.])+$/.test(value))
    },
    "非法的数字字母下划线！");
    jQuery.validator.addMethod("letterdecmal",
    function (value, element, params) {
        return this.optional(element) || params == false || (/^([a-zA-Z0-9.])+$/.test(value))
    },
    "非法的数字字母！");
    jQuery.validator.addMethod("versioncode",
    function (value, element, params) {
        return this.optional(element) || params == false || (/([1-9]+(\.\d+)+(\.\d+))+$/.test(value))
    },
    "非法的版本号！");
    jQuery.validator.addMethod("all",
    function (value, element, params) {
        return this.optional(element) || params == false || (/^[^<>"'\\=&?]+$/.test(value))
    },
    "不包含“^<>\"'=&?”！");
    jQuery.validator.addMethod("organizationcode",
    function (value, element, params) {
        return this.optional(element) || params == false || (/^[a-zA-Z0-9]{8}-[a-zA-Z0-9]{1}|[0-9]{9}$/.test(value));
    },
    "组织机构代码格式不正确！");
    jQuery.validator.addMethod("all2",
    function (value, element, params) {
        return this.optional(element) || params == false || (/^[^<>"'\\=&?,]+$/.test(value))
    },
    "不包含“^<>\"'=&?,”！");
}(jQuery));