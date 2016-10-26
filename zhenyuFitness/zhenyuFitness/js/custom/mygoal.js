//初始化页面
function initMyGoal(v) {
    initVariable(v);
    initDatePicker();
    initEasyPie();
    initCountdown($("#goaldatespan").html());
    initchart();
}

function initVariable(value) {
    if (value.length < 6) { alert("其他类型目标的ID数量不符。");return; }
    squatsID = value[0];
    deadLiftID = value[1];
    barbellPressID = value[2];
    shoulderPressID = value[3];
    barbellRowID = value[4];
    barbellCurlID = value[5];
}

function initDatePicker() {
    $("#goalDaysCount").datepicker();;
}

//初始化EasyPie插件
function initEasyPie() {
    $('#pie_fatrate').easyPieChart({
        easing: 'easeOutBounce',
        onStep: function (from, to, percent) {
            //if (percent > 80 && percent <= 100) $(this.el).find('.percent').text("很高");
            //if (percent > 60 && percent <= 80) $(this.el).find('.percent').text("高");
            //if (percent > 40 && percent <= 60) $(this.el).find('.percent').text("始终");
            //if (percent > 20 && percent <= 40) $(this.el).find('.percent').text("低");
            //if (percent > 0 && percent <= 20) $(this.el).find('.percent').text("很低");
            //$(this.el).find('.percent').text(Math.round(percent * 100) / 100);
        },
        //lineWidth: 6,
        barColor: '#00aeef',
        size: 150,
        scaleLength: 5,
        trackColor: 'black',
        lineCap: 'butt',
        lineWidth: 10
        //barColor: '#D9134F'
    });
    $('#pie_fatrate').data('easyPieChart');
}

//初始化倒计时插件
function initCountdown(days) {
    return new Countdown({
        time: 86400 * days, // 86400 seconds = 1 day
        width: 200,
        height: 50,
        rangeHi: "year",
        target: "foo1",
        labels: {
            font: "微软雅黑",
            textScale: 0.8, // Percentage of size
            weight: "normal"	// < - no comma on last item!
        },
        style: "flip"	// <- no comma on last item!
    });
}

