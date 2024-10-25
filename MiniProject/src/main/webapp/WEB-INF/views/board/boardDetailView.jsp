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
	
	.select-none{
	    height: auto;
	    padding: 10px;
	    margin-bottom: 10px;
	    display: flex;
	    align-items: center;
	    background-color: #f0f0f0;
	    border-radius: 5px; 	 
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
		

		.mat-var {
		    cursor: pointer;
		    transition: background-color 0.3s;
		}
		
		.mat-var:hover {
		    background-color: #d0d0d0; /* 마우스 오버 시 색상 */
		}
				

		.detail-title{
			font-size: 40px;
			margin-bottom: 20px;
		}
		
		.sub-check-box{
			margin-right: 5px; 
		}
		.disabled {
            pointer-events: none; /* 클릭 이벤트 차단 */
        }
 /* GPT GPT GPT GPT GPT GPT */       
.reply-line {
    display: flex;
    padding: 15px;
    border: 1px solid #ddd;
    border-radius: 10px;
    background-color: #ffffff;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    margin: 15px 0;
    transition: transform 0.2s;
}

.reply-line:hover {
    transform: scale(1.02);
}

.reply-mat-box {
    flex: 1;
    display: flex;
    align-items: center;
}

.reply-mat-img {
    width: 60px;
    height: 60px;
    margin-right: 15px;
    border-radius: 50%;
    object-fit: cover;
    border: 2px solid #3498db; /* 이미지 테두리 */
}

.reply-mat-name {
    font-size: 1.4em;
    font-weight: bold;
    color: #333;
}

.reply-mat-vol {
    font-size: 0.9em;
    color: #777;
}

.reply-sub-box {
    flex: 2;
    display: flex;
    flex-direction: column;
    padding-left: 25px;
}

.sub-name {
    display: flex;
    align-items: center;
    margin: 8px 0;
    padding: 8px;
    border-radius: 5px;
    transition: background-color 0.2s;
}

.sub-name:hover {
    background-color: #f0f8ff; /* 호버 시 배경색 변화 */
}

.sub-img {
    width: 40px;
    height: 40px;
    margin-right: 10px;
    border-radius: 50%;
    object-fit: cover;
}

.sub-vol {
    font-size: 1.1em;
    color: #555;
}

.sub-after {
    font-size: 1.1em;
    font-weight: bold;
    color: #e74c3c; /* 빨간색 */
}

.sub-calc-result {
    font-size: 1.4em;
    font-weight: bold;
    color: #2ecc71; /* 초록색 */
    margin-top: 10px;
    border-top: 1px solid #ccc;
    padding-top: 10px;
}
/* GPT GPT GPT GPT GPT GPT */
        .modal-2{
		  width: 300px; /* 너비 설정 */
		    height: 200px; /* 높이 설정 */
		    background-color: lightblue; /* 배경색 */
		    display: flex;
		    justify-content: center;
		    align-items: center;
		    border: 1px solid #000; /* 테두리 */
		    text-align: center; /* 텍스트 중앙 정렬 */
 		   transform: translateY(-50px); /* 위로 띄우기 */
        }
        

    
    </style>
</head>
<body>
		
	<%@ include file="/WEB-INF/inc/top.jsp" %> 
	
	<main class="flex-shrink-0">
		<section class="py-5">
			<div class="container px-5">
				<div class="rounded-4 py-5 px-4 px-md-5">
					<div class="text-center mb-5">
						<h1 class="fw-bolder">견 적 내 역</h1>
					</div>


					<div class="row gx-5 justify-content-center">
						<div class="col-lg-12 col-xl-10">
							
						
							<table class="table table-bordered">
								<!-- 각 열의 너비 설정 및 가운데 정렬 적용 -->
								<colgroup>
									<col style="width: 25%;" />
									<!-- 번호  -->
									<col style="width: 25%;" />
									<!-- 날짜  -->
									<col style="width: 25%;" />
									<!-- 업체명  -->
									<col style="width: 25%;" />
									<!-- 피드백 여부  -->
								</colgroup>
								<thead class="thead-light">
									<tr>
										<th scope="col" class="text-center">번호</th>
										<th scope="col" class="text-center">날짜</th>
										<th scope="col" class="text-center">업체명</th>
										<th scope="col" class="text-center">피드백 여부</th>
									</tr>
								</thead>
								<tbody>
									<tr> 
										<th id="boardNum" scope="row" class="text-center">${board.orderNo}</th> <!-- 번호 -->
										<td class="text-center">${board.requestDate}</td> <!-- 날짜 -->
										<td class="text-center">${board.entpName}</td> <!-- 업체명 -->
										<td class="text-center">${board.feedbackYn}</td> <!-- 피드백여부 -->
									</tr>
								</tbody>
							</table>
							
							<div class="content-box">
								<div>
									<div class="detail-title">테스트트트트(제목)</div>
									<div class="detail-content">테스트 내용(내용)</div>
								</div>
								 
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
									<span id="bef_result" style="padding-right: 15px; font-weight: bold; color: blue;">${calcResult }</span>
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
								<div id="replyCal">
									<c:forEach var="scv" items="${scVolList }">
										
											<div class="reply-line">
												<div class="reply-mat-box">
													<img class="reply-mat-img" src="${scv.materialImg }">
													<div class="reply-mat-name">${scv.materialName}</div> <!-- 이름 -->
													<div class="reply-mat-vol">${scv.materialVolume} kg</div> <!-- 이름 -->
												</div>
												<div class="reply-sub-box">
													<div>변경 사항 없음</div>
												</div> 
											</div>
											 
									</c:forEach>
								</div>
								<button id="modalBtn" >계산기</button>
								<textarea id="replyContent" rows="15" cols="111"></textarea> 
								 <button id="goBackBtn">뒤로가기</button>
								<button id="replyWriteBtn">답변작성</button>
								
								<div class="modal-box">
									<div class="modal-mat-list">
										<div class="material-list">
											<c:forEach items="${scmList }" var="scm">
												<div class="mat-var disabled">
													<div class="mat-no" style="display: none;">${scm.materialNo }</div>
													<div class="mat-var-img">
														<img class="mat-img" src="${scm.materialImg }">
													</div>
													
													<div class="mat-var-name">${scm.materialName}</div> 
													<div style="padding-left: 15px" class="mat-var-vol">${scm.materialVolume}kg</div>
													<div style="padding-left: 20px" class="mat-cal-result" >${Math.round(scm.gasKg * scm.materialVolume)}</div>
												</div>
											</c:forEach>
										</div>
									</div>
									
									<div class="modal-cal">
										<div class="modal-cal-list"></div>
										<div id="resultCal">0 CO₂/kg</div>
										<div id="btnBox">
											<button id="closeCal" type="button">닫기</button>
											<button id="nextSub" type="button">다음</button>
											<button id="registSub" type="button" style="display: none;">등록</button>
											
										</div>
									</div> 
							
								</div>
								
							</c:if>
							<c:if test="${sessionScope.login.getMemId() != 'admin' }">
								<button id="goBackUserBtn">뒤로가기</button>
							</c:if>
							
							

						</div>
					</div>

				</div>
			</div>
		</section>
	</main>
	
	<%@ include file="/WEB-INF/inc/footer.jsp"%>
	
	<script type="text/javascript">
	
	
		if(${sessionScope.login.getMemId() == 'admin'}){
			let v_overlay = document.getElementById('overlay');
			let sscId = "";	
			let nextIdx = 0;
			let matMap = new Map(); // matNo - Map(subNo - subVol)
			let subMap = new Map(); // subNo - subVol
			let final_result = 0;
			let orderNo = ${board.orderNo};
			let after_total = 0; 
			 
			console.log(sscId); 
			
			// 모달 띄우기 버튼  
			let v_modalBtn = document.querySelector('#modalBtn');
			v_modalBtn.addEventListener('click',()=>{
				document.querySelector('#registSub').style.display = "none";
				document.querySelector('#nextSub').style.display = "block";
				
				nextIdx=0;
				v_matVar[0].click();
				document.getElementsByClassName('modal-box')[0].style.display = "flex";
				v_overlay.style.display = "block";
				let current = Date.now();
				sscId = current;
			})
				
			// 모달 창 닫기
			let v_closeModal = document.querySelector('#closeCal');
			v_closeModal.addEventListener('click',()=>{
				document.getElementsByClassName('modal-box')[0].style.display = "none"; 
				v_overlay.style.display = "none"; 
				nextIdx = 0;
			})
				
			    
			    
			    
			// mat-var(scmList) 클릭이벤트 주기
			let v_img = document.querySelectorAll('.mat-img');
			let v_name = document.querySelectorAll('.mat-var-name');
			let v_co2 = document.querySelectorAll('.mat-var-co2');
			
			
			let v_matVar = document.querySelectorAll('.mat-var');
			
			let v_resultCal = document.querySelector('#resultCal');
			let v_modalCalList = document.querySelectorAll('.modal-cal-list')
			
			v_modalCalList[0].innerHTML = "abc"
			
			let v_alpha = "";
			
			
			let matBtnList = [];
			
		    const event = new Event('change');
		    const Ievent = new Event('input');
			let cal_result = 0; // 이전 계산 결과 (mat당)
			let v_befResult = document.querySelector('#bef_result');
		    
		    let noneCheck = 0;
			// 목록에서 자재 누르면 계산기에 뜨고  기능 구현
			v_matVar.forEach((mat,j) => {
				 
				
				let material_no = parseInt(mat.querySelector('.mat-no').innerHTML.trim());
				  
				let sub_total = 0;
				
				mat.addEventListener('click',()=>{ 
					let total=0;
					noneCheck = 0;
					cal_result = parseFloat(document.querySelectorAll('.mat-cal-result')[j].innerHTML);
					v_resultCal.innerHTML = Math.round(100*total)/100;
					
					for(let index=0; index < v_matVar.length; index++){
						if(index == j){
							v_matVar[index].style.backgroundColor="#D0D0D0"
						}else{
							v_matVar[index].style.backgroundColor="#F0F0F0" 
						}
					}
					
					// ajax ( mat no로 sub(대체제) 가져와서 나타내기)
					$.ajax({
						url: '${pageContext.request.contextPath}/findSub',
						type: 'POST',
						contentType: 'application/json',
						data: JSON.stringify({
							no: material_no
						}),
						success: function(response){
							let v_alpha = "";
							let subNoList = [];
							response.forEach(r =>{
								v_alpha += '<div class="cal-var"><input class="sub-check-box" type="checkbox"><div class="cal-var-img"><img class="cal-img" src="'+ r.subImg +'"></div><div class="cal-var-name">'
								v_alpha += r.subName + '</div><div id="hiddenMatNo" style="display: none;">'+ material_no + '</div><div class="cal-var-co2">'
								v_alpha += r.gasKg + '</div><input value="0" min="0" max="1000000000000"  class="sub-input" style="display: none;" type="number">'
								v_alpha += '<div class="sub-result"  style="display: none;"></div></div>'
								subMap.set(r.subNo, 0);
							})
							v_alpha += '<div class="select-none"><input class="select-none-check-box" type="checkbox">변경사항 없음</div>' 
							
							
							v_modalCalList[0].innerHTML = v_alpha;
							
							// 체크박스
							let v_checkBox = document.querySelectorAll('.sub-check-box');
							let v_noneBox = document.querySelector('.select-none-check-box');
							// #D0D0D0 #F0F0F0  #FAFAFA
							
							
							let v_subInput = document.querySelectorAll('.sub-input');
							let v_subResult = document.querySelectorAll('.sub-result');
							
							let v_gas = document.querySelectorAll('.cal-var-co2');
							
							let v_subCal = document.querySelectorAll('.cal-var');
							
							v_subInput.forEach((subI, k)=>{
								
								
								subI.addEventListener('input',()=>{
									
									if(v_checkBox[k].checked){
										if(v_subResult[k].getAttribute('data-value') == null){
											total -= 0;
											subMap.set(response[k].subNo, 0);
										}else{
											total -= parseFloat(v_subResult[k].getAttribute('data-value'));
											subMap.set(response[k].subNo, parseInt(subI.value));
										}
										v_subResult[k].setAttribute('data-value',Math.round(100 * subI.value *  v_gas[k].innerHTML) / 100);
										total += parseFloat(v_subResult[k].getAttribute('data-value')); 
										
										subMap.set(response[k].subNo, parseInt(subI.value))
									}else{
										total -= parseFloat(v_subResult[k].getAttribute('data-value'));
										v_subResult[k].setAttribute('data-value', 0);
										
										subMap.set(response[k].subNo, 0)
									}
									v_resultCal.innerHTML = Math.round(100*total)/100;
									
								})
							})
							
							v_noneBox.addEventListener('change',()=>{
								  
								if(v_noneBox.checked){
									noneCheck += 1;
									v_noneBox.parentElement.style.backgroundColor = "#D0D0D0";
									v_checkBox.forEach((check, k)=>{
										check.checked = false;
										check.parentElement.style.backgroundColor = "#F0F0F0";
									})
									v_resultCal.innerHTML = 0;  
									 
									v_subInput.forEach((subI, k)=>{
										subI.style.display = "none";
									})
									v_checkBox.forEach((cb)=>{
										cb.style.display = "none";
									})
									
									for(let index=0; index<response.length; index++){
										subMap.set(response[index].subNo, 0)
									}
								}else{ 
									noneCheck -= 1;
									v_noneBox.parentElement.style.backgroundColor = "#F0F0F0";
									v_resultCal.innerHTML = Math.round(100*total)/100;
									
									v_checkBox.forEach((cb)=>{
										cb.style.display = "block";
									})
									v_subResult.forEach((result,k)=>{
										if(result.getAttribute('data-value')!= 0 && result.getAttribute('data-value')!= null){
											v_checkBox[k].checked = true;
											v_checkBox[k].dispatchEvent(event); 
										}
									})
									
								}
								
							})
							
							v_checkBox.forEach((check,x)=>{
								check.addEventListener('change',()=>{
									
									if(check.checked){
										v_noneBox.parentElement.style.backgroundColor = "#F0F0F0";
										check.parentElement.style.backgroundColor = "#D0D0D0";
										v_subInput[x].style.display = "block";
										v_noneBox.checked = false;
										 
										subMap.set(response[x].subNo, parseInt(v_subInput[x].value));
									}else{
										check.parentElement.style.backgroundColor = "#F0F0F0";
										v_subInput[x].style.display = "none";
										
										subMap.set(response[x].subNo, 0);
									}
									v_subInput[x].dispatchEvent(Ievent);
								})
							})
							
							
						}
							
							
					}) // ajax 끝
					
				}) // mat click 끝
				
			}) // v_matVar forEach 끝
				
			// 다음버튼 (선택 없으면 안넘어가게, 기존 < 이후 이면 안넘어가게), 내용저장, total 초기화
			let v_nextBtn = document.querySelector('#nextSub');
			
			
			v_nextBtn.addEventListener('click',()=>{ 
				
				subMap.set(0, parseInt(100 * v_resultCal.innerHTML) / 100);
				
				let b_result = 0;
				let v_resultBox = document.querySelectorAll('.sub-result');
				
				if(v_resultCal.innerHTML == null){
					subMap.set(0, 0);
				}
				let keysArray = Array.from(subMap.keys());
				let checkZero = 0; 
				
				for(let key = 0 ; key < keysArray.length - 1; key++){
					if(subMap.get(keysArray[key]) == 0 || isNaN(subMap.get(keysArray[key]))){
						checkZero++;
					}else if(subMap.get(keysArray[key])<0){
						checkZero++;
						checkZero++;
					}
				} 
				
				
				if(noneCheck != 0 || checkZero < 3 ){
					
					let mat_no2 = parseInt(v_matVar[nextIdx % v_matVar.length].querySelector('.mat-no').innerHTML.trim());
					
					const subObj = Object.fromEntries(subMap);
					const strSub = JSON.stringify(subObj);
					
					matMap.set(mat_no2, strSub);
					subMap = new Map();
					
					nextIdx++;
					
				}else if(checkZero == 3){
					alert('변경사항이 없으면 변경사항 없음을 선택해주세요')
				}else{
					alert('음수 사용 불가')
				}
				
				if(nextIdx % v_matVar.length == 0){
					// 등록버튼 나오게 다음버튼 없어지게
					document.querySelector('#registSub').style.display = "block";
					document.querySelector('#nextSub').style.display = "none";
				}else{
					v_matVar[nextIdx % v_matVar.length].click();
				} 
				
				
				
			}) 
			
			// 등록버튼 (savesubcal 들 모아서 넘기기   기존 총합  이후 총합 차이)
			let v_registBtn = document.querySelector('#registSub');
			let v_replyLine = document.querySelectorAll('.reply-sub-box');
			
			console.log(v_replyLine[0]) 
			console.log(v_replyLine[1]) 
			
			v_registBtn.addEventListener('click',()=>{
				
				const matObj = Object.fromEntries(matMap);
				const strMap = JSON.stringify(matObj);
				
				console.log(orderNo);
				after_total = 0;
				
				
				$.ajax({
					url: '${pageContext.request.contextPath}/saveSub',
					type: 'POST',
					contentType: 'application/json',
					data: JSON.stringify({
						b_id : orderNo + "",
						id : sscId + "", 
						map : strMap  
					}), 
					success: function(response){
						console.log(response)
						document.getElementsByClassName('modal-box')[0].style.display = "none"; 
						v_overlay.style.display = "none";
						
						let matEa = response['eaList'].length;;
						let idx = 0;
						
						for(let i=0; i < matEa; i++){
							
							let v_beta = "";  
							for(let j=0; j< response['eaList'][i]; j++){
								after_total += response['sscList'][idx].subVol * response['subList'][idx].gasKg;
								v_beta += '<div class="sub-name"><div>' + response['subList'][idx].subName + '</div>'
								v_beta += '<img class="sub-img" src="' + response['subList'][idx].subImg + '">'
								v_beta += '<div class="sub-vol">' + response['sscList'][idx].subVol + '</div></div>'
								
								idx ++;
							}
							v_replyLine[i].innerHTML = v_beta;
						}
						
						final_result = (Math.round((v_befResult.innerHTML - after_total)*100) /100)
						after_total = (Math.round(after_total * 100)/100);
						v_replyLine[matEa - 1].innerHTML += '<div class="sub-after">' + after_total + '</div>'
						v_replyLine[matEa - 1].innerHTML += '<div class="sub-calc-result">' + (Math.round((v_befResult.innerHTML - after_total)*100) /100) + '</div>'
						
						console.log(v_replyLine[matEa - 1].parentElement.outerHTML);   
					}
						})
					
				})
			 
			 
			let v_replyWriteBtn = document.querySelector('#replyWriteBtn');
			let rContent = document.querySelector('#replyContent');
			
			
			 v_replyWriteBtn.addEventListener('click',()=>{
				 
				 sscId += "";
				 
				 let rv = rContent.value;
				 
				if(rContent.value.length < 1 ){ 
					alert('내용을 입력하세요');
				}else if(sscId == null || sscId.length < 5 ){ 
					alert('견적 내용을 입력하세요');  
				}else if(final_result < 0 ){
					alert('견적 결과가 요청결과보다 큽니다') 
				}else{
					$.ajax({
						url: '${pageContext.request.contextPath}/replyWrite',
						type: 'POST',
						contentType: 'application/json',
						data: JSON.stringify({
							after : after_total + "", 
							b_no : orderNo + "",
							id : sscId, 
							result : final_result + "",
							content : rv
						}), 
						success: function(response){
							console.log(response);
							document.querySelector('#modalBtn').style.display = "none";
							document.querySelector('#replyContent').style.display = "none";
							document.querySelector('#replyWriteBtn').style.display = "none";
						}
						
					})
				}
			}) 
			
			document.querySelector('#goBackBtn').addEventListener('click',()=>{
				location.href = "${pageContext.request.contextPath}/boardViewAdmin";
			})
			
				
			 
		}else{
			document.querySelector('#goBackUserBtn').addEventListener('click',()=>{
				location.href = "${pageContext.request.contextPath}/boardView";
			})
		}
		
		
		
	</script>
		
	
</body>
</html>
