<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<jsp:include page="../include/header.jsp"></jsp:include>


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
				<div class="contact-form">
					<div class="container">
						<form action="/board/modify" method="POST">
							<div class="row">
								<div class="col-12">
									<p>글번호</p>
									<input name="b_no" value="${board.b_no}" readonly="readonly"/>
									<p>
									제목<span>*</span>
									</p>
									<input type="text" name="b_title" value="${board.b_title}" 
										class="checkout__input__add">
								</div>
								<div class="col-12">
									<p>작성자</p>
									<input type="hidden" name="m_id" value="${board.m_id}"
										disabled="disabled">
									<input type="text" value="${board.m_id}"
										readonly="readonly">
								</div>
								<div class="col-lg-12 text-center">
									<p>내용</p>
									<textarea name="b_content" >${board.b_content}</textarea>
									<button data-oper ="modify" type="submit" class="site-btn" formaction="/board/modify">수정 확인</button>
									<button data-oper ="remove" type="submit" formaction="/board/remove" class="site-btn">삭제</button>
									<button data-oper="list" onclick="list()" class="site-btn">목록</button>
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



<script type="text/javascript">
$(document).ready(function(){
	
	function list() {
    window.location.href = "/board/list";
		 }
	
	/*
	var formObj = $("form");
	
	$('button').on("click", function(e){
	    e.preventDefault();
	    var operation = $(this).data("oper");
	    console.log(operation);
	    if(operation === 'remove'){
	        formObj.attr("action","/board/remove");
	    } else if(operation === 'list'){
	        self.location = "/board/list";
	    }else if(operation === 'modify'){
	        formObj.attr("action","/board/modify");
	        formObj.attr("method","POST");
	    }
	    formObj.submit();
	});
	*/

});
</script>





<jsp:include page="../include/footer.jsp"></jsp:include>