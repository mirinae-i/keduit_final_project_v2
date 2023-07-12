<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="../../../resources/css/bootstrap.min.css" />
    <script src="../../../resources/js/jquery-3.3.1.min.js"></script>
    <script src="../../../resources/js/bootstrap.min.js"></script>
    <title>회원 정보</title>
    <style>
      #m_id_chk,
      #m_pw_chk,
      #m_pw_re_chk,
      #m_name_chk,
      #m_email_chk {
        color: red;
      }
    </style>
  </head>
  <body>
    <h1>내 정보 보기</h1>
    <hr />
    <c:choose>
      <c:when test="${Member ne null}">
        <%-- 로그인중일 때 시작 --%>
        <form>
          <div class="row">
            <div class="col-md-2">
              <label class="col" for="m_id">ID: </label>
            </div>
            <div class="col-md-9">
              <label id="m_id" class="col">${Member.id}</label>
            </div>
          </div>
          <div class="row">
            <div class="col-md-2">
              <label class="col" for="m_pw">비밀번호: </label>
            </div>
            <div class="col-md-9">
              <input
                class="col"
                width="auto"
                id="m_pw"
                type="text"
                value="${Member.pw}"
                placeholder="새로 사용할 비밀번호를 입력하세요."
                disabled
              />
              <label id="m_pw_chk" class="col" style="display: none">ASDF</label>
            </div>
          </div>
          <div id="pw_recheck" class="row" style="display: none">
            <div class="col-md-2">
              <label class="col" for="m_pw_re">비밀번호 재입력: </label>
            </div>
            <div class="col-md-9">
              <input class="col" width="auto" id="m_pw_re" type="text" value="" placeholder="비밀번호를 다시 입력해주세요." />
              <label id="m_pw_re_chk" class="col" style="display: none">ASDF</label>
            </div>
          </div>
          <div class="row">
            <div class="col-md-2">
              <label class="col" for="m_name">닉네임: </label>
            </div>
            <div class="col-md-9">
              <input class="col" id="m_name" type="text" value="${Member.name}" placeholder="새로 사용할 닉네임을 입력하세요." disabled />
              <label id="m_name_chk" class="col" style="display: none">ASDF</label>
            </div>
          </div>
          <div class="row">
            <div class="col-md-2">
              <label class="col" for="m_grade">회원 등급: </label>
            </div>
            <div class="col-md-9">
              <c:choose>
                <c:when test="${Member.grade eq 9}">
                  <label class="col">최고 관리자</label>
                </c:when>
                <c:when test="${Member.grade eq 1}">
                  <label class="col">일반 회원</label>
                </c:when>
                <c:when test="${Member.grade ge 2 and Member.grade le 8}">
                  <label class="col">관리자</label>
                </c:when>
                <c:otherwise>
                  <label class="col">회원 등급 조회 실패</label>
                </c:otherwise>
              </c:choose>
            </div>
          </div>
          <div class="row">
            <div class="col-md-2">
              <label class="col" for="m_email">이메일: </label>
            </div>
            <div class="col-md-9">
              <input
                class="col"
                id="m_email"
                type="email"
                value="${Member.email}"
                placeholder="새로 사용할 이메일 주소를 입력하세요."
                disabled
              />
            </div>
            <label id="m_email_chk" class="col" style="display: none">ASDF</label>
          </div>
          <div class="row">
            <div class="col-md-2">
              <label class="col" for="m_join_date">가입일: </label>
            </div>
            <div class="col-md-9">
              <label class="col">${Member.join_date}</label>
            </div>
          </div>
        </form>
        <br />
        <%-- 회원 탈퇴 --%>
        <span>
          <button id="modify_btn">회원 정보 수정</button>
          <button id="modify_submit_btn" style="display: none">수정 확인</button>
          <button id="modify_cancel_btn" style="display: none">취소</button>
          <c:choose>
            <%-- 일반 회원이면 탈퇴 가능, 관리자는 회원 탈퇴 불가 --%>
            <c:when test="${Member.grade eq 1}">
              <button id="delete_btn">회원 탈퇴</button>
            </c:when>
            <%-- 최고 관리자 메뉴: 회원 목록 조회 가능 --%>
            <c:when test="${Member.grade eq 9}">
              <button id="list_btn">회원 목록 관리</button>
            </c:when>
            <%-- 일반 관리자 메뉴 --%>
            <c:when test="${Member.grade ge 2 and Member.grade le 8}"></c:when>
            <c:otherwise></c:otherwise>
          </c:choose>
        </span>
        <p><a href="/member/main">메인 페이지로</a></p>
      </c:when>
      <%-- 로그인중일 때 끝 --%>
      <c:otherwise>
        <%-- 로그인중이 아닐 때 시작 --%>
        <p>현재 로그인중이 아닙니다.</p>
        <p><a href="/member/sign">로그인하기</a></p>
      </c:otherwise>
      <%-- 로그인중이 아닐 때 끝 --%>
    </c:choose>
    <script>
      $(function () {
        let pw_val = $('#m_pw').val();
        // 회원 정보 수정 버튼 처리
        $('#modify_btn').on('click', function () {
          $('#m_pw').prop('value', '');
          $('#m_pw').prop('disabled', false);
          $('#m_name').prop('disabled', false);
          $('#m_email').prop('disabled', false);
          $('#pw_recheck').show();
          $('#modify_btn').hide();
          $('#modify_submit_btn').show();
          $('#modify_cancel_btn').show();
          $('#delete_btn').hide();
        });
        // 수정 확인 버튼 처리
        $('#modify_submit_btn').on('click', function () {
          // 입력값 처리
          let id = $('#m_id').text();
          let pw = $('#m_pw').val();
          let name = $('#m_name').val();
          let email = $('#m_email').val();
          let pw_re = $('#m_pw_re').val();
          let is_pw_v = false;
          let is_pw_re_v = false;
          let is_name_v = false;
          let is_email_v = false;
          // alert('pw: ' + pw + ', pw_re: ' + pw_re + ', name: ' + name + ', email: ' + email);
          // PW check
          if (!pw) {
            $('#m_pw_chk').text('비밀번호를 입력하세요.');
            $('#m_pw_chk').show();
          } else if (pw.includes(' ')) {
            $('#m_pw_chk').text('비밀번호에 공백을 사용할 수 없습니다.');
            $('#m_pw_chk').show();
          } else if (pw.length < 8 || pw.length > 64) {
            $('#m_pw_chk').text('비밀번호는 8자 이상, 64자 이하여야 합니다.');
            $('#m_pw_chk').show();
          } else if (!/^[a-zA-Z0-9!@#$%^&*]+$/.test(pw)) {
            $('#m_pw_chk').text('비밀번호에 사용할 수 없는 문자가 포함되어 있습니다.');
            $('#m_pw_chk').show();
          } else {
            is_pw_v = true;
            $('#m_pw_chk').hide();
          }
          // PW_re check
          if (pw.length > 0 && pw_re.length > 0 && pw === pw_re) {
            is_pw_re_v = true;
            $('#m_pw_re_chk').hide();
          } else {
            $('#m_pw_re_chk').text('비밀번호가 일치하지 않습니다.');
            $('#m_pw_re_chk').show();
          }
          // name check
          if (!name) {
            $('#m_name_chk').text('닉네임을 입력하세요.');
            $('#m_name_chk').show();
          } else if (name.length < 2 || name.length > 40) {
            $('#m_name_chk').text('닉네임은 2자 이상, 40자 이하여야 합니다.');
            $('#m_name_chk').show();
          } else {
            is_name_v = true;
            $('#m_name_chk').hide();
          }
          // email check
          if (!email) {
            $('#m_email_chk').text('이메일 주소를 입력하세요.');
            $('#m_email_chk').show();
          } else if (!/^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/.test(email)) {
            $('#m_email_chk').text('올바른 이메일 주소 형식이 아닙니다.');
            $('#m_email_chk').show();
          } else {
            is_email_v = true;
            $('#m_email_chk').hide();
          }
          // form 만들기
          if (is_pw_v && is_pw_re_v && is_name_v && is_email_v) {
            let v_form = document.createElement('form');
            v_form.method = 'post';
            v_form.action = '/member/modify_member';
            // id 공백????
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
        // 취소 버튼 처리
        $('#modify_cancel_btn').on('click', function () {
          $('#m_pw').prop('value', pw_val);
          $('#m_pw').prop('disabled', true);
          $('#m_name').prop('disabled', true);
          $('#m_email').prop('disabled', true);
          $('#pw_recheck').hide();
          $('#modify_btn').show();
          $('#modify_submit_btn').hide();
          $('#modify_cancel_btn').hide();
          $('#delete_btn').show();
        });
        // 회원 탈퇴 버튼 처리
        $('#delete_btn').on('click', function () {
        	location.href = "/member/leave";
        });
        // 회원 정보 보기 버튼 처리
        $('#list_btn').on('click', function () {});
      });
    </script>
  </body>
</html>