//初始化坐标图插件
function initchart() {
    initchart_weight();
    initchart_bodyfatrate();
    initchart_goalAchievePercent();
}
function initchart_weight() {//weighthistory形如：72,74,75,72
    //var interval = $("#weightCurveInterval").val();
    var weightHistory = $("#weightHistory").val().split(",");
    var weightHistoryDate = $("#weightHistoryDate").val().split(",");

    if (weightHistory.length == 1 || weightHistoryDate.length == 1) {
        if (weightHistory == "") {
            $("#chartWeightCurve").css("height", "350");
            $("#chartWeightCurve").html("<div style=\"margin-top:110px;margin-left:90px;color:#919191;font-family:微软雅黑;font-size:50px;\">您从未更新过您的体重！</div>");
            return;
        }
    }

    if (weightHistory.length != weightHistoryDate.length)
    {
        bootbox.alert({
            size: 'small',
            message: "历史体重记录和历史体重记录值不匹配。("+weightHistory.length+","+weightHistoryDate.length +")"
        });
        return;
    }

    var goalWeight = $("#goalWeight").html();
    var startWeight = $("#startWeight").html();
    var startDate = $("#goalStartDate").html();
    //goalweight：目标体重曲线；weighthistory：用户记录的体重记录；
    var goalweight = [], weighthistory = [], dateRecords = [],xlabels =[],xs = [];
    //加入起始点
    goalweight.push(goalWeight);
    weighthistory.push(startWeight);
    dateRecords.push(startDate);
    var totalRecords = weightHistory.length;

    if (totalRecords >= 26) {
        //初始化记录值
        for (var i = 0; i < totalRecords; i++) {
            goalweight.push(goalWeight);
            weighthistory.push(weightHistory[i]);
            dateRecords.push(weightHistoryDate[i]);

            xs.push(i + 1);
            if (i % 3 == 0)
                xlabels.push(i + 1);

                
        }
    }
    else
    {
        for(var i = 0;i<26;i++)
        {
            goalweight.push(goalWeight);
            xlabels.push(i);
            if(i<totalRecords)
            {
                weighthistory.push(weightHistory[i]);
                dateRecords.push(weightHistoryDate[i]);
                
                xs.push(i+1);
            }
        }
        
    }
    var data = [
                {
                    name: '目标体重',
                    value: goalweight,
                    color: '#0d8ecf',
                    line_width: 4
                },
                {
                    name: '历史体重',
                    value: weighthistory,
                    color: '#ef7707',
                    line_width: 1
                }
    ];

    //var labels = ["2012-06-01", "2012-08-02", "2012-08-03", "2012-08-04", "2012-08-05", "2012-08-06", "2012-08-05", "2012-08-06"];
    var line = new iChart.LineBasic2D({
        render: 'chartWeightCurve',
        data: data,
        align: 'center',
        title: {
            text: '您的体重变化曲线',
            color: '#254d70',
            font: '微软雅黑',
            size:'10px'
        },
        shadow:true,
        //subtitle: '平均每个人访问2-3个页面(访问量单位：万)',
        //footnote: '共' + totalRecords + '个体重记录',
        width: 760,
        height: 350,
        border: {
            width: [0, 0, 0, 0]
        },
        tip: {
            enable: true,
            shadow: true,
            listeners: {
                //tip:提示框对象、name:数据名称、value:数据值、text:当前文本、i:数据点的索引
                parseText: function (tip, name, value, text, i) {
                    if (name == '历史体重') {
                        if (i == 0) {
                            return "<span style='color:#005268;font-size:12px;'>目标开始时的体重：<br/>" +
                        "</span><span style='color:#005268;font-size:12px;'>记录时间：" + dateRecords[i] + "<br/>" +
                        "</span><span style='color:#005268;font-size:20px;'>" + value + "千克</span>";
                        }
                        return "<span style='color:#005268;font-size:12px;'>第" + xs[i - 1] + "次记录：<br/>" +
                        "</span><span style='color:#005268;font-size:12px;'>记录时间：" + dateRecords[i] + "<br/>" +
                        "</span><span style='color:#005268;font-size:20px;'>" + value + "千克</span>";
                    }
                    else
                    {
                        return "<span>目标体重：</span></span><span style='color:#005268;font-size:20px;'>" + value + "千克</span>";
                    }
                }
            }
        },
        legend: {
            enable: true,
            row: 1,//设置在一行上显示，与column配合使用
            column: 'max',
            valign: 'top',
            sign: 'bar',
            background_color: null,//设置透明背景
            offsetx: -80,//设置x轴偏移，满足位置需要
            border: true
        },
        crosshair: {
            enable: true,
            line_color: '#62bce9'
        },
        sub_option: {
            label: false,
            point_hollow: false
        },
        coordinate: {
            width: 640,
            height: 240,
            axis: {
                color: '#9f9f9f',
                width: [0, 0, 2, 2]
            },
            //grids: {
            //    vertical: {
            //        way: 'share_alike',
            //        value: 5
            //    }
            //},
            scale: [{
                position: 'left',
                start_scale: startWeight * 0.45,
                end_scale: startWeight * 1.50,
                scale_space: 5,
                scale_size: 2,
                scale_color: '#9f9f9f'
            }, {
                position: 'bottom',
                labels: xlabels
            }]
        }
    });

    //利用自定义组件构造左侧说明文本
    line.plugin(new iChart.Custom({
        drawFn: function () {
            //计算位置
            var coo = line.getCoordinate(),
                x = coo.get('originx'),
                y = coo.get('originy'),
                w = coo.width,
                h = coo.height;
            //在左上侧的位置，渲染一个单位的文字
            line.target.textAlign('start')
            .textBaseline('bottom')
            .textFont('600 11px 微软雅黑')
            .fillText('体重(千克)', x - 40, y - 12, false, '#9d987a')
            .textBaseline('top')
            .fillText('(序号)', x + w + 12, y + h + 10, false, '#9d987a');

        }
    }));

    //开始画图
    line.draw();




}
function initchart_bodyfatrate() {
    var bfrHistory = $("#bfrHistory").val().split(",");
    var bfrHistoryDate = $("#bfrHistoryDate").val().split(",");
    if (bfrHistory.length == 1 || bfrHistoryDate.length == 1)
    {
        if (bfrHistory == "") {
            $("#chartBodyfatRateCurve").css("height", "350");
            $("#chartBodyfatRateCurve").html("<div style=\"margin-top:110px;margin-left:70px;color:#919191;font-family:微软雅黑;font-size:50px;\">您从未更新过您的体脂率！</div>");
            return;
        }
    }


    if (bfrHistory.length != bfrHistoryDate.length) {
        bootbox.alert({
            size: 'small',
            message: "历史体脂率记录和历史体脂率记录值不匹配。(" + bfrHistory.length + "," + bfrHistoryDate.length + ")"
        });
        return;
    }

    var goalBFR = $("#goalBFR").html();
    var startBodyFat = $("#startBodyFat").html();
    var startDate = $("#goalStartDate").html();
    //goalbfr：目标体脂率曲线；bfrhistory：用户记录的体脂率记录；
    var goalbfr = [], bfrhistory = [], dateRecords = [], xlabels = [], xs = [];
    //加入起始点
    goalbfr.push(goalBFR);
    bfrhistory.push(startBodyFat);
    dateRecords.push(startDate);
    var totalRecords = bfrHistory.length;
    if (totalRecords >= 26) {

        //初始化记录值
        for (var i = 0; i < totalRecords; i++) {
            goalbfr.push(goalBFR);
            bfrhistory.push(bfrHistory[i]);
            dateRecords.push(bfrHistoryDate[i]);

            xs.push(i + 1);
            if (i % 3 == 0)
                xlabels.push(i + 1);


        }
    }
    else {
        for (var i = 0; i < 26; i++) {
            goalbfr.push(goalBFR);
            xlabels.push(i);
            if (i < totalRecords) {
                bfrhistory.push(bfrHistory[i]);
                dateRecords.push(bfrHistoryDate[i]);
                
                xs.push(i + 1);
            }
        }

    }

    var data = [
                {
                    name: '目标体脂率',
                    value: goalbfr,
                    color: '#0d8ecf',
                    line_width: 4
                },
                {
                    name: '历史体脂率',
                    value: bfrhistory,
                    color: '#ef7707',
                    line_width: 1
                }
    ];
    //var labels = ["2012-06-01", "2012-08-02", "2012-08-03", "2012-08-04", "2012-08-05", "2012-08-06", "2012-08-05", "2012-08-06"];
    var line = new iChart.LineBasic2D({
        render: 'chartBodyfatRateCurve',
        data: data,
        align: 'center',
        title: {
            text: '您的体脂率变化曲线',
            color: '#254d70',
            font: '微软雅黑',
            size: '10px'
        },
        shadow: true,
        //subtitle: '平均每个人访问2-3个页面(访问量单位：万)',
        //footnote: '共' + totalRecords + '个体重记录',
        width: 760,
        height: 350,
        border: {
            width: [0, 0, 0, 0]
        },
        tip: {
            enable: true,
            shadow: true,
            listeners: {
                //tip:提示框对象、name:数据名称、value:数据值、text:当前文本、i:数据点的索引
                parseText: function (tip, name, value, text, i) {
                    if (name == '历史体脂率') {
                        if (i == 0) {
                            return "<span style='color:#005268;font-size:12px;'>目标开始时的体脂率：<br/>" +
                        "</span><span style='color:#005268;font-size:12px;'>记录时间：" + dateRecords[i] + "<br/>" +
                        "</span><span style='color:#005268;font-size:20px;'>" + value + "%</span>";
                        }
                        return "<span style='color:#005268;font-size:12px;'>第" + xs[i - 1] + "次记录：<br/>" +
                        "</span><span style='color:#005268;font-size:12px;'>记录时间：" + dateRecords[i] + "<br/>" +
                        "</span><span style='color:#005268;font-size:20px;'>" + value + "%</span>";
                    }
                    else {
                        return "<span>目标体脂率：</span></span><span style='color:#005268;font-size:20px;'>" + value + "%</span>";
                    }
                }
            }
        },
        legend: {
            enable: true,
            row: 1,//设置在一行上显示，与column配合使用
            column: 'max',
            valign: 'top',
            sign: 'bar',
            background_color: null,//设置透明背景
            offsetx: -80,//设置x轴偏移，满足位置需要
            border: true
        },
        crosshair: {
            enable: true,
            line_color: '#62bce9'
        },
        sub_option: {
            label: false,
            point_hollow: false
        },
        coordinate: {
            width: 640,
            height: 240,
            axis: {
                color: '#9f9f9f',
                width: [0, 0, 2, 2]
            },
            //grids: {
            //    vertical: {
            //        way: 'share_alike',
            //        value: 5
            //    }
            //},
            scale: [{
                position: 'left',
                start_scale: 0,
                end_scale: startBodyFat * 1 + 10,
                scale_space: 3,
                scale_size: 2,
                scale_color: '#9f9f9f'
            }, {
                position: 'bottom',
                labels: xlabels
            }]
        }
    });

    //利用自定义组件构造左侧说明文本
    line.plugin(new iChart.Custom({
        drawFn: function () {
            //计算位置
            var coo = line.getCoordinate(),
                x = coo.get('originx'),
                y = coo.get('originy'),
                w = coo.width,
                h = coo.height;
            //在左上侧的位置，渲染一个单位的文字
            line.target.textAlign('start')
            .textBaseline('bottom')
            .textFont('600 11px 微软雅黑')
            .fillText('体脂率(%)', x - 40, y - 12, false, '#9d987a')
            .textBaseline('top')
            .fillText('(序号)', x + w + 12, y + h + 10, false, '#9d987a');

        }
    }));

    //开始画图
    line.draw();
}
function initchart_goalAchievePercent() {
    var weightHistory = $("#weightHistory").val().split(",");
    var weightHistoryDate = $("#weightHistoryDate").val().split(",");
    var bfrHistory = $("#bfrHistory").val().split(",");
    var bfrHistoryDate = $("#bfrHistoryDate").val().split(",");
    var goalWeight = $("#goalWeight").html();
    var startWeight = $("#startWeight").html();
    var goalBFR = $("#goalBFR").html();
    var startBodyFat = $("#startBodyFat").html();
    var startDate = $("#goalStartDate").html();

    if (weightHistory.length == 1 || weightHistoryDate.length == 1) {
        if (weightHistory == "") {
            if (bfrHistory.length == 1 || bfrHistoryDate.length == 1)
            {
                if(bfrHistory == "")
                {
                    $("#chartGoalAchieveRateCurve").css("height", "350");
                    $("#chartGoalAchieveRateCurve").html("<div style=\"margin-top:110px;margin-left:47px;color:#919191;font-family:微软雅黑;font-size:50px;\">您从未更新过体重和体脂率！</div>");
                    return;
                }
            }
        }
    }

    if (weightHistory.length != weightHistoryDate.length) {
        bootbox.alert({
            size: 'small',
            message: "历史体重记录和历史体重记录值不匹配。(" + weightHistory.length + "," + weightHistoryDate.length + ")"
        });
        return;
    }

    if (bfrHistory.length == 1 && weightHistory==1) {
        if (bfrHistory == "") {
            $("#chartBodyfatRateCurve").css("height", "350");
            $("#chartBodyfatRateCurve").html("<div style=\"margin-top:110px;margin-left:70px;color:#919191;font-family:微软雅黑;font-size:50px;\">您从未更新过您的体脂率！</div>");
            return;
        }
    }


    if (bfrHistory.length != bfrHistoryDate.length) {
        bootbox.alert({
            size: 'small',
            message: "历史体脂率记录和历史体脂率记录值不匹配。(" + bfrHistory.length + "," + bfrHistoryDate.length + ")"
        });
        return;
    }

    var weightAchievePercentHistory = [], bfrAchievePercent = [], weightDateRecords = [], bfrDateRecords = [], xlabels = [], xs = [];
    weightAchievePercentHistory.push(0);
    bfrAchievePercent.push(0);
    weightDateRecords.push(startDate);
    bfrDateRecords.push(startDate);

    var weightChangeDireciton = goalWeight * 1 - startWeight * 1;
    if (weightChangeDireciton > 0) weightChangeDireciton = 1;//增重
    else weightChangeDireciton = -1;//减重

    var bfrChangeDireciton = goalBFR * 1 - startBodyFat;
    if (bfrChangeDireciton > 0) bfrChangeDireciton = 1;//增脂肪（基本不可能）
    else bfrChangeDireciton = -1;//减重

    for(var i = 0;i<weightHistory.length;i++)
    {
        if (weightChangeDireciton > 0) {
            if (weightHistory[i] * 1 - startWeight < 0) {
                weightAchievePercentHistory.push(0);
            }
            else {
                weightAchievePercentHistory.push((((weightHistory[i] * 1 - startWeight) / (goalWeight * 1 - startWeight))*100).toFixed(1));
            }
        }
        else
        {
            if (weightHistory[i] * 1 - startWeight > 0)
            {
                weightAchievePercentHistory.push(0);
            }
            else {
                weightAchievePercentHistory.push((((weightHistory[i] * 1 - startWeight) / (goalWeight * 1 - startWeight))*100).toFixed(1));
            }
        }
        weightDateRecords.push(weightHistoryDate[i]);
    }
    //alert(weightDateRecords[1]);
    for (var i = 0; i < bfrHistory.length; i++) {
        if (bfrHistory[i] == "") break;

        if (bfrChangeDireciton > 0) {
            if (bfrHistory[i] * 1 - startBodyFat < 0) {
                bfrAchievePercent.push(0);
            }
            else {
                bfrAchievePercent.push((((bfrHistory[i] * 1 - startBodyFat) / (goalBFR * 1 - startBodyFat))*100).toFixed(1));
            }
        }
        else
        {
            if (bfrHistory[i] * 1 - startBodyFat > 0) {
                bfrAchievePercent.push(0);
            }
            else {
                bfrAchievePercent.push((((bfrHistory[i] * 1 - startBodyFat) / (goalBFR * 1 - startBodyFat))*100).toFixed(3));
            }
        }
        bfrDateRecords.push(bfrHistoryDate[i]);
    }

    var longerListCount;
    if (weightHistory.length > bfrHistory.length) longerListCount = weightHistory.length;
    else longerListCount = bfrHistory.length;

    

    var longX = [];//
    if (longerListCount < 26) {
        for (var i = 0; i < 26; i++) {
            longX.push(i);
            xlabels.push(i);
        }
    }
    else {
        for (var i = 0; i < longerListCount; i++) {
            xlabels.push(i);
        }
    }


    var data = [
                {
                    name: '体重指标完成率',
                    value: weightAchievePercentHistory,
                    color: '#0d8ecf',
                    line_width: 1
                },
                {
                    name: '体脂率指标完成率',
                    value: bfrAchievePercent,
                    color: '#ef7707',
                    line_width: 1
                },
                {
                    name: '',
                    value: longX,
                    color: 'rgba(0,0,0,0)',
                }
    ];

    //var labels = ["2012-06-01", "2012-08-02", "2012-08-03", "2012-08-04", "2012-08-05", "2012-08-06", "2012-08-05", "2012-08-06"];
    var line = new iChart.LineBasic2D({
        render: 'chartGoalAchieveRateCurve',
        data: data,
        align: 'center',
        title: {
            text: '健身目标完成率变化曲线',
            color: '#254d70',
            font: '微软雅黑',
            size: '10px'
        },
        shadow: true,
        //subtitle: '平均每个人访问2-3个页面(访问量单位：万)',
        //footnote: '共' + totalRecords + '个体重记录',
        width: 760,
        height: 350,
        border: {
            width: [0, 0, 0, 0]
        },
        tip: {
            enable: true,
            shadow: true,
            listeners: {
                //tip:提示框对象、name:数据名称、value:数据值、text:当前文本、i:数据点的索引
                parseText: function (tip, name, value, text, i) {
                    if (name == '体重指标完成率') {
                        return "<span style='color:#005268;font-size:12px;'>记录时间：" + weightDateRecords[i] + "<br/>" +
                        "<span>体重指标完成率：</span></span><span style='color:#005268;font-size:20px;'>" + value.toFixed(1) + "%</span>";
                    }
                    else if (name == '体脂率指标完成率') {
                        return "<span style='color:#005268;font-size:12px;'>记录时间：" + weightDateRecords[i] + "<br/>" +
                            "<span>体脂率指标完成率：</span></span><span style='color:#005268;font-size:20px;'>" + value.toFixed(1) + "%</span>";
                    }
                    else return "<span style='display:none;height:2px;width:2px;border:none;background-color:transparent;color:transparent'></span>";
                }
            }
        },
        legend: {
            enable: true,
            row: 1,//设置在一行上显示，与column配合使用
            column: 'max',
            valign: 'top',
            sign: 'bar',
            background_color: null,//设置透明背景
            offsetx: -80,//设置x轴偏移，满足位置需要
            border: true
        },
        crosshair: {
            enable: true,
            line_color: '#62bce9'
        },
        sub_option: {
            label: false,
            point_hollow: false
        },
        coordinate: {
            width: 640,
            height: 240,
            axis: {
                color: '#9f9f9f',
                width: [0, 0, 2, 2]
            },
            //grids: {
            //    vertical: {
            //        way: 'share_alike',
            //        value: 5
            //    }
            //},
            scale: [{
                position: 'left',
                start_scale: -10,
                end_scale: 100,
                scale_space: 10,
                scale_size: 2,
                scale_color: '#9f9f9f'
            }, {
                position: 'bottom',
                labels: xlabels
            }]
        }
    });

    //利用自定义组件构造左侧说明文本
    line.plugin(new iChart.Custom({
        drawFn: function () {
            //计算位置
            var coo = line.getCoordinate(),
                x = coo.get('originx'),
                y = coo.get('originy'),
                w = coo.width,
                h = coo.height;
            //在左上侧的位置，渲染一个单位的文字
            line.target.textAlign('start')
            .textBaseline('bottom')
            .textFont('600 11px 微软雅黑')
            .fillText('完成进度(%)', x - 40, y - 12, false, '#9d987a')
            .textBaseline('top')
            .fillText('(序号)', x + w + 12, y + h + 10, false, '#9d987a');

        }
    }));

    //开始画图
    line.draw();

}

