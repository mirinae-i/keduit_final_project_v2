let leave = {};

$(function () {
    $('#leave_btn').click(function () {
        leave.leaveCheck();
    });
    $('#goto_myinfo_btn').click(function () {
        location.href = '/member/my_info';
    });
    $('#goto_main_btn').click(function () {
        location.href = '/main/index';
    });
    leave.leaveCheck = function () {
        const pw_regex = new RegExp('[!@#$%^&*a-zA-Z0-9]+');
        const pw_string = $('#leave_pw').val();
        if (!pw_string || !pw_regex.test(pw_string) || pw_string.length < 8 || pw_string.length > 32) {
            if (!pw_string) {
                $('#leave_pw_chk').hide();
                $('#leave_pw_chk').text('비밀번호를 입력하세요.');
                $('#leave_pw_chk').show();
            } else {
                $('#leave_pw_chk').hide();
                $('#leave_pw_chk').text('비밀번호는 8자 이상 32자 이하, 영문 소문자와 숫자, 특수문자로 구성되어야 합니다.');
                $('#leave_pw_chk').show();
            }
        } else {
            $('#leave_pw_chk').hide();
            const param = {
                id: $('#leave_id').val(),
                pw: $('#leave_pw').val(),
            };
            $.ajax({
                url: '/member/leave_action',
                type: 'POST',
                data: param,
                success: function (data) {
                    if (data === 'Success') {
                        alert('회원 탈퇴가 완료되었습니다.');
                        location.href = '/member/leave_complete';
                    } else if (data === 'Fail') {
                        $('#leave_pw_chk').text('비밀번호가 일치하지 않습니다.');
                        $('#leave_pw_chk').show();
                    } else {
                        $('#leave_pw_chk').text('회원 탈퇴 작업이 실패했습니다. 다시 시도해주세요.');
                        $('#leave_pw_chk').show();
                        console.log('회원 탈퇴 실패');
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
