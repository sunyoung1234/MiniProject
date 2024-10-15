<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Blog Home - Start Bootstrap Template</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet" />
        
        <style type="text/css">
        	.gas{
        		width:1200px;
        		height:400px;
        	}
        	
        	font-bold{
        		font-weight: bold;
        	}
        	
        	.bg-color{
        		background-color: #10bd66;
        	}
        	
        	.table-box{
        		width:1000px;
        	}
        	
        	.chart-box{
        		width:1000px;
        		height:300px;
        		border: 1px solid black;
        	}
        
        </style>
        
    </head>
    <body>

        <!-- Responsive navbar-->
        <nav class="navbar navbar-expand-lg navbar-dark bg-color">
            <div class="container">
                <a class="navbar-brand" href="${pageContext.request.contextPath }/">Green Solution</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                        <li class="nav-item"><a class="nav-link font-bold" href="${pageContext.request.contextPath }/">Home</a></li>
                        <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath }/loginView">로그인</a></li>
                        <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath }/registView">회원가입</a></li>
                        <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath }/boardView">견적 요청</a></li>
                    </ul>
                </div>
            </div>
        </nav>
        <!-- Page header with logo and tagline-->
        <header class="py-5 bg-light border-bottom mb-4">
            <div class="container">
                <div class="text-center my-5">
                    <h1 class="fw-bolder">Green Solution</h1>
                    <p class="lead mb-0">온실가스 배출로 인해 지구온난화가 진행중이며 몇 도 씨 상승시 어떻게 된다 이러한 현상의 도움을 주고자 이 기업을 설립하였습니다</p>
                    <p class="lead mb-0">Green Solution은 건축 자재에 따른 탄소 배출량을 계산하고 더 나은 탄소 배출 절감을 진행하는 건축 자재 견적 솔루션 기업입니다.</p>
                </div>
            </div>
        </header>
        <!-- Page content-->
        
        
        <div class="container">
        	<h2 class="mb-4">탄소 배출 관련 정보</h2>
            
                <div class="d-flex">
                    <div class="gas mb-4 me-4">
                    	<h4 class="card-title">1990년 ~ 2020년 온실가스 배출량 추이</h2>
                        <a href="https://www.index.go.kr/unity/potal/indicator/IndexInfo.do?cdNo=210&clasCd=2&idxCd=4288"><img class="card-img-top" src="resources/image/chart428801_1Img.png" /></a>
                        <div class="card-body">
                            <p class="card-text">온실가스 배출량은 해마다 증가하는 추세이고 탄소 중립을 실현하기 위해서는 탄소 배출량을 절감해야한다.</p>
                        </div>
                    </div>
                    
                    <div class="gas mb-4">
                    	<h4 class="card-title">20년 이후 온실가스 예상 배출량 추이</h2>
                        <a href="https://www.index.go.kr/unity/potal/indicator/IndexInfo.do?cdNo=210&clasCd=2&idxCd=4288"><img class="card-img-top" src="resources/image/chart428801_1Img.png" /></a>
                        <div class="card-body">
                            <p class="card-text">온실가스 배출량은 해마다 증가하는 추세이고 탄소 중립을 실현하기 위해서는 탄소 배출량을 절감해야한다.</p>
                        </div>
                    </div>
                    
                </div>
                
                <div class="mb-4 ">
                   	<h3>광역시도별 탄소중립포인트 에너지 참여현황</h3>
                   	<div>
                   		<select id="category" name="regionCategory" onchange="f_change()">
                   			<option value="강원" ${keyRegion == '강원' ? 'selected' : ''  }>강원
                   			<option value="경기" ${keyRegion == '경기' ? 'selected' : ''  }>경기
                   			<option value="경남" ${keyRegion == '경남' ? 'selected' : ''  }>경남
                   			<option value="경북" ${keyRegion == '경북' ? 'selected' : ''  }>경북
                   			<option value="광주" ${keyRegion == '광주' ? 'selected' : ''  }>광주
                   			<option value="대구" ${keyRegion == '대구' ? 'selected' : ''  }>대구
                   			<option value="대전" ${keyRegion == '대전' ? 'selected' : ''  }>대전
                   			<option value="부산" ${keyRegion == '부산' ? 'selected' : ''  }>부산
                   			<option value="세종" ${keyRegion == '세종' ? 'selected' : ''  }>세종
                   			<option value="울산" ${keyRegion == '울산' ? 'selected' : ''  }>울산
                   			<option value="인천" ${keyRegion == '인천' ? 'selected' : ''  }>인천
                   			<option value="전남" ${keyRegion == '전남' ? 'selected' : ''  }>전남
                   			<option value="전북" ${keyRegion == '전북' ? 'selected' : ''  }>전북
                   			<option value="제주" ${keyRegion == '제주' ? 'selected' : ''  }>제주
                   			<option value="충남" ${keyRegion == '충남' ? 'selected' : ''  }>충남
                   			<option value="충북" ${keyRegion == '충북' ? 'selected' : ''  }>충북
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
	                   			<thead>
	                   				<tr>
	                   					<th>지역</th>
	                   					<th>가구수</th>
	                   					<th>참여가구</th>
	                   					<th>참여율(%)</th>
	                   				</tr>
	                   			</thead>
	                   			<tbody>
	                   				<c:forEach items="${keyPointList}" var="pointList">
		                   				<tr>
		                    				<th>${pointList.pointRegion }</th>
		                    				<td>${pointList.pointApartmentAll }</td>
		                    				<td>${pointList.pointApartmentJoin }</td>
		                    				<td>${pointList.participation } </td>
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
                  
                  <div >
                   	<h3>기초단체별 탄소중립포인트 에너지 참여현황</h3>
                   	<div class="d-flex justify-content-between">
                   		<div class="table-box">
	                   		<table>
	                   			<colgroup>
		                   			<col width="13%">
	                   				<col width="13%">
	                   				<col width="13%">
	                   				<col width="13%">
	                   				
	                   			</colgroup>
	                   			<thead>
	                   				<tr>
	                   					<th>지역</th>
	                   					<th>가구수</th>
	                   					<th>참여가구</th>
	                   					<th>참여율(%)</th>
	                   				</tr>
	                   			</thead>
	                   			<tbody id="tableBottom">
	                   				<c:forEach items="${keyGangwan }" var="cityList">
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
                   		 <div class="chart-box">
                   			<canvas id="myChart2"></canvas>
                   		</div>
                   </div>
                   	
               </div>
                
         </div>
        <!-- Footer-->
        <footer class="py-5 bg-dark">
            <div class="container"><p class="m-0 text-center text-white">Copyright &copy; Your Website 2023</p></div>
        </footer>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
        <script type="text/javascript">
        
        	let v_partList = '${keyPartList}'
        	let v_regionName = "${keyRegionName}"
        	
        	v_partList = v_partList.replace('[', '')
       		v_partList = v_partList.replace(']', '')
       		
       		v_regionName = v_regionName.replace('[', '')
       		v_regionName = v_regionName.replace(']', '')
        	
       		v_partList = v_partList.split(',')
           	v_regionName = v_regionName.split(',')
           	
           
        	
        	let v_temp = {}
        	v_temp['name'] = v_regionName
        	v_temp['num'] = v_partList
        	
        	console.log(v_temp)
        	console.log(v_partList)
        	console.log(typeof(v_partList))
        	console.log(v_regionName)
        	console.log(typeof(v_regionName))
        	
        	let ctx = document.getElementById('myChart')
        	
        	
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
       	       					
       	       					v_chartRegion += v_region[i]["pointCity"]
       							v_chartPari += v_region[i]["cityParticipation"]
       					}
       					
       					document.getElementById("tableBottom").innerHTML += v_input
	       				
       		           	
       		           	let v_temp = {}
			        	v_temp['name'] = v_chartRegion
			        	v_temp['num'] = v_chartPari
			        	
			        	console.log(v_chartRegion)
			        	console.log(v_chartPari)
			        	console.log(v_temp)
			        	
			        	let ctx2 = document.getElementById('myChart2')
       					
       				}
       			}
       			
       			v_ajax.send(v_data);
        		
        	}
        	
        	
        
        </script>
        
        
        
    </body>
</html>
