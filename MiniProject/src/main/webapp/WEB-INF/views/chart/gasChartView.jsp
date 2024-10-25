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

.container1{
	margin-top:20px;
}

.gas-chart-box {
	margin-bottom: 400px;
}

.gas {
	margin-top:20px;
	width: 1200px;
	height: 400px;
}

.main-title{
	margin-top:50px;
	margin-right:50px;
	font-size:80px;
	font-weight:bold;
	color: #6FB400;
	display: flex;
	justify-content: center;
	
}

.gas-title{
	margin-top:70px;
	margin-left:320px;
	padding-left:10px;
	font-size:30px;
	font-weight: bold;
}

.article-main-container{
	
	margin-top:70px;
	margin-bottom:70px;
	padding-left:10px;
	widht:95%;
	border: 1px solid #ddd;
    border-radius: 8px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    padding-bottom: 20px;
}



.article-main{
	font-size: 30px;
	font-weight: bold;
	margin-top:20px;
	
	
}

.article-container{
	display: flex;
	margin-top:20px;

}

.article-img{
	width:100%;
	height:100%
	
}

.article-box1{
	width:500px;
	height:400px;
	margin-right:50px;
	border: 1px solid #ddd;
    border-radius: 8px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

.article-box2{
	width:500px;
	height:400px;
	margin-right:150px;
	margin-left:30px;
	border: 1px solid #ddd;
    border-radius: 8px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

.carbon-main-container{
	margin-top:20px;
	margin-bottom:100px;
	padding-left:10px;
	widht:95%;
	border: 1px solid #ddd;
    border-radius: 8px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    
    
}

.carbon-main{
	font-size: 30px;
	font-weight: bold;
	margin-top:20px;
	margin-bottom: 20px;

}

.carbon-img-box{
	width:1100px;
	height:500px;
}

.carbon-img{
	width:100%;
	height:100%;
}

.carbon-text{
	margin-top: 30px;
	
}

.carbon-text > p{
	font-size: 20px;
}


</style>

</head>
<body>

    <%@ include file="/WEB-INF/inc/top.jsp"%>

    <!-- 첫번째: 탄소 배출 관련 정보 -->
    
    <div class="main-title">
    	탄소 관련 정보
    </div>
    
    <div class="gas-title">
	    온실가스 배출량 추이와 예측
    </div>
    
    <div class="container1">
        <div class="row justify-content-center">
            <div class="col-lg-8">
                <div class="card shadow-lg ">
                    <div class="gas">
                        <canvas id="gasChart" style="max-height: 400px;"></canvas>
                    </div>
                </div>
                
                <div class="article-main-container">
	                <div class="article-main">기사</div>
	                <div class="article-container">
	                	<div class="article-box1">
	                		<img class="article-img"  src="${pageContext.request.contextPath}/resources/image/article1.png">
	                	</div>
	                	<div class="article-box2">
	                		<img class="article-img" src="${pageContext.request.contextPath}/resources/image/article2.png">
	                	</div>
	                </div>
                </div>
                
                <div>
                
                <div class="carbon-main-container">
	                <div class="carbon-main">탄소 배출 절감과 기업</div>
	                	<div class="carbon-img-box">
	                		<img class="carbon-img" src="${pageContext.request.contextPath}/resources/image/tree.png">
	                	</div>
	                	<div class="carbon-text">
	                		<p>국립산림과학원에 따르면 30년산 소나무 1그루는 연간 6.6kgCO2 흡수한다고 합니다.</p>
	                		<p>온실가스 배출량이 늘어날수록 지구온난화와 이상 기후는 점차 증가할 것입니다.</p>
	                		<p>건물의 건설에서 철거까지 약 2억톤 가량의 탄소가 배출되고 이는 우리나라가 배출한 온실가스양의 30%를 차지합니다.</p>
	                		<p>2억톤 가량의 탄소를 흡수하기 위해서는 소나무 300억 그루가 필요합니다.</p>
	                		
	                		<p>저희는 더 효과적인 탄소 배출 절감을 위해 건축 자재에 따른 탄소 절감 솔루션을 진행하고</p>
	                		<p>지속 가능한 탄소 절감을 위해 솔루션 과정을 개발하고 더 나은 내일을 위해 달려갈 것을 약속합니다.</p>
	                	</div>
	                </div>
                </div>
                
                
            </div>
        </div>
        
    </div>
    

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
                             grid:{
                            	 display:false
                             }
                         },
                         y: {
                             beginAtZero: true,
                             title: {
                                 display: true,
                                 text: '배출량 (백만톤 CO₂eq)'
                             },
                         },
                     }
                 }
             });
        
        	
        	
        
        </script>


</body>
</html>
