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
<title>요청 게시판</title>


<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Custom Google font-->
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link
	href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@100;200;300;400;500;600;700;800;900&amp;display=swap"
	rel="stylesheet" />
<!-- Bootstrap icons-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css"
	rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="css/styles.css" rel="stylesheet" />

<style type="text/css">
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
	width: 600px;
	height: 300px;
	border: 1px solid black;
}

.cur-poi {
	cursor: pointer;
}
</style>


</head>
<body class="d-flex flex-column">
	<!-- Responsive navbar-->
	<nav class="navbar navbar-expand-lg navbar-dark bg-color">
		<div class="container">
			<a class="navbar-brand" href="${pageContext.request.contextPath }/">Green
				Solution</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav ms-auto mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link font-bold"
						href="${pageContext.request.contextPath }/">Home</a></li>
					<li class="nav-item"><a class="nav-link"
						href="${pageContext.request.contextPath }/loginView">로그인</a></li>
					<li class="nav-item"><a class="nav-link" href="#!">회원가입</a></li>
					<li class="nav-item"><a class="nav-link"
						href="${pageContext.request.contextPath }/boardView">견적 요청</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<main class="flex-shrink-0">
		<!-- Page content-->
		<section class="py-5">
			<!-- 게시판 메인 시작 -->
			<div class="container px-5">
				<div class="bg-light rounded-4 py-5 px-4 px-md-5">

					<div class="text-center mb-5">
						<!-- 게시판 타이틀 부분 -->
						<h1 class="fw-bolder">요청 게시판</h1>
					</div>

					<div class="row gx-5 justify-content-center">
						<div class="col-lg-12 col-xl-10">
							<!-- 게시판 테이블 -->
							<table class="table table-bordered">
								<thead class="thead-light">
									<tr>
										<th scope="col">순번</th>
										<th scope="col">날짜</th>
										<th scope="col">제목</th>
										<th scope="col">내용</th>
										<th scope="col">업체명</th>
										<th scope="col">피드백 여부</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<th scope="row">1</th>
										<td>2024-10-08</td>
										<td>배관자재변경건</td>
										<td>알루미늄 배관을 CV배관으로 변경함에 관하여 요청</td>
										<td>삼성물산</td>
										<td>미확인</td>
									</tr>
									<tr>
										<th scope="row">2</th>
										<td>2024-10-01</td>
										<td>타일자재변경건</td>
										<td>콘크리트 타일을 목재타일로 변경함에 관하여 요청</td>
										<td>현대건설</td>
										<td>승인</td>
									</tr>
									<tr>
										<th scope="row">3</th>
										<td>2024-09-27</td>
										<td>창틀자재변경건</td>
										<td>목재 창문틀을 3중창문틀로 변경함에 관하여 요청</td>
										<td>대우건설</td>
										<td>미승인</td>
									</tr>
									<!-- 추가 항목을 여기에 추가 -->
								</tbody>
							</table>
						</div>
					</div>

					<!-- 요청서 작성 버튼 -->
					<div class="position-fixed" style="bottom: 20px; right: 20px;">
						<button class="btn btn-success" id="requestButton"
							href="${pageContext.request.contextPath }/boardWriteView">요청서 작성</button>
					</div>
				</div>
			</div>
		</section>



	</main>
	<!-- Footer-->
	<!--  -->
	<footer class="bg-white py-4 mt-auto">
		<div class="container px-5">
			<div
				class="row align-items-center justify-content-between flex-column flex-sm-row">
			</div>
		</div>
	</footer>
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="js/scripts.js"></script>
	<!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
	<!-- * *                               SB Forms JS                               * *-->
	<!-- * * Activate your form at https://startbootstrap.com/solution/contact-forms * *-->
	<!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
	<script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>

	<script type="text/javascript">
        
            const regist_btn = document.querySelector("#registBtn");
            regist_btn.addEventListener('click', () => {
                event.preventDefault();
                location.href = "${pageContext.request.contextPath}/registView"; 
            }); 
	        
        
        </script>
</body>
</html>

