<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>로그인</title>
    <link rel="stylesheet" href="/resources/css/member/login.css" />
  </head>
  <body>
    <jsp:include page="../common/header.jsp"></jsp:include>
    <section class="blog-details spad2">
      <div class="container">
        <c:choose>
          <c:when test="${member eq null}">
            <div class="row">
              <div class="col-lg-4 col-md-5 order-md-1 order-2">
                <div class="blog__sidebar">
                  <div class="blog__sidebar__item">
                    <h4>로그인</h4>
                    <ul></ul>
                  </div>
                </div>
              </div>
              <div class="col-lg-8 col-md-7 order-md-1 order-1">
                <div class="row">
                  <div class="col-lg-9">
                    <div class="checkout__input">
                      <p style="display: inline-block">
                        <label for="login_id">아이디<span>*</span></label>
                      </p>
                      <input id="login_id" class="col-9" type="text" style="display: block; float: right" />
                      <label id="login_id_chk" style="display: none"></label>
                    </div>
                  </div>
                  <div class="col-lg-9">
                    <div class="checkout__input">
                      <p style="display: inline-block">
                        <label for="login_pw">비밀번호<span>*</span></label>
                      </p>
                      <input id="login_pw" class="col-9" type="password" style="display: block; float: right" />
                      <label id="login_pw_chk" style="display: none"></label>
                    </div>
                  </div>
                  <div class="col-lg-9">
                    <div class="checkout__input">
                      <button id="login_btn" type="button" class="site-btn">로그인</button>
                      <button id="join_btn" type="button" class="site-btn">회원가입</button>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </c:when>
          <c:otherwise>
            <div class="row">
              <div class="col-lg-8 col-md-7 order-md-1 order-1">
                <p style="display: inline-block; padding-right: 2rem">이미 로그인되어 있습니다.</p>
                <button id="goto_main_btn" type="button" class="site-btn">메인 화면으로</button>
              </div>
            </div>
          </c:otherwise>
        </c:choose>
      </div>
    </section>
    <jsp:include page="../common/footer.jsp"></jsp:include>
    <script src="/resources/js/member/login.js"></script>
  </body>
</html>
