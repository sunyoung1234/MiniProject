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
.table-box {
	width: 100%;
	max-width: 1000px;
}

.cur-poi {
	cursor: pointer;
}

.page-item.active .page-link {
	background-color: #198754; /* 강조할 색상 */
	color: white; /* 텍스트 색상 */
	border-color: #198754; /* 테두리 색상 */
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
	<%@ include file="/WEB-INF/inc/top.jsp"%>

	<main class="flex-shrink-0">
		<section class="py-5">
			<div class="container px-5">
				<div class="py-5 px-4 px-md-5">
					<div class="text-center mb-5">
						<h1 class="fw-bolder">견적 내역 (관리자)</h1>
					</div>
					<!-- 검색 바 -->
					<form name="searchForm" method="get"
						action="${pageContext.request.contextPath}/boardViewAdmin"
						onsubmit="return validateSearchForm()">
						<div class="row mb-4 align-items-end">
							<div class="col-md-2">
								<select class="form-select" name="searchOption"
									id="searchOption">
									<option value="title"
										${param.searchOption == 'title' ? 'selected' : ''}>제목</option>
									<option value="content"
										${param.searchOption == 'content' ? 'selected' : ''}>내용</option>
									<option value="company"
										${param.searchOption == 'company' ? 'selected' : ''}>업체명</option>
								</select>
							</div>
							<div class="col-md-6">
								<input type="text" class="form-control" name="searchWord"
									value="${param.searchWord}" placeholder="검색어를 입력하세요" />
							</div>
							<div class="col-md-2">
								<button type="submit" class="btn btn-success w-100">검색</button>
							</div>
							<div class="col-md-2">
								<select class="form-select" name="feedbackYn" id="confirm">
									<option value="">피드백 여부</option>
									<option value="Y" ${param.feedbackYn == 'Y' ? 'selected' : ''}>확인</option>
									<option value="N" ${param.feedbackYn == 'N' ? 'selected' : ''}>미확인</option>
								</select>
							</div>
						</div>
					</form>

					<div class="row justify-content-center">
						<div class="col-lg-12">
							<table class="table table-bordered">
								<!-- 각 열의 너비 설정 -->
								<colgroup>
									<col style="width: 7%;" />
									<col style="width: 50%;" />
									<col style="width: 15%;" />
									<col style="width: 15%;" />
									<col style="width: 13%;" />
								</colgroup>
								<thead class="thead-light">
									<tr>
										<th scope="col" class="text-center">번호</th>
										<th scope="col" class="text-center">제목</th>
										<th scope="col" class="text-center">날짜</th>
										<th scope="col" class="text-center">업체명</th>
										<th scope="col" class="text-center">피드백 여부</th>
									</tr>
								</thead>
								<tbody>
									<c:if test="${not empty boardList}">
										<c:forEach var="board" items="${boardList}">
											<tr>
												<th scope="row" class="text-center">${board.orderNo}</th>
												<td class="text-center"><a
													href="${pageContext.request.contextPath}/boardDetailView?orderNo=${board.orderNo}">${board.orderTitle}</a></td>
												<td class="text-center">${board.requestDate}</td>
												<td class="text-center">${board.entpName}</td>
												<td class="text-center">${board.feedbackYn}</td>
											</tr>
										</c:forEach>
									</c:if>
									<c:if test="${empty boardList}">
										<tr>
											<td colspan="5" class="text-center">게시물이 없습니다.</td>
										</tr>
									</c:if>
								</tbody>
							</table>
							<!-- Paging Bar -->
							<div class="d-flex justify-content-center mt-4">
								<nav aria-label="Page navigation example">
									<ul class="pagination">
										<li class="page-item"><a class="page-link"
											href="<c:url value='/boardViewAdmin?pageNo=1&searchOption=${pageSearch.searchOption}&searchWord=${pageSearch.searchWord}'/>"
											aria-label="Previous"> <span aria-hidden="true">&laquo;</span></a></li>
										<li class="page-item"><c:if
												test="${pageSearch.firstPage != 1}">
												<a class="page-link"
													href="<c:url value='/boardViewAdmin?pageNo=${pageSearch.firstPage - 1 }&searchOption=${pageSearch.searchOption}&searchWord=${pageSearch.searchWord }'/>"
													aria-label="Previous"> <span aria-hidden="true">&lt;</span></a>
											</c:if> <c:if test="${pageSearch.firstPage == 1}">
												<a class="page-link" href="#" aria-label="Previous"> <span
													aria-hidden="true">&lt;</span></a>
											</c:if></li>

										<c:forEach begin="${pageSearch.firstPage}"
											end="${pageSearch.lastPage}" var="page">
											<c:if test="${page != pageSearch.pageNo}">
												<li class="page-item"><a class="page-link"
													href="<c:url value='/boardViewAdmin?pageNo=${page }&searchOption=${pageSearch.searchOption}&searchWord=${pageSearch.searchWord }'/>"
													aria-label="Previous">${page}</a></li>
											</c:if>
											<c:if test="${page == pageSearch.pageNo}">
												<li class="page-item active" aria-current="page"><span
													class="page-link">${page}</span></li>
											</c:if>
										</c:forEach>

										<li class="page-item"><c:if
												test="${pageSearch.lastPage != pageSearch.boardCount}">
												<a class="page-link"
													href="<c:url value='/boardViewAdmin?pageNo=${pageSearch.lastPage + 1}&searchOption=${pageSearch.searchOption}&searchWord=${pageSearch.searchWord }'/>"><span
													aria-hidden="true">&gt;</span></a>
											</c:if> <c:if test="${pageSearch.lastPage == pageSearch.boardCount}">
												<a class="page-link" href="#" aria-label="Next"> <span
													aria-hidden="true">&gt;</span></a>
											</c:if></li>

										<li class="page-item"><a class="page-link"
											href="<c:url value='/boardViewAdmin?pageNo=${pageSearch.boardCount }&searchOption=${pageSearch.searchOption }&searchWord=${pageSearch.searchWord }'/>"><span
												aria-hidden="true">&raquo;</span></a></li>
									</ul>
								</nav>
							</div>
						</div>
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
	<script type="text/javascript">
	
		function f_change() {
			console.log(event.target.value)
			let v_url = "${pageContext.request.contextPath}/boardViewAdmin"
			let v_query = "?feedbackYn=" + event.target.value
			location.href = v_url + v_query;
		}
		let v_option = '${pageSearch.searchOption}'
      	let v_search = '${pageSearch.searchWord}'
      	console.log(v_option)
      	console.log(v_search)
      	
		let v_category = document.getElementById('confirm').value
		document.getElementById('confirm').addEventListener('change', ()=>{
			v_category = event.target.value
   			if(v_category != null){
   				let v_url = "${pageContext.request.contextPath}/boardViewAdmin"
	       			let v_query = "?feedbackYn=" + v_category + "&searchOption=" + v_option + "&searchWord=" + v_search
	       			location.href = v_url + v_query;
   			}else{
   				location.href = "${pageContext.request.contextPath}/boardViewAdmin"
   			}
		})
		
	</script>


</body>
</html>
