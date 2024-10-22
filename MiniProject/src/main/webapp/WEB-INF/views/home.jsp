<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Green Solution</title>
<!-- Favicon -->
<link rel="icon" type="image/x-icon"
	href="${pageContext.request.contextPath}/resources/assets/favicon.ico" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="css/styles.css" rel="stylesheet" />

<style type="text/css">
.gas-chart-box {
	margin-bottom: 400px;
}

.gas {
	width: 1200px;
	height: 400px;
}

font-bold {
	font-weight: bold;
}

.bg-color {
	background-color: #10bd66;
}

.table-box {
	width: 1000px;
}

.chart-box {
	width: 1000px;
	height: 300px;
}

.chart-box2 {
	width: 1000px;
	height: 300px;
}

.point-box {
	
}

.point-title {
	padding-left: 10px;
}

.point-head {
	border-bottom: 1px solid black;
	text-align: center;
}

.point-body {
	text-align: center;
}

.hidden {
	opacity: 0;
	transition: opacity 0.5s ease-in-out; /* 부드러운 전환 효과 */
}

.visible {
	opacity: 1;
}

/* 비디오와 텍스트 레이아웃 */
.video-section {
	position: relative; /* 비디오 위에 텍스트를 올리기 위해 */
	height: 95vh; /* 비디오의 높이를 화면의 50%로 설정 */
	overflow: hidden; /* 비디오가 부모 요소를 넘지 않도록 설정 */
	top: -7px;
}

.video-section video {
	width: 100%; /* 비디오의 너비를 부모에 맞춤 */
	height: 100%; /* 비디오의 높이를 부모에 맞춤 */
	object-fit: cover; /* 비디오가 비율에 맞게 잘림 */
}

.overlay-text {
	position: absolute; /* 비디오 위에 텍스트를 올리기 위해 */
	top: 47%; /* 수직 중앙 정렬 */
	left: 50%; /* 수평 중앙 정렬 */
	transform: translate(-50%, -50%); /* 중앙 정렬 */
	color: white; /* 텍스트 색상 */
	text-align: center; /* 텍스트 정렬 */
	opacity: 1; /* 텍스트가 보이도록 설정 */
	font-size: 1em; /* 비디오 위 텍스트 크기 2배 증가 */
}

/* 카드 스타일 */
.card {
    border-radius: 10px;
    overflow: hidden;
    transition: transform 0.2s;
}

/* .card:hover {
    transform: scale(1.02);
} */

.card-header {
    padding: 20px;
    text-align: center;
}

.card-body {
    padding: 20px;
}

/* 차트 스타일 */
#gasChart {
    background-color: #f8f9fa;
    border-radius: 10px;
}

</style>

</head>
<body>

	<%@ include file="/WEB-INF/inc/top.jsp"%>

	<!-- 첫 번째 영역: 비디오 섹션 -->
	<header class="video-section" id="section1">
		<video autoplay loop muted>
			<source
				src="${pageContext.request.contextPath}/resources/image/forest.mp4"
				type="video/mp4">
			비디오를 지원하지 않는 브라우저입니다.
		</video>

		<!-- 비디오 위에 텍스트 영역 -->
		<div class="overlay-text">
			<h2 style="margin: 0; font-size: 70px; margin-bottom: 10px">Green
				Solution</h2>
			<p style="margin: 0; margin-bottom: 5px">대기 중 온실가스 농도가 증가함에 따라
				대기와 해양은 따뜻해지고...</p>
			<p style="margin: 0;">Green Solution은 기후 위기를 실감하고 탄소 중립을 위한 방법들 중
				하나입니다.</p>
		</div>
	</header>
	<!-- 두 번째 영역: 탄소 배출 관련 정보 -->
	<section id="section2" class="hidden">
		<div class="container">
