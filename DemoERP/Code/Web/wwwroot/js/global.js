$(document).ajaxSend(onSend).ajaxComplete(onComplete).ajaxSuccess(onSuccess).ajaxError(onError);
//ajax请求开始前
function onSend(event, xhr, options) {
    if (options.loading != undefined) {
        if (options.loading.onSend != undefined) {
            options.loading.onSend();
        } else if (options.loading.button != undefined) {
            $(options.loading.button).ButtonDo(true, options.loading.loadingtext);
        }
    }
}   
//ajax请求完成时
function onComplete(event, xhr, options) {
    if (options.loading != undefined) {
        if (options.loading.onComplete != undefined) {
            options.loading.onComplete();
        } else if (options.loading.button != undefined) {
            $(options.loading.button).ButtonDo(false, options.loading.buttontext);
        }
    }
    if (xhr.status == 'timeout') {
        top.$.Alert({ msg: "请求超时,请检查网络" });
    }
}
//ajax获取数据后
function onSuccess(event, xhr, options) {
    var d;
    try{
        d = $.parseJSON(xhr.responseText);
    }catch(err) {
        d=xhr.responseText;
    }
    switch (d.State) {
        case 401://登录失效
            top.location.href = "/login";
            break
        case 402://权限不足
            top.$.Alert({ msg: d.Message != undefined ? d.Message : d, ico: "fail" });
            break
        case undefined:
            break;
    }
}
//ajax请求发生错误后
function onError(event, xhr, options) {
    var d;
    try{
        d = $.parseJSON(xhr.responseText);
    } catch (err) {
        d=xhr.responseText;
    }
    var m = d != null && d.Message != undefined ? d.Message : d
    if (m != undefined || m != null) {
        top.$.Alert({ msg: m, ico: "fail" });
    }
} 



$(function () {
	$('.toolbar').affix()
    $(document).off('click','.dropdown-menu').on('click','.dropdown-menu', function (event) {
        if ($(this).parents('.btn-group').hasClass('group_fix') && $(this).parents('.btn-group').hasClass('open')) {
            event.stopPropagation();
        };
    });
    $(document).off('mouseover mouseout','th .btn-group').on('mouseover mouseout', 'th .btn-group',function(event){
		 if(event.type == "mouseover"){
		  $(this).addClass('open')
		 }else if(event.type == "mouseout"){
		$('th .btn-group').removeClass('open')
		 }
	})

    $('.head .menu .nav>li').hover(function () {
		$(this).addClass('open')
        }, function () {
        $(this).removeClass('open')
        })
    //模拟select
    $(document).off('click', '.group_select .dropdown-menu li[data-val]').on('click', '.group_select .dropdown-menu li[data-val]', function (event) {
        if ($(this).data('val') == "") return;
    	$(this).parents('.dropdown-menu').find('.active').removeClass('active');
    	$(this).addClass('active');
    	$(this).parents('.group_select').find('.btn').eq(0).addClass('active').html($(this).text());
    	$(this).parents('.group_select').find('input[type=hidden]').val($(this).data('val'));
    	
    	
    });
    
    $(document).off("click", ".group_radio .dropdown-menu input[type='radio']").on('click', ".group_radio .dropdown-menu input[type='radio']", function (event) {
        $(this).addClass('active').siblings().removeClass('active');
        $(this).parents(".btn-group").find('.btn').eq(0).addClass('active').html($(this).parent().text());
    });
    //区域下拉框全选
    $(document).off("click", ".group_fix .dropdown-menu input[type='checkbox']").on('click', ".group_fix .dropdown-menu input[type='checkbox']", function (event) {
        var c = $(this).attr("checked") == "checked" ? true : false;
     
        if ($(this).val() == "all") {
            $(this).parents(".btn-group").find("input[type='checkbox']").attr("checked", c);
        } else {
            $(this).parents(".btn-group").find("#" + $(this).val() + " input[type='checkbox']").attr("checked", c);
        }
        var _checkbox = '',a=0;
        $(this).parents(".btn-group").removeClass('focus')
        $(this).parents(".btn-group").find('input:checked').each(function () {
            a++;
            if (a > 4) {
                return true;
            }
            $(this).parents(".btn-group").addClass('focus')
            _checkbox += (_checkbox.length > 1 ? ',' : '') + $.trim($(this).parent().text());
        })
        var t = $(this).parents(".btn-group").find('.btn').eq(0);
        if (t.data("val") == undefined) {
            //t.data("val", t.html());
            t.data("val", '请选择');
        }
        t.addClass('active').html(_checkbox)
     
       	if(_checkbox.length == 0){
       	    t.eq(0).addClass('active').html(t.data("val")).removeClass('active');
       	}
       	event.stopPropagation();
    });
});