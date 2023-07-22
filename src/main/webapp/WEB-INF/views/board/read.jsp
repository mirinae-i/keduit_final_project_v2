<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>

<jsp:include page="../include/header.jsp"></jsp:include>

<Style>
.yedy_input{
	width: 100%;
	height: 50px;
	font-size: 16px;
	color: #6f6f6f;
	padding-left: 20px;
	margin-bottom: 30px;
	border: 1px solid #ebebeb;
	border-radius: 4px;
}
.yedy_area{
	width: 100%;
	height: 150px;
	font-size: 16px;
	color: #6f6f6f;
	padding-left: 20px;
	margin-bottom: 24px;
	border: 1px solid #ebebeb;
	border-radius: 4px;
	padding-top: 12px;
	resize: none;
}
</Style>
<!-- Blog Details Section Begin -->
<section class="blog-details spad2">
	<div class="container">
		<div class="row">
			<div class="col-lg-2 col-md-5 order-md-1 order-2">
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
			<div class="col-lg-10 col-md-7 order-md-1 order-1">
				<div class="contact-form spad">
					<div class="container">
					<div>
							<div class="row">
								<div class="col-12">
								
									<p>글번호</p>
									<input name="b_no" value="${board.b_no }"  readonly="readonly"
									class="yedy_input"/>
									
									<p>제목</p>
									<input name="b_title" 
									value="${board.b_title }" readonly="readonly"
									class="yedy_input"/>
									
									<p>작성자</p>
									<input name="m_id" value="${board.m_id }" disabled="disabled"
									class="yedy_input"/>
								
									<p>내용</p>
									<textarea name="b_content" readonly="readonly" class="yedy_area"><c:out value="${board.b_content}"/></textarea>
								
								</div>
								<div class="col-lg-12 text-center">
									
									<button class="site-btn" id="mod" >수정</button>
									<button class="site-btn" onclick="list()">목록</button>
									
<script type="text/javascript">
$(document).ready(function(){
    
    $("#mod").on("click", function(){
    	self.location = "/board/modify?b_no="+${board.b_no};
    	});
});

function list() {
    window.location.href = "/board/list";
		 }
    
</script>
								</div>
							</div>
							</div>
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