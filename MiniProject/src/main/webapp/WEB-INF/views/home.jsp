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
                        <li class="nav-item"><a class="nav-link" href="#!">회원가입</a></li>
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
                   		<select>
                   			<option>강원
                   			<option>경기
                   			<option>강원
                   		</select>
                   		<button>검색</button>
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
		                   			<col width="11%">
	                   				<col width="13%">
	                   				<col width="13%">
	                   				<col width="13%">
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
	                   					<th>지역</th>
	                   					<th>가구수</th>
	                   					<th>참여가구</th>
	                   					<th>참여율(%)</th>
	                   				</tr>
	                   			</thead>
	                   			<tbody>
	                   				<tr>
	                    				<th>강원</th>
	                    				<td>708,894</td>
	                    				<td>53,458</td>
	                    				<td>7.54</td>
	                    				<th>강원</th>
	                    				<td>708,894</td>
	                    				<td>53,458</td>
	                    				<td>7.54</td>
	                   				</tr>
	                   				<tr>
	                    				<th>강원</th>
	                    				<td>708,894</td>
	                    				<td>53,458</td>
	                    				<td>7.54</td>
	                    				<th>강원</th>
	                    				<td>708,894</td>
	                    				<td>53,458</td>
	                    				<td>7.54</td>
	                   				</tr>
	                   				<tr>
	                    				<th>강원</th>
	                    				<td>708,894</td>
	                    				<td>53,458</td>
	                    				<td>7.54</td>
	                    				<th>강원</th>
	                    				<td>708,894</td>
	                    				<td>53,458</td>
	                    				<td>7.54</td>
	                   				</tr>
	                   			</tbody>
	                   		 </table>
                   		 </div>
                   		 <div class="chart-box">
                   			차트
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
        	let v_regionName = '${keyRegionName}'
        	
        	console.log(v_partList)
        	console.log(v_regionName)
        	
        	let ctx = document.getElementById('myChart')
        	
        	new Chart(ctx,{
        		type:'bar',
        		data:{
        			labels: v_regionName,
        			datasets:[{
        				label:'광역시도별 탄소중립포인트 에너지 참여율(%)',
        				data:v_partList
        			}]
        		},
                options: {
                    scales: {
                        y: {
                            beginAtZero: true
                        },
        				ticks: {
                            minRotation: 45, // x축 값의 회전 각도를 설정할 수 있어요.
                            padding: 5, // x축 값의 상하 패딩을 설정할 수 있어요.
                         }
                    }
                }
        	})
        	
        
        
        </script>
        
        
        
    </body>
</html>
