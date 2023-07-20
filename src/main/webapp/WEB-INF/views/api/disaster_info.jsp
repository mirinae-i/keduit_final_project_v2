<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css" />
    <link rel="stylesheet" href="/resources/css/api/disaster_info.css" />
    <script src="/resources/js/jquery-3.3.1.min.js"></script>
    <script src="/resources/js/bootstrap.min.js"></script>
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
    <script src="/resources/js/api/disaster_info.js"></script>
  </body>
</html>
