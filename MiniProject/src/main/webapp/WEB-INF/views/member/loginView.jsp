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
<title>로그인</title>
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

.login-bg {
	background-color: #f8f9fa; /* 요청게시판의 배경색 */
}

.login-card {
	background-color: white; /* 카드 색상 */
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); /* 그림자 효과 */
}

.err-msg {
	color: red;
}

.main-height{
	height:1000px;
}

</style>

</head>

<%@ include file="/WEB-INF/inc/top.jsp"%>
<body class="d-flex flex-column login-bg">
	<main class="main-height flex-shrink-0">
		<!-- Navigation-->
		
		<!-- Page content-->
		<section class="py-5">
			<div class="container px-5">
				<div class="login-card rounded-4 py-5 px-4 px-md-5">
					<div class="text-center mb-5">
						<h1 class="fw-bolder">로그인</h1>
					</div>
					<div class="row gx-5 justify-content-center">
						<div class="col-lg-8 col-xl-6">
							<span class="err-msg">${msg}</span>
							<form id="contactForm"
								action="${pageContext.request.contextPath}/loginDo"
								method="POST">
								<!-- 아이디 input-->
								<div class="form-floating mb-3">
									<input name="memId" class="form-control" id="inputId"
										type="text" placeholder="아이디"
										value="${cookie.rememberId.value }" required /> <label
										for="inputId">아이디</label>
								</div>
								<!-- 비밀번호 input-->
								<div class="form-floating mb-3">
									<input name="memPw" class="form-control" id="inputPw"
										type="password" placeholder="비밀번호" required /> <label
										for="inputPw">비밀번호</label>
									<!-- 아이디 기억하기 -->
									<div class="form-check mb-3 mt-1">
										<input class="form-check-input" type="checkbox"
											id="inputRememberId" type="checkbox" name="rememberId"
											${cookie.rememberId.value == null ? "" : "checked" }>
										<label class="form-check-label" for="inputRememberId">아이디
											기억하기</label>
									</div>
								</div>
								<!-- Submit Button-->
								<div class="d-grid">
									<button class="btn btn-success btn-lg mb-2 cur-poi"
										id="submitBtn" type="submit">로그인</button>
								</div>
								<div class="d-grid">
									<button class="btn btn-success btn-lg" id="registBtn">회원가입</button>
								</div>
								<a class="cur-poi" style="color: black;">아이디/비밀번호 찾기</a>
							</form>
						</div>
					</div>
				</div>
			</div>
		</section>
	</main>
	<%@ include file="/WEB-INF/inc/footer.jsp"%>
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

	<!-- Core theme JS-->
	<script src="js/scripts.js"></script>

	<script type="text/javascript">
        const regist_btn = document.querySelector("#registBtn");
        regist_btn.addEventListener('click', () => {
            event.preventDefault();
            location.href = "${pageContext.request.contextPath}/registView"; 
        }); 
	</script>
</body>
</html>
