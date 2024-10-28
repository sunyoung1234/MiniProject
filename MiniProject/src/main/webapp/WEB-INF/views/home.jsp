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
	height: 500px; /* 카드 높이에 맞게 조정 */
	position: relative; /* 자식 요소의 절대 위치를 위한 기준 설정 */
	overflow: hidden; /* 자식 요소가 범위를 벗어날 경우 숨기기 */
	transition: opacity 0.3s ease-in-out; /* opacity 전환 설정 */
	background-color: transparent; /* 각 캐러셀 아이템의 배경을 투명으로 설정 */
	opacity: 0; /* 처음에 투명하게 설정 */
}

.carousel-item.active {
	opacity: 1; /* 현재 활성화된 아이템은 보이게 설정 */
}

.carousel-item img {
	height: 90%; /* 이미지가 높이에 맞게 조정 */
	object-fit: cover; /* 이미지 비율 유지 */
	background-color: white;
}

.carousel-overlay-text {
	position: absolute;
	top: 20%;
	left: 45%;
	transform: translate(-50%, -50%);
	color: white;
	font-size: 30px; /* 텍스트 크기 조정 */
	font-weight: bold;
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
		<h2 class="fade-in" style="font-size: 40px; margin-bottom: 10px; text-shadow: -0.2px 0 #D3D3D3, 0 0.2px #D3D3D3, 0.2px 0 #D3D3D3, 0 -0.2px #D3D3D3; ">지속 가능한 건축을 위한 혁신</h2>
		<h2 class="fade-in" style="font-size: 60px; margin-bottom: 10px; text-shadow: -0.2px 0 #D3D3D3, 0 0.2px #D3D3D3, 0.2px 0 #D3D3D3, 0 -0.2px #D3D3D3;">GreenSolution</h2>
		<p class="fade-in" style="font-size: 20px; margin-bottom: 10px; text-shadow: -0.2px 0 #D3D3D3, 0 0.2px #D3D3D3, 0.2px 0 #D3D3D3, 0 -0.2px #D3D3D3;">우리는 건축 자재의 탄소 배출량을 분석하여 환경에 부담을 덜어주는 솔루션을 제공합니다.</p>
		<p class="fade-in" style="font-size: 20px; margin-bottom: 10px; text-shadow: -0.2px 0 #D3D3D3, 0 0.2px #D3D3D3, 0.2px 0 #D3D3D3, 0 -0.2px #D3D3D3;">기술과 지속 가능성이 결합된 우리의 노력으로, 더 나은 내일을 만듭니다.</p>
	</div>
</header>
<!-- 메인 문구 타이틀 -->
<div class="solution-content solution-title" style="margin-bottom: 50px">
	<h2>Our Enterprise</h2>
</div>

<!-- 텍스트 섹션 -->
<section class="solution-section" id="section2">
	<div class="solution-content">
		<h2 style="margin: 0; font-size: 60px; margin-bottom: 20px; text-align: center;">Green Solution</h2>
		<p style="font-size: 18px; text-align: center; margin-bottom: 15px;">대기 중 온실가스 농도가 증가하는 가운데</p>
		<p style="font-size: 18px; text-align: center; margin-bottom: 15px;">우리는 탄소 배출이 낮은 자재를 통해 건축 산업의 변화를 선도하고 있습니다.</p>
		<p style="font-size: 18px; text-align: center;">기후 위기에 대응하는 Green Solution의 솔루션은 지속 가능한 미래를 위한 첫걸음입니다.</p>
	</div>
</section>

<!-- 캐러셀 타이틀 -->
<div class="solution-content solution-title" style="margin-bottom: 50px">
	<h2>Vision</h2>
</div>

<!-- 캐러셀 메인 -->
<div id="carouselExampleIndicators" class="carousel slide" style="margin-bottom: 150px" data-bs-ride="carousel">
	<div class="carousel-indicators">
		<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
		<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
		<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
	</div>
	<div class="carousel-inner">
		<div class="carousel-item active" style="background-color: white;">
			<div class="position-relative text-center">
				<img src="${pageContext.request.contextPath}/resources/image/1녹색건축물.png" class="custom-carousel-image" alt="자연 건축">
				<div class="carousel-overlay-text"
					style="text-shadow: -0.2px 0 #D3D3D3, 0 0.2px #D3D3D3, 0.2px 0 #D3D3D3, 0 -0.2px #D3D3D3;">
					자연을 품은 건축,<br> 우리의 미래를 설계합니다.
				</div>
			</div>
		</div>
		<div class="carousel-item">
			<div class="position-relative text-center" style="background-color: white;">
				<img src="${pageContext.request.contextPath}/resources/image/jpg캐러셀이미지2.jpg" class="custom-carousel-image" alt="환경 건축">
				<div class="carousel-overlay-text">
					환경을 생각하는 설계,<br> GreenSolution의 약속입니다.
				</div>
			</div>
		</div> 
		<div class="carousel-item">
			<div class="position-relative text-center" style="background-color: white;">
				<img src="${pageContext.request.contextPath}/resources/image/캘셀3.jpg" class="custom-carousel-image" alt="탄소 절감">
				<div class="carousel-overlay-text" 
				     style="text-shadow: -0.2px 0 #D3D3D3, 0 0.2px #D3D3D3, 0.2px 0 #D3D3D3, 0 -0.2px #D3D3D3;">
					탄소 중립을 향한 작은 실천,<br> 큰 변화를 이룹니다.
				</div>
				
			</div>
		</div>
	</div>
</div>

<div class="solution-content solution-title">
	<h2>Information</h2>
</div>
<!-- 카드 두개  -->
<div class="card-container d-flex justify-content-center" style="margin-bottom: 150px;">
	<div class="card me-3" style="flex: 1; max-width: 500px;">
		<img src="${pageContext.request.contextPath}/resources/image/nature_co2_image.png" class="card-img-top" alt="Nature Build" style="width: 100%; height: 300px;">
		<div class="card-body">
			<h3 class="card-title">온실가스 및 건축</h3>
			<p class="card-text">온실가스 차트 & 건축 기사</p>
			<a href="${pageContext.request.contextPath}/gasChartView" class="btn btn-success">더 알아보기</a>
		</div>
	</div>
	<div class="card me-3" style="flex: 1; max-width: 500px;">
		<img src="${pageContext.request.contextPath}/resources/image/nature_build.png" class="card-img-top" alt="Nature co2 image" style="width: 100%; height: 300px;">
		<div class="card-body">
			<h3 class="card-title">탄소중립포인트 참여현황</h3>
			<p class="card-text">광역시도별 & 기초단체별 차트</p>
			<a href="${pageContext.request.contextPath}/cityChartView" class="btn btn-success">더 알아보기</a>
		</div>
	</div>
</div>

<%@ include file="/WEB-INF/inc/footer.jsp"%>

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

<script>
$(document).ready(function() {
    // 캐러셀 자동루프
    $('.carousel').carousel({
        interval: 5000, // 5초마다 자동 슬라이드
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
