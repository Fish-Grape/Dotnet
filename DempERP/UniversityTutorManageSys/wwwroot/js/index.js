var tabs;
$(function () {

    tabs = $("#tabs").tabs();

    $("#tabs").on("click", 'span.ui-icon-close', function () {
        var panelId = $(this).closest("li").remove().attr("aria-controls");
        $("#" + panelId).remove();
        tabs.tabs("refresh");
    });

    function onresize() {
        $('.page_tabs .ui-tabs .ui-tabs-panel').height(
			$('.content').height() - $('.page_tabs .ui-tabs .ui-tabs-nav').height()
		);
    };
    onresize();

    window.onresize = function () {
        onresize();
        adjustStyle($(this).width());
    }
    function processLowerIENavigate() {
        var isIE = document.all ? 1 : 0;
        if (isIE == 1) {
            if (navigator.userAgent.indexOf("MSIE7.0") > 0 || navigator.userAgent.indexOf("MSIE 8.0") > 0) {
                //  var doc=document; 
                var link = document.createElement("link");
                link.setAttribute("rel", "stylesheet");
                link.setAttribute("type", "text/css");
                link.setAttribute("id", "size-stylesheet");
                link.setAttribute("href", "");
                var heads = document.getElementsByTagName("head");
                if (heads.length) {
                    $('head').append(link);
                } else {

                    document.documentElement.appendChild(link);
                }
            }
        }
    }
    var lowerIE8 = processLowerIENavigate();
    adjustStyle($(this).width());
    function adjustStyle(width) {
        width = parseInt(width);
        if (width < 1601) {
            $("#size-stylesheet").attr("href", "/css/common-responsive_1600.css");
        } else {
            $("#size-stylesheet").attr("href", "");
        }
    }
});
function addTab(tabid, tabTitle, url, data) {
    if (tabid == "")
        return;
        
    var id = "tabs-" + tabid,
    li = "<li class='tabli'><a href='#" + id + "'>" + tabTitle + "</a> <span class='ui-icon ui-icon-close'>关闭</span></li>";

    data = data || {};
    data.TabId = tabid;
    data.TabTitle = tabTitle;
    data.TabUrl = url;
    data.TabData = JSON.stringify(data);

    if (id != "tabs-0") {
        var width = 0;
        $.each($("#tabs").find("li.tabli"), function (n, value) {
            width += $(value).width();
        });
        //计算li的宽度与ul的宽度，超过设置则删除第二个创建的标签。望东升
        if ($("#tabs").width() < width + 300) {
            var panelId = $('#tabs li:eq(1)').remove().attr("aria-controls");
            $("#" + panelId).remove();
            tabs.tabs("refresh");
        }
        if (tabs.find("#" + id).length < 1) {
            tabs.find(".ui-tabs-nav").append(li);
            //tabs.append("<div id='" + id + "'>" + tabContent + "</div>");
            tabs.append("<div id='" + id + "' style='overflow:auto'></div>");
        } else {
            tabs.find("li.tabli a[href='#" + id + "']").html(tabTitle);
        };

        tabs.find("#" + id).addClass("pageloading").load(url, data, function () {
            $(this).removeClass("pageloading");
        });
    }
    tabs.tabs("refresh");
    tabs.find('a[href="#' + id + '"]').trigger("click");

    onresize();
}
function getcurtab() {
    return tabs.find(".ui-tabs-panel[aria-hidden=false]");
}
function setcurtab(id) {
    id = "tabs-" + id;
    tabs.find('a[href="#' + id + '"]').trigger("click");
}
function closetab(id) {
    id = "tabs-" + id;
    tabs.find('a[href="#' + id + '"]').next().trigger("click");
    //刷新一下首页
    tabs.find("#tabs-0 form[id=frm] button[type=submit]").trigger("click");
}