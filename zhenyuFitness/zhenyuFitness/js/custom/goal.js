var FormWizard = function () {
    return {
        init: function () {
            if (!jQuery().bootstrapWizard) {
                return;
            }
            /*-----------------------------------------------------------------------------------*/
            /*	Show country list in Uniform style
			/*-----------------------------------------------------------------------------------*/
            $("#province_select").select2({
                placeholder: ""
            });

            var wizform = $('#registerForm');
            var alert_success = $('.alert-success', wizform);
            var alert_error = $('.alert-danger', wizform);

            $('#steptitle').html("请输入当前的身体数据");

            /*-----------------------------------------------------------------------------------*/
            /*	Validate the form elements
			/*-----------------------------------------------------------------------------------*/
            wizform.validate({
                doNotHideMessage: true,
                errorClass: 'error-span',
                errorElement: 'span',
                rules: {
                    /* �����˺� */
                    height: {
                        required: true,
                        number: true
                    },
                    weight: {
                        required: true,
                        number: true
                    },




                    email: {
                        required: true,
                        email: true,
                        maxlength: 49
                    },
                    password: {
                        minlength: 3,
                        required: true,
                        rangelength: [4, 15]
                    },
                    name: {
                        required: true,
                        maxlength: 29
                    },
                    gender: {
                        required: true
                    },
                    confirmpassword: {
                        required: true,
                        equalTo: '#password'

                    },
                    province: {
                        required: true
                    },
                    //country: {
                    //    required: true
                    //},
                    phone: {
                        /*                        required: true,*/
                        digits: true
                    },

                    /* ������Ϣ */
                    birthday: {
                        required: true

                    },

                    fitHis: {
                        required: true
                    }
                    //card_number: {
                    //	required: true,
                    //    minlength: 16,
                    //    maxlength: 16
                    //},
                    //card_cvc: {
                    //	required: true,
                    //    digits: true,
                    //    minlength: 3,
                    //    maxlength: 3
                    //},
                    //card_expirydate: {
                    //    required: true
                    //},
                    // card_holder_name: {
                    //    required: true
                    //}
                },

                invalidHandler: function (event, validator) {
                    alert_success.hide();
                    alert_error.show();
                },

                highlight: function (element) {
                    $(element)
                        .closest('.form-group').removeClass('has-success').addClass('has-error');
                },

                unhighlight: function (element) {
                    $(element)
                        .closest('.form-group').removeClass('has-error');
                },

                success: function (label) {
                    if (label.attr("for") == "gender") {
                        label.closest('.form-group').removeClass('has-error').addClass('has-success');
                        label.remove();
                    } else {
                        label.addClass('valid')
                        .closest('.form-group').removeClass('has-error').addClass('has-success');
                    }


                }
            });

            /*-----------------------------------------------------------------------------------*/
            /*	Initialize Bootstrap Wizard
			/*-----------------------------------------------------------------------------------*/
            $('#formWizard').bootstrapWizard({
                'nextSelector': '.nextBtn',
                'previousSelector': '.prevBtn',
                onNext: function (tab, navigation, index) {
                    if (index == 1) {
                        /* 验证身高、体重、腰围输入的正确性 */
                        $('#error-span-top').html("");
                        var tag = 0;
                        var height = parseFloat($('#input-1').val());
                        var weight = parseFloat($('#input-2').val());
                        var waist = parseFloat($('#input-3').val());
                        if ($('#input-1').val().length == 0) {
                            tag = 1;
                            $('#error-span-top').html($('#error-span-top').html() + "身高必须填写。此数值将参与估算您的体脂率。<br />");
                        }
                        if ($('#input-2').val().length == 0) {
                            tag = 1;
                            $('#error-span-top').html($('#error-span-top').html() + "体重必须填写。此数值将参与估算您的体脂率。<br />");
                        }
                        if ($('#input-3').val().length == 0) {
                            tag = 1;
                            $('#error-span-top').html($('#error-span-top').html() + "腰围必须填写。此数值将参与估算您的体脂率。<br />");
                        }
                        if ($('#input-1').val().length != 0 && (isNaN(height) || height > 300 || height <= 0)) {
                            tag = 1;
                            if (isNaN(height)) {
                                $('#error-span-top').html($('#error-span-top').html() + "身高必须为数字。<br />");
                            }
                            if (height > 3) {
                                $('#error-span-top').html($('#error-span-top').html() + "您的身高似乎不太可能超过3米……<br />");
                            }
                            if (height < 0.5) {
                                $('#error-span-top').html($('#error-span-top').html() + "您的身高似乎不太可能小于0.5米……<br />");
                            }
                        }


                        if ($('#input-2').val().length != 0 && (isNaN(weight) || weight > 300 || weight < 20)) {
                            tag = 1;
                            if (isNaN(weight)) {
                                $('#error-span-top').html($('#error-span-top').html() + "体重必须为数字。<br />");
                            }
                            if (weight > 300) {
                                $('#error-span-top').html($('#error-span-top').html() + "您的体重似乎不太可能超过300千克……<br />");
                            }
                            if (weight < 20) {
                                $('#error-span-top').html($('#error-span-top').html() + "您的体重似乎不太可能小于20千克……<br />");
                            }
                        }

                        if ($('#input-3').val().length != 0 && (isNaN(waist) || waist > 300 || waist < 20)) {
                            tag = 1;
                            if (isNaN(waist)) {
                                $('#error-span-top').html($('#error-span-top').html() + "腰围必须为数字。<br />");
                            }
                            if (waist > 300) {
                                $('#error-span-top').html($('#error-span-top').html() + "您的腰围似乎不太可能超过300厘米……<br />");
                            }
                            if (waist < 20) {
                                $('#error-span-top').html($('#error-span-top').html() + "您的腰围似乎不太可能小于20厘米……<br />");
                            }
                        }

                        if (tag == 1) {
                            alert_error.show();
                            return false;
                        }
                    }
                    /* end 验证身高、体重、腰围输入的正确性 */

                    /*根据input-1,input-2,input-3,以及用户的年龄和性别来计算体脂率*/
                    if (index == 1) {
                        var bodyfat = calculateBodyfat($('#input-1').val(), $('#input-2').val(), $('#input-3').val(), $('#gender').val(), $('#age').val());
                        $('#input-4').val(bodyfat.toFixed(2));
                        initinput();
                        /*end 根据input-1,input-2,input-3,以及用户的年龄和性别来计算体脂率*/

                        /*初始化step2_part2里的参数*/
                        //设置bodyfat
                        $("#step2_part2_bodyfatrate_span").html(bodyfat.toFixed(2) + "%");
                        //设置参数显示
                        if ($("#gender").val() == 0) {
                            $("#step2_part2_gender_span").html("男");
                        }
                        if ($("#gender").val() == 1) {
                            $("#step2_part2_gender_span").html("女");
                        }
                        $("#step2_part2_age_span").html($("#age").val());
                        $("#step2_part2_height_span").html($('#input-1').val());
                        $("#step2_part2_weight_span").html($('#input-2').val());
                        $("#step2_part2_waist_span").html($('#input-3').val());

                        //设置对比数据、体型图片-男
                        bodyfat /= 100;
                        if ($("#gender").val() == 0)//男性
                        {
                            ////对比
                            //$("#step2_part2_img_constrast_lean").attr('src', "http://localhost/resources/img/对比/male_lean.jpg");
                            //$("#step2_part2_img_constrast_lean_chart").attr('src', "http://localhost/resources/img/对比/male_lean_chart.png");
                            //$("#step2_part2_constrast_height_lean").html("身高：1.8米");
                            //$("#step2_part2_constrast_weight_lean").html("体重：90千克");
                            //$("#step2_part2_constrast_bodyfat_lean").html("体脂率：9%");
                            //$("#step2_part2_img_constrast_large").attr('src', "http://localhost/resources/img/对比/male_large.jpg");
                            //$("#step2_part2_img_constrast_large_chart").attr('src', "http://localhost/resources/img/对比/male_large_chart.png");
                            //$("#step2_part2_constrast_height_large").html("身高：1.8米");
                            //$("#step2_part2_constrast_weight_large").html("体重：90千克");
                            //$("#step2_part2_constrast_bodyfat_large").html("体脂率：26%");

                            //if (bodyfat <= 0.05) {
                            //    $("#step2_part2_img").attr('src', "http://localhost/resources/img/bodyfatpercentage/5_man_shadow.jpg");
                            //}
                            //else if (bodyfat > 0.05 && bodyfat <= 0.1) {
                            //    $("#step2_part2_img").attr('src', "http://localhost/resources/img/bodyfatpercentage/10_man_shadow.jpg");
                            //}
                            //else if (bodyfat > 0.1 && bodyfat <= 0.15) {
                            //    $("#step2_part2_img").attr('src', "http://localhost/resources/img/bodyfatpercentage/15_man_shadow.jpg");
                            //}
                            //else if (bodyfat > 0.15 && bodyfat <= 0.2) {
                            //    $("#step2_part2_img").attr('src', "http://localhost/resources/img/bodyfatpercentage/20_man_shadow.jpg");
                            //}
                            //else if (bodyfat > 0.2 && bodyfat <= 0.25) {
                            //    $("#step2_part2_img").attr('src', "http://localhost/resources/img/bodyfatpercentage/25_man_shadow.jpg");
                            //}
                            //else if (bodyfat > 0.25 && bodyfat <= 0.3) {
                            //    $("#step2_part2_img").attr('src', "http://localhost/resources/img/bodyfatpercentage/30_man_shadow.jpg");
                            //}
                            //else if (bodyfat > 0.3 && bodyfat <= 0.35) {
                            //    $("#step2_part2_img").attr('src', "http://localhost/resources/img/bodyfatpercentage/35_man_shadow.jpg");
                            //}
                            //else {
                            //    $("#step2_part2_img").attr('src', "http://localhost/resources/img/bodyfatpercentage/40_man_shadow.jpg");
                            //}


                            ////初始化step2_part3图片
                            //var listimg1 = $("#select_img_bodyfat1 img");
                            //for (i = 0; i < listimg1.length; i++) {
                            //    var src = "http://localhost/resources/img/bodyfatpercentage/" + (i + 2) * 5 + "_man.jpg";
                            //    listimg1.eq(i).attr('src', src);
                            //}

                            //var listimg2 = $("#select_img_bodyfat2 img");
                            //for (i = 0; i < listimg2.length; i++) {
                            //    var src = "http://localhost/resources/img/bodyfatpercentage/" + (i + 4) * 5 + "_man.jpg";
                            //    listimg2.eq(i).attr('src', src);
                            //}



                        }
                        if ($("#gender").val() == 1)//女性
                        {
                            //对比
                            $("#step2_part2_constract_desc").html("下图两位女士同年龄(30)、同身高(165cm)、同体重(65kg)，但是身体形态差异却十分巨大！");
                            $("#step2_part2_img_constrast_lean").attr('src', "http://localhost/resources/img/对比/female_lean.jpg");
                            $("#step2_part2_img_constrast_lean_chart").attr('src', "http://localhost/resources/img/对比/female_lean_chart.png");
                            $("#step2_part2_constrast_height_lean").html("身高：1.65米");
                            $("#step2_part2_constrast_weight_lean").html("体重：65千克");
                            $("#step2_part2_constrast_bodyfat_lean").html("体脂率：13%");
                            $("#step2_part2_img_constrast_large").attr('src', "http://localhost/resources/img/对比/female_large.jpg");
                            $("#step2_part2_img_constrast_large_chart").attr('src', "http://localhost/resources/img/对比/female_large_chart.png");
                            $("#step2_part2_constrast_height_large").html("身高：1.65米");
                            $("#step2_part2_constrast_weight_large").html("体重：65千克");
                            $("#step2_part2_constrast_bodyfat_large").html("体脂率：33%");


                            if (bodyfat <= 0.1) {
                                $("#step2_part2_img").attr('src', "http://localhost/resources/img/bodyfatpercentage/10_women_shadow.jpg");
                            }
                            else if (bodyfat > 0.1 && bodyfat <= 0.15) {
                                $("#step2_part2_img").attr('src', "http://localhost/resources/img/bodyfatpercentage/15_women_shadow.jpg");
                            }
                            else if (bodyfat > 0.15 && bodyfat <= 0.2) {
                                $("#step2_part2_img").attr('src', "http://localhost/resources/img/bodyfatpercentage/20_women_shadow.jpg");
                            }
                            else if (bodyfat > 0.2 && bodyfat <= 0.25) {
                                $("#step2_part2_img").attr('src', "http://localhost/resources/img/bodyfatpercentage/25_women_shadow.jpg");
                            }
                            else if (bodyfat > 0.25 && bodyfat <= 0.3) {
                                $("#step2_part2_img").attr('src', "http://localhost/resources/img/bodyfatpercentage/30_women_shadow.jpg");
                            }
                            else {
                                $("#step2_part2_img").attr('src', "http://localhost/resources/img/bodyfatpercentage/35_women_shadow.jpg");
                            }

                            //初始化step2_part3图片
                            var listimg1 = $("#select_img_bodyfat1 img");
                            for (i = 0; i < listimg1.length; i++) {
                                var src = "http://localhost/resources/img/bodyfatpercentage/" + (i + 2) * 5 + "_women.jpg";
                                listimg1.eq(i).attr('src', src);
                            }

                            var listimg2 = $("#select_img_bodyfat2 img");
                            for (i = 0; i < listimg2.length; i++) {
                                var src = "http://localhost/resources/img/bodyfatpercentage/" + (i + 6) * 5 + "_women.jpg";
                                listimg2.eq(i).attr('src', src);
                            }

                            $("#step2_part3_last1").css('display', 'none');
                            $("#step2_part3_last2").css('display', 'none');

                            //设置图片说明
                            var listdesc = $("#select_img_bodyfat1 span");
                            for (i = 0; i < listdesc.length; i++) {
                                switch (i) {
                                    case 0:
                                        listdesc.eq(i).html("体脂率：10% &nbsp;纤细骨感");
                                        break;
                                    case 1:
                                        listdesc.eq(i).html("体脂率：15% &nbsp;气质性感");
                                        break;
                                    case 2:
                                        listdesc.eq(i).html("体脂率：20% &nbsp;活力健康");
                                        break;
                                    case 3:
                                        listdesc.eq(i).html("体脂率：25% &nbsp;健康柔美");
                                        break;
                                    default:
                                        break;
                                }
                            }

                            listdesc = $("#select_img_bodyfat2 span");
                            for (i = 0; i < listdesc.length; i++) {
                                switch (i) {
                                    case 0:
                                        listdesc.eq(i).html("体脂率：30% &nbsp;超重……");
                                        break;
                                    case 1:
                                        listdesc.eq(i).html("体脂率：35% &nbsp;肥胖……");
                                        break;
                                    default:
                                        break;
                                }
                            }
                        }



                        /* end 初始化step2_part2里的参数*/


                        
                    }


                    //设置步骤标题
                    showStepTitle(0, index);




                    alert_success.hide();
                    alert_error.hide();
                    if (wizform.valid() == false) {
                        return false;
                    }
                    var total = navigation.find('li').length;
                    var current = index + 1;
                    $('.stepHeader', $('#formWizard')).text('Step ' + (index + 1) + ' of ' + total);
                    jQuery('li', $('#formWizard')).removeClass("done");
                    var li_list = navigation.find('li');
                    for (var i = 0; i < index; i++) {
                        jQuery(li_list[i]).addClass("done");
                    }
                    if (current == 1) {
                        $('#formWizard').find('.prevBtn').hide();
                    } else {
                        $('#formWizard').find('.prevBtn').show();
                    }
                    if (current >= total) {
                        $('#formWizard').find('.nextBtn').hide();
                        $('#formWizard').find('.submitBtn').show();
                    } else {
                        $('#formWizard').find('.nextBtn').show();
                        $('#formWizard').find('.submitBtn').hide();
                    }
                },
                onPrevious: function (tab, navigation, index) {
                    showStepTitle(1, index);


                    alert_success.hide();
                    alert_error.hide();
                    var total = navigation.find('li').length;
                    var current = index + 1;
                    $('.stepHeader', $('#formWizard')).text('Step ' + (index + 1) + ' of ' + total);
                    jQuery('li', $('#formWizard')).removeClass("done");
                    var li_list = navigation.find('li');
                    for (var i = 0; i < index; i++) {
                        jQuery(li_list[i]).addClass("done");
                    }
                    if (current == 1) {
                        $('#formWizard').find('.prevBtn').hide();
                    } else {
                        $('#formWizard').find('.prevBtn').show();
                    }
                    if (current >= total) {
                        $('#formWizard').find('.nextBtn').hide();
                        $('#formWizard').find('.submitBtn').show();
                    } else {
                        $('#formWizard').find('.nextBtn').show();
                        $('#formWizard').find('.submitBtn').hide();
                    }
                },
                onTabClick: function (tab, navigation, index) {
                    //bootbox.alert('On Tab click is disabled');
                    return false;
                },
                onTabShow: function (tab, navigation, index) {
                    var total = navigation.find('li').length;
                    var current = index + 1;
                    var $percent = (current / total) * 100;
                    $('#formWizard').find('.progress-bar').css({
                        width: $percent + '%'
                    });
                }
            });

            $('#formWizard').find('.prevBtn').hide();
            $('#formWizard .submitBtn').click(function () {
                //bootbox.alert("提交成功。");
            }).hide();
        }
    };
}();


