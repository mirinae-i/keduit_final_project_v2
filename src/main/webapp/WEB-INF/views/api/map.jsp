<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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

<form action="/api/search">
        <input type="text" name="keyword" placeholder="키워드를 입력하세요">
        <input type="submit" value="검색"/>
</form>

    <div id="map"></div>

    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7b9ac432ac6ac82b56574b8ede8f6c14&libraries=services"></script>
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
        
        <c:choose>
        	<c:when test="${keywordList eq null}">
        		<c:forEach items="${locationList}" var="location">
           			var wtmX = ${location.x};
            		var wtmY = ${location.y};

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
        	</c:when>
        	<c:otherwise>
        		<c:forEach items="${locationList}" var="location">
   					var wtmX = ${location.x};
    				var wtmY = ${location.y};

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
        	</c:otherwise>
        </c:choose>
        
        

        
    });
    </script>
</body>
</html>
