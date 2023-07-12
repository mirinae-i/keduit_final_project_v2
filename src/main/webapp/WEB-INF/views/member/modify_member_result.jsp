<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>회원 정보 수정</title>
  </head>
  <body>
    <h1>회원 정보 수정 결과</h1>
    <hr />
    <c:choose>
      <c:when test="${modify_result eq 1}">
        <p>회원 정보 수정이 성공적으로 완료되었습니다. 다시 로그인해주세요.</p>
        <p><a href="/member/modify_complete">로그인 화면으로</a></p>
      </c:when>
      <c:otherwise>
        <p>회원 정보를 수정하지 못했습니다.</p>
        <p><a href="redirect:/member/show_member_info">나의 정보 화면으로</a></p>
      </c:otherwise>
    </c:choose>
  </body>
</html>
