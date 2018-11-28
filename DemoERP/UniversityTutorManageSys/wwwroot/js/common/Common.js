//初始化日期控件按钮
(function ($) {
    $.datepicker.setDefaults({
        showButtonPanel: true,
        closeText: '关闭',
        currentText: '今天',
        beforeShow: function (input) {
            setTimeout(function () {
                var buttonPane = $(input)
                .datepicker("widget")
                .find(".ui-datepicker-buttonpane");
                $("<button>", {
                    text: "清除",
                    click: function () {
                        $.datepicker._clearDate(input);
                    }
                }).addClass("ui-state-default ui-priority-primary ui-corner-all").appendTo(buttonPane);
            }, 1);
        }
    });
})(jQuery);

//初始化并设置城市和区县默认值
function SetCityAreaDefualtValue(provinceID,cityID,areaID,cityCode, areaCode) {
    //客户地址三级联动
    $("#" + provinceID + "").change(function () {
        if ($(this).val() != "") {
            $.get("provinces/getcitiesbycode", { code: $(this).val() },
                function (response, status, xhr) {
                    if (response.State == 0) {
                        var option = "";
                        $.each(response.Obj, function (i, item) {
                            option += "<option value='" + item.cityNo + "' " + (item.cityNo ==cityCode ? "selected" : "") + ">" + item.cityName + "</option>";
                        });
                        $("#"+cityID+"")[0].length = 1;
                        $("#"+areaID+"")[0].length = 1;
                        $("#"+cityID+"").append(option);
                        $("#"+cityID+"").trigger("change");
                    }
                }
            );
        }
    });
    $("#"+cityID+"").change(function () {
        if ($(this).val() != "") {
            $.get("provinces/getareasbycode", { code: $(this).val() },
                function (response, status, xhr) {
                    if (response.State == 0) {
                        var option = "";
                        $.each(response.Obj, function (i, item) {
                            option += "<option value='" + item.areaNo + "' " + (item.areaNo == areaCode ? "selected" : "") + ">" + item.areaName + "</option>";
                        });
                        $("#"+areaID+"")[0].length = 1;
                        $("#"+areaID+"").append(option);
                    }
                }
            );
        }
    });
    $("#" + provinceID + "").change();  //页面打开Ajax加载联动
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

function GetQueryString(name) {
    var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
    var r = window.location.search.substr(1).match(reg);
    if (r != null) return unescape(r[2]); return null;
}

/**
 * 使用jquery的inArray方法判断元素是否存在于数组中
 * @param {Object} arr 数组
 * @param {Object} value 元素值
 */
function isInArray2(arr, value) {
    var index = $.inArray(value, arr);
    if (index >= 0) {
        return true;
    }
    return false;
}

//Post方式打开窗口
function openWindowWithPost(url, jsonData) {
    var newWindow = window.open(url);
    if (!newWindow)
        return false;

    var html = "";
    html += "<html><head></head><body><form id='formid' method='post' action='" + url + "'>";
    if (jsonData) {
        for (var js2 in jsonData) {
            html += "<input type='hidden' name='" + escape (js2) + "' value='" + escape(jsonData[js2]) + "'/>";
        }
    }

    html += "</form><script type='text/javascript'>document.getElementById('formid').submit();";
    html += "<\/script></body></html>".toString().replace(/^.+?\*|\\(?=\/)|\*.+?$/gi, "");
    newWindow.document.write(html);

    return newWindow;
}

//获取json对象的长度
function getJsonLength(jsonData) {
    var jsonLength = 0;
    for (var item in jsonData) {
        jsonLength++;
    }
    return jsonLength;
}

/**
 * Function applyTableSum
 * 
 * 函数功能： 为表格添加合计行,本函数依赖于jquery
 * 
 * @param {}
 *            table : The table which append the sum row to 需要添加合计行的表格对象
 * @param {}
 *            colArr : The col index Arry which shuld sum 需要合计的列序号数组，从0开始
 * @param {}
 *            capIndex : caption index defalt is 0 合计标题放置的列，默认是0。即第一列
 * @param {}
 *            emptyText : The text not sumed col default is '-' 未合计行的文本
 */
function applyTableSum(table, colArr, capIndex, emptyText) {
    var me = this;
    var _capIndex = capIndex || 0;
    var _emptyText = emptyText || "-";
    var _SD = "{1}quot;", _hasD = new Array();
    var _SY = "￥", _hasY = new Array();
    var _comma = ",", _hasComma = new Array();
    if (table != null && table != undefined && colArr != null) {
        var lastTr, sumHtml;
        var iColData=0, strData;
        var trs = table.children("tbody").first().children("tr");
        var trLen = trs.length;
        var lastTr = trs.last();
        var tds, tdLen, tr, td;
        var i, j, k;
        sumHtml = "<tr class='td_row'>";
        var sumCols = new Array(trLen);
        // 遍历所有行
        for (i = 0; i < trLen; i++) {
            tr = trs.get(i);
            tr = $(tr);
            tds = tr.children("td");
            if (tds == null || tds == undefined) {
                continue;
            }
            tdLen = tds.length;
            for (j = 0, k = 0; j < tdLen; j++) {
                td = tds.get(j);
                td = $(td);
                // 如果是要统计的列
                if (colArr[k] == j) {
                    strData = td.text();
                    if(strData==null||strData==undefined||strData=="")
                    {
                        strData="0";
                    }
                    // console.log("strData="+strData);
                    while (strData.indexOf(_SD) != -1) {
                        strData = strData.replace(_SD, "");
                        _hasD[j] = true;
                    }
                    while (strData.indexOf(_SY) != -1) {
                        strData = strData.replace(_SY, "");
                        _hasY[j] = true;
                    }
                    while (strData.indexOf(_comma) != -1) {
                        strData = strData.replace(_comma, "");
                        _hasComma[j] = true;
                    }
                    try {
                        iColData = parseFloat(strData);						
                        if (sumCols[j] == null || sumCols[j] == undefined) {
                            sumCols[j] = 0;
                        }
                        sumCols[j] = parseFloat(sumCols[j]) + iColData;
                    } catch (e) {
                        console.log(e.message);
                    }
                    k++;
                }
            }
        }// end for
        //小数正则表达式
        var regu = "^([0-9]*[.0-9])$"; // 小数测试
        var dotFormat = new RegExp(regu);
        var m = 0;
        for (m = 0, k = 0; m < tdLen; m++) {
            if (m == _capIndex) {
                sumHtml += "<td>合计</td>";
            } else if (colArr[k] == m) {
                if (sumCols[m] != null && sumCols[m] != undefined) {
                    var iSum = sumCols[m];
                    var str = sumCols[m] + "";
                    var textAlign = "";
                    if (_hasD[m] == true || _hasY[m] == true
							|| _hasComma[m] == true || str.search(dotFormat) == -1) {
                        str = iSum.toFixed(2);
                        textAlign = "align= 'right'";
                    }
                    if (iSum === 0) {
                        str = "";
                    }
                    if (_hasComma.length >= m && _hasComma[m] == true) {
                        str = ConvertToMoney(iSum);
                    }
                    if (_hasD.length >= m && _hasD[m] == true) {
                        str = _SD + str;
                    } else if (_hasY.length >= m && _hasY[m] == true) {
                        str = _SY + str;
                    }
                    sumHtml += "<td " + textAlign + ">" + str + "</td>";
                } else {
                    sumHtml += "<td>" + _emptyText + "</td>";
                }
                k++;
            } else {
                sumHtml += "<td>" + _emptyText + "</td>";
            }
        }
        sumHtml += "</tr>";
        lastTr.after(sumHtml);
    }
};
function ConvertToMoney(money) {
    var s = money; // 获取小数型数据
    s += "";
    if (s.indexOf(".") == -1)
        s += ".0"; // 如果没有小数点，在后面补个小数点和0
    if (/\.\d$/.test(s))
        s += "0"; // 正则判断
    while (/\d{4}(\.|,)/.test(s))
        // 符合条件则进行替换
        s = s.replace(/(\d)(\d{3}(\.|,))/, "$1,$2"); // 每隔3位添加一个
    return s;
}

function isCardNo(card) {
    // 身份证号码为15位或者18位，15位时全为数字，18位前17位为数字，最后一位是校验位，可能为数字或字符X 
    var reg = /(^[1-9]\d{5}(18|19|([23]\d))\d{2}((0[1-9])|(10|11|12))(([0-2][1-9])|10|20|30|31)\d{3}[0-9Xx]$)|(^[1-9]\d{5}\d{2}((0[1-9])|(10|11|12))(([0-2][1-9])|10|20|30|31)\d{2}$)/;
    if (reg.test(card) === false) {
        return false;
    }
    return true;
}

//当前线程休眠
function sleep(numberMillis) {
    var now = new Date();
    var exitTime = now.getTime() + numberMillis;
    while (true) {
        now = new Date();
        if (now.getTime() > exitTime)
            return;
    }
}
