<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:include page="../include/header.jsp"></jsp:include>




<script>
      $(function () {
        $("#login_btn").on("click", function () {
          let id = $("#login_id").val();
          let pw = $("#login_pw").val();
          console.log("id: " + id + ", pw: " + pw);
          if (id && !id.includes(" ") && pw) {
            $("#login_id_chk").hide();
            $("#login_pw_chk").hide();
            let v_form = document.createElement("form");
            v_form.method = "post";
            v_form.action = "/member/login";
            let id_chk = document.createElement("input");
            id_chk.setAttribute("type", "hidden");
            id_chk.setAttribute("name", "id");
            id_chk.setAttribute("value", id);
            v_form.appendChild(id_chk);
            let pw_chk = document.createElement("input");
            pw_chk.setAttribute("type", "hidden");
            pw_chk.setAttribute("name", "pw");
            pw_chk.setAttribute("value", pw);
            v_form.appendChild(pw_chk);
            document.body.appendChild(v_form);
            v_form.submit();
          } else {
            if (!id || id.includes(" ")) {
              $("#login_id_chk").text("올바른 ID 형식이 아닙니다.");
              $("#login_id_chk").show();
            } else {
              $("#login_id_chk").hide();
            }
            if (!pw) {
              $("#login_pw_chk").text("올바른 비밀번호 형식이 아닙니다.");
              $("#login_pw_chk").show();
            } else {
              $("#login_pw_chk").hide();
            }
          }
        });
      });
    </script>
    

<!-- Breadcrumb Section Begin -->
<section class="breadcrumb-section set-bg"
	data-setbg="../resources/img/action/D_bg.jpg">
	<div class="container">
		<div class="row">
			<div class="col-lg-12 text-center">
				<div class="breadcrumb__text">
					<h2>실시간 재난정보</h2>
					<div class="breadcrumb__option">
						<a href="./index.html">Home</a> <span>Shop</span>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- Breadcrumb Section End -->

<!-- Blog Details Section Begin -->
<section class="product spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-5">
                    <div class="sidebar">
                    <div class="sidebar__item">
                            <h4>기본대비요령</h4>
                            <ul>
                                <li><a href="#">재난대비</a></li>
                                <li><a href="#">비상대비</a></li>
                                
                            </ul>
                        </div>
                        <div class="sidebar__item">
                            <h4>사회재난</h4>
                            <ul>
                                <li><a href="#">화재</a></li>
                                <li><a href="#">테러</a></li>
                                <li><a href="#">감염병 예방</a></li>
                                <li><a href="#">건축물 붕괴</a></li>
                                <li><a href="#">지하철 사고</a></li>
                                
                            </ul>
                        </div>
                        <div class="sidebar__item">
                            <h4>생활안전</h4>
                            <ul>
                                <li><a href="#">응급처치</a></li>
                                <li><a href="#">심폐소생술</a></li>
                                <li><a href="#">자동심장충격기</a></li>
                                <li><a href="#">소화기 사용법</a></li>
                                <li><a href="#">소화전 사용법</a></li>
                                
                            </ul>
                        </div>
                        <div class="sidebar__item">
                            <h4>자연재난</h4>
                            <ul>
                                <li><a href="#">폭염</a></li>
                                <li><a href="#">가뭄</a></li>
                                <li><a href="#">대설</a></li>
                                <li><a href="#">한파</a></li>
                                <li><a href="#">지진</a></li>
                                <li><a href="#">낙뢰</a></li>
                                <li><a href="#">산사태</a></li>
                                <li><a href="#">화산재 낙하</a></li>
                                <li><a href="#">태풍 및 호우</a></li>
                                <li><a href="#">황사 및 고농도 미세먼지</a></li>
                            </ul>
                        </div>
                        
                        
				</div>
			</div>
			<div class="col-lg-8 col-md-7 order-md-1 order-1">
				<div class="checkout__form">
					<h4>로그인</h4>
					<form action="#">
						<div class="row">
							<div class="col-lg-8 col-md-6">
								<div class="row">
									<div class="col-lg-6"></div>

								</div>
								<div class="checkout__input">
									<p>
							      <label for="login_id">ID<span>*</span></label>
							      <label id="login_id_chk" style="display: none">id</label>
									</p>
									<input type="text" id="login_id" placeholder="아이디">
								</div>
								<div class="checkout__input">
									<p>
							   <label for="login_pw">Password<span>*</span>
									</p>
									<input type="password" id="login_pw" placeholder="비밀번호">
									<label id="login_pw_chk" style="display: none">pw</label>
								</div>
								
								<br>
								<div class="checkout__input">
									<button type="submit" value="로그인" id="login_btn" class="site-btn">Login</button>
									&nbsp
									<button type="reset" value="다시쓰기" id="reset_btn" class="site-btn">Reset</button>
									&nbsp
									<button type="submit" value="카카오로그인" id="kakao_btn" class="site-btn">Login for kakao</button>

								</div>
							</div>

						</div>
				</div>
				<div class="blog__details__content">
					<div class="row">
						<div class="col-lg-6"></div>
					</div>
					<div class="col-lg-6"></div>
				</div>
			</div>
		</div>
	</div>
	</div>
</section>
<!-- Blog Details Section End -->


<jsp:include page="../include/footer.jsp"></jsp:include>
