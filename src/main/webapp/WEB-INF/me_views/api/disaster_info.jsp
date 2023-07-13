<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="../../../resources/css/bootstrap.min.css" />
    <style>
      .wrapper #table_area {
        width: 100%;
        height: auto;
      }
      .wrapper #table_area,
      .wrapper #table_area tr,
      .wrapper #table_area th,
      .wrapper #table_area td {
        border: 1px solid midnightblue;
        border-collapse: collapse;
      }
      .wrapper #table_area th,
      .wrapper #table_area td {
        padding: 0.5rem 1rem;
      }
    </style>
    <script src="../../../resources/js/jquery-3.3.1.min.js"></script>
    <script src="../../../resources/js/bootstrap.min.js"></script>
    <title>재난 발생 내역 조회</title>
  </head>
  <body>
    <div class="wrapper">
      <table id="table_area">
        <thead id="thead_area"></thead>
        <tbody id="tbody_area"></tbody>
        <tfoot></tfoot>
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
              tbody += "<tr>";
              for (let key in item) {
                // tbody += "<td>" + item[key] + "</td>";
                if (key == "create_date") {
                  tbody += "<td>" + item["create_date"] + "</td>";
                } else if (key == "msg") {
                  tbody += "<td>" + item["msg"] + "</td>";
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
  </body>
</html>