//更新当前体重
function updateCurrentWeight() {
    var goalid = $("#goalid").val();
    if (goalid == "")
    {
        bootbox.alert({
            size: 'small',
            message: "请先制定一个健身目标。"
        });
        return;
    }
    //to do:判断距离上一次更新是否超过了7天




    var startWeight = $("#startWeight").html();
    var startBFR = $("#startBodyFat").html();
    var currentweight = $("#updateCurrentWeight_weightinput").val();
    var lastWeightMesured = $("#currentweight").html();
    var currentBFR = $("#currentBFR").html();
    $.ajax({
        type: "POST",
        url: "/zhenyuFitness/ashx/DealAjax.ashx",
        data: { ajaxtype: "updateCurrentWeight", goalID: goalid, currentWeight: currentweight },
        async: true,
        success: function (data) {
            if (data == "0") {//更新失败
                bootbox.alert({
                    size: 'small',
                    message: "更新当前体重失败。请重试！"
                });
                $('#updateCurrentWeight').modal('hide')
            }
            if (data == "1") {//数据库更新成功，更新前台数据
                $('#updateCurrentWeight').modal('hide')

                $("#currentweight").html(currentweight);//更新当前体重
                $("#leanbodyweight").html(((1 - currentBFR / 100) * currentweight).toFixed(1));//更新当前瘦体重
                $("#bodyfatweight").html((currentBFR / 100 * currentweight).toFixed(1));//更新当前体脂肪重量

                //更新体重变化
                var totalWeightChange = currentweight - startWeight;
                if (totalWeightChange > 0)
                {
                    $("#weightchange").html((totalWeightChange).toFixed(1));
                    $("#weightChangeDirection").html("总共增加");
                }
                else
                {
                    $("#weightchange").html((0 - totalWeightChange).toFixed(1));
                    $("#weightChangeDirection").html("总共减少");
                }

                //更新瘦体重变化
                var totalLeanBodyWeightChange = currentweight * (100 - currentBFR) / 100 - startWeight * (100 - startBFR) / 100;
                if(totalLeanBodyWeightChange > 0)
                {
                    $("#leanbodyweightchange").html(totalLeanBodyWeightChange.toFixed(1));
                    $("#leanBodyWeightChangeDirection").html("总共增加");
                }
                else
                {
                    $("#leanbodyweightchange").html(0 - totalLeanBodyWeightChange.toFixed(1));
                    $("#leanBodyWeightChangeDirection").html("总共减少");
                }

                //更新体脂肪变化
                var totalBodyfatWeightChange = currentweight * currentBFR / 100 - startWeight * startBFR / 100;
                if(totalBodyfatWeightChange > 0)
                {
                    $("#bodyfatweightchange").html(totalBodyfatWeightChange.toFixed(1));
                    $("bodyfatWeightChangeDirection").html("总共增加");
                }
                else
                {
                    $("#bodyfatweightchange").html(0 - totalBodyfatWeightChange.toFixed(1));
                    $("bodyfatWeightChangeDirection").html("总共减少");
                }

                //to do:更新三个图表

            }
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            alert("更新体重时ajax调用出错了");
            alert(errorThrown);
        }
    });
}

function initSelect2()
{
    $("#weightCurveInterval").select2({
        tags: true,
    });
}

//更新当前体脂率
function updateCurrentBFR()
{
    var goalid = $("#goalid").val();
    if (goalid == "") {
        bootbox.alert({
            size: 'small',
            message: "请先制定一个健身目标。"
        });
        return;
    }


    var startWeight = $("#startWeight").html();
    var startBFR = $("#startBodyFat").html();
    var currentbfr = $("#updateCurrentBFR_bfrinput").val();
    var lastBFRMesured = $("#currentBFR").html();
    var currentWeight = $("#currentweight").html();
    $.ajax({
        type: "POST",
        url: "/zhenyuFitness/ashx/DealAjax.ashx",
        data: { ajaxtype: "updateCurrentBFR", goalID: goalid, currentBFR: currentbfr },
        async: true,
        success: function (data) {
            if (data == "0") {//更新失败
                bootbox.alert({
                    size: 'small',
                    message: "更新当前体脂率失败。请重试！"
                });
                $('#updateCurrentBF').modal('hide')
            }
            if (data == "1") {//数据库更新成功，更新前台数据
                $('#updateCurrentBF').modal('hide')

                $("#currentBFR").html(currentbfr);//更新当前体脂率
                $("#leanbodyweight").html(((1 - currentbfr / 100) * currentWeight).toFixed(1));//更新当前瘦体重
                $("#bodyfatweight").html((currentbfr / 100 * currentWeight).toFixed(1));//更新当前体脂肪重量

                //更新体脂率变化
                var totalbfrChange = currentbfr - startBFR;
                if (totalbfrChange > 0) {
                    $("#BFRchange").html((totalbfrChange).toFixed(1));
                    $("#BFRChangeDirection").html("总共增加");
                    
                }
                else {
                    $("#BFRchange").html((0 - totalbfrChange).toFixed(1));
                    $("#BFRChangeDirection").html("总共减少");
                }

                //更新瘦体重变化
                var totalLeanBodyWeightChange = currentWeight * (100 - currentbfr) / 100 - startWeight * (100 - startBFR) / 100;
                if (totalLeanBodyWeightChange > 0) {
                    $("#leanbodyweightchange").html(totalLeanBodyWeightChange.toFixed(1));
                    $("#leanBodyWeightChangeDirection").html("总共增加");
                }
                else {
                    $("#leanbodyweightchange").html(0 - totalLeanBodyWeightChange.toFixed(1));
                    $("#leanBodyWeightChangeDirection").html("总共减少");
                }

                //更新体脂肪变化
                var totalBodyfatWeightChange = currentWeight * currentbfr / 100 - startWeight * startBFR / 100;
                if (totalBodyfatWeightChange > 0) {
                    $("#bodyfatweightchange").html(totalBodyfatWeightChange.toFixed(1));
                    $("bodyfatWeightChangeDirection").html("总共增加");
                }
                else {
                    $("#bodyfatweightchange").html(0 - totalBodyfatWeightChange.toFixed(1));
                    $("bodyfatWeightChangeDirection").html("总共减少");
                }

                //to do:更新三个图表

            }
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            alert("更新体脂率ajax调用出错了");
            alert(errorThrown);
        }
    });
}

