<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>로그인</title>
    <link rel="stylesheet" href="/resources/css/member/leave.css" />
  </head>
  <body>
    <jsp:include page="../common/header.jsp"></jsp:include>
    <section class="blog-details spad2">
      <div class="container">
        <c:choose>
          <c:when test="${member ne null}">
            <div class="row">
              <div class="col-lg-4 col-md-5 order-md-1 order-2">
                <div class="blog__sidebar">
                  <div class="blog__sidebar__item">
                    <h4>회원 탈퇴</h4>
                    <ul></ul>
                  </div>
                </div>
              </div>
            </div>
            <div class="row">
              <div class="col-lg-8 col-md-7 order-md-1 order-1">
                <div class="row">
                  <div class="col-lg-9">
                    <div class="checkout__input">
                      <p style="display: inline-block">
                        회원 탈퇴를 하시겠습니까?<span style="color: red"
                          >탈퇴 처리가 완료된 후 이 계정의 정보로 로그인할 수 없으며, 탈퇴 작업은 되돌릴 수 없습니다.</span
                        >
                      </p>
                      <p style="display: inline-block">회원 탈퇴를 완료하려면 비밀번호를 입력해주세요.</p>
                    </div>
                  </div>
                  <div class="col-lg-9">
                    <div class="checkout__input">
                      <p style="display: inline-block">
                        <label for="leave_pw">비밀번호<span>*</span></label>
                      </p>
                      <input id="leave_id" name="id" class="col-9" type="text" style="display: none; float: right" value="${member.id}" />
                      <input id="leave_pw" name="pw" class="col-9" type="password" style="display: block; float: right" />
                      <label id="leave_pw_chk" style="display: none"></label>
                    </div>
                  </div>
                  <div class="col-lg-9">
                    <div class="checkout__input">
                      <button id="leave_btn" type="button" class="site-btn">회원 탈퇴</button>
                      <button id="goto_myinfo_btn" type="button" class="site-btn">취소</button>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </c:when>
          <c:otherwise>
            <div class="row">
              <div class="col-lg-8 col-md-7 order-md-1 order-1">
                <p style="display: inline-block; padding-right: 2rem">잘못된 접근입니다.</p>
                <button id="goto_main_btn" type="button" class="site-btn">메인 화면으로</button>
              </div>
            </div>
          </c:otherwise>
        </c:choose>
      </div>
    </section>
    <jsp:include page="../common/footer.jsp"></jsp:include>
    <script src="/resources/js/member/leave.js"></script>
  </body>
</html>
