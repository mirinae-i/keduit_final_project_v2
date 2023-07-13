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
    <title>로그인/회원가입</title>
    <style>
      #login_id_chk,
      #login_pw_chk {
        color: red;
      }
    </style>
    <script>
      $(function () {
        $("#login_btn").on("click", function () {
          let id = $("#login_id").val();
          let pw = $("#login_pw").val();
          console.log("id: " + id + ", pw: " + pw);
          if (id && !id.includes(" ") && pw) {
            $("#login_id_chk").hide();
            $("#login_pw_chk").hide();
            let v_form = document.createElement("form");
            v_form.method = "post";
            v_form.action = "/member/login";
            let id_chk = document.createElement("input");
            id_chk.setAttribute("type", "hidden");
            id_chk.setAttribute("name", "id");
            id_chk.setAttribute("value", id);
            v_form.appendChild(id_chk);
            let pw_chk = document.createElement("input");
            pw_chk.setAttribute("type", "hidden");
            pw_chk.setAttribute("name", "pw");
            pw_chk.setAttribute("value", pw);
            v_form.appendChild(pw_chk);
            document.body.appendChild(v_form);
            v_form.submit();
          } else {
            if (!id || id.includes(" ")) {
              $("#login_id_chk").text("올바른 ID 형식이 아닙니다.");
              $("#login_id_chk").show();
            } else {
              $("#login_id_chk").hide();
            }
            if (!pw) {
              $("#login_pw_chk").text("올바른 비밀번호 형식이 아닙니다.");
              $("#login_pw_chk").show();
            } else {
              $("#login_pw_chk").hide();
            }
          }
        });
        $("#join_btn").on("click", function () {
          location.href = "/member/join";
        });
      });
    </script>
  </head>
  <body>
    <div class="container">
      <div>
        <h1>로그인/회원 가입</h1>
        <hr />
      </div>
      <c:choose>
        <c:when test="${is_logon eq null or member eq null}">
          <div class="row">
          <!-- 로그인 -->
            <div class="col col-md-6">
              <form>
                <label for="login_id">ID: </label>
                <input id="login_id" type="text" />
                <label id="login_id_chk" style="display: none"></label>
                <br />
                <label for="login_pw">비밀번호: </label>
                <input id="login_pw" type="password" />
                <label id="login_pw_chk" style="display: none"></label>
                <br />
                <input id="login_btn" type="button" value="로그인" />
              </form>
            </div>
            <!-- 회원 가입 -->
            <div class="col col-md-6">
              <p>커뮤니티에 게시글을 작성하기 위해서는 회원가입이 필요합니다.</p>
              <input id="join_btn" type="button" value="회원 가입" />
            </div>
          </div>
        </c:when>
        <c:otherwise>
          <p>이미 ${member.name} 사용자로 로그인되어 있습니다.</p>
          <p><a href="/member/show_member_info">나의 정보 페이지로 이동</a></p>
        </c:otherwise>
      </c:choose>
    </div>
  </body>
</html>
