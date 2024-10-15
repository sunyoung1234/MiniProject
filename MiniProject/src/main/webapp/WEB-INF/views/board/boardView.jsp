<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>요청 게시판</title>
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link
	href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@100;200;300;400;500;600;700;800;900&amp;display=swap"
	rel="stylesheet" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css"
	rel="stylesheet" />
<link href="css/styles.css" rel="stylesheet" />

<style type="text/css">
.bg-color {
	background-color: #10bd66;
}

.table-box {
	width: 100%;
	max-width: 1000px;
}

.cur-poi {
	cursor: pointer;
}
</style>

<!-- 검색어가 없을 때 경고창을 띄우는 스크립트 -->
<script type="text/javascript">
	function validateSearchForm() {
		var searchWord = document.forms["searchForm"]["searchWord"].value
				.trim();
		if (searchWord === "") {
			alert("검색어를 입력해주세요.");
			return false; // 폼 제출 중지
		}
		return true; // 폼 제출 진행
	}
</script>

</head>

<body class="d-flex flex-column">
	<nav class="navbar navbar-expand-lg navbar-dark bg-color">
		<div class="container">
			<a class="navbar-brand" href="${pageContext.request.contextPath}/">Green
				Solution</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav ms-auto mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link"
						href="${pageContext.request.contextPath}/">Home</a></li>
					<li class="nav-item"><a class="nav-link"
						href="${pageContext.request.contextPath}/loginView">로그인</a></li>
					<li class="nav-item"><a class="nav-link"
						href="${pageContext.request.contextPath}/registView">회원가입</a></li>
					<li class="nav-item"><a class="nav-link"
						href="${pageContext.request.contextPath}/boardView">견적 요청</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<main class="flex-shrink-0">
		<section class="py-5">
			<div class="container px-5">
				<div class="bg-light rounded-4 py-5 px-4 px-md-5">
					<div class="text-center mb-5">
						<h1 class="fw-bolder">견 적 내 역</h1>
					</div>

					<!-- 검색 바 -->
					<form name="searchForm" method="get"
						action="${pageContext.request.contextPath}/boardSearch"
						onsubmit="return validateSearchForm()">
						<div class="row mb-4">
							<div class="col-md-4">
								<select class="form-select" name="searchOption">
									<option value="title" selected>제목</option>
									<option value="content">내용</option>
									<option value="company">업체명</option>
								</select>
							</div>
							<div class="col-md-6">
								<input type="text" class="form-control" name="searchWord"
									value="${param.searchWord}" placeholder="검색어를 입력하세요" />
							</div>
							<div class="col-md-2">
								<button type="submit" class="btn btn-success">검색</button>
							</div>
						</div>
					</form>

					<div class="row gx-5 justify-content-center">
						<div class="col-lg-12 col-xl-10">
							<table class="table table-bordered">
								<!-- 각 열의 너비 설정 및 가운데 정렬 적용 -->
								<colgroup>
									<col style="width: 7%;" />
									<col style="width: 15%;" />
									<col style="width: 15%;" />
									<col style="width: 40%;" />
									<col style="width: 15%;" />
									<col style="width: 10%;" />
								</colgroup>
								<thead class="thead-light">
									<tr>
										<th scope="col" class="text-center">순번</th>
										<th scope="col" class="text-center">날짜</th>
										<th scope="col" class="text-center">제목</th>
										<th scope="col" class="text-center">내용</th>
										<th scope="col" class="text-center">업체명</th>
										<th scope="col" class="text-center">피드백 여부</th>
									</tr>
								</thead>
								<tbody>
									<c:if test="${not empty boardList}">
										<c:forEach var="board" items="${boardList}">
											<tr>
												<th scope="row" class="text-center">${board.orderNo}</th>
												<td class="text-center">${board.requestDate}</td>
												<td class="text-center"><a
													href="${pageContext.request.contextPath}/boardDetailView/${board.orderNo}">${board.orderTitle}</a></td>
												<td class="text-center">${board.orderContent}</td>
												<td class="text-center">${board.entpName}</td>
												<td class="text-center">${board.feedbackYn}</td>
											</tr>
										</c:forEach>
									</c:if>
									<c:if test="${empty boardList}">
										<tr>
											<td colspan="6" class="text-center">게시물이 없습니다.</td>
										</tr>
									</c:if>
								</tbody>
							</table>

						</div>
					</div>

					<!-- 요청서 작성 버튼 -->
					<div class="position-fixed" style="bottom: 20px; right: 20px;">
						<a class="btn btn-success"
							href="${pageContext.request.contextPath}/boardWriteView">요청서
							작성</a>
					</div>

				</div>
			</div>
		</section>
	</main>

	<!-- Footer -->
	<footer class="bg-white py-4 mt-auto">
		<div class="container px-5">
			<div
				class="row align-items-center justify-content-between flex-column flex-sm-row">
				<div class="col-sm-4 text-center text-sm-start">
					<div class="small m-0 text-muted">© 2024 Your Company</div>
				</div>
			</div>
		</div>
	</footer>

	<!-- Bootstrap core JS -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<script src="js/scripts.js"></script>
</body>
</html>
