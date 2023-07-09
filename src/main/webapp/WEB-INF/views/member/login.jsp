<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>로그인</title>
  </head>
  <body>
    <h1>로그인 결과</h1>
    <hr />
    <c:choose>
      <c:when test="${Member.serial_no ge 1}">
        <p>${Member.name}님, 환영합니다!!</p>
        <p><a href="#">메인 페이지로 이동</a></p>
      </c:when>
      <c:otherwise>
        <p>입력한 ID 또는 비밀번호가 잘못되었습니다.</p>
        <p><a href="#">다시 로그인하기</a></p>
      </c:otherwise>
    </c:choose>
  </body>
</html>
