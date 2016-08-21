function translateDegreePie2() {
    var v = parseInt($('#pie_2').attr('data-percent'));
    if (v > 80 && v <= 100) $('#pie_2 .percent').html("高");
    else if (v > 60 && v <= 80) $('#pie_2 .percent').html("较高");
    else if (v > 40 && v <= 60) $('#pie_2 .percent').html("适中");
    else if (v > 20 && v <= 40) $('#pie_2 .percent').html("较低");
    else $('#pie_2 .percent').html("低");
}

function translateDegreePie3() {
    var v = parseInt($('#pie_3').attr('data-percent'));
    if (v > 80 && v <= 100) $('#pie_3 .percent').html("高");
    else if (v > 60 && v <= 80) $('#pie_3 .percent').html("较高");
    else if (v > 40 && v <= 60) $('#pie_3 .percent').html("适中");
    else if (v > 20 && v <= 40) $('#pie_3 .percent').html("较低");
    else $('#pie_3 .percent').html("低");
}

function strLength(s)
{
    var l = 0;
    for(i=0;i<s.length;i++)
    {
        if (checkChinese(s.charAt(i))) {
            l += 2;
        }
        else {
            l++;
        }
    }
    return l;
}

function checkChinese(c)
{
    var reg = /[\u4E00-\u9FA5\uF900-\uFA2D]/;
    return reg.test(c);
    //var reg = new RegExp("[\\u4E00-\\u9FFF]+", "g");
}