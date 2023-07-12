<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="../../../resources/css/bootstrap.min.css" />
    <script src="../../../resources/js/jquery-3.3.1.min.js"></script>
    <script src="../../../resources/js/bootstrap.min.js"></script>
    <title>회원 탈퇴</title>
    <style>
      #r_warn,
      #r_pw_chk {
        color: red;
      }
    </style>
  </head>
  <body>
    <h1>회원 탈퇴</h1>
    <hr />
    <p id="r_warn">회원을 탈퇴하려면 비밀번호를 입력하세요.</p>
    <form>
      <input id="r_pw" type="password" class="col-md-4" placeholder="비밀번호를 입력하세요." />
      <input id="r_btn" type="button" value="확인" />
      <label id="r_pw_chk" style="display: none"></label>
    </form>
    <p><a href="/member/show_member_info">뒤로가기 (나의 정보 화면으로 이동)</a></p>
  </body>
  <script>
    $(function () {
      $('#r_btn').on('click', function () {
        let pw = $('#r_pw').val();
        let pw_v = false;
        if (!pw) {
          $('#r_pw_chk').text('비밀번호가 입력되지 않았거나 유효한 값이 아닙니다.');
          $('#r_pw_chk').show();
        } else {
          pw_v = true;
          $('#r_pw_chk').hide();
        }
        if (pw_v) {
          let v_form = document.createElement('form');
          v_form.method = 'post';
          v_form.action = '/member/leave';
          let v_pw = document.createElement('input');
          v_pw.setAttribute('type', 'hidden');
          v_pw.setAttribute('name', 'pw');
          v_pw.setAttribute('value', pw);
          v_form.appendChild(v_pw);
          document.body.appendChild(v_form);
          v_form.submit();
        }
      });
    });
  </script>
</html>
