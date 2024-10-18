<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>${board.orderTitle}</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css" />
    
    <style type="text/css">
    	.content-box{
    		width:100%;
    		height:600px;
    		border: 1px solid black;
    		margin-bottom: 100px;
    	}
    	
    	.reply-box{
    		width:100%;
    		height:500px;
    		border: 1px solid black;
    	}
    
    </style>
    
</head>
<body>

	<%@ include file="/WEB-INF/inc/top.jsp" %>
	
	<main class="flex-shrink-0">
		<section class="py-5">
			<div class="container px-5">
				<div class="bg-light rounded-4 py-5 px-4 px-md-5">
					<div class="text-center mb-5">
						<h1 class="fw-bolder">견 적 내 역</h1>
					</div>


					<div class="row gx-5 justify-content-center">
						<div class="col-lg-12 col-xl-10">
							<table class="table table-bordered">
								<!-- 각 열의 너비 설정 및 가운데 정렬 적용 -->
								<colgroup>
									<col style="width: 7%;" />
									<!-- 번호  -->
									<col style="width: 40%;" />
									<!-- 제목  -->
									<%-- <col style="width: 40%;" /> <!-- 내용  -->  --%>
									<col style="width: 15%;" />
									<!-- 날짜  -->
									<col style="width: 15%;" />
									<!-- 업체명  -->
									<col style="width: 23%;" />
									<!-- 피드백 여부  -->
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
									<tr> 
										<th scope="row" class="text-center">${board.orderNo}</th> <!-- 번호 -->
										<td class="text-center">${board.orderTitle}</a></td> <!-- 제목 -->
										<td class="text-center">${board.requestDate}</td> <!-- 날짜 -->
										<td class="text-center">${board.entpName}</td> <!-- 업체명 -->
										<td class="text-center">${board.feedbackYn}</td> <!-- 피드백여부 -->
									</tr>
								</tbody>
							</table>
							
							<div class="content-box">${board.orderContent}</div>
							<div class="reply-box">피드백</div>   
	
						</div>
					</div>

				</div>
			</div>
		</section>
	</main>
	
	
		
	
</body>
</html>
