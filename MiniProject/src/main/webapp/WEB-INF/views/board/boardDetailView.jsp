<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>${board.orderTitle}</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css" />
    <script src="https://code.jquery.com/jquery-3.7.1.js"
	integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
	crossorigin="anonymous"></script>
    
    <style type="text/css">
    	* {
    box-sizing: border-box;
    margin: 0;
    padding: 0;
	}

	body {
	    font-family: Arial, sans-serif;
	    background-color: #f9f9f9;
	}
	
	button {
	    background-color: #007bff;
	    color: white;
	    border: none;
	    padding: 10px 15px;
	    border-radius: 5px;
	    cursor: pointer;
	    transition: background-color 0.3s;
	}
	
	button:hover {
	    background-color: #0056b3;
	}
	
	#overlay {
	    display: none; /* 기본적으로 숨김 */
	    position: fixed;
	    top: 0;
	    left: 0;
	    width: 100%;
	    height: 100%;
	    background-color: rgba(0, 0, 0, 0.5); /* 반투명 배경 */
	    z-index: 99; /* 모달보다 낮은 z-index */
	}
	
	.modal-box {
	    z-index: 100;
	    width: 90%;
	    max-width: 1200px;
	    height: 80%;
	    display: none;
	    justify-content: center;
	    align-items: flex-start; /* Align items at the top */
	    position: fixed;
	    top: 50%;
	    left: 50%;
	    transform: translate(-50%, -50%);
	    background-color: white;
	    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
	    border-radius: 10px;
	    overflow: hidden; /* Hide overflow of modal box */
	}
	
	.modal-mat-list, .modal-cal {
	    padding: 20px;
	    height: calc(100% - 60px); /* Adjust height to accommodate buttons */
	    overflow-y: auto; /* Enable vertical scroll */
	}
	
	.material-list {
	    padding: 10px;
	    border: 1px solid #ddd;
	    border-radius: 5px;
	    background-color: #fafafa;
	}
	
	.mat-var {
	    padding: 10px;
	    border-bottom: 1px solid #ddd;
	    display: flex;
	    align-items: center;
	}
	
	.mat-var:last-child {
	    border-bottom: none;
	}
	
	.cal-var, .cal-var-input {
	    padding: 10px;
	    margin-bottom: 10px;
	    display: flex;
	    align-items: center;
	    background-color: #f0f0f0;
	    border-radius: 5px;
	}
	
	#resultCal {
	    margin-top: 20px;
	    text-align: right;
	    color: #333;
	    font-size: 24px;
	    font-weight: bold;
	}
	
	#btnBox {
	    display: flex;
	    justify-content: space-between;
	    margin-top: 20px;
	}
	
	input[type='number'] {
	    width: 80px;
	    margin-left: 10px;
	    padding: 5px;
	    border: 1px solid #ccc;
	    border-radius: 5px;
	}
	
	input[type='text'], textarea, select {
	    padding: 5px;
	    margin-right: 10px;
	    border: 1px solid #ccc;
	    border-radius: 5px;
	}
	
	textarea {
	    resize: none; /* Prevent resizing */
	}
	
	select {
	    width: auto;
	}
	
	.material-list img.mat-img {
	    width: 50px;
	    height: auto;
	    margin-right: 10px;
	}
	
	.cal-var-img img.cal-img {
	    width: 30px;
	    height: auto;
	}
	
	#exampleBox {
	    border: 1px solid #ddd;
	    border-radius: 8px;
	    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	    overflow: hidden;
	    margin: 20px;
	    width: 1100px;
	    transition: transform 0.2s;
	}
	
	#exampleBox:hover {
	    transform: scale(1.05); /* 호버 시 크기 증가 */
	}
	
	.ex-img img {
	    width: 70px;
	    height: auto;
	    border-bottom: 1px solid #ddd;
	}
	
	.ex-name {
	    font-size: 15px;
	    font-weight: bold;
	    margin: 10px 0;
	    text-align: center;
	    color: #333;
	}
	
	.ex-EA {
	    font-size: 1em;
	    color: #666;
	    text-align: center;
	    padding: 0 10px;
	    margin-bottom: 10px;
	}
	
	.write-overview {
	    display: flex;
	    width: 1200px;
	    height: 30px;
	    border: 1px solid black;
	}
	
	.write-container {
	    width: 1200px;
	    border: 1px solid black;
	}
	
	.application {
	    display: flex;
	    justify-content: center;
	    align-items: center;
	    width: calc(100% / 3 - 2px);
	    height: 30px;
	}
	
	.application1 {
	    display: flex;
	    justify-content: space-around;
	    align-items: center;
	    width: calc(100% / 3 - 2px);
	    height: 30px;
	}
	
	.write-title-box {
	    display: flex;
	    width: 100%;
	    height: 70px;
	    margin-top: 40px;
	}
	
	.write-title {
	    display: flex;
	    justify-content: center;
	    width: 33%;
	    height: 40px;
	}
	
	.write-title-input {
	    width: 66%;
	    height: 40px;
	    padding-right: 20px;
	}
	
	.write-content-box {
	    display: flex;
	    width: 100%;
	    height: 200px;
	    margin-top: 40px;
	}
	
	.write-content {
	    display: flex;
	    justify-content: center;
	    align-items: center;
	    width: 33%;
	    height: 200px;
	}
	
	.write-content-input {
	    width: 66%;
	    height: 200px;
	    padding-right: 20px;
	}
	
	.write-click-btn {
	    display: flex;
	    justify-content: end;
	}
	
	.ex-box {
	    display: flex;
	    width: calc(100% / 5 - 10px);
	    height: 50px;
	}
	    	
	    
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
    	
    	#fixedHeight {
        	height: 15px; 
        	overflow: hidden; 
  		}
  		  
		
		.material-img {
		    height: 100%; 
		    width: 25%; 
		}
		
		.fixedHeight td, .fixedHeight th {
		    height: 100%; 
		}
		
		#calcResult{
			display: flex;
			justify-content: flex-end;
			padding-right: 20px;
		}
		
		.material-img:hover{ 
			transform: scale(2);
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
										<th id="boardNum" scope="row" class="text-center">${board.orderNo}</th> <!-- 번호 -->
										<td class="text-center">${board.orderTitle}</td> <!-- 제목 -->
										<td class="text-center">${board.requestDate}</td> <!-- 날짜 -->
										<td class="text-center">${board.entpName}</td> <!-- 업체명 -->
										<td class="text-center">${board.feedbackYn}</td> <!-- 피드백여부 -->
									</tr>
								</tbody>
							</table>
							
							<div class="content-box">
								
								 
								<table style="background-color: white;" class="table table-bordered">
									<!-- 각 열의 너비 설정 및 가운데 정렬 적용 -->
									<colgroup>
										<col style="width: 35%; " /> 
										<col style="width: 40%;" />
										<col style="width: 25%;" /> 
									</colgroup> 
									<thead class="thead-light">
										<tr>
											<th scope="col" class="text-center">자재 사진</th>
											<th scope="col" class="text-center">자재 이름</th>
											<th scope="col" class="text-center">자재 사용량</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="scv" items="${scVolList }">
										
											<tr id="fixedHeight">  
												<th scope="row" class="text-center">
													<img class="material-img" src="${scv.materialImg }">
												</th> 
												<td class="text-center">${scv.materialName}</td> <!-- 이름 -->
												<td class="text-center">${scv.materialVolume} kg</td> <!-- 이름 -->
											</tr>
											 
										</c:forEach>	
									</tbody>
								</table>
								<p id="calcResult">
									<span style="padding-right: 15px; font-weight: bold; color: blue;">${calcResult }</span>
									<span style="font-weight: bold;">CO2/KG</span>
								</p>
								<h5>내용</h5>
								<p>
									${board.orderContent}
								</p> 
							</div>
							
							<div id="exampleBox"></div>   
							<c:if test="${sessionScope.login.getMemId() == 'admin' }">
								<div id="overlay"></div>
								<textarea id="replyContent" rows="15" cols="111"></textarea>
								<button id="modalBtn" >계산기</button>
								<button id="replyWriteBtn">답변작성</button>
								
								<div class="modal-box">
									<div class="modal-mat-list">
										<div class="material-list">
											<c:forEach items="${scmList }" var="scm">
												<div class="mat-var">
													<div class="mat-no" style="display: none;">${scm.materialNo }</div>
													<div class="mat-var-img">
														<img class="mat-img" src="${scm.materialImg }">
													</div>
													<div class="mat-var-name">${scm.materialName}</div>
													<div class="mat-var-co2">${scm.gasKg}</div>
												</div>
											</c:forEach>
										</div>
									</div>
									
									<div class="modal-cal">
										<div class="modal-cal-list"></div>
										<div id="resultCal">0 CO₂/kg</div>
										<div id="btnBox">
											<button id="closeCal" type="button">닫기</button>
											<button id="registCal" type="button">등록</button>
										</div>
									</div>
							
								</div>
							</c:if>
							
							

						</div>
					</div>

				</div>
			</div>
		</section>
	</main>
	
	<script type="text/javascript">
	
	
		if(${sessionScope.login.getMemId() == 'admin'}){
			let v_overlay = document.getElementById('overlay');
			
			// 모달 띄우기 버튼  
				let v_modalBtn = document.querySelector('#modalBtn');
				v_modalBtn.addEventListener('click',()=>{
					document.getElementsByClassName('modal-box')[0].style.display = "flex";
					v_overlay.style.display = "block"; 
				})
				
			// 모달 창 닫기
				let v_closeModal = document.querySelector('#closeCal');
				v_closeModal.addEventListener('click',()=>{
					document.getElementsByClassName('modal-box')[0].style.display = "none"; 
					v_overlay.style.display = "none"; 
				})
				
			    
			    
			    
			// mat-var 클릭이벤트 주기
				let v_img = document.querySelectorAll('.mat-img');
				let v_name = document.querySelectorAll('.mat-var-name');
				let v_co2 = document.querySelectorAll('.mat-var-co2');
				
				let v_matVar = document.querySelectorAll('.mat-var');
				
				let v_resultCal = document.querySelector('#resultCal');
				let v_modalCalList = document.querySelectorAll('.modal-cal-list')
				
				v_modalCalList[0].innerHTML = "abc"
				
				let v_alpha = "";
				let total = 0;
				
				let matBtnList = [];
				
				// 목록에서 자재 누르면 계산기에 뜨고  기능 구현
				v_matVar.forEach(mat => {
					
					let i = parseInt(mat.querySelector('.mat-no').innerHTML.trim());
					
					mat.addEventListener('click',()=>{ 
						
						$.ajax({
							url: '${pageContext.request.contextPath}/findSub',
							type: 'POST',
							contentType: 'application/json',
							data: JSON.stringify({
								no: i
							}),
							success: function(response){
								let v_alpha = "";  
								
								response.forEach(r =>{
									v_alpha += '<div class="cal-var"><div class="cal-var-img"><img class="cal-img" src="'+ r.subImg +'"></div><div class="cal-var-name">'
									v_alpha += r.subName + '</div><div id="hiddenMatNo" style="display: none;">'+ i + '</div><div class="cal-var-co2">'
									v_alpha += r.gasKg + '</div><div class="cal-var-input"></div>'
									
								})
								
								v_modalCalList[0].innerHTML = v_alpha;
								v_modalCalList[0].style.display = "block";
							}
						}) 
						
						
					})
					let v_delete = document.querySelectorAll('.delete-btn');
				
					v_delete.forEach((delBtn,idx) =>{
						console.log(delBtn.parentElement);
					})
					
				})
				
				// 리스트 controller로 보내기
				let scId = "";	
			
				v_registBtn = document.querySelector('#registCal');
				
				// 등록 버튼
				v_registBtn.addEventListener('click',()=>{
					
					v_overlay.style.display = "none";
					document.getElementsByClassName('modal-box')[0].style.display = "none";
					let noList = [];
					let eaList = [];
					
					v_calVar = document.querySelectorAll('.cal-var');
					
					// 계산기 div들에 대해
					v_calVar.forEach(cv =>{
						let v_no = cv.querySelector('#hiddenMatNo').innerHTML.trim(); //String
						let v_ea = parseFloat(cv.querySelector('.input-EA').value); // Float
						 
						if(v_ea <= 0 || isNaN(v_ea)){ 
							return;   
						}else{
							v_ea = Math.floor(v_ea);
							noList.push(v_no);
							eaList.push(v_ea); 
						}
						
						 
					})
					
					let v_inputEA = document.querySelectorAll('.input-EA');
					
					let isYang = true;
					v_inputEA.forEach(v_ea =>{
						if(v_ea.value<0){
							isYang = false;
						}	
					})
					if(!isYang){
						alert('음수불가');
					}else{
						let v_exBox = document.querySelector('#exampleBox'); 
						
						if(eaList.length == 0){
							v_exBox.innerHTML = "아직 계산 내용 X"
							document.getElementsByClassName('modal-box')[0].style.display = "none";
							return;
						}
						
						
						let strNoList = noList.join(',');
						let strEaList = eaList.join(',');
						let v_alpha2 = "";
						
						
						$.ajax({
						    url: '${pageContext.request.contextPath}/registCal', 
						    type: 'POST',
						    contentType: 'application/json',
						    data: JSON.stringify({
						        no: strNoList,
						        ea: strEaList
						    }), 
						    success: function(response) { 
						    	
						    	console.log(response.registList[0].materialImg);     
						    	
						    	for(let i=0; i<response['registList'].length; i++){
						    		
						    		v_alpha2 += '<div class="ex-box"><div class="ex-img"><img src="'+ response.registList[i].materialImg
							    	v_alpha2 += '"></div><div class="ex-name">'+ response.registList[i].materialName 
							    	v_alpha2 += '</div><div class="ex-EA">'+ eaList[i] +'</div></div>' 
						    	}
						    	
						    	v_exBox.innerHTML = v_alpha2;
						    	
						    	scId = response['scId']; 
						    	
						    }
						    
						}); 
						 
					}
					
				}) 
				
				// 답변 등록하고 실시간 띄우기
				let v_replyBtn = document.querySelector('#replyWriteBtn');
				let v_content = document.querySelector('#replyContent');
				let b_no = document.querySelector('#boardNum');
				     
				
				
				v_replyBtn.addEventListener('click',()=>{
					
					if(!v_content.value.trim()){
						alert('답변 comments를 입력해주세요');
					}else if(scId == ""){
						alert('답변에 견적 내용이 없습니다.')
					}else{
						
						
						$.ajax({
							url: '${pageContext.request.contextPath}/replyWriteDo',
							type: 'POST',
							contentType: 'application/json',
							data: JSON.stringify({
								id: scId,
								content: v_content.value,
								no: b_no.innerHTML
							}),
							success: function(r){
								console.log(r);
								location.href = location.href;
							}
						})
					}
				})
		}
		
	</script>
		
	
</body>
</html>
