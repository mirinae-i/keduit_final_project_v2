let login = {};

$(function () {
    $('#login_pw').keyup(function (e) {
        // Keycode of Enter key: 13
        if (e.keyCode === 13) {
            $('#login_btn').trigger('click');
        }
    });
    $('#login_btn').click(function () {
        login.checkLogin();
    });
    $('#join_btn').click(function () {
        location.href = '/member/join';
    });
    $('#goto_main_btn').click(function () {
        location.href = '/member/main';
    });
    login.checkLogin = function () {
        const param = {
            id: $('#login_id').val(),
            pw: $('#login_pw').val(),
        };
        $.ajax({
            url: '/member/login_action',
            type: 'POST',
            data: param,
            success: function (data) {
                $('#login_id_chk').hide();
                $('#login_pw_chk').hide();
                if (data === 'Success') {
                    location.href = '/member/main';
                } else if (data === 'Not_Found') {
                    $('#login_id_chk').text('존재하지 않는 ID입니다.');
                    $('#login_id_chk').show();
                } else if (data === 'PW_Mismatch') {
                    $('#login_pw_chk').text('비밀번호가 일치하지 않습니다.');
                    $('#login_pw_chk').show();
                } else {
                    alert('로그인 실패');
                    console.log('로그인 실패');
                }
            },
            error: function (e) {
                console.log('서버 연결 실패');
                console.log(e);
            },
        });
    };
});
