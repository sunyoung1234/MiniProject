<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<style type="text/css">
		.bg-color{
        		background-color: #10bd66;
        	}
	</style>
	


</head>
<body>
	 	<nav class="navbar navbar-expand-lg navbar-dark bg-color">
			<div class="container">
				<a class="navbar-brand" href="${pageContext.request.contextPath}/">Green Solution</a>
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
						<c:if test="${not empty sessionScope.login}">
							<li class="nav-item"><a class="nav-link"
							href="${pageContext.request.contextPath}/boardView">견적 요청</a></li>
						</c:if>
						
						
					</ul>

				</div>
			</div>
		</nav>


</body>
</html>