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

<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/5.1.3/css/bootstrap.min.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/5.1.3/js/bootstrap.min.js"></script>

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
            height: 100vh; /* 전체 화면 높이 */
            overflow: hidden; /* 비디오가 부모 요소를 넘지 않도록 설정 */
             margin: 0; /* 기본 여백 제거 */
    		padding: 0; /* 기본 패딩 제거 */
    		top: -20px;
        }

        .video-section video {
            width: 100%; /* 비디오의 너비를 부모에 맞춤 */
            height: 100%; /* 비디오의 높이를 부모에 맞춤 */
            object-fit: cover; /* 비디오가 비율에 맞게 잘림 */
        }

        .overlay-text {
            position: absolute; /* 비디오 위에 텍스트를 올리기 위해 */
            top: 45%; /* 수직 중앙 정렬 */
            left: 50%; /* 수평 중앙 정렬 */
            transform: translate(-50%, -50%); /* 중앙 정렬 */
            color: white; /* 텍스트 색상 */
            text-align: center; /* 텍스트 정렬 */
            font-size: 1.5em; /* 비디오 위 텍스트 크기 조정 */
        }

.carousel-item {
	height: 400px; /* 카드 높이에 맞게 조정 */
	position: relative; /* 자식 요소의 절대 위치를 위한 기준 설정 */
	overflow: hidden; /* 자식 요소가 범위를 벗어날 경우 숨기기 */
	transition: opacity 0.5s ease-in-out; /* opacity 전환 설정 */
}

.carousel-item img {
	height: 100%; /* 이미지가 높이에 맞게 조정 */
	object-fit: cover; /* 이미지 비율 유지 */
}

.carousel-overlay-text {
	position: absolute;
	top: 20%;
	left: 40%;
	transform: translate(-50%, -50%);
	color: black;
	font-size: 30px; /* 텍스트 크기 조정 */
	font-weight: bold;
}
/* 
.carousel-item-next, .carousel-item-prev, .carousel-item.active {
	position: absolute;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	opacity: 0; /* 비활성 아이템은 투명 */
}
.carousel-item.active {
	opacity: 1; /* 현재 활성화된 아이템은 보이게 설정 */
}

/* 카드 스타일 */
.card {
	border-radius: 10px;
	overflow: hidden;
	transition: transform 0.2s;
}

.card-header {
	padding: 20px;
	text-align: center;
}

.card-body {
	padding: 20px;
}

/* 차트 스타일 */
#gasChart {
	border-radius: 10px;
}

