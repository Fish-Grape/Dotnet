
//弹出提示框带图标
$.Alert = function (option) {
    var defaults = {
        msg: "",
        ico: "none",    //success 成功 //none 无记录 //warning 提示、警告 //fail 失败
        onConfirm: function () { }
    };
    var options = $.extend(defaults, option);
    var t = $("#Alert");
    if (!t.length > 0) {
        $("<div class=\"modal hide fade tool\" id=\"Alert\">" +
            "<div class=\"modal-header\"><h4>提示</h4></div><div class=\"modal-body rel tc\"><i class=\"ico\"></i><p id='msgbox' class='fz16 pt5 '></p></div>" +
            "<div class=\"modal-footer\"><a href=\"javascript:;\" id=\"ok\" class=\"btn\">确定</a></div></div>").appendTo('body');
        t = $("#Alert");
    }
    t.find(".modal-body .ico").removeClass("ico_success").removeClass("ico_warning").removeClass("ico_fail").removeClass("ico_none").addClass("ico_"+options.ico);
    t.find("#ok").unbind().on('click', function () {
        t.modal('hide');
        options.onConfirm();
    });
    t.find("#msgbox").html(options.msg);
    t.modal({
        backdrop: "static"
    });
};
$.Confirm = function (option) {
    var defaults = {
        msg: "",
        data: {},
        ico: "warning",    //success 成功 //none 无记录 //warning 提示、警告 //fail 失败
        onConfirm: function () { },
        onCancel: function () { }
    };
    var options = $.extend(defaults, option);
    var t = $("#confirm");
    if (!t.length > 0) {
        $("<div class=\"modal hide fade tool\" id=\"confirm\"><div class=\"modal-body rel rel tc\"><i class=\"ico\"></i><p id='msgbox' class='pt5'></p></div><div class=\"modal-footer\"><a href=\"javascript:;\" id=\"ok\" class=\"btn\">确定</a><a href=\"javascript:;\" id=\"cancel\" class=\"btn\">取消</a></div></div>").appendTo('body');
        t = $("#confirm");
    }
    t.find(".modal-body .ico").removeClass("ico_success").removeClass("ico_warning").removeClass("ico_fail").removeClass("ico_none").addClass("ico_" + options.ico);
    t.find("#ok").unbind().on('click', function () {
        t.modal('hide');
        options.onConfirm(options.data);
    });

    t.find("#cancel").unbind().on('click', function () {
        t.modal('hide');
        options.onCancel(options.data);
    });
    t.find("#msgbox").html(options.msg);
    t.modal({
        backdrop: "static"
    });
};
$.Window = function (option) {
    var defaults = {
        id: "window",
        title: "",
        width: "600px",
        height: "400px",
        url: "",
        replace: false,
        onClose: function () { },
        data: {}
    };
    var options = $.extend(defaults, option);
    var t = $("#" + options.id);
    if (!t.length > 0) {
        options.width = options.width.replace("px", "");
        //data-dismiss=\"modal\" aria-hidden=\"true\"
        $("<div class=\"modal hide fade window\" data-width='" + options.width + "' style='height:" + options.height + "' data-replace='" + options.replace + "' id=\"" + options.id + "\"><div class=\"modal-header\"><button type=\"button\" class=\"close\" id='closexxx' >×</button><h4 id='title'>" + options.title + "</h4></div><div class='pageloading rel' id='body'></div></div>").appendTo('body');
        t = $("#" + options.id);
    } else {
        //自动调整大小
        var w = t.width();
        var h = t.height();
        if (options.width != w || options.height != h) {
            t.css({ 'width': options.width, 'height': options.height });
        }
        t.find("#title").html(options.title);
    }
    if (options.title == "") {
        t.find(".modal-header").hide();
    } else {
        t.find(".modal-header").show();
    }
    t.find("#body").unbind().load(options.url, options.data, function () {
        $(this).removeClass("pageloading");
    });
    t.find("#cancel").unbind().on('click', function () {
        t.modal('hide');
    });
    t.find("#closexxx").unbind().on('click', function () {
        
        t.modal('hide');
    });
    t.unbind().on('hidden', function () {
        options.onClose();
        if ($(this).is(':hidden')) { $(this).remove(); }
    });
    t.modal({
        backdrop: "static"
    });

};
$.Window.Resize = function (option) {
    var defaults = {
        id: "window",
        width: "600px",
        height: "400px"
    };
    var options = $.extend(defaults, option);
    var t = $("#" + options.id);
    t.animate({ 'width': options.width, 'height': options.height }, function () {
        //$(window).resize();
    });
   
};
//格式化为千分位
//$.toThousands = function (num) {
//    var result = [], counter = 0;
//    num = (num || 0).toString().split('');
//    for (var i = num.length - 1; i >= 0; i--) {
//        counter++;
//        result.unshift(num[i]);
//        if (!(counter % 3) && i != 0) { result.unshift(','); }
//    }
//    return result.join('');
//}
$.toThousands = function (num) {
    var nm = num;
    if (num.toString().indexOf('.') > -1)
    {
        nm = num.toString().split('.')[0];
    }
    var result = [], counter = 0;
    nm = (nm || 0).toString().split('');
    for (var i = nm.length - 1; i >= 0; i--) {
        counter++;
        result.unshift(nm[i]);
        if (!(counter % 3) && i != 0) { result.unshift(','); }
    }
    if (num.toString().indexOf('.') > -1)
    {
        return result.join('') + "." + num.toString().split('.')[1];
    }
    return result.join('');
}
$.convertBase64UrlToBlob = function (urlData) {

    var bytes = window.atob(urlData);        //去掉url的头，并转换为byte

    //处理异常,将ascii码小于0的转换为大于0
    var ab = new ArrayBuffer(bytes.length);
    var ia = new Uint8Array(ab);
    for (var i = 0; i < bytes.length; i++) {
        ia[i] = bytes.charCodeAt(i);
    }

    return new Blob([ab], { type: 'image/png' });
};

