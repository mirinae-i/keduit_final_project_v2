<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>메인</title>
  </head>
  <body>
    <h1>세션 상태</h1>
    <hr />
    <c:choose>
      <c:when test="${isLogOn eq true}">
        <p><a href="/member/logout">${Member.name} (로그아웃)</a></p>
        <p><a href="/member/show_member_info">나의 정보</a></p>
      </c:when>
      <c:otherwise>
        <p><a href="/member/sign">로그인</a></p>
      </c:otherwise>
    </c:choose>
  </body>
</html>