.solution-section {
	background-color: white; /* 배경색 */
	padding: 50px 20px; /* 상하 좌우 패딩 */
	text-align: center; /* 텍스트 가운데 정렬 */
	height: 400px;
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

.custom-carousel-image {
	width: 50%; /* 1/3 크기 */
	margin: 0 auto; /* 중앙 정렬 */
	display: block; /* 블록 요소로 설정 */
	border-radius: 15px;
}

/* Fade-in 애니메이션 정의 */
        @keyframes fadeInUp {
            0% {
                opacity: 0;
                transform: translateY(20px); /* 텍스트가 위로 이동하는 효과 */
            }
            100% {
                opacity: 1;
                transform: translateY(0); /* 원래 위치로 돌아옴 */
            }
        }

        /* 애니메이션을 적용할 클래스 */
        .fade-in {
            opacity: 0; /* 처음에 투명하게 시작 */
            animation: fadeInUp 1s ease forwards; /* 1초 동안 애니메이션 적용 */
        }

        /* 각 텍스트 요소에 지연 시간 추가 */
        .fade-in:nth-child(1) {
            animation-delay: 0s; /* 첫 번째 요소는 지연 없음 */
        }
        .fade-in:nth-child(2) {
            animation-delay: 1s; /* 두 번째 요소는 1초 지연 */
        }
        .fade-in:nth-child(3) {
            animation-delay: 2s; /* 세 번째 요소는 2초 지연 */
        }
        .fade-in:nth-child(4) {
            animation-delay: 3s; /* 네 번째 요소는 3초 지연 */
        }
</style>

</head>
<body>

	<%@ include file="/WEB-INF/inc/top.jsp"%>

    <!-- 첫 번째 영역: 비디오 섹션 -->
    <header class="video-section" id="section1">
        <video autoplay loop muted>
            <source src="${pageContext.request.contextPath}/resources/image/forest.mp4" type="video/mp4">
        </video>
        <!-- 비디오 위에 텍스트 영역 -->
        <div class="overlay-text">
            <h2 class="fade-in" style="font-size: 40px; margin-bottom: 10px">지속 가능한 건축을 위한 혁신</h2>
            <h2 class="fade-in" style="font-size: 60px; margin-bottom: 10px">GreenSolution</h2>
            <p class="fade-in" style="font-size: 20px; margin-bottom: 10px">우리는 건축 자재의 탄소 배출량을 분석하여 환경에 부담을 덜어주는 솔루션을 제공합니다.</p>
            <p class="fade-in" style="font-size: 20px; margin-bottom: 10px">기술과 지속 가능성이 결합된 우리의 노력으로, 더 나은 내일을 만듭니다.</p>
        </div>
    </header>




	<!-- 메인 문구 타이틀 -->
	<div class="solution-content solution-title">
		<h2>Our Vision</h2>
	</div>

	<!-- 텍스트 섹션 -->
	<section class="solution-section" id="section2">
		<div class="solution-content">
			<h2
				style="margin: 0; font-size: 60px; margin-bottom: 20px; text-align: center;">Green
				Solution</h2>
			<p style="font-size: 18px; text-align: center; margin-bottom: 15px;">대기
				중 온실가스 농도가 증가하는 가운데</p>
			<p style="font-size: 18px; text-align: center; margin-bottom: 15px;">우리는
				탄소 배출이 낮은 자재를 통해 건축 산업의 변화를 선도하고 있습니다.</p>
			<p style="font-size: 18px; text-align: center;">기후 위기에 대응하는 Green
				Solution의 솔루션은 지속 가능한 미래를 위한 첫걸음입니다.</p>
		</div>
	</section>

	<!-- 캐러셀 타이틀 -->
	<div class="solution-content solution-title" style="margin-bottom: 50px">
		<h2>About us</h2>
	</div>

	<!-- 캐러셀 메인 -->
	<div id="carouselExampleIndicators" class="carousel slide" style="margin-bottom: 200px"
		data-bs-ride="carousel">
		<div class="carousel-indicators">
			<button type="button" data-bs-target="#carouselExampleIndicators"
				data-bs-slide-to="0" class="active" aria-current="true"
				aria-label="Slide 1"></button>
			<button type="button" data-bs-target="#carouselExampleIndicators"
				data-bs-slide-to="1" aria-label="Slide 2"></button>
			<button type="button" data-bs-target="#carouselExampleIndicators"
				data-bs-slide-to="2" aria-label="Slide 3"></button>
		</div>
		<div class="carousel-inner">
			<div class="carousel-item active">
				<div class="position-relative text-center">
					<img
						src="${pageContext.request.contextPath}/resources/image/jpg캐러셀이미지1.jpg"
						class="custom-carousel-image" alt="자연 건축">
					<div class="carousel-overlay-text solution-content"
						style="color: white; font-size: 26px; text-shadow: -1px 0 #000, 0 1px #000, 1px 0 #000, 0 -1px #000;">
						자연을 품은 건축,<br> 우리의 미래를 설계합니다.
					</div>
				</div>
			</div>
			<div class="carousel-item">
				<div class="position-relative text-center">
					<img
						src="${pageContext.request.contextPath}/resources/image/jpg캐러셀이미지2.jpg"
						class="custom-carousel-image" alt="환경 건축">
					<div class="carousel-overlay-text solution-content"
						style="color: white; text-shadow: -1px 0 #000, 0 1px #000, 1px 0 #000, 0 -1px #000;">
						환경을 생각하는 설계,<br> GreenSolution의 약속입니다.
					</div>
				</div>
			</div>
			<div class="carousel-item">
				<div class="position-relative text-center">
					<img
						src="${pageContext.request.contextPath}/resources/image/jpg3캐러셀이미지3.jpg"
						class="custom-carousel-image" alt="탄소 절감">
					<div class="carousel-overlay-text solution-content"
						style="color: white; text-shadow: -1px 0 #000, 0 1px #000, 1px 0 #000, 0 -1px #000;">
						탄소 중립을 향한 작은 실천,<br> 큰 변화를 이룹니다.
					</div>
				</div>
			</div>
		</div>
	</div>





	<div class="solution-content solution-title">
		<h2>What we do</h2>
	</div>
	<!-- 카드 두개  -->
	<div class="card-container d-flex justify-content-center"
		style="margin-bottom: 150px;">
		<div class="card me-3" style="flex: 1; max-width: 500px;">
			<img
				src="${pageContext.request.contextPath}/resources/image/nature_co2_image.png"
				class="card-img-top" alt="Nature Build"
				style="width: 100%; height: 300px;">
			<div class="card-body">
				<h3 class="card-title">온실가스 배출량 추이</h3>
				<p class="card-text">1990년 ~ 2020년 차트</p>
				<a href="${pageContext.request.contextPath}/gasChartView"
					class="btn btn-success">더 알아보기</a>
			</div>
		</div>
		<div class="card me-3" style="flex: 1; max-width: 500px;">
			<img
				src="${pageContext.request.contextPath}/resources/image/nature_build.png"
				class="card-img-top" alt="Nature co2 image"
				style="width: 100%; height: 300px;">
			<div class="card-body">
				<h3 class="card-title">광역시도별 탄소중립포인트 참여현황</h3>
				<p class="card-text">광역시도별 & 기초단체별 차트</p>
				<a href="${pageContext.request.contextPath}/cityChartView"
					class="btn btn-success">더 알아보기</a>
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
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
	<script>
	
	$(document).ready(function() {
	    // 캐러셀 자동루프
	    $('.carousel').carousel({
	        interval: 5000, // 2초마다 자동 슬라이드
	        pause: false // 마우스 오버 시 슬라이드 일시 정지 하지 않음
	    });

	    // 슬라이드 전환 효과
	    $('.carousel').on('slide.bs.carousel', function () {
	        $('.carousel-item.active').css('opacity', '0'); // 현재 활성 슬라이드만 투명하게 설정
	    });

	    $('.carousel').on('slid.bs.carousel', function () {
	        $('.carousel-item.active').css('opacity', '1'); // 활성화된 슬라이드만 보이게 설정
	    });
	});

</script>
</body>
</html>
