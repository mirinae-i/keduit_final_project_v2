<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="../../../resources/css/bootstrap.min.css" />
    <script src="../../../resources/js/jquery-3.3.1.min.js"></script>
    <script src="../../../resources/js/bootstrap.min.js"></script>
    <title>회원 가입</title>
    <style>
      #join_id_chk,
      #join_pw_chk,
      #join_pw_re_chk,
      #join_name_chk,
      #join_email_chk {
        color: red;
      }
    </style>
  </head>
  <body>
    <div class="container">
      <div>
        <h1>회원 가입</h1>
        <hr />
      </div>
      <!-- 회원 가입 -->
      <div>
        <form>
          <div class="row">
            <div class="col col-md-2">
              <label for="join_id">ID: </label>
            </div>
            <div class="col col-md-10">
              <input id="join_id" type="text" />
              <label id="join_id_chk" style="display: none"></label>
            </div>
          </div>
          <div class="row">
            <div class="col col-md-2">
              <label for="join_pw">비밀번호: </label>
            </div>
            <div class="col col-md-10">
              <input id="join_pw" type="password" />
              <label id="join_pw_chk" style="display: none"></label>
            </div>
          </div>
          <div class="row">
            <div class="col col-md-2">
              <label for="join_pw_re">비밀번호 다시 입력: </label>
            </div>
            <div class="col col-md-10">
              <input id="join_pw_re" type="password" />
              <label id="join_pw_re_chk" style="display: none"></label>
            </div>
          </div>
          <div class="row">
            <div class="col col-md-2">
              <label for="join_name">닉네임: </label>
            </div>
            <div class="col col-md-10">
              <input id="join_name" type="text" />
              <label id="join_name_chk" style="display: none"></label>
            </div>
          </div>
          <div class="row">
            <div class="col col-md-2">
              <label for="join_email">이메일: </label>
            </div>
            <div class="col col-md-10">
              <input id="join_email" type="email" />
              <label id="join_email_chk" style="display: none"></label>
            </div>
          </div>
          <input id="join_btn" type="button" value="확인" />
          <button type="reset">다시 입력</button>
        </form>
      </div>
    </div>
    <script>
      $(function () {
        $('#join_btn').on('click', function () {
          let id = $('#join_id').val();
          let pw = $('#join_pw').val();
          let pw_re = $('#join_pw_re').val();
          let name = $('#join_name').val();
          let email = $('#join_email').val();
          let is_id_v = false;
          let is_pw_v = false;
          let is_pw_re_v = false;
          let is_name_v = false;
          let is_email_v = false;
          console.log('id: ' + id + ', pw: ' + pw + ', pw_re: ' + pw_re + ', name: ' + name + ', email: ' + email);
          // ID check
          if (!id) {
            $('#join_id_chk').text('ID를 입력하세요.');
            $('#join_id_chk').show();
          } else if (id.includes(' ')) {
            $('#join_id_chk').text('ID에 공백을 사용할 수 없습니다.');
            $('#join_id_chk').show();
          } else if (!/^[a-z][a-z0-9]*$/.test(id)) {
            $('#join_id_chk').text('ID는 영문 소문자 및 숫자만 사용 가능합니다. 첫 글자는 영문 소문자여야 합니다.');
            $('#join_id_chk').show();
          } else if (id.length < 4 || id.length > 20) {
            $('#join_id_chk').text('ID는 4자 이상, 20자 이하여야 합니다.');
            $('#join_id_chk').show();
          } else {
            is_id_v = true;
            $('#join_id_chk').hide();
          }
          // PW check
          if (!pw) {
            $('#join_pw_chk').text('비밀번호를 입력하세요.');
            $('#join_pw_chk').show();
          } else if (pw.includes(' ')) {
            $('#join_pw_chk').text('비밀번호에 공백을 사용할 수 없습니다.');
            $('#join_pw_chk').show();
          } else if (pw.length < 8 || pw.length > 64) {
            $('#join_pw_chk').text('비밀번호는 8자 이상, 64자 이하여야 합니다.');
            $('#join_pw_chk').show();
          } else if (!/^[a-zA-Z0-9!@#$%^&*]+$/.test(pw)) {
            $('#join_pw_chk').text('비밀번호에 사용할 수 없는 문자가 포함되어 있습니다.');
            $('#join_pw_chk').show();
          } else {
            is_pw_v = true;
            $('#join_pw_chk').hide();
          }
          // PW_re check
          if (pw.length > 0 && pw_re.length > 0 && pw === pw_re) {
            is_pw_re_v = true;
            $('#join_pw_re_chk').hide();
          } else {
            $('#join_pw_re_chk').text('비밀번호가 일치하지 않습니다.');
            $('#join_pw_re_chk').show();
          }
          // name check
          if (!name) {
            $('#join_name_chk').text('닉네임을 입력하세요.');
            $('#join_name_chk').show();
          } else if (name.length < 2 || name.length > 40) {
            $('#join_name_chk').text('닉네임은 2자 이상, 40자 이하여야 합니다.');
            $('#join_name_chk').show();
          } else {
            is_name_v = true;
            $('#join_name_chk').hide();
          }
          // email check
          if (!email) {
            $('#join_email_chk').text('이메일 주소를 입력하세요.');
            $('#join_email_chk').show();
          } else if (!/^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/.test(email)) {
            $('#join_email_chk').text('올바른 이메일 주소 형식이 아닙니다.');
            $('#join_email_chk').show();
          } else {
            is_email_v = true;
            $('#join_email_chk').hide();
          }
          if (is_id_v && is_pw_v && is_pw_re_v && is_name_v && is_email_v) {
            let v_form = document.createElement('form');
            v_form.method = 'post';
            v_form.action = '/member/join';
            // id
            let v_id = document.createElement('input');
            v_id.setAttribute('type', 'hidden');
            v_id.setAttribute('name', 'id');
            v_id.setAttribute('value', id);
            v_form.appendChild(v_id);
            // pw
            let v_pw = document.createElement('input');
            v_pw.setAttribute('type', 'hidden');
            v_pw.setAttribute('name', 'pw');
            v_pw.setAttribute('value', pw);
            v_form.appendChild(v_pw);
            // pw_re
            let v_pw_re = document.createElement('input');
            v_pw_re.setAttribute('type', 'hidden');
            v_pw_re.setAttribute('name', 'pw_re');
            v_pw_re.setAttribute('value', pw_re);
            v_form.appendChild(v_pw_re);
            // name
            let v_name = document.createElement('input');
            v_name.setAttribute('type', 'hidden');
            v_name.setAttribute('name', 'name');
            v_name.setAttribute('value', name);
            v_form.appendChild(v_name);
            // email
            let v_email = document.createElement('input');
            v_email.setAttribute('type', 'hidden');
            v_email.setAttribute('name', 'email');
            v_email.setAttribute('value', email);
            v_form.appendChild(v_email);
            // submit
            document.body.appendChild(v_form);
            v_form.submit();
          }
        });
      });
    </script>
  </body>
</html>