//删除当前“体重、体脂率”健身目标
function deleteCurrentBFRGoal() {
    var goalid = $("#goalid").val();
    if (goalid == "") {
        bootbox.alert({
            size: 'small',
            message: "请先制定一个健身目标。"
        });
        return;
    }

    $.ajax({
        type: "POST",
        url: "/zhenyuFitness/ashx/DealAjax.ashx",
        data: { ajaxtype: "deleteCurrentBFRGoal", goalID:goalid },
        async: true,
        success: function (data) {
            if (data == "0") {//删除失败
                bootbox.alert({
                    size: 'small',
                    message: "删除当前健身目标失败。请重试！"
                });
                $('#deleteCurrentGoal').modal('hide')
            }
            if (data == "1") {//数据库更新成功，更新前台数据
                $('#deleteCurrentGoal').modal('hide')

                location.reload(true);

            }
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            alert("删除当前目标ajax调用出错了");
            alert(errorThrown);
            ret = -1
        }
    });
}

//根据输入的体重值，更新页面数据
function CheckUpdateCurrentWeight_weightinput(inputValue) {
    if (inputValue * 1 >= 500) {
        $("#updateCurrentWeight_weightinput").val("");
        bootbox.alert({
            size: 'small',
            message: "您的体重似乎不太可能超过500公斤！请您重新输入。"
        });
        return;
    }
    var lastWeightMeasured = $("#currentweight").html();
    if (inputValue > 10) {
        if (inputValue * 1 > lastWeightMeasured * 1) {

            $("#updateCurrentWeight_weightdesctable_changeDirection").html("增加了");
            $("#updateCurrentWeight_weightdesctable_changeAmount").html((inputValue - lastWeightMeasured).toFixed(1));
            $(".updateCurrentWeight_directionstyle").attr("class", "fa fa-long-arrow-up fa-5x updateCurrentWeight_directionstyle");
            $(".updateCurrentWeight_directionstyle").css("color", "#F00000");
            //$("#updateCurrentWeight_weightdesctable_changeDayCount").html();
        }
        else if (inputValue * 1 < lastWeightMeasured * 1) {
            $("#updateCurrentWeight_weightdesctable_changeDirection").html("减少了");
            $("#updateCurrentWeight_weightdesctable_changeAmount").html((lastWeightMeasured - inputValue).toFixed(1));
            $(".updateCurrentWeight_directionstyle").attr("class", "fa fa-long-arrow-down fa-5x updateCurrentWeight_directionstyle");
            $(".updateCurrentWeight_directionstyle").css("color", "#003399");

            //$("#updateCurrentWeight_weightdesctable_changeDayCount").html();
        }
        else {
            $("#updateCurrentWeight_weightdesctable_changeDirection").html("没有变化");
            $("#updateCurrentWeight_weightdesctable_changeAmount").html((lastWeightMeasured - inputValue).toFixed(1));
            $(".updateCurrentWeight_directionstyle").attr("class", "fa fa-arrows-h fa-5x updateCurrentWeight_directionstyle");
            $(".updateCurrentWeight_directionstyle").css("color", "#CCCCCC");
            //$("#updateCurrentWeight_weightdesctable_changeDayCount").html();
        }
    }
}

//根据输入的体脂率，更新页面数据
function CheckUpdateCurrentBFR_bfrinput(inputValue) {
    if (inputValue * 1 > 60) {
        $("#updateCurrentBFR_bfrinput").val("");
        bootbox.alert({
            size: 'small',
            message: "您的体脂率似乎不太可能超过60%！请您重新输入。"
        });
        return;
    }

    var lastBFRMeasured = $("#currentBFR").html();
    if (inputValue * 1 > lastBFRMeasured * 1) {
        $("#updateCurrentBFR_bfrdesctable_changeDirection").html("增加了");
        $("#updateCurrentBFR_bfrdesctable_changeAmount").html((inputValue - lastBFRMeasured).toFixed(1));
        $(".updateCurrentBFR_directionstyle").attr("class", "fa fa-long-arrow-up fa-5x updateCurrentBFR_directionstyle");
        $(".updateCurrentBFR_directionstyle").css("color", "#F00000");
    }
    else if (inputValue * 1 < lastBFRMeasured * 1) {
        $("#updateCurrentBFR_bfrdesctable_changeDirection").html("减少了");
        $("#updateCurrentBFR_bfrdesctable_changeAmount").html((lastBFRMeasured - inputValue).toFixed(1));
        $(".updateCurrentBFR_directionstyle").attr("class", "fa fa-long-arrow-down fa-5x updateCurrentBFR_directionstyle");
        $(".updateCurrentBFR_directionstyle").css("color", "#003399");
    }
    else {
        $("#updateCurrentBFR_bfrdesctable_changeDirection").html("没有变化");
        $("#updateCurrentBFR_bfrdesctable_changeAmount").html((lastBFRMeasured - inputValue).toFixed(1));
        $(".updateCurrentBFR_directionstyle").attr("class", "fa fa-arrows-h fa-5x updateCurrentBFR_directionstyle");
        $(".updateCurrentBFR_directionstyle").css("color", "#CCCCCC");
    }
}







//估算One Rep Max
function EstimateRepMax(weightUsed, numberOfRepetitions) {
    return weightUsed / (1.0278 - (0.0278 * numberOfRepetitions));
}
//********************开始：目标设定***************************
//start:在力量型目标框里操作时的变化
function updateModel_squats(currentLiftWeightAmount, currentRepsCount, goalLiftWeightAmount, goalRepsCount)
{
    if (currentLiftWeightAmount.length > 3) {
        $("#currentLiftWeightAmount_squats").val(parseInt(currentLiftWeightAmount / 10));
        $("#currentLiftWeightOneRepsMax_squats").html((EstimateRepMax(currentLiftWeightAmount, currentRepsCount) / 10).toFixed(0));
    }

    else
    {
        //$("#currentLiftWeightOneRepsMax").html(parseInt(currentLiftWeightAmount));
        $("#currentLiftWeightAmount_squats").val(parseInt(currentLiftWeightAmount));
        $("#currentLiftWeightOneRepsMax_squats").html((EstimateRepMax(currentLiftWeightAmount, currentRepsCount)).toFixed(0));
    }
    $('#currentLiftWeightRepsCount_squats').html(currentRepsCount);

    if (goalLiftWeightAmount.length > 3) {
        $("#goalLiftWeightAmount_squats").val(parseInt(goalLiftWeightAmount / 10));
        $("#goalLiftWeightOneRepsMax_squats").html((EstimateRepMax(goalLiftWeightAmount, goalRepsCount) / 10).toFixed(0));
    }
    else {
        $("#goalLiftWeightAmount_squats").val(parseInt(goalLiftWeightAmount));
        $("#goalLiftWeightOneRepsMax_squats").html(EstimateRepMax(goalLiftWeightAmount, goalRepsCount).toFixed(0));
    }
    $('#goalLiftWeightRepsCount_squats').html(goalRepsCount);
}

function updateModel_deadLift(currentLiftWeightAmount, currentRepsCount, goalLiftWeightAmount, goalRepsCount) {
    if (currentLiftWeightAmount.length > 3) {
        $("#currentLiftWeightAmount_deadLift").val(parseInt(currentLiftWeightAmount / 10));
        $("#currentLiftWeightOneRepsMax_deadLift").html((EstimateRepMax(currentLiftWeightAmount, currentRepsCount) / 10).toFixed(0));
    }

    else {
        //$("#currentLiftWeightOneRepsMax_deadLift").html(parseInt(currentLiftWeightAmount));
        $("#currentLiftWeightAmount_deadLift").val(parseInt(currentLiftWeightAmount));
        $("#currentLiftWeightOneRepsMax_deadLift").html((EstimateRepMax(currentLiftWeightAmount, currentRepsCount)).toFixed(0));
    }
    $('#currentLiftWeightRepsCount_deadLift').html(currentRepsCount);

    if (goalLiftWeightAmount.length > 3) {
        $("#goalLiftWeightAmount_deadLift").val(parseInt(goalLiftWeightAmount / 10));
        $("#goalLiftWeightOneRepsMax_deadLift").html((EstimateRepMax(goalLiftWeightAmount, goalRepsCount) / 10).toFixed(0));
    }
    else {
        $("#goalLiftWeightAmount_deadLift").val(parseInt(goalLiftWeightAmount));
        $("#goalLiftWeightOneRepsMax_deadLift").html(EstimateRepMax(goalLiftWeightAmount, goalRepsCount).toFixed(0));
    }
    $('#goalLiftWeightRepsCount_deadLift').html(goalRepsCount);
}