//格式化日期  2014-09-01 00:00:00.000
$.FormatDate=function(date, format) {
    var paddNum = function (num) {
        num += "";
        return num.replace(/^(\d)$/, "0$1");
    }
    //指定格式字符
    var cfg = {
        yyyy: date.getFullYear() //年 : 4位
      , yy: date.getFullYear().toString().substring(2)//年 : 2位
      , M: date.getMonth() + 1  //月 : 如果1位的时候不补0
      , MM: paddNum(date.getMonth() + 1) //月 : 如果1位的时候补0
      , d: date.getDate()   //日 : 如果1位的时候不补0
      , dd: paddNum(date.getDate())//日 : 如果1位的时候补0
      , hh: date.getHours()  //时
      , mm: date.getMinutes() //分
      , ss: date.getSeconds() //秒
    }
    format || (format = "yyyy-MM-dd hh:mm:ss");
    return format.replace(/([a-z])(\1)*/ig, function (m) { return cfg[m]; });
}

//json日期格式转换为正常格式 -- 年月日
$.JsonDateFormat = function (jsonDate) {
    try {
        var date = new Date(parseInt(jsonDate.replace("/Date(", "").replace(")/", ""), 10));
        var month = date.getMonth() + 1 < 10 ? "0" + (date.getMonth() + 1) : date.getMonth() + 1;
        var day = date.getDate() < 10 ? "0" + date.getDate() : date.getDate();
        return date.getFullYear() + "-" + month + "-" + day; //年月日
    } catch (ex) {
        return "";
    }
}

//json日期格式转换为正常格式 -- 年月日时分秒
$.JsonDateTimeFormat = function (jsonDate) {
    try {
        var date = new Date(parseInt(jsonDate.replace("/Date(", "").replace(")/", ""), 10));
        var month = date.getMonth() + 1 < 10 ? "0" + (date.getMonth() + 1) : date.getMonth() + 1;
        var day = date.getDate() < 10 ? "0" + date.getDate() : date.getDate();
        var hours = date.getHours();
        var minutes = date.getMinutes();
        var seconds = date.getSeconds();
        return date.getFullYear() + "-" + month + "-" + day + " " + hours + ":" + minutes + ":" + seconds; //年月日时分秒
    } catch (ex) {
        return "";
    }
}

