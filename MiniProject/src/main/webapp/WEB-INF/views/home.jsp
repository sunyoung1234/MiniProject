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
        
        	.gas-chart-box{
        		margin-bottom: 400px;
        	
        	}
        	
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
        	}
        	
        	.chart-box2{
        		width:1000px;
        		height:300px;
        	}
        	
        	.point-box{
        	}
        	
        	.point-title{
        	 	padding-left:10px;
        	}
        	
        	.point-head{
        		border-bottom: 1px solid black;
        		text-align: center;
        	}
        	
        	.point-body{
        		text-align: center;
        	}
        
        </style>
        
    </head>
    <body>

        <%@ include file="/WEB-INF/inc/top.jsp"%>
        
        <!-- Page header with logo and tagline-->
        <header class="py-5 bg-light border-bottom mb-4">
            <div class="container">
                <div class="text-center my-5">
                    <h1 class="fw-bolder">Green Solution</h1>
                    <p class="lead mb-0">대기 중 온실가스 농도가 증가함에 따라 대기와 해양은 따뜻해지고
눈과 빙하의 양은 줄어들고 해수면은 상승하고 해양산성화가 진행 중으로
지구온난화는 명백하게 진행되고 있다는 것을 알 수 있으며, 기후변화 영향이 나타나고 그 정도가 진행됨에 따라 기후위기를 초래하고 있습니다.</p>
					<br>
                    <p class="lead mb-0">Green Solution은 이러한 기후 위기를 실감하고 탄소 중립을 위한 방법들 중 하나로 건축 자재에 따른 탄소 배출량을 계산하고 더 나은 탄소 배출 절감을 진행하는 건축 자재 견적 솔루션 기업입니다.</p>
                </div>
            </div>
        </header>
        <!-- Page content-->
        
        
        <div class="container">
        	<h2 class="mb-4">탄소 배출 관련 정보</h2>
            
                <div class="gas-chart-box d-flex">
                    <div class="gas mb-4 me-4">
                    	<h4 class="card-title"></h4>1990년 ~ 2020년 온실가스 배출량 추이</h2>
                    	<div>
                    		<canvas id="gasChart"></canvas>
                    	</div>
                        <div class="card-body">
                            <p class="card-text">온실가스 배출량은 해마다 증가하는 추세이고 탄소 중립을 실현하기 위해서는 탄소 배출량을 절감해야한다.</p>
                        </div>
                    </div>
                    
                </div>
                
                <div class="point-box mb-4">
                	<div class="point-title">
	                   	<h3>광역시도별 탄소중립포인트 에너지 참여현황</h3>
                	</div>
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
                   		 <div class="chart-box2">
                   		 	<canvas id="myChart2"></canvas>
                   		</div>
                   </div>
                   	
               </div>
                
         </div>
         
         <%@ include file="/WEB-INF/inc/footer.jsp" %>
        

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
