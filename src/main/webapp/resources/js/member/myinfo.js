let modify = {};
let hashed_pw;

$(function () {
    $('#modify_btn').click(function () {
        modify.enableModify();
    });
    $('#cancel_btn').click(function () {
        modify.disableModify();
    });
    $('#modify_commit_btn').click(function () {
        modify.modifyCheck();
    });
    $('.goto_main_btn').click(function () {
        location.href = '/member/main';
    });
    modify.enableModify = function () {
        $('.modify_frm').removeAttr('readonly');
        $('#modify_pw').attr('placeholder', '새로운 비밀번호를 입력해주세요.');
        hashed_pw = $('#modify_pw').val();
        $('#modify_pw').val('');
        $('#modify_btn').hide();
        $('#goto_main_btn').hide();
        $('#modify_pw_re').attr('placeholder', '비밀번호를 다시 입력해주세요.');
        $('#modify_pw_re_div').show();
        $('#modify_commit_btn').show();
        $('#cancel_btn').show();
    };
    modify.disableModify = function () {
        $('.modify_frm').attr('readonly', 'readonly');
        $('#modify_pw').val(hashed_pw);
        $('#modify_btn').show();
        $('#goto_main_btn').show();
        $('#modify_pw_re_div').hide();
        $('#modify_commit_btn').hide();
        $('#cancel_btn').hide();
    };
    modify.modifyCheck = function () {
        const pw_regex = new RegExp('[!@#$%^&*a-zA-Z0-9]+');
        const pw_string = $('#modify_pw').val();
        const pw_re_string = $('#modify_pw_re').val();
        const name_string = $('#modify_name').val();
        const email_regex = new RegExp('^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+.[a-zA-Z]{2,}$');
        const email_string = $('#modify_email').val();
        if (!pw_string || !pw_regex.test(pw_string) || pw_string !== pw_re_string || pw_string.length < 8 || pw_string.length > 32) {
            if (!pw_string) {
                $('.modify_chk').hide();
                $('#modify_pw_chk').text('비밀번호를 입력하세요.');
                $('#modify_pw_chk').show();
            } else if (!pw_regex.test(pw_string) || pw_string.length < 8 || pw_string.length > 32) {
                $('.join_chk').hide();
                $('#modify_pw_chk').text('비밀번호는 8자 이상 32자 이하, 영문 소문자와 숫자, 특수문자로 구성되어야 합니다.');
                $('#modify_pw_chk').show();
            } else {
                $('.modify_chk').hide();
                $('#modify_pw_re_chk').text('비밀번호가 일치하지 않습니다.');
                $('#modify_pw_re_chk').show();
            }
            // Name check
        } else if (!name_string || name_string.length < 2 || name_string.length > 20) {
            if (!name_string) {
                $('.modify_chk').hide();
                $('#modify_name_chk').text('닉네임을 입력하세요.');
                $('#modify_name_chk').show();
            } else {
                $('.modify_chk').hide();
                $('#modify_name_chk').text('닉네임은 2자 이상, 20자 이하여야 합니다.');
                $('#modify_name_chk').show();
            }
            // Email check
        } else if (!email_string || !email_regex.test(email_string) || email_string.length < 5 || email_string.length > 100) {
            if (!email_string) {
                $('.modify_chk').hide();
                $('#modify_email_chk').text('이메일 주소를 입력하세요.');
                $('#modify_email_chk').show();
            } else {
                $('.modify_chk').hide();
                $('#modify_email_chk').text('올바른 이메일 주소 양식이 아닙니다.');
                $('#modify_email_chk').show();
            }
        } else {
            $('.modify_chk').hide();
            const param = {
                id: $('#modify_id').val(),
                pw: $('#modify_pw').val(),
                name: $('#modify_name').val(),
                email: $('#modify_email').val(),
            };
            $.ajax({
                url: '/member/modify_action',
                type: 'POST',
                data: param,
                success: function (data) {
                    if (data === 'Success') {
                        alert('회원 정보가 수정되었습니다. 다시 로그인해주세요.');
                        location.href = '/member/modify_complete';
                    } else if (data === 'Duplicate_ID') {
                        $('#modify_id_chk').text('이미 사용중인 ID입니다.');
                        $('#modify_id_chk').show();
                    } else if (data === 'Duplicate_Name') {
                        $('#modify_name_chk').text('이미 사용중인 닉네임입니다.');
                        $('#modify_name_chk').show();
                    } else if (data === 'Duplicate_Email') {
                        $('#modify_email_chk').text('이미 사용중인 이메일 주소입니다.');
                        $('#modify_email_chk').show();
                    } else {
                        $('#modify_total_chk').text('회원 정보 수정 작업이 실패했습니다. 다시 시도해주세요.');
                        $('#modify_total_chk').show();
                        console.log('회원 가입 실패');
                    }
                },
                error: function (e) {
                    console.log('서버 연결 실패');
                    console.log(e);
                },
            });
        }
    };
});
