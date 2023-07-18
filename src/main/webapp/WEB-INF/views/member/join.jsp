<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>회원 가입</title>
    <link rel="stylesheet" href="/resources/css/member/join.css" />
    <jsp:include page="../common/header.jsp"></jsp:include>
  </head>
  <body>
    <section class="blog-details spad2">
      <div class="container">
        <c:choose>
          <c:when test="${member eq null}">
            <div class="row">
              <div class="col-lg-4 col-md-5 order-md-1 order-2">
                <div class="blog__sidebar">
                  <div class="blog__sidebar__item">
                    <h4>회원가입</h4>
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
                      <p style="display: inline-block">아이디<span>*</span></p>
                      <input
                        id="join_id"
                        name="id"
                        class="col-9"
                        type="text"
                        placeholder="영문 소문자, 숫자 조합 6 ~ 20자 (-, _ 가능)"
                        style="display: block; float: right"
                      />
                      <label id="join_id_chk" class="join_chk" style="display: none"></label>
                    </div>
                  </div>
                  <div class="col-lg-9">
                    <div class="checkout__input">
                      <p style="display: inline-block">비밀번호<span>*</span></p>
                      <input
                        id="join_pw"
                        name="pw"
                        class="col-9"
                        type="password"
                        placeholder="영문 소문자, 숫자 조합 8 ~ 32자 (!, @, #, $, %, ^, &, * 가능)"
                        style="display: block; float: right"
                        autocomplete="off"
                      />
                      <label id="join_pw_chk" class="join_chk" style="display: none"></label>
                    </div>
                  </div>
                  <div class="col-lg-9">
                    <div class="checkout__input">
                      <p style="display: inline-block">비밀번호 확인<span>*</span></p>
                      <input
                        id="join_pw_re"
                        class="col-9"
                        type="password"
                        placeholder="비밀번호를 다시 입력해주세요."
                        style="display: block; float: right"
                        autocomplete="off"
                      />
                      <label id="join_pw_re_chk" class="join_chk" style="display: none"></label>
                    </div>
                  </div>
                  <div class="col-lg-9">
                    <div class="checkout__input">
                      <p style="display: inline-block">닉네임<span>*</span></p>
                      <input
                        id="join_name"
                        name="name"
                        class="col-9"
                        type="text"
                        placeholder="글 작성시 닉네임으로 표기됩니다. (2 ~ 20자)"
                        style="display: block; float: right"
                      />
                      <label id="join_name_chk" class="join_chk" style="display: none"></label>
                    </div>
                  </div>
                  <div class="col-lg-9">
                    <div class="checkout__input">
                      <p style="display: inline-block">이메일<span>*</span></p>
                      <input
                        id="join_email"
                        name="email"
                        class="col-9"
                        type="text"
                        placeholder="gildong@abc.com"
                        style="display: block; float: right"
                      />
                      <label id="join_email_chk" class="join_chk" style="display: none"></label>
                    </div>
                  </div>
                </div>

                <div class="checkout__input__checkbox col-lg-9">
                  <label for="acc"
                    >대피소 홈페이지 개인정보 수집 및 이용동의 <input type="checkbox" id="acc" /> <span class="checkmark"></span>
                  </label>
                </div>
                <div class="col-lg-9">
                  <p>
                    개인정보 수집 및 이용에 대해서는 거부할 수 있으며, 거부 시에는 회원가입이 불가합니다. 서비스 제공을 위해서 반드시 필요한
                    최소한의 개인정보이므로 동의를 하셔야 서비스 이용이 가능합니다.
                  </p>
                  <label id="join_acc_chk" class="join_chk" style="display: none"></label>
                  <div class="checkout__input">
                    <button id="join_btn" class="site-btn" type="button">확인</button>
                  </div>
                  <br />
                  <label id="join_total_chk" class="join_chk" style="display: none"></label>
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
  </body>
  <jsp:include page="../common/footer.jsp"></jsp:include>
  <script src="/resources/js/member/join.js"></script>
</html>
