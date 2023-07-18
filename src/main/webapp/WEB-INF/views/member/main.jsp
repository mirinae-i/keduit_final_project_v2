<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>메인</title>
  </head>
  <body>
    <c:choose>
      <c:when test="${member ne null}">
        <p>${member.name} (${member.serial_no})</p>  
        <p><a href="/member/logout">로그아웃</a></p>
        <p><a href="/member/mypage">마이페이지</a></p>
      </c:when>
      <c:otherwise>
        <p><a href="/member/login">로그인</a></p>
      </c:otherwise>
    </c:choose>
  </body>
</html>
