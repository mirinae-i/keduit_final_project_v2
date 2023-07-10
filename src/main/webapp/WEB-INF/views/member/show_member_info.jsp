<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>회원 정보</title>
  </head>
  <body>
    <h1>내 정보 보기</h1>
    <hr />
    <c:choose>
      <c:when test="${Member ne null}"> <%-- 로그인중일 때 시작 --%>
        <p>닉네임: ${Member.name}</p>
        <table>
          <tr>
            <th>ID</th>
            <td>${Member.id}</td>
          </tr>
          <tr>
            <th>비밀번호</th>
            <td>${Member.pw}</td>
          </tr>
          <tr>
            <th>닉네임</th>
            <td>${Member.name}</td>
          </tr>
          <tr>
            <th>회원 등급</th>
            <c:choose>
              <c:when test="${Member.grade eq 9}">
                <td>최고 관리자</td>
              </c:when>
              <c:otherwise>
                <c:choose>
                  <c:when test="${Member.grade eq 1}">
                    <td>일반 회원</td>
                  </c:when>
                  <c:otherwise>
                    <td>관리자 (관리 권한 등급: ${Member.grade})</td>
                  </c:otherwise>
                </c:choose>
              </c:otherwise>
            </c:choose>
          </tr>
          <tr>
            <th>이메일</th>
            <td>${Member.email}</td>
          </tr>
          <tr>
            <th>가입일</th>
            <td>${Member.join_date}</td>
          </tr>
        </table>
        <br />
        <%-- 회원 탈퇴 --%>
        <span>
          <button>회원 정보 수정</button>
          <c:choose>
            <c:when test="${Member.grade eq 1}">
              <button>회원 탈퇴</button>
            </c:when>
            <c:otherwise>
              <%-- 관리자는 회원 탈퇴 불가 --%>
            </c:otherwise>
          </c:choose>
        </span>
        <p><a href="/member/main">메인 페이지로</a></p>
      </c:when> <%-- 로그인중일 때 끝 --%>
      <c:otherwise> <%-- 로그인중이 아닐 때 시작 --%>
        <p>현재 로그인중이 아닙니다.</p>
        <p><a href="/member/sign">로그인하기</a></p>
      </c:otherwise> <%-- 로그인중이 아닐 때 끝 --%>
    </c:choose>
  </body>
</html>
