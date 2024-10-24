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
<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap"
	rel="stylesheet">

<style type="text/css">
/* 기본 스타일 */
body {
	font-family: 'Poppins', sans-serif; /* 변경된 폰트 */
	background-color: white; /* 밝은 배경색 */
	color: #333;
}

h3 {
	font-weight: bold;
	color: #2c3e50;
}

/* 차트 스타일 */
.chart-box, .chart-box2 {
	width: 100%;
	max-width: 900px;
	margin: 0 auto;
	padding: 20px;
}

canvas {
	border-radius: 12px; /* 라운드 처리 */
}

/* 테이블 스타일 */
table {
	width: 100%;
	border-collapse: collapse;
	margin: 10px 0; /* 위아래 간격을 줄임 */
	border-radius: 12px; /* 테이블 엣지 부드럽게 */
	overflow: hidden; /* border-radius 적용을 위한 */
}

th, td {
	padding: 2px;
	text-align: center;
	border-bottom: 1px solid #ddd; /* 기존: #ddd */
}

th {
	background-color: #198754; /* 변경: #10bd66 -> #198754 */
	color: white;
	font-weight: bold;
}

tbody tr:nth-child(even) {
	background-color: #f2f2f2; /* 줄무늬 효과 */
}

tbody tr:hover {
	background-color: #d1e7dd; /* 호버 효과 */
}

/* 반응형 디자인 */
@media ( max-width : 768px) {
	.card {
		margin-bottom: 20px;
	}
	.chart-box, .chart-box2 {
		padding: 10px;
	}
	h3 {
		font-size: 1.2em;
	}
}

/* 버튼 스타일 */
select {
	border: 1px solid #198754; /* 변경: #10bd66 -> #198754 */
	border-radius: 5px;
	padding: 10px;
	font-size: 1em;
	transition: border-color 0.3s;
}

select:hover {
	border-color: #08a95c; /* 기존: #08a95c (변경하지 않음) */
}

select:focus {
	outline: none;
	border-color: #007bff; /* 포커스 시 색상 변화 (변경하지 않음) */
}

.solution-section {
	background-color: white; /* 배경색 */
	padding: 50px 20px; /* 상하 좌우 패딩 */
	text-align: center; /* 텍스트 가운데 정렬 */
	height: 200px;
}

.solution-content h2 {
	color: #2c3e50; /* 제목 색상 */
	font-weight: bold; /* 제목 두껍게 */
}

.solution-content p {
	color: #34495e; /* 본문 색상 */
	max-width: 800px; /* 최대 너비 */
	margin: 0 auto; /* 가운데 정렬 */
}

.solution-title h2 {
	margin-left: 200px;
	margin-top: 50px;
	margin-bottom: 30px;
	font-size: 50px;
}
</style>



</head>
<body>

	<%@ include file="/WEB-INF/inc/top.jsp"%>

	<!-- 텍스트 섹션 -->
	<section class="solution-section" id="section2">
		<div class="solution-content">
			<h2 style="margin: 0; font-size: 50px; text-align: center; margin-bottom: 15px;"> 탄소중립포인트 에너지 참여현황</h2>
			<p style="font-size: 16px; text-align: center; margin-bottom: 55px;">탄소중립을
				향한 여정은 지역별 에너지 참여를 통해 가속화됩니다. <br> 각
				광역시도의 현황은 우리가 함께 나아가야 할 방향을 제시합니다. </p>

		</div>
	</section>


	</section>
	<!-- 세 번째 영역: 광역시도별 탄소중립포인트 에너지 참여현황 -->
	<section id="section3" class="hidden">
		<div class="container">
			<div class="point-box mb-4">
				<div class="point-title">
					<h3>광역시도별 참여현황</h3>
				</div>
				<div class="d-flex justify-content-between" style="flex-wrap: wrap;">
					<div class="table-box" style="flex: 3;">
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
					<div class="chart-box" style="flex: 7;">
						<canvas id="myChart"></canvas>
					</div>
				</div>
			</div>

			<div class="point-box mb-4">
				<div class="point-title">
					<h3>기초단체별 참여현황</h3>
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

				<div class="d-flex justify-content-between" style="flex-wrap: wrap;">
					<div class="table-box" style="flex: 3;">
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
					<div class="chart-box" style="flex: 7;">
						<canvas id="myChart2"></canvas>
					</div>
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




</body>
</html>
