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




</style>

</head>
<body>

    <%@ include file="/WEB-INF/inc/top.jsp"%>

    <!-- 첫번째: 탄소 배출 관련 정보 -->
    <section id="section2" class="hidden">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-11">
                    <div class="card shadow-lg mb-4">
                        <div class="card-header text-white bg-success">
                            <h4 class="mb-0">1990년 ~ 2020년 온실가스 배출량 추이</h4>
                        </div>
                        <div class="gas">
                            <canvas id="gasChart" class="w-100" style="max-height: 400px;"></canvas>
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
            
        	
        	let gasChart = document.getElementById("gasChart")
        	
        	let v_gasTwo = []
        	for(let i = 0; i < v_gas.length; i+=12){
        		v_gasTwo.push(v_gas[i])
        	}
        	console.log(v_gasTwo)
        	
        	let v_array = []
        	for(let i = 1990; i < 2026; i++){
        		v_array.push(i)
        	}
        	console.log(v_array)
        	
        	new Chart(gasChart,{
        		type:'line',
        		data:{
        			labels: v_array,
        			datasets:[{
        				label:'온실가스 총 배출량',
        				data: v_gasTwo.slice(0,31)
        			},{
        				label:'20년 이후 예측 온실가스 총 배출량',
        				data: v_gasTwo.slice(0,36)
        			}]
        		},
        		 options: {
        			 elements: {
        		    	   point: {
        		    	   radius: 0,
        		    	  },
        		    },
        		    plugins: {
        	            title: {
        	                display: true,
        	                text: '년도별 온실가스 총 배출량'
        	            }
        	        },
                     scales: {
                         x: {
                             ticks: {
                                 maxRotation: 45,
                                 minRotation: 45,
                             },
                             title: {
                                 display: true,
                                 text: '년도'
                             },
                         },
                         y: {
                             beginAtZero: true,
                             title: {
                                 display: true,
                                 text: '배출량'
                             },
                         },
                     }
                 }
             });
        
        	
        	
        
        </script>


</body>
</html>
