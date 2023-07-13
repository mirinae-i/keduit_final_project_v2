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
      <c:when test="${member_no ne null}">
        <c:choose>
          <c:when test="${member_no eq -1 or member_no eq -2}">
            <p>입력한 ID 또는 비밀번호가 잘못되었습니다.</p>
            <p><a href="/member/sign">이전 화면으로</a></p>
          </c:when>
          <c:when test="${member_no eq -3}">
            <p>탈퇴한 회원입니다.</p>
            <p><a href="/member/sign">이전 화면으로</a></p>
          </c:when>
          <c:otherwise>
            <p>${member.name}님, 환영합니다!!</p>
            <p><a href="/member/main">메인 페이지로</a></p>
          </c:otherwise>
        </c:choose>
      </c:when>
      <c:otherwise>
        <p>잘못된 요청입니다.</p>
        <p><a href="/member/main">메인 페이지로</a></p>
      </c:otherwise>
    </c:choose>
  </body>
</html>
