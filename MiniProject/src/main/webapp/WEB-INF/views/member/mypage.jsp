<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content />
<meta name="author" content />
<title>로그인 - Green Solution</title>
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

.prof-img {
	height: 200px;
	width: 200px;
	border-radius: 150px;
	cursor: pointer;
}

.login-card {
	background-color: white;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

.err-msg {
	color: red;
}

.table {
	font-size: 10px;
}

th, td {
	padding: 5px;
}

.mypage-profile-text {
	font-size: 16px;
	text-decoration: none;
	color: black;
	
}

.mypage-profile-text:hover{

}


.mypage-profile-text-small{
	font-size: 14px;
	text-decoration: none;
	color: black;
}

.mypage-profile-text-small{
	font-size: 14px;
	text-decoration: none;
	color: black;
}

.v-edit-btn {
	background-color: #10bd66; /* 배경색 */
	color: white; /* 글자 색상 */
	border: 1px solid grey; /* 테두리 */
	padding: 7px 14px; /* 패딩 */
	text-decoration: none; /* 밑줄 제거 */
	border-radius: 10px; /* 모서리 둥글게 */
	display: inline-block; /* 버튼처럼 보이도록 */
	text-align: center; /* 텍스트 중앙 정렬 */
	transition: background-color 0.3s; /* 호버 효과 */
	font-weight: bold;
	margin-top: 5px;
}

.v-edit-btn:hover {
	background-color: #0f9e58; /* 호버 시 배경색 변경 */
	color: white;
	text-decoration: none; /* 밑줄 제거 */
}

.col-6.bg-white {
    min-height: 390px;
    max-height: 800px;
}

.page-item.active .page-link {
	background-color: #198754; /* 강조할 색상 */
	color: white; /* 텍스트 색상 */
	border-color: #198754; /* 테두리 색상 */
}
</style>

</head>
<body class="d-flex flex-column">

	<%@ include file="/WEB-INF/inc/top.jsp"%>

	<main class="flex-shrink-0">
		<section class="py-5">
			<div class="text-center mb-5">
				<h1 class="fw-bolder mb-4">마이페이지</h1>
			</div>
			<div class="container px-5 text-center ">
				<div class="container text-center mb-5">
					<div class="row row-cols-2 justify-content-center">

						<!-- 프로필 이미지 및 프로필 정보 영역 -->
						<div class="col-6 justify-content-center d-flex">
							<div class="form-floating mb-3">
								<div class="d-flex justify-content-center me-3">
									<img class="prof-img" id="imgBox"
										src="${pageContext.request.contextPath}/displayImage?imgName=${member.memProfile}"
										alt="profile Image" /> 
									
								</div>
							</div>
							<div class="ms-4 mt-4">
								<!-- entp_name -->
								<div class="form-floating mb-3">
									<a class="mypage-profile-text">${sessionScope.login.getEntpName() } 님</a>
								</div>

								<!-- mem_Phone -->
								<div class="form-floating mb-3">
									<a class="mypage-profile-text-small">${sessionScope.login.getMemPhone() }</a>
								</div>

								<!-- mem_Email -->
								<div class="form-floating mb-5">
									<a class="mypage-profile-text-small">${sessionScope.login.getMemEmail() }</a>
								</div>

								<!-- memEditView로 이동하는 수정하기 Button -->
								<div class="d-grid mt-5 ms-4">
									<a class="v-edit-btn bg-color"
										href="${pageContext.request.contextPath}/memEditView">수정하기</a>
								</div>
							</div>
						</div>

						<!-- 견적내역 영역 -->
						<div class="col-6 bg-white rounded-4 py-3 border">
							<div class="row gx-5 justify-content-center">
								<div class="col-lg-12 col-xl-12">
									<table class="table table-bordered">
										<colgroup>
											<col style="width: 7%;" />
											<col style="width: 45%;" />
											<col style="width: 15%;" />
											<col style="width: 14%;" />
											<col style="width: 19%;" />
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
											<c:if test="${boardListById != null}">
												<c:forEach var="board" items="${boardListById}">
													<tr>
														<th scope="row" class="text-center">${board.orderNo}</th>
														<!-- 번호 -->
														<td class="text-center"><a
															href="${pageContext.request.contextPath}/boardDetailView?orderNo=${board.orderNo}">${board.orderTitle}</a></td>
														<!-- 제목 -->
														<td class="text-center">${board.requestDate}</td>
														<!-- 날짜 -->
														<td class="text-center">${board.entpName}</td>
														<!-- 업체명 -->
														<td class="text-center">${board.feedbackYn}</td>
														<!-- 피드백여부 -->
													</tr>
												</c:forEach>
											</c:if>
											<c:if test="${empty boardListById}">
												<tr>
													<td colspan="6" class="text-center">게시물이 없습니다.</td>
												</tr>
											</c:if>
										</tbody>
									</table>
								<!-- Paging Bar -->
									<div class="d-flex justify-content-center mt-4">
										<nav aria-label="Page navigation example">
											<ul class="pagination">
												<!-- 이전 페이지 버튼 -->
												<li class="page-item"><c:if
														test="${pageSearch.pageNo > 1}">
														<a class="page-link"
															href="<c:url value='/mypage?pageNo=${pageSearch.pageNo - 1}&searchOption=${pageSearch.searchOption}&searchWord=${pageSearch.searchWord }'/>"
															aria-label="Previous"> <span aria-hidden="true">&lt;</span>
														</a>
													</c:if> <c:if test="${pageSearch.pageNo == 1}">
														<a class="page-link disabled" href="#"
															aria-label="Previous"> <span aria-hidden="true">&lt;</span>
														</a>
													</c:if></li>

												<!-- 페이지 번호 링크 -->
												<c:forEach begin="${pageSearch.firstPage}"
													end="${pageSearch.lastPage}" var="page">
													<c:if test="${page != pageSearch.pageNo}">
														<li class="page-item"><a class="page-link"
															href="<c:url value='/mypage?pageNo=${page }&searchOption=${pageSearch.searchOption}&searchWord=${pageSearch.searchWord }'/>">
																${page} </a></li>
													</c:if>
													<c:if test="${page == pageSearch.pageNo}">
														<li class="page-item active" aria-current="page"><span
															class="page-link">${page}</span></li>
													</c:if>
												</c:forEach>

												<!-- 다음 페이지 버튼 -->
												<li class="page-item"><c:if
														test="${pageSearch.pageNo < pageSearch.finalPage}">
														<a class="page-link"
															href="<c:url value='/mypage?pageNo=${pageSearch.pageNo + 1}&searchOption=${pageSearch.searchOption}&searchWord=${pageSearch.searchWord }'/>"
															aria-label="Next"> <span aria-hidden="true">&gt;</span>
														</a>
													</c:if> <c:if test="${pageSearch.pageNo >= pageSearch.finalPage}">
														<a class="page-link disabled" href="#" aria-label="Next">
															<span aria-hidden="true">&gt;</span>
														</a>
													</c:if></li>
											</ul>
										</nav>
									</div>
								</div>
							</div>
						</div>
						<!-- 견적내역 영역 끝 -->
					</div>
				</div>
				<!-- 차트 영역 시작 -->
				<div class="row align-items-start">
					<div class="col-6">
						<div class="rounded-4 py-5 px-4 px-md-5 border"><canvas id="myChart"></canvas></div>
					</div>
					<div class="col-6">
						<div class="rounded-4 py-5 px-4 px-md-5 border">차트2</div>
					</div>
				</div>
				<!-- 차트 영역 끝 -->
			</div>
		</section>
	</main>


	<%@ include file="/WEB-INF/inc/footer.jsp" %>

	<!-- Bootstrap core JS -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<script src="js/scripts.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

	<script type="text/javascript">
        console.log(document.querySelector('#imgBox').src)
        
        let v_result = 0;
        let v_boardResult = 0;
        
        console.log(v_result)
        console.log(v_boardResult)
        
        // 피드백 탄소 배출량
       	console.log(typeof v_result)
       	console.log(typeof v_boardResult)
       	 
       	if(${getReplyResult} == null){
       		v_result = 0
       	}else{
       	 	v_result = '${getReplyResult}'
       	}
        
        if(${getBoardCalc} == null){
       		v_result = 0
       	}else{
       		v_boardResult = '${getBoardCalc}'
       	}
        
        let ctx = document.getElementById("myChart")
        
        console.log("나무 : " + (v_boardResult*100000 - v_result)/20 + "그루")
        
        new Chart(ctx,{
        		type:'bar',
        		data:{
        			labels: ['오늘 하루'],
        			datasets:[{
        				label:'솔루션 전 탄소 배출량',
        				data: [v_boardResult*100000]
        			},{
        				label:'솔루션 후 탄소 배출량',
        				data: [v_result]
        			}]
        		},
        		 options: {
                     scales: {
                         x: {
                             ticks: {
                                 autoSkip: false
                                 
                             }
                         },
                         y: {
                             beginAtZero: true
                             }
                     }
                 }
             });
        
        
        
    </script>
    
</body>
</html>
