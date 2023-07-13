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
							<li><a href="/board/comm">소통게시판</a></li>
						</ul>
					</div>
				</div>
			</div>
			<div class="col-lg-10">
				<div class="contact-form spad">
					<div class="container">
						<form action="#">
							<div class="row">
								<div class="col-lg-12">
									<div class="shoping__cart__table">
										<h4>소통게시판</h4>
										<br>
										<table id="boardTable">
											<thead>
												<tr>
													<th>글번호</th>
													<th>글제목</th>
													<th>작성자</th>
													<th>작성일</th>
													<th>조회수</th>
												</tr>
											</thead>
											<tbody>
											</tbody>
										</table>
									</div>
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
	$(document).ready(function() {
		$.ajax({
			url: "/board/getlist",
			type: "POST",
			dataType: "json",
			success: function(data) {
				var boardTbody = $("#boardTable tbody");
				$.each(data, function(index, item) {
					var updateDate = new Date(item.b_date);
					var options = {year:"numeric",month:"2-digit", day:"2-digit", hour:"2-digit", minute:"2-digit"};
					var formattedUpdate = updateDate.toLocaleString("ko-KR",options);
						
					var row = $("<tr>");
					row.append($("<td>").text(item.b_no));
					var titleLink = $("<a>").attr("href", "/board/read?b_no="+item.b_no).text(item.b_title);
					var titleTd = $("<td>").append(titleLink);
					row.append(titleTd);
					row.append($("<td>").text(item.m_id));
					
					row.append($("<td>").text(formattedUpdate));
					row.append($("<td>").text(item.b_views));
					boardTbody.append(row);
				});
			},
			error: function(e) {
				console.log(e);
				alert("실패");
			}	
		});
	});
</script>

<jsp:include page="../include/footer.jsp"></jsp:include>
