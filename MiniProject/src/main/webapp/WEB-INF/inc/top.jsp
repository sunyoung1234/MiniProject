<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Green Solution</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<style type="text/css">
body {
	margin: 0;
	font-family: Arial, sans-serif;
	padding-top: 70px; /* Navbar 높이에 맞춰 여백 설정 */
}

.navbar {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	z-index: 1000;
	padding: 14px 20px;
	background-color: transparent; /* 기본적으로 배경색 없음 */
	transition: background-color 0.3s, color 0.3s;
	/* 배경과 색상 변화 시 애니메이션 효과 */
	border-bottom: 1px solid grey; /* 기본적으로 투명한 테두리 */
}

.navbar.scrolled {
	background-color: rgba(255, 255, 255, 1); /* 스크롤 시 배경 색상 변경 (흰색) */
	color: black; /* 스크롤 시 글자 색상 변경 */
	border: 1px solid grey; /* 스크롤 시 테두리 색상 변경 */
}

.navbar a {
	color: white; /* 기본 글자 색상 */
	text-decoration: none;
	margin: 0 15px; /* 링크 간격 */
	transition: color 0.3s; /* 링크 색상 변화 시 애니메이션 효과 */
}

.navbar.scrolled a {
	color: black; /* 스크롤 시 링크 글자 색상 변경 */
}

.navbar:hover {
	background-color: rgba(255, 255, 255, 1);
	/* 전체 네비게이션 바에 마우스 오버 시 배경 색상 변경 (흰색) */
	color: black; /* 전체 네비게이션 바에 마우스 오버 시 글자 색상 변경 */
}

.navbar:hover a {
	color: black; /* 전체 네비게이션 바에 마우스 오버 시 링크 색상 변경 */
}

.navbar a:hover {
	background-color: white; /* 마우스 오버 시 링크 배경 색상 변경 */
	color: black; /* 마우스 오버 시 링크 글자 색상 변경 */
	border-radius: 5px; /* 모서리 둥글게 */
}

.green-solution {
	text-align: center;
	padding: 60px 20px;
	background-color: rgba(240, 255, 240, 0.9);
	border-radius: 10px;
	margin: 20px;
	box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
}

.green-solution h2 {
	font-size: 2.5em;
	color: #16bd66;
	margin-bottom: 20px;
}

.green-solution p {
	font-size: 1.2em;
	color: #333;
	line-height: 1.6;
}
</style>
<script>
	window.addEventListener('scroll', function() {
		const navbar = document.querySelector('.navbar');
		if (window.scrollY > 50) {
			navbar.classList.add('scrolled');
		} else {
			navbar.classList.remove('scrolled');
		}
	});
</script>
</head>
<body>
	<nav class="navbar">
		<div class="container">
			<a class="navbar-brand" href="${pageContext.request.contextPath}/">
				<i class="fas fa-leaf"></i> Green Solution
			</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav ms-auto mb-3 mb-lg-0">
					<c:if test="${not empty sessionScope.login}">
						<c:if test="${sessionScope.login.getMemId() != 'admin'}">
							<li class="nav-item"><a class="nav-link"
								href="${pageContext.request.contextPath}/mypage">마이페이지</a></li>
						</c:if>
						<li class="nav-item"><a class="nav-link"
								href="${pageContext.request.contextPath}/memEditView">${sessionScope.login.getEntpName()}</a>
							</li>
						<li class="nav-item"><a class="nav-link"
							href="${pageContext.request.contextPath}/logout">로그아웃</a></li>
							
						<c:if test="${sessionScope.login.getMemId() == 'admin'}">
							<li class="nav-item"><a class="nav-link"
								href="${pageContext.request.contextPath}/adminpage">관리자페이지</a></li>
							<li class="nav-item"><a class="nav-link"
								href="${pageContext.request.contextPath}/boardViewAdmin">견적내역관리</a>
							</li>
						</c:if>
						<c:if test="${sessionScope.login.getMemId() != 'admin'}">
							<li class="nav-item"><a class="nav-link"
								href="${pageContext.request.contextPath}/boardView">견적 요청</a></li>
						</c:if>
					</c:if>
					
					<c:if test="${empty sessionScope.login}">
						<li class="nav-item"><a class="nav-link"
							href="${pageContext.request.contextPath}/loginView">로그인</a></li>
						<li class="nav-item"><a class="nav-link"
							href="${pageContext.request.contextPath}/registView">회원가입</a></li>
					</c:if>
				</ul>
			</div>
		</div>
	</nav>

</body>
</html>
