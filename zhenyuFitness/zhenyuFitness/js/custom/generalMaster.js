//判断菜单链接的页面，当前用户是否有权访问
function ifMenuPermitted(o) {
    var menuUrl = initMenuUrl(o);
    var urlAbsolute = getUrlAbsolute(menuUrl);
    var ret = 0;
    //ajax判断权限
    $.ajax({
        type: "POST",
        url: "/zhenyuFitness/ashx/DealAjax.ashx",
        data: { url: urlAbsolute, ajaxtype: "pagePermission" },
        async: false,         
        success: function (data) {
            if (data == "2") {
                bootbox.alert({
                    size: 'small',
                    message: "您尚未登录，请登录后重试。(menu)"
                });
                ret = 2;
            }
            if (data == "3") {
                bootbox.alert({
                    size: 'small',
                    message: "对不起，您没有足够的权限访问此页面。(menu)"
                });
                ret = 3;
            }
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            alert("页面权限ajax调用出错了");
            alert(errorThrown);
            ret = -1
        }
    });
    if (ret == 0) {//如果有权限访问，则给菜单赋值链接
        o.href = menuUrl;
    }
}

//获取页面的绝对路径，如url为http://localhost/zhenyuFitness/Pages/Exercises/ExercisesList.aspx?asdf=123&asdlfkj=91,则返回/zhenyuFitness/Pages/Exercises/ExercisesList.aspx
function getUrlAbsolute(url) {
    var s = url.split("?");
    if (s.length < 1) {
        return;
    }
    else {
        s = s[0];
        //zhenyuFitness
        var start = s.indexOf("/zhenyuFitness");
        s = s.substring(start);
        return s;
    }
}

//菜单的默认链接
function initMenuUrl(o)
{
    var oJquery = $(o);
    if(oJquery.find("span").html() == "目标制定")
    {
        return "/zhenyuFitness/Pages/Goal/GoalSetting.aspx?menu=a1-a11";
    }
    return "没有设置";
}
