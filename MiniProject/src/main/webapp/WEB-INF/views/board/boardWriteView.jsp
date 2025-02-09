<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>견적서 작성</title>
<script src="https://code.jquery.com/jquery-3.7.1.js"
	integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
	crossorigin="anonymous"></script>

<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="css/styles.css" rel="stylesheet" />	


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
    justify-content: space-between;
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

.modal-mat-list {
	padding-top:20px;
	padding-left:20px;
	width:700px;
    height: 800px; /* Adjust height to accommodate buttons */
    overflow-y: auto; /* Enable vertical scroll */
}

.modal-cal {
	padding-top:20px;
	padding-left:20px;
	padding-right:20px;
	width:650px;
    height: 800px; /* Adjust height to accommodate buttons */
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

.cal-var{
	width:550px;
	padding: 10px;
    margin-right:20px;
    margin-bottom: 10px;
    display: flex;
    align-items: center;
    background-color: #f0f0f0;
    border-radius: 5px;
} 


.cal-var-input {
    margin-bottom: 10px;
    display: flex;
    justify-content:center;
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

.category-select{
	margin-bottom: 10px;
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

.delete-btn{
	margin-left:auto;
}





.write-overview {
    display: flex;
    width: 1200px;
    height: 30px;
    border-bottom: 1px solid black;
}

.overview-top{
	padding-top:30px;
	margin-bottom: 50px;
	margin-left: auto;
	text-align: center;
	font-weight: bold;
	font-size: 40px;
	
}

.write-container {
    width: 1200px;
	margin: auto;
    margin-top:20px;
    
    border: 1px solid #ddd;
    border-radius: 8px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
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
    height: 100px;
    margin-top: 40px;
}

.write-content {
    display: flex;
    justify-content: center;
    align-items: center;
    width: 33%;
    height: 100px;
}

.write-content-input {
    width: 300px;
    height: 200px;
    padding-right: 20px;
}

.write-click-btn {
	margin-top:50px;
    margin-left:1470px;
}

.ex-box {
    display: flex;
    width: calc(100% / 5 - 10px);
    height: 50px;
}

.table-container{
	margin-top: 70px;
	padding-left: 180px;
	padding-bottom: 200px;
}

.material-box{
	margin-bottom: 20px;
	margin-top: 50px;
	font-weight: bold;
	display: flex;

}

.table-head{
	border-bottom: 1px solid black;
	text-align: center;
	text-size:15px;
}



.table-text{
	text-align: center;
	padding-bottom: 20px;
}

.material-title{
	width:150px;
}

.material-btn-box{
	margin-left: 790px;
	width:200px;
	
}

.material-btn{
	background-color:#10bd66;
}

.sum-gas{
	margin-left: 950px;
	margin-bottom: 20px;
}

.text-margin{
  border-bottom: 5px solid #fff;
}



</style>

</head>
<body>


	<%@ include file="/WEB-INF/inc/top.jsp"%>
	
	<div class="write-container">
		<div class="overview-top">견 적 서</div>
		<div class="write-overview">
			<div class="application">
				신청인
			</div>
			
			<div class="application1">
				<div class="apllication-top">업체명</div>
				<div>${sessionScope.login.getEntpName() }</div>
			</div>
			
			<div class="application1" id="currentDate">
				<div class="apllication-top">의뢰일자</div>
			</div>
		</div>
		
		<div class="write-title-box">
			<div class="write-title">제 목</div>
			<div class="write-title-input">
				<input style="width:100%" id="boardTitle" type="text">
			</div>
		</div>
		
		<div class="write-content-box">
			<div class="write-content">내 용</div>
			<div class="write-content-input">
				<textarea id="boardContent" rows="5" cols="93"></textarea>
			</div>
		</div>
		
		<div class="table-container">
			<div class="material-box">
				<div class="material-title">건축 자재</div>
				<div class="material-btn-box">
					<button class="material-btn" id="modalBtn">자재 등록</button>
				</div>
				
			</div>
			
			<table class="table-box">
				<colgroup>
                		<col width="100">
                 		<col width="240">
                 		<col width="500">
                 		<col width="140">
	            </colgroup>
			
				<thead class="table-head">
					<tr>
						<th>번호</th>
						<th>분류</th>
						<th>자재명</th>
						<th>kg</th>
					</tr>
				</thead>
				<tbody class="table-text" id="tableText">
					
				</tbody>
			</table>
		</div>
		
		<div id="overlay"></div>
		
		<div class="sum-gas" id ="sumGas">총 탄소 배출량 : 0</div>
	</div>
	
	<div class="write-click-btn mb-3">
		<button id="boardWriteBtn">글 등록</button>
	</div>

	
	


	<div class="modal-box">
		<div class="modal-mat-list">
			<div class="category-select">
				<select id="categorySelect">
					<option value="all" selected>분류
					<option value="wood">목재
					<option value="metal">금속
					<option value="plastic">플라스틱
					<option value="mineral">광물
					<option value="etc">기타
				</select>
			</div>
			<div class="material-list">
				<c:forEach items="${keyMatList }" var="mat">
					<div class="mat-var">
						<div class="mat-no" style="display: none;">${mat.materialNo }</div>
						<div class="mat-var-category">${mat.materialCategory}</div>
						<div class="mat-var-img">
							<img class="mat-img" src="${mat.materialImg }">
						</div>
						<div class="mat-var-name">${mat.materialName}</div>
						<div class="mat-var-co2">${mat.gasKg}</div>
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
	
	<%@ include file="/WEB-INF/inc/footer.jsp"%>



	<script type="text/javascript">  
	
	    date = new Date();
	    year = date.getFullYear();
	    month = date.getMonth() + 1;
	    day = date.getDate();
	    document.getElementById("currentDate").innerHTML +=  year + "/" +  month  +   "/" + day  ;
		
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
		
	// select - option 체크하기	
		function checkValue() {
        	let selectedCategory = document.getElementById('categorySelect').value;
        	let v_materials = document.querySelectorAll('.mat-var');

       	 v_materials.forEach(mat => {
	            let category = mat.querySelector('.mat-var-category').innerHTML.trim();
	            if (selectedCategory === 'all' || selectedCategory === category){
	                mat.style.display = 'flex'; 
	            } else {
	                mat.style.display = 'none'; 
	            }
	        });
	    }

	    document.getElementById('categorySelect').addEventListener('change', checkValue);
	    
	    
	    
	// mat-var 클릭이벤트 주기
		let v_img = document.querySelectorAll('.mat-img');
		let v_name = document.querySelectorAll('.mat-var-name');
		let v_co2 = document.querySelectorAll('.mat-var-co2');
		
		let v_matVar = document.querySelectorAll('.mat-var');
		
		let v_resultCal = document.querySelector('#resultCal');
		
		let total = 0;
		
		let matBtnList = [];
		
		// 목록에서 자재 누르면 계산기에 뜨고  기능 구현
		v_matVar.forEach(mat => {
			
			let i = parseInt(mat.querySelector('.mat-no').innerHTML.trim());
			
			let v_alpha = '<div class="cal-var"><div class="cal-var-img"><img class="cal-img" src="'+ v_img[i-1].src +'"></div><div class="cal-var-name">'
			v_alpha += v_name[i-1].innerHTML + '</div><div id="hiddenMatNo" style="display: none;">'+ i + '</div><div class="cal-var-co2">'
			v_alpha += v_co2[i-1].innerHTML + '</div><div class="cal-var-input"><input defaultValue="0" class="input-EA" type="number" value="0" max="99999" name="cal" pattern="[0-9]" >'
			v_alpha += '</div><button class="delete-btn" id="deleteDiv"  type="button">X</button></div>'
			
			mat.addEventListener('click',()=>{
				matBtnList.push(mat);
				console.log(matBtnList);
				document.querySelector('.modal-cal-list').innerHTML += v_alpha;
				mat.style.display = 'none';
				
				
				// input 내용 바뀔때마다 계산
				let v_inputEA = document.querySelectorAll('.input-EA');
				
				v_inputEA.forEach(v_ea =>{
					
					let v_co2 = parseFloat(v_ea.parentElement.parentElement.children[3].innerHTML); // co2/kg
					
					let previousValue = 0;
					
					v_ea.addEventListener('input',()=>{
						
						previousValue = v_ea.defaultValue * v_co2;
						v_ea.defaultValue = v_ea.value;
						
						  
						total -= previousValue;
						total += v_ea.value * v_co2;
						 
						v_resultCal.innerHTML = total.toFixed(2) + "  CO₂/kg";  
						
					})
				})
				
				// 계산기에서 지우기 X 버튼
				let v_delete = document.querySelectorAll('.delete-btn');
				let v_inHTML = document.querySelector('.modal-cal-list').innerHTML;
				
				v_delete.forEach((delBtn,idx) =>{
					
					delBtn.addEventListener('click',()=>{
						
						// div 지우고 
						// v_innerHTML 이 새로생기면 mat 클릭이벤트를 다시줘야해서 오류뜸
						
						/* let v_del = delBtn.parentElement.outerHTML;
						
						let firstIndex = v_inHTML.indexOf(v_del);
						let lastIndex = firstIndex + v_del.length - 1;
						
						// 고친거
						let v_fixHTML = v_inHTML.substring(0,firstIndex) + v_inHTML.substring(lastIndex+1)
						
						document.querySelector('.modal-cal-list').innerHTML = v_fixHTML; */ 
						
						let v_input = delBtn.parentElement.children[4].children[0];
						v_input.value = 0;
						v_input.dispatchEvent(new Event('input'))
						
						
						let v_delDiv = delBtn.parentElement;
						v_delDiv.style.display = "none"; 
						matBtnList[idx].style.display = "flex";   
					})
				})
				
				
			})
		})
		
		let v_sumGas = document.getElementById("sumGas")
		
		
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
				let v_tableText = document.getElementById("tableText")
				
				if(eaList.length == 0){
					v_exBox.innerHTML = "아직 계산 내용 X"
					document.getElementsByClassName('modal-box')[0].style.display = "none";
					return;
				}
				
				
				let strNoList = noList.join(',');
				let strEaList = eaList.join(',');
				let v_alpha2 = "";
				let v_count = 1
				
				
				$.ajax({
				    url: '${pageContext.request.contextPath}/registCal', 
				    type: 'POST',
				    contentType: 'application/json',
				    data: JSON.stringify({
				        no: strNoList,
				        ea: strEaList
				    }), 
				    success: function(response) { 
				    	
				    	let v_map = {wood:'목재', plastic:'플라스틱', metal:'금속', mineral:'광물', etc:'기타'}
				    	
						for(let i=0; i<response['registList'].length; i++){
							
				    		v_alpha2 += '<tr class="text-margin"><th>'+ v_count + '</th>'
					    	v_alpha2 += '<td>'+ v_map[response.registList[i].materialCategory] +'</td>'
					    	v_alpha2 += '<td>'+  response.registList[i].materialName  +'</td>'
					    	v_alpha2 += '<td>' + eaList[i] +'</td></tr>' 
					    	v_count += 1
				    	}
				    	
				    	v_tableText.innerHTML = v_alpha2;
				    	
				    	scId = response['scId']; 
				    	
				    	v_sumGas.innerHTML = "총 탄소 배출량 : " + Math.round(total,2) + " CO₂/kg"
				    	
				    }
				    
				}); 
				 
			}
			
		})
		
		// 글 등록 버튼  
		let v_writeBtn = document.querySelector('#boardWriteBtn');
		let v_boardTitle = document.querySelector('#boardTitle');
		let v_boardContent = document.querySelector('#boardContent');
		
		v_writeBtn.addEventListener('click',()=>{
			
			if(!v_boardTitle.value.trim() ){
				alert('글 제목을 입력하세요');
				return;
			}else if(!v_boardContent.value.trim()){
				alert('글 내용을 입력하세요');
				return;
			}else if(scId == ""){
				alert('견적요청 내용을 입력해주세요');
			}else{
				let v_title = v_boardTitle.value;
				let v_content = v_boardContent.value;
				
				$.ajax({
					url: '${pageContext.request.contextPath}/boardWriteDo',
					type: 'POST',
					contentType: 'application/json',
					data: JSON.stringify({ 
							id: scId,
							title: v_title,
							content: v_content
						}),
					success: function(resp){
						location.href = '${pageContext.request.contextPath}/boardView';
					}
				})
			}
			
		})
		
		
			
			    	
	</script>

</body>


</html>