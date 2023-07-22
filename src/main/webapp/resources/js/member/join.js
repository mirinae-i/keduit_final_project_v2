let join = {};

$(function () {
    $('#join_btn').click(function () {
        join.checkJoin();
    });
    join.checkJoin = function () {
        const id_regex = new RegExp('^[a-z][a-z0-9-_]*$');
        const id_string = $('#join_id').val();
        const pw_regex = new RegExp('[!@#$%^&*a-zA-Z0-9]+');
        const pw_string = $('#join_pw').val();
        const pw_re_string = $('#join_pw_re').val();
        const name_string = $('#join_name').val();
        const email_regex = new RegExp('^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+.[a-zA-Z]{2,}$');
        const email_string = $('#join_email').val();
        // ID check
        if (!id_string || !id_regex.test(id_string) || id_string.length < 6 || id_string.length > 20) {
            if (!id_string) {
                $('.join_chk').hide();
                $('#join_id_chk').text('ID를 입력하세요.');
                $('#join_id_chk').show();
            } else {
                $('.join_chk').hide();
                $('#join_id_chk').text(
                    'ID는 6자 이상 20자 이하, 영문 소문자와 숫자, -(하이픈), _(밑줄)로 구성되어야 하며 첫 글자는 영문 소문자여야 합니다.'
                );
                $('#join_id_chk').show();
            }
            // PW check
        } else if (!pw_string || !pw_regex.test(pw_string) || pw_string !== pw_re_string || pw_string.length < 8 || pw_string.length > 32) {
            if (!pw_string) {
                $('.join_chk').hide();
                $('#join_pw_chk').text('비밀번호를 입력하세요.');
                $('#join_pw_chk').show();
            } else if (!pw_regex.test(pw_string) || pw_string.length < 8 || pw_string.length > 32) {
                $('.join_chk').hide();
                $('#join_pw_chk').text('비밀번호는 8자 이상 32자 이하, 영문 소문자와 숫자, 특수문자로 구성되어야 합니다.');
                $('#join_pw_chk').show();
            } else {
                $('.join_chk').hide();
                $('#join_pw_re_chk').text('비밀번호가 일치하지 않습니다.');
                $('#join_pw_re_chk').show();
            }
            // Name check
        } else if (!name_string || name_string.length < 2 || name_string.length > 20) {
            if (!name_string) {
                $('.join_chk').hide();
                $('#join_name_chk').text('닉네임을 입력하세요.');
                $('#join_name_chk').show();
            } else {
                $('.join_chk').hide();
                $('#join_name_chk').text('닉네임은 2자 이상, 20자 이하여야 합니다.');
                $('#join_name_chk').show();
            }
            // Email check
        } else if (!email_string || !email_regex.test(email_string) || email_string.length < 5 || email_string.length > 100) {
            if (!email_string) {
                $('.join_chk').hide();
                $('#join_email_chk').text('이메일 주소를 입력하세요.');
                $('#join_email_chk').show();
            } else {
                $('.join_chk').hide();
                $('#join_email_chk').text('올바른 이메일 주소 양식이 아닙니다.');
                $('#join_email_chk').show();
            }
            // CheckBox check
        } else if (!$('#acc').prop('checked')) {
            $('.join_chk').hide();
            $('#join_acc_chk').text('개인정보 수집 및 이용동의 항목을 체크하세요.');
            $('#join_acc_chk').show();
        } else {
            $('.join_chk').hide();
            const param = {
                id: $('#join_id').val(),
                pw: $('#join_pw').val(),
                name: $('#join_name').val(),
                email: $('#join_email').val(),
            };
            $.ajax({
                url: '/member/join_action',
                type: 'POST',
                data: param,
                success: function (data) {
                    if (data === 'Success') {
                        alert('회원가입이 완료되었습니다. 회원가입한 ID로 로그인하세요.');
                        location.href = '/member/login';
                    } else if (data === 'Duplicate_ID') {
                        $('#join_id_chk').text('이미 사용중인 ID입니다.');
                        $('#join_id_chk').show();
                    } else if (data === 'Duplicate_Name') {
                        $('#join_name_chk').text('이미 사용중인 닉네임입니다.');
                        $('#join_name_chk').show();
                    } else if (data === 'Duplicate_Email') {
                        $('#join_email_chk').text('이미 사용중인 이메일 주소입니다.');
                        $('#join_email_chk').show();
                    } else {
                        $('#join_total_chk').text('회원 가입에 실패했습니다. 다시 시도해주세요.');
                        $('#join_total_chk').show();
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
