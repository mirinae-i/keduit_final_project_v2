<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:include page="../include/header.jsp"></jsp:include>
<script src="../../../resources/js/jquery-3.3.1.min.js"></script>


<!-- Blog Details Section Begin -->
<section class="blog-details spad2">
	<div class="container">
		<div class="row">

			<div class="col-lg-12 col-md-12 order-md-1 order-1">
				<div class="contact-form spad">
					<div class="container">
						<form action="#">
							<div class="row">
								<div class="col-lg-12">
									<div class="shoping__cart__table">
										<h4>최근 100건의 재난문자 내역입니다.</h4>
										</br>
										<table id="table_area">
											<thead id="thead_area"></thead>
											<tbody id="tbody_area"></tbody>
										</table>
									</div>
									<script>
      $(function () {
        load();
      });

      function load() {
        $.ajax({
          url: "/api/disaster_info_ajax",
          type: "GET",
          success: function (data) {
            console.log("** Ajax Success! **");
            console.log(data);
            let thead = "<tr>";
            let tbody = "";
            let is_thead_printed = false;
            for (let item of data.row) {
              for (let key in item) {
                if (key == "create_date") {
                  key = "알림 발생 시각";
                  thead += "<th>" + key + "</th>";
                } else if (key == "msg") {
                  key = "메시지";
                  thead += "<th>" + key + "</th>";
                } else {
                  continue;
                }
              }
              is_thead_printed = true;
              if (is_thead_printed) {
                thead += "</tr>";
                break;
              }
            }
            for (let item of data.row) {
              tbody += "<tr class='ylw'>";
              for (let key in item) {
                // tbody += "<td>" + item[key] + "</td>";
                if (key == "create_date") {
                  tbody += "<td class='shoping__cart__total'>" + item["create_date"] + "</td>";
                } else if (key == "msg") {
                  tbody += "<td class='shoping__cart__price'>" + item["msg"] + "</td>";
                } else {
                  continue;
                }
              }
              tbody += "</tr>";
            }
            $("#thead_area").append(thead);
            $("#tbody_area").append(tbody);
          },
          error: function (e) {
            console.log("** Ajax Fail! **");
            console.log(e);
          },
        });
      
      
      }
      
      
    </script>




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

<jsp:include page="../include/footer.jsp"></jsp:include>