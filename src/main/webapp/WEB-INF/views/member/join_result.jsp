<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>회원 가입</title>
  </head>
  <body>
    <h1>회원 가입 결과</h1>
    <hr />
    <c:choose>
      <c:when test="${join_result eq 1}">
        <p>회원 가입이 성공적으로 완료되었습니다.<br />가입한 ID와 비밀번호로 로그인해주세요.</p>
        <p><a href="/member/sign">로그인 화면으로</a></p>
      </c:when>
      <c:otherwise>
        <p>회원 가입 실패</p>
        <p><a href="/member/sign">로그인 화면으로</a></p>
      </c:otherwise>
    </c:choose>
  </body>
</html>
