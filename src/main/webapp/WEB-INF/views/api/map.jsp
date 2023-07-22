<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../include/header.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>WTM 좌표를 WGS84 좌표로 변환하기</title>
    <style>
        #map {
            width: 700px;
            height: 500px;
        }
    </style>
</head>
<body>
    <div id="map"></div>

    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d3d41b627ce3372471984145a540e440&libraries=services"></script>
    <script>
    var mapContainer = document.getElementById('map');
    var mapOption = {
        center: new kakao.maps.LatLng(0, 0), // 초기 중심 좌표를 0, 0으로 설정
        level: 7 // 지도의 확대 레벨
    };

    var map = new kakao.maps.Map(mapContainer, mapOption);
    
    var geocoder = new kakao.maps.services.Geocoder();

    // 현재 위치 가져오기
    navigator.geolocation.getCurrentPosition(function(position) {
        var latitude = position.coords.latitude; // 현재 위치의 위도
        var longitude = position.coords.longitude; // 현재 위치의 경도
        // 현재 위치를 지도의 중심 좌표로 설정
        var centerLatLng = new kakao.maps.LatLng(latitude, longitude);
        map.setCenter(centerLatLng);
        
        var markerImageSrc = '/resources/img/maker.png';
        
        // 현재 위치에 마커 표시
        var marker = new kakao.maps.Marker({
            position: centerLatLng,
            map: map,
            image: new kakao.maps.MarkerImage(markerImageSrc, new kakao.maps.Size(50, 50))
        });
        
        <c:forEach items="${locationList}" var="location">
        var wtmX = ${location.x};
        var wtmY = ${location.y};
        var building = ${location.building};
     // 마커를 클릭했을 때 마커 위에 표시할 인포윈도우를 생성합니다
        var iwContent = '<div style="padding:5px;">building</div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
            iwRemoveable = true; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다

        // 인포윈도우를 생성합니다
        var infowindow = new kakao.maps.InfoWindow({
            content : iwContent,
            removable : iwRemoveable
        });

        // 마커에 클릭이벤트를 등록합니다
        kakao.maps.event.addListener(marker, 'click', function() {
              // 마커 위에 인포윈도우를 표시합니다
              infowindow.open(map, marker);  
        });

        // WTM 좌표를 WGS84 좌표계의 좌표로 변환
        geocoder.transCoord(wtmX, wtmY, function(result, status) {
            if (status === kakao.maps.services.Status.OK) {
                // 변환된 좌표를 사용하여 마커 생성 및 지도에 추가
                var marker = new kakao.maps.Marker({
                    position: new kakao.maps.LatLng(result[0].y, result[0].x),
                    map: map
                });
            }
        }, {
            input_coord: kakao.maps.services.Coords.WTM,
            output_coord: kakao.maps.services.Coords.WGS84
        });
    	</c:forEach>

        
    });
    </script>
</body>
</html>