function updateModel_barbellPress(currentLiftWeightAmount, currentRepsCount, goalLiftWeightAmount, goalRepsCount) {
    if (currentLiftWeightAmount.length > 3) {
        $("#currentLiftWeightAmount_barbellPress").val(parseInt(currentLiftWeightAmount / 10));
        $("#currentLiftWeightOneRepsMax_barbellPress").html((EstimateRepMax(currentLiftWeightAmount, currentRepsCount) / 10).toFixed(0));
    }

    else {
        //$("#currentLiftWeightOneRepsMax_barbellPress").html(parseInt(currentLiftWeightAmount));
        $("#currentLiftWeightAmount_barbellPress").val(parseInt(currentLiftWeightAmount));
        $("#currentLiftWeightOneRepsMax_barbellPress").html((EstimateRepMax(currentLiftWeightAmount, currentRepsCount)).toFixed(0));
    }
    $('#currentLiftWeightRepsCount_barbellPress').html(currentRepsCount);

    if (goalLiftWeightAmount.length > 3) {
        $("#goalLiftWeightAmount_barbellPress").val(parseInt(goalLiftWeightAmount / 10));
        $("#goalLiftWeightOneRepsMax_barbellPress").html((EstimateRepMax(goalLiftWeightAmount, goalRepsCount) / 10).toFixed(0));
    }
    else {
        $("#goalLiftWeightAmount_barbellPress").val(parseInt(goalLiftWeightAmount));
        $("#goalLiftWeightOneRepsMax_barbellPress").html(EstimateRepMax(goalLiftWeightAmount, goalRepsCount).toFixed(0));
    }
    $('#goalLiftWeightRepsCount_barbellPress').html(goalRepsCount);
}

function updateModel_shoulderPress(currentLiftWeightAmount, currentRepsCount, goalLiftWeightAmount, goalRepsCount) {
    if (currentLiftWeightAmount.length > 3) {
        $("#currentLiftWeightAmount_shoulderPress").val(parseInt(currentLiftWeightAmount / 10));
        $("#currentLiftWeightOneRepsMax_shoulderPress").html((EstimateRepMax(currentLiftWeightAmount, currentRepsCount) / 10).toFixed(0));
    }

    else {
        //$("#currentLiftWeightOneRepsMax_shoulderPress").html(parseInt(currentLiftWeightAmount));
        $("#currentLiftWeightAmount_shoulderPress").val(parseInt(currentLiftWeightAmount));
        $("#currentLiftWeightOneRepsMax_shoulderPress").html((EstimateRepMax(currentLiftWeightAmount, currentRepsCount)).toFixed(0));
    }
    $('#currentLiftWeightRepsCount_shoulderPress').html(currentRepsCount);

    if (goalLiftWeightAmount.length > 3) {
        $("#goalLiftWeightAmount_shoulderPress").val(parseInt(goalLiftWeightAmount / 10));
        $("#goalLiftWeightOneRepsMax_shoulderPress").html((EstimateRepMax(goalLiftWeightAmount, goalRepsCount) / 10).toFixed(0));
    }
    else {
        $("#goalLiftWeightAmount_shoulderPress").val(parseInt(goalLiftWeightAmount));
        $("#goalLiftWeightOneRepsMax_shoulderPress").html(EstimateRepMax(goalLiftWeightAmount, goalRepsCount).toFixed(0));
    }
    $('#goalLiftWeightRepsCount_shoulderPress').html(goalRepsCount);
}

function updateModel_barbellRow(currentLiftWeightAmount, currentRepsCount, goalLiftWeightAmount, goalRepsCount) {
    if (currentLiftWeightAmount.length > 3) {
        $("#currentLiftWeightAmount_barbellRow").val(parseInt(currentLiftWeightAmount / 10));
        $("#currentLiftWeightOneRepsMax_barbellRow").html((EstimateRepMax(currentLiftWeightAmount, currentRepsCount) / 10).toFixed(0));
    }

    else {
        //$("#currentLiftWeightOneRepsMax_barbellRow").html(parseInt(currentLiftWeightAmount));
        $("#currentLiftWeightAmount_barbellRow").val(parseInt(currentLiftWeightAmount));
        $("#currentLiftWeightOneRepsMax_barbellRow").html((EstimateRepMax(currentLiftWeightAmount, currentRepsCount)).toFixed(0));
    }
    $('#currentLiftWeightRepsCount_barbellRow').html(currentRepsCount);

    if (goalLiftWeightAmount.length > 3) {
        $("#goalLiftWeightAmount_barbellRow").val(parseInt(goalLiftWeightAmount / 10));
        $("#goalLiftWeightOneRepsMax_barbellRow").html((EstimateRepMax(goalLiftWeightAmount, goalRepsCount) / 10).toFixed(0));
    }
    else {
        $("#goalLiftWeightAmount_barbellRow").val(parseInt(goalLiftWeightAmount));
        $("#goalLiftWeightOneRepsMax_barbellRow").html(EstimateRepMax(goalLiftWeightAmount, goalRepsCount).toFixed(0));
    }
    $('#goalLiftWeightRepsCount_barbellRow').html(goalRepsCount);
}

function updateModel_barbellCurl(currentLiftWeightAmount, currentRepsCount, goalLiftWeightAmount, goalRepsCount) {
    if (currentLiftWeightAmount.length > 3) {
        $("#currentLiftWeightAmount_barbellCurl").val(parseInt(currentLiftWeightAmount / 10));
        $("#currentLiftWeightOneRepsMax_barbellCurl").html((EstimateRepMax(currentLiftWeightAmount, currentRepsCount) / 10).toFixed(0));
    }

    else {
        //$("#currentLiftWeightOneRepsMax_barbellCurl").html(parseInt(currentLiftWeightAmount));
        $("#currentLiftWeightAmount_barbellCurl").val(parseInt(currentLiftWeightAmount));
        $("#currentLiftWeightOneRepsMax_barbellCurl").html((EstimateRepMax(currentLiftWeightAmount, currentRepsCount)).toFixed(0));
    }
    $('#currentLiftWeightRepsCount_barbellCurl').html(currentRepsCount);

    if (goalLiftWeightAmount.length > 3) {
        $("#goalLiftWeightAmount_barbellCurl").val(parseInt(goalLiftWeightAmount / 10));
        $("#goalLiftWeightOneRepsMax_barbellCurl").html((EstimateRepMax(goalLiftWeightAmount, goalRepsCount) / 10).toFixed(0));
    }
    else {
        $("#goalLiftWeightAmount_barbellCurl").val(parseInt(goalLiftWeightAmount));
        $("#goalLiftWeightOneRepsMax_barbellCurl").html(EstimateRepMax(goalLiftWeightAmount, goalRepsCount).toFixed(0));
    }
    $('#goalLiftWeightRepsCount_barbellCurl').html(goalRepsCount);
}
//end:在力量型目标框里操作时的变化

//start：添加力量型目标
function addOtherGoal_squats() {
    var startLiftWeight = $("#currentLiftWeightAmount_squats").val();
    var startRepsCount = $("#currentRepsCountInput_squats").val();
    var goalLiftWeight = $("#goalLiftWeightAmount_squats").val();
    var goalRepsCount = $("#goalRepsCountInput_squats").val();
    var goalDaysCount = $("#goalLiftWeightDaysCountAmount_squats").val();
    if(startLiftWeight == "" || startLiftWeight == "undefined")
    {
        AlertBasic("当前能蹲起的重量不能为空，请填写。");
        return;
    }

    if (goalLiftWeight == "" || goalLiftWeight == "undefined") {
        AlertBasic("目标蹲起重量不能为空，请填写。");
        return;
    }

    if (goalDaysCount == "" || goalDaysCount == "undefined") {
        AlertBasic("目标达成日期不能为空，请填写。");
        return;
    }
    var startLiftWeightMax = EstimateRepMax(startLiftWeight, startRepsCount).toFixed(0);
    var goalLiftWeightMax = EstimateRepMax(goalLiftWeight, goalRepsCount).toFixed(0);

    if (goalLiftWeightMax * 1 <= startLiftWeightMax * 1) {
        AlertBasic("目标重量必须大于起始重量！");
        return;
    }


    $.ajax({
        type: "POST",
        url: "/zhenyuFitness/ashx/DealAjax.ashx",
        data: { ajaxtype: "addOtherGoal_squats", startValue: startLiftWeightMax, goalValue: goalLiftWeightMax, goalDaysCount: goalDaysCount, type: "squats", startLiftWeight: startLiftWeight, startRepsCount: startRepsCount, goalLiftWeight: goalLiftWeight, goalRepsCount: goalRepsCount },
        async: true,
        success: function (data) {
            if (data != "2") {//更新失败
                if (date == "1") {
                    AlertBasic("您尚未登录！请登录后重试。")
                }
                else if(date == "3"){
                    AlertBasic("更新数据时出错，请重试！");
                }
                else {
                    AlertBasic("什么都没有发生！");
                }
            }
            else {//数据库更新成功，更新前台数据
                //刷新前台页面
                $("#squatsGoal").modal("hide");
                AlertBasic("设定目标：自由杠铃深蹲成功。");
                $("#startValueHtml_squats").html(startLiftWeightMax);
                var nowDate = new Date();
                $("#startDateHtml_squats").html(nowDate.getFullYear() + "-" + (nowDate.getMonth() * 1 + 1).toString() + "-" + nowDate.getDate());
                $("#goalValueHtml_squats").html(goalLiftWeightMax);
                $("#goalDaysLeftHtml").html(goalDaysCount);
                $("#progress_currentLiftWeightAmount_squats").html(startLiftWeightMax);
                $("#progress_currentLiftWeightAchievedPercent_squats").html(0);
                $("#progress_currentLiftWeightStatus_squats").html("进行中");

                $("#addOtherGoal_squats").addClass("disableCss");
                $("#deleteOtherGoal_squats").removeClass("disableCss");

                squatsID = data.toString();
            }
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            alert("增加深蹲目标时出错了");
            alert(errorThrown);
        }
    });
}

