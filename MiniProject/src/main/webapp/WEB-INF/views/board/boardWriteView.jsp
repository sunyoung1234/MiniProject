<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
	<style type="text/css">   
		*{
			border: 1px solid black;
		}
		
		.body{
			width:100%;
			height:100vh;
		}
		
		.modal-box{  
			z-index: 100;
			width: 1400px;
			height: 800px; 
			display: none;
			justify-content: center;
			align-items: center;  
			position: fixed;
			top: 50%;
			left: 50%;
			transform: translate(-50%, -50%);
		}
		
		.modal-cal{
			width: 50%;
			height: 100%;
		}
		
		.modal-mat-list{
			width: 50%;
			height: 100%;
			overflow: scroll;
		}
		
		.modal-cal-list{
			width: 100%;
			height: 77%;
			overflow-y: scroll;
		}
		
		.material-list{
			width: 100%;
			height: 90%;
			overflow-y: scroll;
		}
		
		.mat-var{
			width: 100%;
			height: 10%;
			display: flex;
		}
		
		.cal-var{
			width: 100%;
			height: 10%;
			display: flex;
		}
		
		.mat-var-category{
			width: 15%;
			height: 100%;
			display: flex;
			justify-content: center;
			align-items: center;
			top: 5px;
		}
		.mat-var-img{
			width: 20%;
			height: 100%;
		}
		.cal-var-img{
			width: 20%;
			height: 100%;		
		}
		
		.mat-var-name{
			width: 40%;
			height: 100%;
			display: flex;
			justify-content: center;
			align-items: center;
		}
		
		.cal-var-name{
			width: 40%;
			height: 100%;
			display: flex;
			justify-content: center;
			align-items: center;		
		}
		
		.mat-var-co2{
			width: 20%;
			height: 100%;
			display: flex;
			justify-content: center;
			align-items: center;		
		}
		
		.cal-var-co2{
			width: 20%;
			height: 100%;
			display: flex;
			justify-content: center;
			align-items: center;		
		}
		
		.mat-img{
			width: 100%;
			height: 100%;
		}
		
		.cal-img{
			width: 100%;
			height: 100%;		
		}
		
		.cal-var-input{
			width: 20%;
			height: 100%;
			display: flex;
			justify-content: center;
			align-items: center;
		}
		
		/* Chrome, Safari, Edge, Opera */
		input::-webkit-outer-spin-button,
		input::-webkit-inner-spin-button {
		  -webkit-appearance: none;
		  margin: 0;
		}
		
		/* Firefox  */
		input[type='number'] {
		  -moz-appearance: textfield;
		} 
		.input-EA{
			width: 70%;
			height: 70%;
			font-size: 17px;
		}
		
		#resultCal{
			width: 100%;
			height: 10%;
			display: flex;
			justify-content: flex-end;
			align-items: center;
			color: blue;
			font-size: 20px;
			font-weight: bold;
		}
		
		#btnBox{
			width: 100%;
			height: 10%;
		}
	</style>
	
</head>

<body>
	<button id="modalBtn">모달</button> 
	
	<div class="modal-box"> 
		<div class="modal-mat-list">
			<div>
				<input type="text" placeholder="제품명 입력">
				<button id="searchBtn"> 검색 </button>
				<select id="categorySelect">
					<option value="all" selected> 분류
					<option value="wood"> 목재
					<option value="metal"> 금속
					<option value="plastic"> 플라스틱
					<option value="mineral"> 광물
					<option value="etc"> 기타
				</select>
			</div>
			<div class="material-list">
				<c:forEach items="${keyMatList }" var="mat">
					<div class="mat-var" > 
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
			 <form action="${pageContex.request.contextPath }/registCal">
				<div class="modal-cal-list"></div>
				<div id="resultCal"> 0 </div>
				<div id="btnBox">
					<button id="closeCal" type="button">닫기</button>
					<button id="registCal" type="button">등록</button>
				</div>
			</form>
		</div> 
		
	</div> 
	
	
	<script type="text/javascript"> 
		
	// 모달 띄우기 버튼
		let v_modalBtn = document.querySelector('#modalBtn');
		v_modalBtn.addEventListener('click',()=>{
			document.getElementsByClassName('modal-box')[0].style.display = "flex";
		})
		
	// select - option 체크하기	
		function checkValue() {
        	let selectedCategory = document.getElementById('categorySelect').value;
        	let v_materials = document.querySelectorAll('.mat-var');

       	 v_materials.forEach(mat => {
	            let category = mat.querySelector('.mat-var-category').innerHTML.trim();
	            if (selectedCategory === 'all' || category === selectedCategory){
	                mat.style.display = 'flex'; 
	            } else {
	                mat.style.display = 'none'; 
	            }
	        });
	    }

	    document.getElementById('categorySelect').addEventListener('change', checkValue);
	    
	    checkValue();
	    
	// mat-var 클릭이벤트 주기
		let v_img = document.querySelectorAll('.mat-img');
		let v_name = document.querySelectorAll('.mat-var-name');
		let v_co2 = document.querySelectorAll('.mat-var-co2');
		
		let v_matVar = document.querySelectorAll('.mat-var');
		
		v_matVar.forEach(mat => {
			
			let i = parseInt(mat.querySelector('.mat-no').innerHTML.trim());
			
			let v_alpha = '<div class="cal-var"><div class="cal-var-img"><img class="cal-img" src="'+ v_img[i-1].src +'"></div><div class="cal-var-name">'
			v_alpha += v_name[i-1].innerHTML + '</div><div id="hiddenMatNo" style="display: none;">'+ i + '</div><div class="cal-var-co2">'
			v_alpha += v_co2[i-1].innerHTML + '</div><div class="cal-var-input"><input defaultValue="0" class="input-EA" type="number" value="0" max="99999" name="cal" pattern="[0-9]" >'
			v_alpha += '<input style="display: none;">' + '</div><button id="deleteDiv"  type="button">X</button></div>'
			
			mat.addEventListener('click',()=>{
				document.querySelector('.modal-cal-list').innerHTML += v_alpha;
				mat.style.display = 'none';
			})
		})
		
	// 리스트 controller로 보내기
		v_registBtn = document.querySelector('#registCal')
		v_registBtn.addEventListener('click',()=>{
			let noList = [];
			let eaList = [];
			
			v_calVar = document.querySelectorAll('.cal-var');
			
			v_calVar.forEach(cv =>{
				v_no = cv.querySelector('#hiddenMatNo').innerHTML.trim();
				v_ea = cv.querySelector('.input-EA').value;
				
				noList.push(v_no);
				eaList.push(v_ea);
			})
			
			console.log(noList, eaList);
			
			$.ajax({
			    url: '${pageContext.request.contextPath}/registCal',
			    type: 'POST',
			    contentType: 'application/json',
			    data: JSON.stringify({
			        list1: noList,
			        list2: eaList
			    }),
			    success: function(response) {
			    	console.log(response);
			    }
			    
			});
		});
			
			    	
	</script>
	
</body>


</html>