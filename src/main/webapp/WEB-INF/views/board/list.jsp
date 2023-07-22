<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<jsp:include page="../include/header.jsp"></jsp:include>
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>

<style>
ul.pagination.pages li.paginate_button a.active {
  background-color: #0d4185; /* 무너색 배경색으로 변경하거나, 원하는 색상으로 변경 */
  color: white; /* 텍스트 색상 변경 (예: 흰색) */
}
</style>

<!-- Blog Details Section Begin -->
<section class="blog-details spad2">
	<div class="container">
		<div class="row">
			<div class="col-lg-2 col-md-2 order-md-1 order-2">
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
			<div class="col-lg-10 col-md-10 order-md-1 order-1 panel panel-default">
				<div class="contact-form spad">
					<div class="container">
						<form action="#">
							<div class="row">
								<div class="col-lg-12">
									<div class="shoping__cart__table">
										<h4>소통게시판</h4>
										<button type="button" id="regbtn" class="site-btn" style="float: right;">글 쓰기</button>
										<br><br><br>
								
					<div class="row">
					<div class="col-lg-8">
						<form id="searchForm" action="/board/list" method="get">
							<select class="form-control" name="type">
								<option value="" <c:out value="${pageMaker.cri.type == null? 'selected':'' }"/>> -- </option>
								<option value="title" <c:out value="${pageMaker.cri.type == 'b_title'? 'selected':'' }"/>> 제목 </option>
								<option value="content" <c:out value="${pageMaker.cri.type == 'b_content'? 'selected':'' }"/>> 내용 </option>		
							</select>
							<input type="text" name="keyword" style="width: 430px; margin-left:10px;"
								value='<c:out value="${pageMaker.cri.keyword }"/>'>
							
							<input type="hidden" name="pageNum" 
								value='<c:out value="${pageMaker.cri.pageNum }"/>'>
								<input type="hidden" name="amount" 
								value='<c:out value="${pageMaker.cri.amount }"/>'>
								
							<button type="button" class="btn btn-outline btn-primary" style="float: right;">검색</button>
							
						</form>
					</div>
				</div>	
				
				
				
										<table id="boardTable" class="table table-striped table-bordered table-hover">
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
										
						
						<div class="product__pagination">
						<ul class="pagination pages" style="font-size: 20px;">
					
						<c:if test="${pageMaker.prev}">
							<li class="paginate_button previous" style="margin: 5px;">
							<a href="${pageMaker.startPage -1}" class="fa fa-long-arrow-left"></a></li>
						</c:if>

						<c:forEach var="num" begin="${pageMaker.startPage}"
							end="${pageMaker.endPage}">
							<li class="paginate_button  ${pageMaker.cri.pageNum == num ? "active":""} " style="margin: 5px;">
								<a href="${num}"> ${num}</a>
							</li>
						</c:forEach>

						<c:if test="${pageMaker.next}">
							<li class="paginate_button next" style="margin: 5px;">
							<a href="${pageMaker.endPage +1 }" class="fa fa-long-arrow-right"></a></li></br>
						</c:if>
					
					</ul>
				</div>
				
				<form id="actionForm" action="/board/list" method="get">
					<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
					<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
				</form>	
				
				
									</div>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	
	 	  <!-- Modal -->
      <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
          <div class="modal-dialog">
              <div class="modal-content">
                  <div class="modal-header">
                      <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                      <h4 class="modal-title" id="myModalLabel">Modal title</h4>
                  </div>
                  <div class="modal-body">
                  	처리가 완료되었습니다.
                  </div>
                  <div class="modal-footer">
                      <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
                  </div>
              </div>
              <!-- /.modal-content -->
          </div>
          <!-- /.modal-dialog -->
      </div>
	
	
</section>

<script>
	$(document).ready(function(){
		
		setCurrentPageStyle();
		
		$.ajax({
			url: "/board/getlist",
			type: "POST",
			dataType: "json",
			data: {
			    pageNum: $("#actionForm").find("input[name='pageNum']").val(),
			    amount: $("#actionForm").find("input[name='amount']").val(),
			    type: $("#searchForm select[name='type']").val(), // 수정된 부분
			    keyword: $("#searchForm").find("input[name='keyword']").val()
			},
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
					
					var eyeIcon = $("<i>").addClass("fas fa-eye"); // 눈 아이콘 생성
					row.append($("<td>").text(item.b_views));
					boardTbody.append(row);
				});
			},
			error: function(e) {
				console.log(e);
				alert("실패");
			}	
		});
		
		var actionForm = $("#actionForm");
		$(".paginate_button a").on("click", function(e){
			e.preventDefault();
			actionForm.find("input[name='pageNum']").val($(this).attr("href"));
			actionForm.submit();
		});
		
		
		
		// "/register"ㅇㅣ 동
		$("#regbtn").on("click", function(){
			self.location = "/board/register";
		});
		
		var result = "${result}";
		
		checkModal(result);
		// history : 자바 스크립트가 가진 객체 -> 브라우저의 세션 기록을 변경 기능을 가짐
		//{}: 상태(데이터 포함가능), title, url 
		history.replaceState({},null,null); // 브라우저가 새롭게 호출되서 기록에 남지 않도록 설정
		
		function checkModal(result){
			if(result === '' || history.state ){
				return;
			}
			if(parseInt(result) > 0){
				$(".modal-body").html("게시글 " + parseInt(result) +" 번 등록 완료.");
			}
			$("#myModal").modal("show");
		}
		
		
		var searchForm = $("#searchForm");
		
		$("#searchForm button").on("click",function(e){
			if(!searchForm.find("option:selected").val()){
				alert("검색 타입을 선택하세요");
				return false;
			}
			if(!searchForm.find("input[name='keyword']").val()){
				alert("검색어를 입력 하세요");
				return false;
			}
			searchForm.find("input[name='pageNum']").val("1");
			e.preventDefault();
			searchForm.submit();
		});
		
		
	});
	

</script>
<script>

function setCurrentPageStyle() {
	  var currentPage = "${pageMaker.cri.pageNum}"; // JSP EL로 현재 페이지 번호 가져오기
	  var pageButtons = document.querySelectorAll(".paginate_button a");
	  
	  pageButtons.forEach(function(button) {
	    if (button.textContent.trim() === currentPage) {
	      button.classList.add("active"); // active 클래스 추가하여 배경색 변경
	    } else {
	      button.classList.remove("active"); // 다른 버튼들은 active 클래스 제거
	    }
	  });
	}


</script>


<jsp:include page="../include/footer.jsp"></jsp:include>