<!-- 			<h2 class="mb-5 text-center">탄소 배출 관련 정보</h2> -->
			<div class="row justify-content-center">
				<div class="col-lg-8">
					<div class="card shadow-lg mb-4">
						<div class="card-header text-white bg-success">
							<h4 class="mb-0">1990년 ~ 2020년 온실가스 배출량 추이</h4>
						</div>
						<div class="card-body">
							<div>
								<canvas id="gasChart" class="w-100" style="max-height: 400px;"></canvas>
							</div>
							<p class="card-text mt-3">온실가스 배출량은 해마다 증가하는 추세이며, 탄소 중립을
								실현하기 위해서는 탄소 배출량을 절감해야 합니다.</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- 세 번째 영역: 광역시도별 탄소중립포인트 에너지 참여현황 -->
	<section id="section3" class="hidden">
		<div class="container">
			<div class="point-box mb-4">
				<div class="point-title">
					<h3>광역시도별 탄소중립포인트 에너지 참여현황</h3>
				</div>
				<div>
					<select id="category" name="regionCategory" onchange="f_change()">
						<option value="강원" ${keyRegion == '강원' ? 'selected' : ''}>강원</option>
						<option value="경기" ${keyRegion == '경기' ? 'selected' : ''}>경기</option>
						<option value="경남" ${keyRegion == '경남' ? 'selected' : ''}>경남</option>
						<option value="경북" ${keyRegion == '경북' ? 'selected' : ''}>경북</option>
						<option value="광주" ${keyRegion == '광주' ? 'selected' : ''}>광주</option>
						<option value="대구" ${keyRegion == '대구' ? 'selected' : ''}>대구</option>
						<option value="대전" ${keyRegion == '대전' ? 'selected' : ''}>대전</option>
						<option value="부산" ${keyRegion == '부산' ? 'selected' : ''}>부산</option>
						<option value="세종" ${keyRegion == '세종' ? 'selected' : ''}>세종</option>
						<option value="울산" ${keyRegion == '울산' ? 'selected' : ''}>울산</option>
						<option value="인천" ${keyRegion == '인천' ? 'selected' : ''}>인천</option>
						<option value="전남" ${keyRegion == '전남' ? 'selected' : ''}>전남</option>
						<option value="전북" ${keyRegion == '전북' ? 'selected' : ''}>전북</option>
						<option value="제주" ${keyRegion == '제주' ? 'selected' : ''}>제주</option>
						<option value="충남" ${keyRegion == '충남' ? 'selected' : ''}>충남</option>
						<option value="충북" ${keyRegion == '충북' ? 'selected' : ''}>충북</option>
					</select>
				</div>
				<div class="d-flex justify-content-between">
					<div class="table-box">
						<table>
							<colgroup>
								<col width="11%">
								<col width="13%">
								<col width="13%">
								<col width="13%">
							</colgroup>
							<thead class="point-head">
								<tr>
									<th>지역</th>
									<th>가구수</th>
									<th>참여가구</th>
									<th>참여율(%)</th>
								</tr>
							</thead>
							<tbody class="point-body">
								<c:forEach items="${keyPointList}" var="pointList">
									<tr>
										<th>${pointList.pointRegion}</th>
										<td>${pointList.pointApartmentAll}</td>
										<td>${pointList.pointApartmentJoin}</td>
										<td>${pointList.participation}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<div class="chart-box">
						<canvas id="myChart"></canvas>
					</div>
				</div>
			</div>

			<div class="point-box mb-4">
				<div class="point-title">
					<h3>기초단체별 탄소중립포인트 에너지 참여현황</h3>
				</div>
				<div class="d-flex justify-content-between">
					<div class="table-box">
						<table>
							<colgroup>
								<col width="13%">
								<col width="13%">
								<col width="13%">
								<col width="13%">
							</colgroup>
							<thead class="point-head">
								<tr>
									<th>지역</th>
									<th>가구수</th>
									<th>참여가구</th>
									<th>참여율(%)</th>
								</tr>
							</thead>
							<tbody class="point-body" id="tableBottom">
								<c:forEach items="${keyGangwan}" var="cityList">
									<tr>
										<th>${cityList.pointCity}</th>
										<td>${cityList.pointCityApartmentAll}</td>
										<td>${cityList.pointCityApartmentJoin}</td>
										<td>${cityList.cityParticipation}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<div class="chart-box2">
						<canvas id="myChart2"></canvas>
					</div>
				</div>
			</div>
		</div>
	</section>


	<%@ include file="/WEB-INF/inc/footer.jsp"%>


	<script type="text/javascript">
        
        	let v_yearMonth = '${getGreenYear}'
        	let v_gas = '${getGreenGas}'
        	
        	v_yearMonth = v_yearMonth.replace('[', '')
        	v_yearMonth = v_yearMonth.replace(']', '')
         		
         	v_gas = v_gas.replace('[', '')
         	v_gas = v_gas.replace(']', '')
          	
         	v_yearMonth = v_yearMonth.split(',')
            v_gas = v_gas.split(',')
        	
        	console.log(v_yearMonth)
        	console.log(v_gas)
        	
        	let gasChart = document.getElementById("gasChart")
        	
        	new Chart(gasChart,{
        		type:'line',
        		data:{
        			labels: v_yearMonth,
        			datasets:[{
        				label:'온실가스 총배출량',
        				data: v_gas
        			},{
        				label:'온실가스 총배출량',
        				data: v_gas
        			}]
        		},
        		 options: {
                     scales: {
                         x: {
                             ticks: {
                                 autoSkip: true,
                                 maxRotation: 45,
                                 minRotation: 45
                             }
                         },
                         y: {
                             beginAtZero: true
                             }
                     }
                 }
             });
        
        	let v_partList = '${keyPartList}'
        	let v_regionName = "${keyRegionName}"
        	
        	v_partList = v_partList.replace('[', '')
       		v_partList = v_partList.replace(']', '')
       		
       		v_regionName = v_regionName.replace('[', '')
       		v_regionName = v_regionName.replace(']', '')
        	
       		v_partList = v_partList.split(',')
           	v_regionName = v_regionName.split(',')
           	
           	let v_gangwon = '${keyRegion }'
          	let v_gangwonValue = "${keyRegionValue}"
               	
          	v_gangwon = v_gangwon.replace('[', '')
            v_gangwonValue = v_gangwonValue.replace('[', '')
              		
            v_gangwon = v_gangwon.replace('[', '')
            v_gangwonValue = v_gangwonValue.replace(']', '')
               	
            v_gangwon = v_gangwon.split(',')
            v_gangwonValue = v_gangwonValue.split(',')
        	
        	let v_temp = {}
        	v_temp['name'] = v_regionName
        	v_temp['num'] = v_partList
        	
        	let v_temp2 = {}
        	v_temp2['name'] = v_gangwon
        	v_temp2['num'] = v_gangwonValue
        	
        	console.log(v_temp)
        	console.log(v_partList)
        	console.log(typeof(v_partList))
        	console.log(v_regionName)
        	console.log(typeof(v_regionName))
        	
        	let ctx = document.getElementById('myChart')
        	
        	console.log(v_temp2)
        	
        	
        	new Chart(ctx,{
        		type:'bar',
        		data:{
        			labels: v_temp['name'],
        			datasets:[{
        				label:'광역시도별 탄소중립포인트 에너지 참여율(%)',
        				data: v_temp['num']
        			}]
        		},
        		 options: {
                     scales: {
                         x: {
                             ticks: {
                                 autoSkip: false,
                                 maxRotation: 45,
                                 minRotation: 45
                             }
                         },
                         y: {
                             beginAtZero: true
                             }
                     }
                 }
             });
          	
			let ctx2 = document.getElementById("myChart2")
			
        	let v_chart = new Chart(ctx2,{
        		type:'bar',
        		data:{
        			labels: v_temp2['name'],
        			datasets:[{
        				label:'기초단체별 탄소중립포인트 에너지 참여율(%)',
        				data: v_temp2['num']
        			}]
        		},
        		 options: {
                     scales: {
                         x: {
                             ticks: {
                                 autoSkip: false,
                                 maxRotation: 45,
                                 minRotation: 45
                             }
                         },
                         y: {
                             beginAtZero: true
                             }
                     }
                 }
             });
        	
        	v_chart
        	
        	function f_change(){
        		console.log(event.target.value)
        		document.getElementById("category").value = event.target.value
        		
				let v_ajax = new XMLHttpRequest();
       			
       			v_ajax.open("POST", '${pageContext.request.contextPath}/tableView');
       			
				let v_data = "pointRegion=" + event.target.value;
       			v_ajax.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
       			
       			v_ajax.onload = () =>{
       				if(v_ajax.response){
       					
       					let v_region = JSON.parse(v_ajax.response)
       					
       					let v_input = "";
       					document.getElementById("tableBottom").innerHTML = ""
       					
       					let v_chartRegion = [];
       					let v_chartPari = [];
       					
       					for(let i = 0; i < v_region.length; i++){
       						v_input += '<tr>'
       	       					v_input += '<th>'+ v_region[i]["pointCity"] +'</th>'
       	       					v_input += '<td> '+ v_region[i]["pointCityApartmentAll"] +' </td>'
       	       					v_input += '<td> '+ v_region[i]["pointCityApartmentJoin"] +' </td>'
       	       					v_input += '<td> '+ v_region[i]["cityParticipation"] +' </td>'
       	       					v_input += '<tr>'
       	       					
       	       					v_chartRegion[i] = v_region[i]["pointCity"]
       							v_chartPari[i] = v_region[i]["cityParticipation"]
       					}
       					
       					document.getElementById("tableBottom").innerHTML += v_input
	       				
       		           	
       		           	let v_temp2 = {}
			        	v_temp2['name'] = v_chartRegion
			        	v_temp2['num'] = v_chartPari
			        	
			        	console.log(v_temp2)
			        	
			        	v_chart.data.datasets[0].label = '기초단체별 탄소중립포인트 에너지 참여율(%)'
			            v_chart['data']['labels'] = v_temp2['name']
       					v_chart['data']['datasets'][0]['data'] = v_temp2['num'];
       					
       					v_chart.update();
						
			        	v_chart
			        	
			        	
			        	
       					
       				}
       			}
       			
       			v_ajax.send(v_data);
        		
        	}
        	
        	
        
        </script>
	<script>
document.addEventListener("DOMContentLoaded", function() {
	const sections = document.querySelectorAll("section");

	function checkVisibility() {
		const triggerBottom = window.innerHeight / 5 * 4; // 스크롤이 화면의 80% 지점에 도달했을 때
		sections.forEach(section => {
			const sectionTop = section.getBoundingClientRect().top;

			if (sectionTop < triggerBottom) {
				section.classList.add("visible");
			} else {
				section.classList.remove("visible");
			}
		});
	}

	window.addEventListener("scroll", checkVisibility);
	checkVisibility(); // 초기 호출
});
</script>

	<script>
    // 텍스트 표시 함수
    function showOverlayText() {
        const overlayText = document.querySelector('.overlay-text');
        overlayText.style.opacity = 1; // 텍스트를 보이게 함
    }

    // 페이지 로드 후 비디오 위의 텍스트 나타나기
    window.onload = function() {
        showOverlayText(); // 비디오가 로드된 후 텍스트 보이기
    };
</script>


</body>
</html>
