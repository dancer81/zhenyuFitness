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
                    //alert(index);
                    showStepTitle(0, index);

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
                        if (isNaN(height))
                        {
                            $('#error-span-top').html($('#error-span-top').html() + "身高必须为数字。<br />");
                        }
                        if (height > 3)
                        {
                            $('#error-span-top').html($('#error-span-top').html() + "您的身高似乎不太可能超过3米……<br />");
                        }
                        if (height < 0.5)
                        {
                            $('#error-span-top').html($('#error-span-top').html() + "您的身高似乎不太可能小于0.5米……<br />");
                        }
                    }


                    if ($('#input-2').val().length != 0 &&(isNaN(weight) || weight > 300 || weight < 20)) {
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
                    /* end 验证身高、体重、腰围输入的正确性 */






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
    if(direction == 0)//next
    {
        if(index == 1)
        {
            $('#steptitle').html("请确认您的体脂率");
        }

    }
    if(direction == 1)//previous
    {
        if(index == 0)
        {
            $('#steptitle').html("请输入当前的身体数据");
        }
    }
}