$.newGuid = function () {
    var guid = "{";
    for (var i = 1; i <= 32; i++) {
        var n = Math.floor(Math.random() * 16.0).toString(16);
        guid += n;
        if ((i == 8) || (i == 12) || (i == 16) || (i == 20))
            guid += "-";
    }
    return guid + "}";
};


//toolbar保留查询条件
$.GetInquireItem = function (id) {
    var t = id.find('.btn-group')
    t.each(function () {
        var _html = '', a = 0;
        $(this).find("input[type='checkbox']:checked").each(function () {
            a++;
            if (a > 2) {
                return true;
            }
            _html += (_html.length > 1 ? ',' : '') + $.trim($(this).parent().text());
        })
        if ($(this).find("input[type='checkbox']:checked").length > 0) {
            $(this).find('.btn').eq(0).addClass('active').html(_html)
        }
    })
};
//返回日期时间天数
$.GetDateDiff = function (startDate,endDate) {
    var startTime = new Date(startDate).getTime();
    var endTime = new Date(endDate).getTime();
    var dates = Math.abs((startTime - endTime)) / (1000 * 60 * 60 * 24);
    return dates;
};

//对象判等
$.Compare = function (x,y) {
    // If both x and y are null or undefined and exactly the same 
    if (x === y) {
        return true;
    }

    // If they are not strictly equal, they both need to be Objects 
    if (!(x instanceof Object) || !(y instanceof Object)) {
        return false;
    }

    //They must have the exact same prototype chain,the closest we can do is
    //test the constructor. 
    if (x.constructor !== y.constructor) {
        return false;
    }

    for (var p in x) {
        //Inherited properties were tested using x.constructor === y.constructor
        if (x.hasOwnProperty(p)) {
            // Allows comparing x[ p ] and y[ p ] when set to undefined 
            if (!y.hasOwnProperty(p)) {
                return false;
            }

            // If they have the same strict value or identity then they are equal 
            if (x[p] === y[p]) {
                continue;
            }

            // Numbers, Strings, Functions, Booleans must be strictly equal 
            if (typeof (x[p]) !== "object") {
                return false;
            }

            //// Objects and Arrays must be tested recursively 
            //if (!Object.equals(x[p], y[p])) {
            //    return false;
            //}
        }
    }

    for (p in y) {
        // allows x[ p ] to be set to undefined 
        if (y.hasOwnProperty(p) && !x.hasOwnProperty(p)) {
            return false;
        }
    }
    return true;
};


//合并第一列内容相同的单元格
$.w_table_rowspan = function (tab, w_table_colnum) {
    var _w_table_firsttd = "";
    var _w_table_currenttd = "";
    var _w_table_SpanNum = 0;
    var _w_table_Obj = tab.find(" tr td:nth-child(" + w_table_colnum + ")");
    _w_table_Obj.each(function (i) {
        if (i == 0) {
            _w_table_firsttd = $(this);
            _w_table_SpanNum = 1;
        } else {
            _w_table_currenttd = $(this);
            if (_w_table_firsttd.text() == _w_table_currenttd.text()) {
                _w_table_SpanNum++;
                _w_table_currenttd.hide(); //remove();
                _w_table_firsttd.attr("rowSpan", _w_table_SpanNum);
            } else {
                _w_table_firsttd = $(this);
                _w_table_SpanNum = 1;
            }
        }
    });
};

function htmlEncode(value) {
    return $('<div/>').text(value).html();
}
//Html解码获取Html实体
function htmlDecode(value) {
    return $('<div/>').html(value).text();
}
function newGuid() {
    var guid = "";
    for (var i = 1; i <= 32; i++) {
        var n = Math.floor(Math.random() * 16.0).toString(16);
        guid += n;
        if ((i == 8) || (i == 12) || (i == 16) || (i == 20))
            guid += "-";
    }
    return guid;
}
(function ($) {
    $.fn.ButtonDo = function (dis,val) {
        var b = $(this);
        b.attr("disabled", dis);
        b.html(val);
    };
})(jQuery);