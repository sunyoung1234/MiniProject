<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<title>회원정보 수정</title>
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet" />
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
</style>
</head>
<body class="d-flex flex-column">
	<main class="flex-shrink-0">
		<!-- Navigation-->
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
						<c:if test="${not empty sessionScope.login}">
							<li class="nav-item"><a class="nav-link"
								href="${pageContext.request.contextPath}/memEditView">회원정보</a></li>
							<li class="nav-item"><a class="nav-link"
								href="${pageContext.request.contextPath}/logout">로그아웃</a></li>
						</c:if>
						<c:if test="${empty sessionScope.login}">
							<li class="nav-item"><a class="nav-link"
								href="${pageContext.request.contextPath}/loginView">로그인</a></li>
							<li class="nav-item"><a class="nav-link"
								href="${pageContext.request.contextPath}/registView">회원가입</a></li>
						</c:if>
						<li class="nav-item"><a class="nav-link"
							href="${pageContext.request.contextPath}/boardView">견적 요청</a></li>
					</ul>

				</div>
			</div>
		</nav>

		<section class="py-5">
			<div class="container px-5">
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
											src="C:/uploads/no003_1729148466127.jpeg "
											alt="Profile Image"
<%-- 											onerror="this.src='${pageContext.request.contextPath}/images/default.jpg';"  --%>/>
										<input name="memProfile" class="form-control d-none"
											id="registProfile" type="file" accept="image/*" />
									</div>
								</div>
								
								<!-- ID input (Read-only) -->
								<div class="form-floating mb-3">
									<input name="memId" class="form-control" id="inputId"
										type="text" value="${member.memId}" readonly /> <label
										for="inputId">아이디 (변경 불가)</label>
								</div>

								<!-- Password input -->
								<div class="form-floating mb-3">
									<input name="memPw" class="form-control" id="inputPw"
										type="password" placeholder="비밀번호" value="${member.memPw}" /> <label for="inputPw">비밀번호</label>
								</div>

								<!-- Email input -->
								<div class="form-floating mb-3">
									<input name="memEmail" class="form-control" id="inputEmail"
										type="email" value="${member.memEmail}" placeholder="이메일" />
									<label for="inputEmail">이메일</label>
								</div>

								<!-- Phone input -->
								<div class="form-floating mb-3">
									<input name="memPhone" class="form-control" id="inputPhone"
										type="tel" value="${member.memPhone}" placeholder="휴대폰 번호" />
									<label for="inputPhone">휴대폰 번호</label>
								</div>

								<!-- Company Name input (Read-only) -->
								<div class="form-floating mb-3">
									<input name="entpName" class="form-control" id="inputEntp"
										type="text" value="${member.entpName}" readonly /> <label
										for="inputEntp">회사명 (변경 불가)</label>
								</div>


								<!-- Submit Button -->
								<div class="d-grid">
									<button class="btn btn-primary btn-lg mb-2 cur-poi"
										id="submitButton" type="submit">수정하기</button>
								</div>
							</form>

							<div class="d-grid">
								<button class="btn mb-2 btn-secondary btn-lg" id="backBtn">뒤로가기</button>
							</div>
							
							<div class="d-grid"> 
								<button class="btn btn-secondary btn-lg" style="color: white; background-color: red;">회원탈퇴</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
	</main>

	<footer class="bg-white py-4 mt-auto">
		<div class="container px-5">
			<div
				class="row align-items-center justify-content-between flex-column flex-sm-row">
				<div class="col-auto">
					<div class="small m-0">Copyright &copy; Your Website 2023</div>
				</div>
				<div class="col-auto">
					<a class="small" href="#!">Privacy</a> <span class="mx-1">&middot;</span>
					<a class="small" href="#!">Terms</a> <span class="mx-1">&middot;</span>
					<a class="small" href="#!">Contact</a>
				</div>
			</div>
		</div>
	</footer>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<script src="js/scripts.js"></script>

	<script type="text/javascript">
        document.querySelector('.prof-img').addEventListener('click', () => {
            document.querySelector('#registProfile').click();
        });

        document.querySelector('#registProfile').addEventListener('change', () => {
            const file = document.querySelector('#registProfile').files[0];
            const reader = new FileReader();
            reader.onload = function(event) {
                document.getElementById('imgBox').src = event.target.result;
            };
            reader.readAsDataURL(file);
        });

        document.querySelector('#backBtn').addEventListener('click', () => {
            location.href = "${pageContext.request.contextPath}/"; // home으로 돌아가기
        });
    </script>
</body>
</html>
