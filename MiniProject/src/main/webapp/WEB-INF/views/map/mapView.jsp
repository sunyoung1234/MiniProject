<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>간단한 지도 표시하기</title>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script> <!-- 주소 -->
<style type="text/css">


        .custom-overlay {
            width: 100px;
            height: 40px;
            background-color: #fff;
            border: 2px solid #39DE2A;
            border-radius: 4px;
            text-align: center;
            line-height: 40px;
            font-weight: bold;
        }
        
        .custom-overlay:hover{
        	background-color: yellow;
        }
</style>
</head>
<body>
	<input type="text" id="sample4_postcode" placeholder="우편번호">
	<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
	<input type="text" id="sample4_roadAddress" placeholder="도로명주소">
	<input type="text" id="sample4_jibunAddress" placeholder="지번주소">
	<span id="guide" style="color:#999;display:none"></span>
	<input type="text" id="sample4_detailAddress" placeholder="상세주소">
	<input type="text" id="sample4_extraAddress" placeholder="참고항목">
	 
	<button id="registJuso">등록</button>
	<button onclick="hideMarkers">등록</button>
	
	<div id="map" style="width:100%;height:1000px;"></div> 
	<p>
	    <button onclick="zoomIn()">-</button>
	    <button onclick="zoomOut()">+</button>
	    <span id="maplevel"></span>
	</p>
	
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e0184ed647e553cf5795a108feda8a4a&libraries=clusterer,services"></script>

	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e0184ed647e553cf5795a108feda8a4a"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/sidodo.js"></script>
	<script>
	
		var jsonData = JSON.parse(JSON.stringify(SidoFile));

	
		let mapContainer = document.getElementById('map'), // 지도를 표시할 div    
	    mapOption = { 
	        center: new kakao.maps.LatLng(35.544932, 127.082053), // 지도의 중심좌표
	        level: 13 // 지도의 확대 레벨
	    }; 
		
		const strokeColors = ['#39DE2A', '#FF5733', '#33C1FF', '#FFC300', '#9B59B6', '#8E44AD', '#F39C12', '#2ECC71', '#E74C3C', '#2980B9', '#16A085', '#1F618D', '#D35400', '#34495E', '#F1C40F', '#F79C42'];
		const fillColors = ['#A2FF99', '#FFB3B3', '#B3D9FF', '#FFEB99', '#E0B0FF', '#D5A6E8', '#F4D03F', '#ABEBC6', '#FADBD8', '#D5E8F9', '#A3E4D7', '#D4E6F1', '#FDEBD0', '#CCD1D1', '#F9E79F', '#F2D7D5'];

 		 
		// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
		let map = new kakao.maps.Map(mapContainer, mapOption);
		
		displayLevel(); 
		
		// 좌표
		let positions = []; // 제로에너지 건물 목록
		let markers = []; // marker 모아둔 배열
		let centers = [];
	    
		<c:forEach var="zero" items="${zeroList}">
		    positions.push({ 
		        title: '${zero.getBuildingName()}',
		        level: '${zero.getZeroLevel()}',
		        latlng: new kakao.maps.LatLng(${zero.getLatitude()},${zero.getLongitude()})
		    });
		</c:forEach>
		
		level = '';

		
		var imageSrc = "";
		
		
		for (var i = 0; i < positions.length; i ++){
			if(positions[i].level == 'ZEB 1'){
				imageSrc = "${pageContext.request.contextPath }/resources/image/zeb1.png";  
			}else if(positions[i].level == 'ZEB 2'){
				imageSrc = "${pageContext.request.contextPath }/resources/image/zeb2.png";
			}else if(positions[i].level == 'ZEB 3'){
				imageSrc = "${pageContext.request.contextPath }/resources/image/zeb3.png";
			}else if(positions[i].level == 'ZEB 4'){
				imageSrc = "${pageContext.request.contextPath }/resources/image/zeb4.png";
			}else{
				imageSrc = "${pageContext.request.contextPath }/resources/image/zeb5.png";
			}
			
		    var imageSize = new kakao.maps.Size(20,20); // 24,35   
		    
		    // 마커 이미지를 생성합니다    
		    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
		    
		    // 마커를 생성합니다 
		    var marker = new kakao.maps.Marker({
		        map: map, // 마커를 표시할 지도
		        position: positions[i].latlng, // 마커를 표시할 위치
		        title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
		        image : markerImage // 마커 이미지 
		    });
		    
		    markers.push(marker); 
		    
		    hideMarkers(); 
		}
		
		for(let i=0 ; i < jsonData['features'].length; i++){
			console.log(jsonData['features'][i]['properties']['SIG_KOR_NM'])
			
			var v_region = jsonData['features'][i]['properties']['SIG_KOR_NM'];
			var polygonPath = [];
			for(let j=0; j< jsonData['features'][i]['geometry']['coordinates'][0].length; j++){
				polygonPath.push(new kakao.maps.LatLng(jsonData['features'][i]['geometry']['coordinates'][0][j][1],jsonData['features'][i]['geometry']['coordinates'][0][j][0]))
			}
			
			var polygon = new kakao.maps.Polygon({
			    path:polygonPath, // 그려질 다각형의 좌표 배열입니다
			    strokeWeight: 5, // 선의 두께입니다
			    strokeColor: '#39DE2A'	, // 선의 색깔입니다
			    strokeOpacity: 0.8, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
			    strokeStyle: 'solid', // 선의 스타일입니다
			    fillColor: fillColors[i], // 채우기 색깔입니다
			    fillOpacity: 0 // 채우기 불투명도 입니다
			});  

			// 지도에 다각형을 표시합니다
			polygon.setMap(map);
			
			
			
			var centerP = getPolygonCenter(polygonPath,v_region);
			var content = '<div onclick="zoom(centerP)" class="custom-overlay">' + jsonData['features'][i]['properties']['SIG_KOR_NM'] + '</div>'
			
			var customOverlay = new kakao.maps.CustomOverlay({
			    position: centerP, 
			    content: content   
			});
			
			customOverlay.setMap(map);
		}
		
		
		 function sample4_execDaumPostcode() {
		        new daum.Postcode({
		            oncomplete: function(data) {
		                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

		                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
		                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
		                var roadAddr = data.roadAddress; // 도로명 주소 변수
		                var extraRoadAddr = ''; // 참고 항목 변수

		                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
		                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
		                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
		                    extraRoadAddr += data.bname;
		                }
		                // 건물명이 있고, 공동주택일 경우 추가한다.
		                if(data.buildingName !== '' && data.apartment === 'Y'){
		                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
		                }
		                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
		                if(extraRoadAddr !== ''){
		                    extraRoadAddr = ' (' + extraRoadAddr + ')';
		                }

		                // 우편번호와 주소 정보를 해당 필드에 넣는다.
		                document.getElementById('sample4_postcode').value = data.zonecode;
		                document.getElementById("sample4_roadAddress").value = roadAddr;
		                document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
		                
		                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
		                if(roadAddr !== ''){
		                    document.getElementById("sample4_extraAddress").value = extraRoadAddr;
		                } else {
		                    document.getElementById("sample4_extraAddress").value = '';
		                }

		                var guideTextBox = document.getElementById("guide");
		                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
		                if(data.autoRoadAddress) {
		                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
		                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
		                    guideTextBox.style.display = 'block';

		                } else if(data.autoJibunAddress) {
		                    var expJibunAddr = data.autoJibunAddress;
		                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
		                    guideTextBox.style.display = 'block';
		                } else {
		                    guideTextBox.innerHTML = '';
		                    guideTextBox.style.display = 'none';
		                }
		            }
		        }).open();
		    }
		 
		 var geocoder = new kakao.maps.services.Geocoder();
		 let v_latitude = 0;
		 let v_longitude = 0;
		 
		 
		 // 주소 검색 후 => 좌표 등록
		 document.querySelector('#registJuso').addEventListener('click',()=>{
			 let juso = document.querySelector('#sample4_roadAddress').value;
			 
			 geocoder.addressSearch(juso, function(result, status) {

				    // 정상적으로 검색이 완료됐으면 
				     if (status === kakao.maps.services.Status.OK) {

				        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
				        
				        v_latitude = result[0].y;
						v_longitude = result[0].x;
						
						console.log(v_latitude);
						console.log(v_longitude);

				        // 결과값으로 받은 위치를 마커로 표시합니다
				        var marker = new kakao.maps.Marker({
				            map: map,
				            position: coords
				        });

				        // 인포윈도우로 장소에 대한 설명을 표시합니다
				        var infowindow = new kakao.maps.InfoWindow({
				            content: '<div style="width:150px;text-align:center;padding:6px 0;">그린솔루션</div>'
				        });
				        infowindow.open(map, marker);

				        
				        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
				        map.setCenter(coords);
				    } 
				});
		 })
		 
		 function zoomIn() {        
		    level = map.getLevel();
		    
		    map.setLevel(level - 1);
		    
		    displayLevel();
		}    

		function zoomOut() {    
		    level = map.getLevel(); 
		    
		    map.setLevel(level + 1);
		    
		    displayLevel(); 
		}
		
		function zoom(event){
			level = map.getLevel(); 
		    console.log(level);
			while(level > 8){
			    map.setLevel(level - 1);
			} 
		    
		    displayLevel();
		    
		    var mouseLL = event.latLng;
		    map.setCenter(mouseLL);
		}
		
		/* window.addEventListener('mousewheel', function(){
			displayLevel();
		}); */
		
		kakao.maps.event.addListener(map, "zoom_changed", function (){
			displayLevel();
			level = map.getLevel();
			if(level < 11){
				showMarkers();
				polygon.setMap(null);
				customOverlay.setMap(null);
			}else{
				hideMarkers();
				polygon.setMap(map); 
				customOverlay.setMap(map);
			}
		})
		
		
		
		
		
		function displayLevel(){
		    var levelEl = document.getElementById('maplevel');
		    levelEl.innerHTML = '현재 지도 레벨은 ' + map.getLevel() + ' 레벨 입니다.';
		}
		
		function setMarkers(map) {
		    for (var i = 0; i < markers.length; i++) {
		        markers[i].setMap(map);
		    }            
		}
		
		// "마커 보이기" 버튼을 클릭하면 호출되어 배열에 추가된 마커를 지도에 표시하는 함수입니다
		function showMarkers() {
		    setMarkers(map)    
		}

		// "마커 감추기" 버튼을 클릭하면 호출되어 배열에 추가된 마커를 지도에서 삭제하는 함수입니다
		function hideMarkers() {
		    setMarkers(null);    
		}
		
		// 다각형 중심좌표
		function getPolygonCenter(polygonPath,region) {
		    var latSum = 0;
		    var lngSum = 0;
		    var pathLength = polygonPath.length;

		    // 각 좌표의 위도와 경도를 더함
		    for (let i = 0; i < pathLength; i++) {
		        latSum += polygonPath[i].getLat();  // 위도
		        lngSum += polygonPath[i].getLng();  // 경도
		    }

		    // 평균값을 구해서 중심 좌표를 반환
		    var centerLat = latSum / pathLength;
		    var centerLng = lngSum / pathLength;
		    
		    if(region == "충북"){ 
		    	centerLat += 0.2;
		    	centerLng -= 0.1;
		    }else if(region == "세종"){
		    	centerLat -= 0.05;
		    }else if(region == "충남"){
		    	centerLng -= 0.15;
		    }else if(region == "서울"){
		    	centerLng += 0.1;
		    }else if(region == "경기"){
		    	centerLat -= 0.25; 
		    	centerLng += 0.15;
		    }else if(region == "경북"){
		    	centerLat += 0.25; 
		    }else if(region == "대구"){
		    	centerLat += 0.05;  
		    }else if(region == "울산"){
		    	centerLat += 0.05;
		    }

		    return new kakao.maps.LatLng(centerLat, centerLng);
		}
		
		

		 
		     
	</script>
</body>
</html>