function addOtherGoal_deadLift() {
    var startLiftWeight = $("#currentLiftWeightAmount_deadLift").val();
    var startRepsCount = $("#currentRepsCountInput_deadLift").val();
    var goalLiftWeight = $("#goalLiftWeightAmount_deadLift").val();
    var goalRepsCount = $("#goalRepsCountInput_deadLift").val();
    var goalDaysCount = $("#goalLiftWeightDaysCountAmount_deadLift").val();
    if (startLiftWeight == "" || startLiftWeight == "undefined") {
        AlertBasic("当前能蹲起的重量不能为空，请填写。");
        return;
    }

    if (goalLiftWeight == "" || goalLiftWeight == "undefined") {
        AlertBasic("目标蹲起重量不能为空，请填写。");
        return;
    }

    if (goalDaysCount == "" || goalDaysCount == "undefined") {
        AlertBasic("目标达成日期不能为空，请填写。");
        return;
    }

    var startLiftWeightMax = EstimateRepMax(startLiftWeight, startRepsCount).toFixed(0);
    var goalLiftWeightMax = EstimateRepMax(goalLiftWeight, goalRepsCount).toFixed(0);

    if (goalLiftWeightMax * 1 <= startLiftWeightMax * 1) {
        AlertBasic("目标重量必须大于起始重量！");
        return;
    }
    $.ajax({
        type: "POST",
        url: "/zhenyuFitness/ashx/DealAjax.ashx",
        data: { ajaxtype: "addOtherGoal_deadLift", startValue: startLiftWeightMax, goalValue: goalLiftWeightMax, goalDaysCount: goalDaysCount, type: "deadLift", startLiftWeight: startLiftWeight, startRepsCount: startRepsCount, goalLiftWeight: goalLiftWeight, goalRepsCount: goalRepsCount },
        async: true,
        success: function (data) {
            if (data != "2") {//更新失败
                if (date == "1") {
                    AlertBasic("您尚未登录！请登录后重试。")
                }
                else if (date == "3") {
                    AlertBasic("更新数据时出错，请重试！");
                }
                else {
                    AlertBasic("什么都没有发生！");
                }
            }
            else {//数据库更新成功，更新前台数据
                //刷新前台页面
                $("#deadLiftGoal").modal("hide");
                AlertBasic("设定目标：杠铃传统硬拉成功。");
                $("#startValueHtml_deadLift").html(startLiftWeightMax);
                var nowDate = new Date();
                $("#startDateHtml_deadLift").html(nowDate.getFullYear() + "-" + (nowDate.getMonth() * 1 + 1).toString() + "-" + nowDate.getDate());
                $("#goalValueHtml_deadLift").html(goalLiftWeightMax);
                $("#goalDaysLeftHtml").html(goalDaysCount);
                $("#progress_currentLiftWeightAmount_deadLift").html(startLiftWeightMax);
                $("#progress_currentLiftWeightAchievedPercent_deadLift").html(0);
                $("#progress_currentLiftWeightStatus_deadLift").html("进行中");

                $("#addOtherGoal_deadLift").addClass("disableCss");
                $("#deleteOtherGoal_deadLift").removeClass("disableCss");

                deadLiftID = data.toString();
            }
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            alert("增加深蹲目标时出错了");
            alert(errorThrown);
        }
    });
}

function addOtherGoal_barbellPress() {
    var startLiftWeight = $("#currentLiftWeightAmount_barbellPress").val();
    var startRepsCount = $("#currentRepsCountInput_barbellPress").val();
    var goalLiftWeight = $("#goalLiftWeightAmount_barbellPress").val();
    var goalRepsCount = $("#goalRepsCountInput_barbellPress").val();
    var goalDaysCount = $("#goalLiftWeightDaysCountAmount_barbellPress").val();
    if (startLiftWeight == "" || startLiftWeight == "undefined") {
        AlertBasic("当前能蹲起的重量不能为空，请填写。");
        return;
    }

    if (goalLiftWeight == "" || goalLiftWeight == "undefined") {
        AlertBasic("目标蹲起重量不能为空，请填写。");
        return;
    }

    if (goalDaysCount == "" || goalDaysCount == "undefined") {
        AlertBasic("目标达成日期不能为空，请填写。");
        return;
    }

    var startLiftWeightMax = EstimateRepMax(startLiftWeight, startRepsCount).toFixed(0);
    var goalLiftWeightMax = EstimateRepMax(goalLiftWeight, goalRepsCount).toFixed(0);

    if (goalLiftWeightMax * 1 <= startLiftWeightMax * 1) {
        AlertBasic("目标重量必须大于起始重量！");
        return;
    }
    $.ajax({
        type: "POST",
        url: "/zhenyuFitness/ashx/DealAjax.ashx",
        data: { ajaxtype: "addOtherGoal_barbellPress", startValue: startLiftWeightMax, goalValue: goalLiftWeightMax, goalDaysCount: goalDaysCount, type: "barbellPress", startLiftWeight: startLiftWeight, startRepsCount: startRepsCount, goalLiftWeight: goalLiftWeight, goalRepsCount: goalRepsCount },
        async: true,
        success: function (data) {
            if (data != "2") {//更新失败
                if (date == "1") {
                    AlertBasic("您尚未登录！请登录后重试。")
                }
                else if (date == "3") {
                    AlertBasic("更新数据时出错，请重试！");
                }
                else {
                    AlertBasic("什么都没有发生！");
                }
            }
            else {//数据库更新成功，更新前台数据
                //刷新前台页面
                $("#barbellPressGoal").modal("hide");
                AlertBasic("设定目标：杠铃平板卧推成功。");
                $("#startValueHtml_barbellPress").html(startLiftWeightMax);
                var nowDate = new Date();
                $("#startDateHtml_barbellPress").html(nowDate.getFullYear() + "-" + (nowDate.getMonth() * 1 + 1).toString() + "-" + nowDate.getDate());
                $("#goalValueHtml_barbellPress").html(goalLiftWeightMax);
                $("#goalDaysLeftHtml").html(goalDaysCount);
                $("#progress_currentLiftWeightAmount_barbellPress").html(startLiftWeightMax);
                $("#progress_currentLiftWeightAchievedPercent_barbellPress").html(0);
                $("#progress_currentLiftWeightStatus_barbellPress").html("进行中");

                $("#addOtherGoal_barbellPress").addClass("disableCss");
                $("#deleteOtherGoal_barbellPress").removeClass("disableCss");

                barbellPressID = data.toString();
            }
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            alert("增加深蹲目标时出错了");
            alert(errorThrown);
        }
    });
}

function addOtherGoal_shoulderPress() {
    var startLiftWeight = $("#currentLiftWeightAmount_shoulderPress").val();
    var startRepsCount = $("#currentRepsCountInput_shoulderPress").val();
    var goalLiftWeight = $("#goalLiftWeightAmount_shoulderPress").val();
    var goalRepsCount = $("#goalRepsCountInput_shoulderPress").val();
    var goalDaysCount = $("#goalLiftWeightDaysCountAmount_shoulderPress").val();
    if (startLiftWeight == "" || startLiftWeight == "undefined") {
        AlertBasic("当前能蹲起的重量不能为空，请填写。");
        return;
    }

    if (goalLiftWeight == "" || goalLiftWeight == "undefined") {
        AlertBasic("目标蹲起重量不能为空，请填写。");
        return;
    }

    if (goalDaysCount == "" || goalDaysCount == "undefined") {
        AlertBasic("目标达成日期不能为空，请填写。");
        return;
    }

    var startLiftWeightMax = EstimateRepMax(startLiftWeight, startRepsCount).toFixed(0);
    var goalLiftWeightMax = EstimateRepMax(goalLiftWeight, goalRepsCount).toFixed(0);

    if (goalLiftWeightMax * 1 <= startLiftWeightMax * 1) {
        AlertBasic("目标重量必须大于起始重量！");
        return;
    }
    $.ajax({
        type: "POST",
        url: "/zhenyuFitness/ashx/DealAjax.ashx",
        data: { ajaxtype: "addOtherGoal_shoulderPress", startValue: startLiftWeightMax, goalValue: goalLiftWeightMax, goalDaysCount: goalDaysCount, type: "shoulderPress", startLiftWeight: startLiftWeight, startRepsCount: startRepsCount, goalLiftWeight: goalLiftWeight, goalRepsCount: goalRepsCount },
        async: true,
        success: function (data) {
            if (data != "2") {//更新失败
                if (date == "1") {
                    AlertBasic("您尚未登录！请登录后重试。")
                }
                else if (date == "3") {
                    AlertBasic("更新数据时出错，请重试！");
                }
                else {
                    AlertBasic("什么都没有发生！");
                }
            }
            else {//数据库更新成功，更新前台数据
                //刷新前台页面
                $("#shoulderPressGoal").modal("hide");
                AlertBasic("设定目标：杠铃肩上推举成功。");
                $("#startValueHtml_shoulderPress").html(startLiftWeightMax);
                var nowDate = new Date();
                $("#startDateHtml_shoulderPress").html(nowDate.getFullYear() + "-" + (nowDate.getMonth() * 1 + 1).toString() + "-" + nowDate.getDate());
                $("#goalValueHtml_shoulderPress").html(goalLiftWeightMax);
                $("#goalDaysLeftHtml").html(goalDaysCount);
                $("#progress_currentLiftWeightAmount_shoulderPress").html(startLiftWeightMax);
                $("#progress_currentLiftWeightAchievedPercent_shoulderPress").html(0);
                $("#progress_currentLiftWeightStatus_shoulderPress").html("进行中");

                $("#addOtherGoal_shoulderPress").addClass("disableCss");
                $("#deleteOtherGoal_shoulderPress").removeClass("disableCss");

                shoulderPressID = data.toString();
            }
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            alert("增加深蹲目标时出错了");
            alert(errorThrown);
        }
    });
}

