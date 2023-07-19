<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <jsp:include page="../common/header.jsp"></jsp:include>
    <title>마이페이지</title>
    <link rel="stylesheet" href="/resources/css/member/myinfo.css" />
  </head>
  <body>
    <!-- Blog Details Section Begin -->
    <section class="blog-details spad2">
      <div class="container">
        <c:choose>
          <c:when test="${member ne null}">
            <div class="row">
              <div class="col-lg-4 col-md-5 order-md-1 order-2">
                <div class="blog__sidebar">
                  <div class="blog__sidebar__item">
                    <h4>내 정보 확인</h4>
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
                      <p style="display: inline-block">아이디</p>
                      <input
                        id="modify_id"
                        name="id"
                        class="col-9"
                        type="text"
                        placeholder="ajax 아이디"
                        style="display: block; float: right"
                        readonly="readonly"
                        value="${member.id}"
                      />
                      <label id="modify_id_chk" class="modify_chk" style="display: none"></label>
                    </div>
                  </div>
                  <div class="col-lg-9">
                    <div class="checkout__input">
                      <p style="display: inline-block">비밀번호</p>
                      <input
                        id="modify_pw"
                        name="pw"
                        class="col-9 modify_frm"
                        type="password"
                        placeholder="ajax 비밀번호"
                        readonly="readonly"
                        style="display: block; float: right"
                        value="${member.pw}"
                      />
                      <label id="modify_pw_chk" class="modify_chk" style="display: none"></label>
                    </div>
                  </div>
                  <div class="col-lg-9">
                    <div id="modify_pw_re_div" class="checkout__input" style="display: none">
                      <p style="display: inline-block">비밀번호 확인</p>
                      <input
                        id="modify_pw_re"
                        class="col-9 modify_frm"
                        type="password"
                        placeholder="ajax 비밀번호"
                        style="display: block; float: right"
                      />
                      <label id="modify_pw_re_chk" class="modify_chk" style="display: none"></label>
                    </div>
                  </div>
                  <div class="col-lg-9">
                    <div class="checkout__input">
                      <p style="display: inline-block">닉네임<span>*</span></p>
                      <input
                        id="modify_name"
                        name="name"
                        class="col-9 modify_frm"
                        type="text"
                        placeholder="ajax 닉네임"
                        style="display: block; float: right"
                        readonly="readonly"
                        value="${member.name}"
                      />
                      <label id="modify_name_chk" class="modify_chk" style="display: none"></label>
                    </div>
                  </div>
                  <div class="col-lg-9">
                    <div class="checkout__input">
                      <p style="display: inline-block">이메일<span>*</span></p>
                      <input
                        id="modify_email"
                        name="email"
                        class="col-9 modify_frm"
                        type="text"
                        placeholder="ajax 이메일"
                        readonly="readonly"
                        style="display: block; float: right"
                        value="${member.email}"
                      />
                      <label id="modify_email_chk" class="modify_chk" style="display: none"></label>
                    </div>
                  </div>
                  <div class="col-lg-9">
                    <div id="cancel_btn" class="checkout__input" style="display: none; float: right; margin: 0 0 0 4px">
                      <button type="button" class="site-btn">취소</button>
                    </div>
                    <div id="modify_commit_btn" class="checkout__input" style="display: none; float: right">
                      <button type="button" class="site-btn">확인</button>
                    </div>
                    <div id="goto_main_btn" class="checkout__input goto_main_btn" style="display: block; float: right; margin: 0 0 0 4px">
                      <button type="button" class="site-btn">메인 화면으로</button>
                    </div>
                    <div id="modify_btn" class="checkout__input" style="display: block; float: right">
                      <button type="button" class="site-btn">수정</button>
                    </div>
                    <label id="modify_total_chk" class="modify_chk" style="display: none"></label>
                  </div>
                  <div class="col-lg-9">
                    <p><a href="/member/leave">회원 탈퇴</a></p>
                  </div>
                </div>
              </div>
            </div>
          </c:when>
          <c:otherwise>
            <div class="row">
              <div class="col-lg-8 col-md-7 order-md-1 order-1">
                <p style="display: inline-block; padding-right: 2rem">잘못된 접근입니다.</p>
                <button type="button" class="site-btn goto_main_btn">메인 화면으로</button>
              </div>
            </div>
          </c:otherwise>
        </c:choose>
      </div>
    </section>
    <!-- Blog Details Section End -->
    <jsp:include page="../common/footer.jsp"></jsp:include>
    <script src="/resources/js/member/myinfo.js"></script>
  </body>
</html>
