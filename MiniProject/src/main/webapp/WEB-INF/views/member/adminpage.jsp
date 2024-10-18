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
	font-size: 20px;
	text-decoration: none;
	color: black;
}

.mypage-profile-text:hover {
	font-size: 20px;
	text-decoration: none;
	color: black;
}

.mypage-profile-text-small {
	font-size: 12px;
	text-decoration: none;
	color: black;
}

.mypage-profile-text-small:hover {
	font-size: 12px;
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
</style>

</head>
<body class="d-flex flex-column">
	<%@ include file="/WEB-INF/inc/top.jsp"%>

	<main class="flex-shrink-0">
		<section class="py-5">
			<div class="text-center mb-5">
				<h1 class="fw-bolder mb-4">관리자페이지</h1>
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
									<a class="mypage-profile-text">관리자 님</a>
								</div>

								<!-- mem_Phone -->
								<div class="form-floating mb-3">
									<a class="mypage-profile-text-small">${sessionScope.login.getMemPhone() }</a>
								</div>

								<!-- mem_Email -->
								<div class="form-floating mb-5">
									<a class="mypage-profile-text-small">${sessionScope.login.getMemEmail() }</a>
								</div>

								<!-- 회원관리 모달창 버튼 -->
								<div class="d-grid mt-5 ms-4">
									<button class="v-edit-btn bg-color" data-bs-toggle="modal"
										data-bs-target="#memberModal">회원관리</button>
								</div>
								<!-- 회원관리 모달창 -->
								<div class="modal fade" id="memberModal" tabindex="-1"
									aria-labelledby="memberModalLabel" aria-hidden="true">
									<div class="modal-dialog modal-lg">
										<div class="modal-content">
											<div class="modal-header">
												<h5 class="modal-title" id="memberModalLabel">회원관리</h5>
												<button type="button" class="btn-close"
													data-bs-dismiss="modal" aria-label="Close"></button>
											</div>
											<div class="modal-body">
												<table class="table table-hover">
													<thead>
														<tr>
															<th scope="col">아이디</th>
															<th scope="col">업체명</th>
															<th scope="col">휴대폰번호</th>
															<th scope="col">이메일</th>
														</tr>
													</thead>
													<tbody>
														<!-- 회원정보 불러오는 부분은, 기존 실습때 따로 했던 파일에서 추출한거라 수정 필요하므로, 임시 메모 -->
														<c:forEach items="${keyMemberList}" var="member">
															<tr>
																<td class="text-center">${member.memId}</td>
																<td class="text-center">${member.entpName}</td>
																<td class="text-center">${member.memPhone}</td>
																<td class="text-center">${member.memEmail}</td>

																<td>
																	<!-- 관리자_회원정보수정 모달창 버튼 -->
																	<div class="d-grid mt-5 ms-4">
																		<button class="v-edit-btn bg-color"
																			data-bs-toggle="modal" data-bs-target="#memberModal">회원관리</button>
																	</div> <!-- 관리자_회원정보수정 모달창 -->
																	<div class="modal fade" id="memberModal" tabindex="-1"
																		aria-labelledby="memberModalLabel" aria-hidden="true">
																		<div class="modal-dialog modal-lg">
																			<div class="modal-content">
																				<div class="modal-header">
																					<h5 class="modal-title" id="memberModalLabel">회원관리</h5>
																					<button type="button" class="btn-close"
																						data-bs-dismiss="modal" aria-label="Close"></button>
																				</div>

																				<div class="modal-body container px-5">
																					<div class="bg-light rounded-4 py-5 px-4 px-md-5">
																						<div class="text-center mb-5">
																							<h1 class="fw-bolder">회원정보 수정</h1>
																						</div>
																						<div class="row gx-5 justify-content-center">
																							<div class="col-lg-8 col-xl-6">
																								<form id="editForm"
																									action="${pageContext.request.contextPath}/memberUpdate"
																									method="POST" enctype="multipart/form-data">

																									<!-- Profile image input -->
																									<div class="form-floating mb-3">
																										<div class="d-flex justify-content-center">
																											<img class="prof-img" id="imgBox"
																												src="${pageContext.request.contextPath}/displayImage?imgName=${member.memProfile }"
																												alt="Profile Image" /> <input name="img"
																												class="form-control d-none"
																												id="registProfile" type="file"
																												accept="image/*" />
																										</div>
																									</div>

																									<!-- ID input (Read-only) -->
																									<div class="form-floating mb-3">
																										<input name="memId" class="form-control"
																											id="inputId" type="text"
																											value="${member.memId}" readonly /> <label
																											for="inputId">아이디 (변경 불가)</label>
																									</div>

																									<!-- Password input -->
																									<div class="form-floating mb-3">
																										<input name="memPw" class="form-control"
																											id="inputPw" type="password"
																											placeholder="비밀번호" value="${member.memPw}" />
																										<label for="inputPw">비밀번호</label>
																									</div>

																									<!-- Email input -->
																									<div class="form-floating mb-3">
																										<input name="memEmail" class="form-control"
																											id="inputEmail" type="email"
																											value="${member.memEmail}" placeholder="이메일" />
																										<label for="inputEmail">이메일</label>
																									</div>

																									<!-- Phone input -->
																									<div class="form-floating mb-3">
																										<input name="memPhone" class="form-control"
																											id="inputPhone" type="tel"
																											value="${member.memPhone}"
																											placeholder="휴대폰 번호" /> <label
																											for="inputPhone">휴대폰 번호</label>
																									</div>

																									<!-- Company Name input (Read-only) -->
																									<div class="form-floating mb-3">
																										<input name="entpName" class="form-control"
																											id="inputEntp" type="text"
																											value="${member.entpName}" readonly /> <label
																											for="inputEntp">회사명 (변경 불가)</label>
																									</div>


																									<!-- Submit Button -->
																									<div class="d-grid">
																										<button
																											class="btn btn-primary btn-lg mb-2 cur-poi"
																											id="submitButton" type="submit">수정하기</button>
																									</div>
																								</form>

																								<div class="d-grid">
																									<button class="btn mb-2 btn-secondary btn-lg"
																										id="backBtn">뒤로가기</button>
																								</div>

																								<div class="d-grid">
																									<button class="btn btn-secondary btn-lg"
																										style="color: white; background-color: red;">회원탈퇴</button>
																								</div>
																							</div>
																						</div>
																					</div>
																				</div>



																				<div class="modal-body">
																					<table class="table table-hover">
																						<thead>
																							<tr>
																								<th scope="col">아이디</th>
																								<th scope="col">업체명</th>
																								<th scope="col">휴대폰번호</th>
																								<th scope="col">이메일</th>
																							</tr>
																						</thead>
																						<tbody>
																							<!-- 회원정보 불러오는 부분은, 기존 실습때 따로 했던 파일에서 추출한거라 수정 필요하므로, 임시 메모 -->
																							<c:forEach items="${keyMemberList}" var="member">
																								<tr>
																									<td class="text-center">${member.memId}</td>
																									<td class="text-center">${member.entpName}</td>
																									<td class="text-center">${member.memPhone}</td>
																									<td class="text-center">${member.memEmail}</td>

																									<td>
																										<!-- 회원관리 모달창 버튼 -->
																										<div class="d-grid mt-5 ms-4">
																											<button class="v-edit-btn bg-color"
																												data-bs-toggle="modal"
																												data-bs-target="#memberModal">회원관리</button>
																										</div>

																									</td>

																								</tr>
																							</c:forEach>
																						</tbody>
																					</table>
																				</div>
																				<!-- 관리자_회원정보수정 모달창 닫기 -->
																				<div class="modal-footer">
																					<button type="button" class="btn btn-secondary"
																						data-bs-dismiss="modal">닫기</button>
																				</div>
																			</div>
																		</div>
																	</div>
																</td>
																<!-- 관리자_회원정보수정 모달창 영역 종료  -->

															</tr>
														</c:forEach>
													</tbody>
												</table>
											</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-secondary"
													data-bs-dismiss="modal">닫기</button>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>

						<!-- 견적내역 -> 미확인 견적내역으로 기능 변경. 메모. -->
						<div class="col-6 bg-light rounded-4 py-3 border">
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
											<c:if test="${not empty boardListById}">
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

								</div>
							</div>
						</div>
						<!-- 견적내역 영역 끝 -->
					</div>
				</div>
				<!-- 차트 영역 시작 -->
				<div class="row align-items-start">
					<div class="col-6">
						<div class="bg-light rounded-4 py-5 px-4 px-md-5 border">차트1</div>
					</div>
					<div class="col-6">
						<div class="bg-light rounded-4 py-5 px-4 px-md-5 border">차트2</div>
					</div>
				</div>
				<!-- 차트 영역 끝 -->
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
        document.querySelector('.prof-img').addEventListener('click', () => {
            document.querySelector('#registProfile').click();
        });

        document.querySelector('#backBtn').addEventListener('click', () => {
            location.href = "${pageContext.request.contextPath}/"; // home으로 돌아가기
        });
        console.log(document.querySelector('#imgBox').src)
    </script>
</body>
</html>
