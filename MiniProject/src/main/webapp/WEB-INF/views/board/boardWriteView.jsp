<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>

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
			align-content: center; 
			position: fixed;
			top: 50%;
			left: 50%;
			transform: translate(-50%, -50%);
		}
		
		.modal-mat-list{
			width: 50%;
			height: 100%;
			overflow: scroll;
		}
		
		.modal-cal-list{
			width: 50%;
			height: 100%;
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
		
		.mat-var-category{
			width: 15%;
			height: 100%;
			display: flex;
			justify-content: center;
			align-content: center;
			top: 5px;
		}
		.mat-var-img{
			width: 20%;
			height: 100%;
		} 
		.mat-var-name{
			width: 40%;
			height: 100%;
			display: flex;
			justify-content: center;
			align-content: center;
		}
		.mat-var-co2{
			width: 20%;
			height: 100%;
			display: flex;
			justify-content: center;
			align-content: center;		
		}
		
		.mat-img{
			width: 100%;
			height: 100%;
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
			</div>
			<div class="material-list">
				<c:forEach items="${keyMatList }" var="mat">
					<div class="mat-var" onclick="toCal(${mat.materialNo})" >
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
		<div class="modal-cal-list">
			<div class="cal-var-img">
				<img alt="cal-img" src="">
			</div>
			<div class=""></div>
		</div>
	</div> 
	
	
	<script type="text/javascript">
		v_modalBtn = document.querySelector('#modalBtn');
		v_modalBtn.addEventListener('click',()=>{
			document.getElementsByClassName('modal-box')[0].style.display = "flex";
		})
		
		v_modalCalList = document.getElementsByClassName('modal-cal-list')[0];
		v_matVar = document.getElementsByClassName('mat-var')
		
		function toCal(i){
			v_modalCalList.innerHTML += v_matVar[i-1].outerHTML;
			v_matVar[i-1].style.display = "none";
		}
		
	</script>
	
</body>


</html>