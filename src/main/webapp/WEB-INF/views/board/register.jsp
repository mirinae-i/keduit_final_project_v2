<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<jsp:include page="../include/header.jsp"></jsp:include>
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>


<!-- Blog Details Section Begin -->
<section class="blog-details spad2">
	<div class="container">
		<div class="row">
			<div class="col-lg-2">
				<div class="blog__sidebar">
					<div class="blog__sidebar__item">
						<h4>게시판</h4>
						<ul>
							<li><a href="/board/notice">공지게시판</a></li>
							<li><a href="/board/list">소통게시판</a></li>
						</ul>
					</div>
				</div>
			</div>
			<div class="col-lg-10">
				<div class="contact-form spad">
					<div class="container">
						<form action="/board/register" method="post" enctype="multipart/form-data" >
							<div class="row">
								<div class="col-12">
									<p>
										제목<span>*</span>
									</p>
									<input type="text" placeholder="제목을 입력하세요"
										class="checkout__input__add" name="b_title">
								</div>
								<div class="col-12">
									<p>작성자</p>
									<input type="text"
										disabled="disabled" value="${board.m_id}">
								</div>
								<div class="col-lg-12">
									<p>내용</p>
									<textarea placeholder="내용을 입력하세요" name="b_content"></textarea>
                                </div>
                                <div class="col-lg-12">
                                  <p>이미지</p>
                                  <input name="b_image" type="file">
                                </div>
							    <div class="col-lg-12">
									<button type="reset" class="site-btn">초기화</button>
									<button type="submit" class="site-btn">등록</button>
									<button type="button" class="site-btn" onclick="list()">목록</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- Blog Details Section End -->
<script>
	function list() {
		location.href = "/board/list";
	}
</script>

<jsp:include page="../include/footer.jsp"></jsp:include>