function addOtherGoal_barbellRow() {
    var startLiftWeight = $("#currentLiftWeightAmount_barbellRow").val();
    var startRepsCount = $("#currentRepsCountInput_barbellRow").val();
    var goalLiftWeight = $("#goalLiftWeightAmount_barbellRow").val();
    var goalRepsCount = $("#goalRepsCountInput_barbellRow").val();
    var goalDaysCount = $("#goalLiftWeightDaysCountAmount_barbellRow").val();
    if (startLiftWeight == "" || startLiftWeight == "undefined") {
        AlertBasic("当前能蹲起的重量不能为空，请填写。");
        return;
    }

    if (goalLiftWeight == "" || goalLiftWeight == "undefined") {
        AlertBasic("目标蹲起重量不能为空，请填写。");
        return;
    }

    if (goalDaysCount == "" || goalDaysCount == "undefined") {
        AlertBasic("目标达成日期不能为空，请填写。");
        return;
    }

    var startLiftWeightMax = EstimateRepMax(startLiftWeight, startRepsCount).toFixed(0);
    var goalLiftWeightMax = EstimateRepMax(goalLiftWeight, goalRepsCount).toFixed(0);

    if (goalLiftWeightMax * 1 <= startLiftWeightMax * 1) {
        AlertBasic("目标重量必须大于起始重量！");
        return;
    }
    $.ajax({
        type: "POST",
        url: "/zhenyuFitness/ashx/DealAjax.ashx",
        data: { ajaxtype: "addOtherGoal_barbellRow", startValue: startLiftWeightMax, goalValue: goalLiftWeightMax, goalDaysCount: goalDaysCount, type: "barbellRow", startLiftWeight: startLiftWeight, startRepsCount: startRepsCount, goalLiftWeight: goalLiftWeight, goalRepsCount: goalRepsCount },
        async: true,
        success: function (data) {
            if (data != "2") {//更新失败
                if (date == "1") {
                    AlertBasic("您尚未登录！请登录后重试。")
                }
                else if (date == "3") {
                    AlertBasic("更新数据时出错，请重试！");
                }
                else {
                    AlertBasic("什么都没有发生！");
                }
            }
            else {//数据库更新成功，更新前台数据
                //刷新前台页面
                $("#barbellRowGoal").modal("hide");
                AlertBasic("设定目标：杠铃划船成功。");
                $("#startValueHtml_barbellRow").html(startLiftWeightMax);
                var nowDate = new Date();
                $("#startDateHtml_barbellRow").html(nowDate.getFullYear() + "-" + (nowDate.getMonth() * 1 + 1).toString() + "-" + nowDate.getDate());
                $("#goalValueHtml_barbellRow").html(goalLiftWeightMax);
                $("#goalDaysLeftHtml").html(goalDaysCount);
                $("#progress_currentLiftWeightAmount_barbellRow").html(startLiftWeightMax);
                $("#progress_currentLiftWeightAchievedPercent_barbellRow").html(0);
                $("#progress_currentLiftWeightStatus_barbellRow").html("进行中");

                $("#addOtherGoal_barbellRow").addClass("disableCss");
                $("#deleteOtherGoal_barbellRow").removeClass("disableCss");

                barbellRowID = data.toString();
            }
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            alert("增加深蹲目标时出错了");
            alert(errorThrown);
        }
    });
}

function addOtherGoal_barbellCurl() {
    var startLiftWeight = $("#currentLiftWeightAmount_barbellCurl").val();
    var startRepsCount = $("#currentRepsCountInput_barbellCurl").val();
    var goalLiftWeight = $("#goalLiftWeightAmount_barbellCurl").val();
    var goalRepsCount = $("#goalRepsCountInput_barbellCurl").val();
    var goalDaysCount = $("#goalLiftWeightDaysCountAmount_barbellCurl").val();
    if (startLiftWeight == "" || startLiftWeight == "undefined") {
        AlertBasic("当前能蹲起的重量不能为空，请填写。");
        return;
    }

    if (goalLiftWeight == "" || goalLiftWeight == "undefined") {
        AlertBasic("目标蹲起重量不能为空，请填写。");
        return;
    }

    if (goalDaysCount == "" || goalDaysCount == "undefined") {
        AlertBasic("目标达成日期不能为空，请填写。");
        return;
    }

    var startLiftWeightMax = EstimateRepMax(startLiftWeight, startRepsCount).toFixed(0);
    var goalLiftWeightMax = EstimateRepMax(goalLiftWeight, goalRepsCount).toFixed(0);

    if (goalLiftWeightMax * 1 <= startLiftWeightMax * 1) {
        AlertBasic("目标重量必须大于起始重量！");
        return;
    }
    $.ajax({
        type: "POST",
        url: "/zhenyuFitness/ashx/DealAjax.ashx",
        data: { ajaxtype: "addOtherGoal_barbellCurl", startValue: startLiftWeightMax, goalValue: goalLiftWeightMax, goalDaysCount: goalDaysCount, type: "barbellCurl", startLiftWeight: startLiftWeight, startRepsCount: startRepsCount, goalLiftWeight: goalLiftWeight, goalRepsCount: goalRepsCount },
        async: true,
        success: function (data) {
            if (data != "2") {//更新失败
                if (date == "1") {
                    AlertBasic("您尚未登录！请登录后重试。")
                }
                else if (date == "3") {
                    AlertBasic("更新数据时出错，请重试！");
                }
                else {
                    AlertBasic("什么都没有发生！");
                }
            }
            else {//数据库更新成功，更新前台数据
                //刷新前台页面
                $("#barbellCurlGoal").modal("hide");
                AlertBasic("设定目标：杠铃二头弯举成功。");
                $("#startValueHtml_barbellCurl").html(startLiftWeightMax);
                var nowDate = new Date();
                $("#startDateHtml_barbellCurl").html(nowDate.getFullYear() + "-" + (nowDate.getMonth() * 1 + 1).toString() + "-" + nowDate.getDate());
                $("#goalValueHtml_barbellCurl").html(goalLiftWeightMax);
                $("#goalDaysLeftHtml").html(goalDaysCount);
                $("#progress_currentLiftWeightAmount_barbellCurl").html(startLiftWeightMax);
                $("#progress_currentLiftWeightAchievedPercent_barbellCurl").html(0);
                $("#progress_currentLiftWeightStatus_barbellCurl").html("进行中");

                $("#addOtherGoal_barbellCurl").addClass("disableCss");
                $("#deleteOtherGoal_barbellCurl").removeClass("disableCss");

                barbellCurlID = data.toString();
            }
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            alert("增加深蹲目标时出错了");
            alert(errorThrown);
        }
    });
}
//end：添加力量型目标
//********************结束：目标设定***************************




//********************开始：目标删除***************************
//初始化力量型目标删除框
function initDeleteOtherGoalmodal(type) {
    if (type == "squats") {
        $(".strengthSubTitlName").html("自由杠铃深蹲");
        $(".strengthSubTitleCreateDate").html($("#startDateHtml_squats").html());
    }
    else if (type == "deadLift") {
        $(".strengthSubTitlName").html("传统杠铃硬拉");
        $(".strengthSubTitleCreateDate").html($("#startDateHtml_deadLift").html());
    }
    else if (type == "barbellPress") {
        $(".strengthSubTitlName").html("杠铃平板卧推");
        $(".strengthSubTitleCreateDate").html($("#startDateHtml_barbellPress").html());
    }
    else if (type == "shoulderPress") {
        $(".strengthSubTitlName").html("杠铃肩上推举");
        $(".strengthSubTitleCreateDate").html($("#startDateHtml_shoulderPress").html());
    }
    else if (type == "barbellRow") {
        $(".strengthSubTitlName").html("杠铃划船");
        $(".strengthSubTitleCreateDate").html($("#startDateHtml_barbellRow").html());
    }
    else if (type == "barbellCurl") {
        $(".strengthSubTitlName").html("杠铃二头弯举");
        $(".strengthSubTitleCreateDate").html($("#startDateHtml_barbellCurl").html());
    }
    else {

    }
}

