function initMyGoal() {
    initEasyPie();
    initCountdown($("#goaldatespan").html());

    initchart();
}


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
        lineWidth:10
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


function initchart() {
    initchart1();
    initchart2();
    initchart3();
}

function initchart1() {

    var goalweight = [], weighthistory = [], t;
        for (var i = 0; i < 3; i++) {
            t = i + 10;
            //t = Math.floor(Math.random() * (30 + ((i % 12) * 5))) + 10;
            weighthistory.push(t);
        }

        for (var i = 0; i < 8; i++) {
            //t = Math.floor(t * 0.5);
            //t = t - Math.floor((Math.random() * t) / 2);
            t = 50;
            goalweight.push(t);
        }

        var data = [
                    {
                        name: '目标体重',
                        value: goalweight,
                        color: '#0d8ecf',
                        line_width: 2
                    },
                    {
                        name: '历史体重',
                        value: weighthistory,
                        color: '#ef7707',
                        line_width: 2
                    }
        ];

        var labels = ["2012-08-01", "2012-08-02", "2012-08-03", "2012-08-04", "2012-08-05", "2012-08-06" ,"2012-08-05", "2012-08-06"];
        var line = new iChart.LineBasic2D({
            render: 'chart1',
            data: data,
            align: 'center',
            title: '您的体重变化曲线',
            //subtitle: '平均每个人访问2-3个页面(访问量单位：万)',
            //footnote: '数据来源：模拟数据',
            width: 760,
            height: 350,
            border:{
				width:[0,0,0,0]
			},
            tip: {
                enable: true,
                shadow: true
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
                    end_scale: 100,
                    scale_space: 10,
                    scale_size: 2,
                    scale_color: '#9f9f9f'
                }, {
                    position: 'bottom',
                    labels: labels
                }]
            }
        });

        //开始画图
        line.draw();




}

function initchart2() {

    var pv = [], ip = [], t;
    for (var i = 0; i < 8; i++) {
        t = i + 10;
        //t = Math.floor(Math.random() * (30 + ((i % 12) * 5))) + 10;
        pv.push(t);
        //t = Math.floor(t * 0.5);
        //t = t - Math.floor((Math.random() * t) / 2);
        t = 50;
        ip.push(t);
    }

    var data = [
                {
                    name: '目标体脂率',
                    value: pv,
                    color: '#0d8ecf',
                    line_width: 2
                },
                {
                    name: '历史体脂率',
                    value: ip,
                    color: '#ef7707',
                    line_width: 2
                }
    ];

    var labels = ["2012-08-01", "2012-08-02", "2012-08-03", "2012-08-04", "2012-08-05", "2012-08-06", "2012-08-05", "2012-08-06"];
    var line = new iChart.LineBasic2D({
        render: 'chart2',
        data: data,
        align: 'center',
        title: '您的体脂率变化曲线',
        //subtitle: '平均每个人访问2-3个页面(访问量单位：万)',
        //footnote: '数据来源：模拟数据',
        width: 760,
        height: 400,
        border: {
            width: [0, 0, 0, 0]
        },
        tip: {
            enable: true,
            shadow: true
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
            grids: {
                vertical: {
                    way: 'share_alike',
                    value: 5
                }
            },
            scale: [{
                position: 'left',
                start_scale: 0,
                end_scale: 100,
                scale_space: 10,
                scale_size: 2,
                scale_color: '#9f9f9f'
            }, {
                position: 'bottom',
                labels: labels
            }]
        }
    });

    //开始画图
    line.draw();




}

function initchart3() {

    var pv = [], ip = [], t;
    for (var i = 0; i < 8; i++) {
        t = i + 10;
        //t = Math.floor(Math.random() * (30 + ((i % 12) * 5))) + 10;
        pv.push(t);
        //t = Math.floor(t * 0.5);
        //t = t - Math.floor((Math.random() * t) / 2);
        t = 50;
        ip.push(t);
    }

    var data = [
                {
                    name: '目标净体重',
                    value: pv,
                    color: '#0d8ecf',
                    line_width: 2
                },
                {
                    name: '历史净体重',
                    value: ip,
                    color: '#ef7707',
                    line_width: 2
                }
    ];

    var labels = ["2012-08-01", "2012-08-02", "2012-08-03", "2012-08-04", "2012-08-05", "2012-08-06", "2012-08-05", "2012-08-06"];
    var line = new iChart.LineBasic2D({
        render: 'chart3',
        data: data,
        align: 'center',
        title: '您的净体重变化曲线',
        //subtitle: '平均每个人访问2-3个页面(访问量单位：万)',
        //footnote: '数据来源：模拟数据',
        width: 760,
        height: 400,
        border: {
            width: [0, 0, 0, 0]
        },
        tip: {
            enable: true,
            shadow: true
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
            grids: {
                vertical: {
                    way: 'share_alike',
                    value: 5
                }
            },
            scale: [{
                position: 'left',
                start_scale: 0,
                end_scale: 100,
                scale_space: 10,
                scale_size: 2,
                scale_color: '#9f9f9f'
            }, {
                position: 'bottom',
                labels: labels
            }]
        }
    });

    //开始画图
    line.draw();




}