function showStepTitle(direction, index) {
    if (direction == 0)//next
    {
        if (index == 1) {
            $('#steptitle').html("请确认您的体脂率");
        }
        

    }
    if (direction == 1)//previous
    {
        if (index == 0) {
            $('#steptitle').html("请输入当前的身体数据");
        }
    }
}

function calculateBodyfat(height, weight, waist, gender, age) {
    return (calbodyfat1(weight, waist, gender) + calbodyfat2(weight, height, waist, age, gender)) / 2;
}

function calbodyfat1(weight, waist, gender) {
    var a = waist * 0.74;
    var b;
    if (gender == 0)//男性
        b = weight * 0.082 + 44.74;
    else b = weight * 0.082 + 34.89;//女性
    return (a - b) / weight * 100;
}


function calbodyfat2(weight, height, waist, age, gender) {
    var BMI = weight / (height * height) * 10000;
    var tag;
    if (gender == 0) tag = 1;//男性
    if (gender == 1) tag = 0;//女性
    return 1.2 * BMI + 0.23 * age - 5.4 - 10.8 * tag;
}


function initinput() {
    if (!String.prototype.trim) {
        (function () {
            var rtrim = /^[\s\uFEFF\xA0]+|[\s\uFEFF\xA0]+$/g;
            String.prototype.trim = function () {
                return this.replace(rtrim, '');
            };
        })();
    }

    [].slice.call(document.querySelectorAll('input.input__field')).forEach(function (inputEl) {
        if (inputEl.value.trim() !== '') {
            classie.add(inputEl.parentNode, 'input--filled');
        }

        inputEl.addEventListener('focus', onInputFocus);
        inputEl.addEventListener('blur', onInputBlur);
    });

    function onInputFocus(ev) {
        classie.add(ev.target.parentNode, 'input--filled');
    }

    function onInputBlur(ev) {
        if (ev.target.value.trim() === '') {
            classie.remove(ev.target.parentNode, 'input--filled');
        }
    }
}