//删除力量型目标
function deleteOtherGoal() {
    var type;
    var strengthGoalID;

    if ($("#deleteOtherGoal .strengthSubTitlName").html() == '自由杠铃深蹲') {
        type = "squats";
        if (squatsID == "" || squatsID == "undefined") {
            AlertBasic("您没有设定过该项力量型目标。")
            return;
        }
        else {
            strengthGoalID = squatsID;
            alert(strengthGoalID);
        }
    }
    else if ($("#deleteOtherGoal .strengthSubTitlName").html() == '杠铃传统硬拉') {
        type = "deadLift";
        if (deadLiftID == "" || deadLiftID == "undefined") {
            AlertBasic("您没有设定过该项力量型目标。")
            return;
        }
        else {
            strengthGoalID = deadLiftID;
        }
    }
    else if ($("#deleteOtherGoal .strengthSubTitlName").html() == '杠铃平板卧推') {
        type = "barbellPress";
        if (barbellPressID == "" || barbellPressID == "undefined") {
            AlertBasic("您没有设定过该项力量型目标。")
            return;
        }
        else {
            strengthGoalID = barbellPressID;
        }
    }
    else if ($("#deleteOtherGoal .strengthSubTitlName").html() == '杠铃肩上推举') {
        type = "shoulderPress";
        if (shoulderPressID == "" || shoulderPressID == "undefined") {
            AlertBasic("您没有设定过该项力量型目标。")
            return;
        }
        else {
            strengthGoalID = shoulderPressID;
        }
    }
    else if ($("#deleteOtherGoal .strengthSubTitlName").html() == '杠铃划船') {
        type = "barbellRow";
        if (barbellRowID == "" || barbellRowID == "undefined") {
            AlertBasic("您没有设定过该项力量型目标。")
            return;
        }
        else {
            strengthGoalID = barbellRowID;
        }
    }
    else if ($("#deleteOtherGoal .strengthSubTitlName").html() == '杠铃二头弯举') {
        type = "barbellCurl";
        if (barbellCurlID == "" || barbellCurlID == "undefined") {
            AlertBasic("您没有设定过该项力量型目标。")
            return;
        }
        else {
            strengthGoalID = barbellCurlID;
        }
    }
    else {
        type = "";
    }
    $.ajax({
        type: "POST",
        url: "/zhenyuFitness/ashx/DealAjax.ashx",
        data: { ajaxtype: "deleteOtherGoal", type: type, strengthGoalID: strengthGoalID },
        async: true,
        success: function (data) {
            if (data != "2") {//更新失败

            }
            else {//数据库更新成功，更新前台数据
                AlertBasic("删除成功");

                if (type == "squats") {
                    $("#addOtherGoal_squats").removeClass("disableCss");
                    $("#deleteOtherGoal_squats").addClass("disableCss");
                    $("#updateOtherGoal_squats").removeClass("disableCss");
                }
                else if (type == "deadLift") {
                    $("#addOtherGoal_deadLift").removeClass("disableCss");
                    $("#deleteOtherGoal_deadLift").addClass("disableCss");
                    $("#updateOtherGoal_deadLift").removeClass("disableCss");
                }
                else if (type == "barbellPress") {
                    $("#addOtherGoal_barbellPress").removeClass("disableCss");
                    $("#deleteOtherGoal_barbellPress").addClass("disableCss");
                    $("#updateOtherGoal_barbellPress").removeClass("disableCss");
                }
                else if (type == "shoulderPress") {
                    $("#addOtherGoal_shoulderPress").removeClass("disableCss");
                    $("#deleteOtherGoal_shoulderPress").addClass("disableCss");
                    $("#updateOtherGoal_shoulderPress").removeClass("disableCss");
                }
                else if (type == "barbellRow") {
                    $("#addOtherGoal_barbellRow").removeClass("disableCss");
                    $("#deleteOtherGoal_barbellRow").addClass("disableCss");
                    $("#updateOtherGoal_barbellRow").removeClass("disableCss");
                }
                else if (type == "barbellCurl") {
                    $("#addOtherGoal_barbellCurl").removeClass("disableCss");
                    $("#deleteOtherGoal_barbellCurl").addClass("disableCss");
                    $("#updateOtherGoal_barbellCurl").removeClass("disableCss");
                }
                else {

                }

                
                //$("#addOtherGoal_barbellCurl").addClass("disableCss");
                //$("#deleteOtherGoal_barbellCurl").removeClass("disableCss");
            }
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            alert("删除目标时出错了");
            alert(errorThrown);
        }
    });
}
//********************结束：目标删除***************************





//********************开始：更新数据***************************
function initUpdateLiftWeightStats(type)
{
    $(".UpdateLiftWeightStats_goalLiftWeightAmount").val("");
    $(".UpdateLiftWeightStats_goalRepsCountInput_squats").val(8);
    $(".UpdateLiftWeightStats_goalLiftWeightRepsCount_squats").html(8);

    var dateNow = getCurrentDatetime();
    $(".strengthSubTitleCreateDate").html(dateNow);
    if (type == "squats") {
        $(".strengthSubTitlName").html("自由杠铃深蹲");
        $(".UpdateLiftWeightStats_moveDirectionDesc").html("蹲起");
        $("#currentUpdateLiftWeightStats_ModalType").val("squats");
    }
    else if (type == "deadLift") {
        $(".strengthSubTitlName").html("传统杠铃硬拉");
        $(".UpdateLiftWeightStats_moveDirectionDesc").html("拉起");
        $("#currentUpdateLiftWeightStats_ModalType").val("deadLift");
    }
    else if (type == "barbellPress") {
        $(".strengthSubTitlName").html("杠铃平板卧推");
        $(".UpdateLiftWeightStats_moveDirectionDesc").html("推起");
        $("#currentUpdateLiftWeightStats_ModalType").val("barbellPress");
    }
    else if (type == "shoulderPress") {
        $(".strengthSubTitlName").html("杠铃肩上推举");
        $(".UpdateLiftWeightStats_moveDirectionDesc").html("推起");
        $("#currentUpdateLiftWeightStats_ModalType").val("shoulderPress");
    }
    else if (type == "barbellRow") {
        $(".strengthSubTitlName").html("杠铃划船");
        $(".UpdateLiftWeightStats_moveDirectionDesc").html("拉起");
        $("#currentUpdateLiftWeightStats_ModalType").val("barbellRow");
    }
    else if (type == "barbellCurl") {
        $(".strengthSubTitlName").html("杠铃二头弯举");
        $(".UpdateLiftWeightStats_moveDirectionDesc").html("举起");
        $("#currentUpdateLiftWeightStats_ModalType").val("barbellCurl");
    }
    else {

    }
}

function updateModel_updateLiftWeightStats(goalLiftWeightAmount, goalRepsCount)
{
    if (goalLiftWeightAmount.length > 3) {
        $(".UpdateLiftWeightStats_goalLiftWeightAmount").val(parseInt(goalLiftWeightAmount / 10));
        $(".UpdateLiftWeightStats_goalLiftWeightOneRepsMax_squats").html((EstimateRepMax(goalLiftWeightAmount, goalRepsCount) / 10).toFixed(0));
    }
    else {
        $(".UpdateLiftWeightStats_goalLiftWeightAmount").val(parseInt(goalLiftWeightAmount));
        $(".UpdateLiftWeightStats_goalLiftWeightOneRepsMax_squats").html(EstimateRepMax(goalLiftWeightAmount, goalRepsCount).toFixed(0));
    }
    $('.UpdateLiftWeightStats_goalLiftWeightRepsCount_squats').html(goalRepsCount);
}

function updateLiftWeightStats()
{
    //alert(squatsID);
    var currentWeight = $(".UpdateLiftWeightStats_goalLiftWeightAmount").val();
    var currentReps = $(".UpdateLiftWeightStats_goalRepsCountInput_squats").val();
    var oneRepsMax = EstimateRepMax(currentWeight, currentReps);
    if (currentWeight == "" || currentWeight == "undefined")
    {
        AlertBasic("重量不能为空！请输入。")
        return;
    }
    if (currentReps == "" || currentReps == "undefined") {
        AlertBasic("重复次数不能为空！请输入。")
        return;
    }

    var typedesc = $("#updateLiftWeightStats .strengthSubTitlName").html();
    var type;
    var strengthGoalID;
    if (typedesc == "自由杠铃深蹲") {
        if (squatsID == "" || squatsID == "undefined") {
            AlertBasic("必须先建立该力量型目标，然后更新数据。")
            return;
        }
        else {
            strengthGoalID = squatsID;
        }
        type = "squats";
    }
    else if (typedesc == "传统杠铃硬拉") {
        if (deadLiftID == "" || deadLiftID == "undefined") {
            AlertBasic("必须先建立该力量型目标，然后更新数据。")
            return;
        }
        else {
            strengthGoalID = deadLiftID;
        }
        type = "squats";

    }
    else if (typedesc == "杠铃平板卧推") {
        if (barbellPressID == "" || barbellPressID == "undefined") {
            AlertBasic("必须先建立该力量型目标，然后更新数据。")
            return;
        }
        else {
            strengthGoalID = barbellPressID;
        }
        type = "barbellPress";
    }
    else if (typedesc == "杠铃肩上推举") {
        if (shoulderPressID == "" || shoulderPressID == "undefined") {
            AlertBasic("必须先建立该力量型目标，然后更新数据。")
            return;
        }
        else {
            strengthGoalID = shoulderPressID;
        }
        type = "shoulderPress";
    }
    else if (typedesc == "杠铃划船") {
        if (barbellRowID == "" || barbellRowID == "undefined") {
            AlertBasic("必须先建立该力量型目标，然后更新数据。")
            return;
        }
        else {
            strengthGoalID = barbellRowID;
        }
        type = "barbellRow";
    }
    else if (typedesc == "杠铃二头弯举") {
        if (barbellCurlID == "" || barbellCurlID == "undefined") {
            AlertBasic("必须先建立该力量型目标，然后更新数据。")
            return;
        }
        else {
            strengthGoalID = barbellCurlID;
        }
        type = "barbellCurl";
    }
    else {

    }

    $.ajax({
        type: "POST",
        url: "/zhenyuFitness/ashx/DealAjax.ashx",
        data: { ajaxtype: "updateLiftWeightStats", currentWeight: currentWeight, currentReps: currentReps, type: type, oneRepsMax: oneRepsMax, strengthGoalID: strengthGoalID },
        async: true,
        success: function (data) {
            if (data != "1") {//更新失败
                alert(data.toString());
                AlertBasic("更新数据失败，请重试。");
            }
            else {//数据库更新成功，更新前台数据
                //刷新前台页面
                AlertBasic("更新数据成功。");
                $("#updateLiftWeightStats").modal("hide");
            }
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            alert("增加深蹲目标时出错了");
            alert(errorThrown);
        }
    });



}





//********************结束：更新数据***************************

