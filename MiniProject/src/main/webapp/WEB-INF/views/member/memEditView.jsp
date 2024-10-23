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
		
		<%@ include file="/WEB-INF/inc/top.jsp" %>

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
											src="${pageContext.request.contextPath}/displayImage?imgName=${member.memProfile }" 
							 				alt="Profile Image"
<%-- 											onerror="this.src='${pageContext.request.contextPath}/images/default.jpg';"  --%>/>
										<input name="img" class="form-control d-none"
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

	<%@ include file="/WEB-INF/inc/footer.jsp" %>

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
        console.log(document.querySelector('#imgBox').src)
    </script>
</body>
</html>
