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
		}
	</style>
	
</head>

<body>
	<button id="modalBtn">모달</button> 
	
	<div class="modal-box">
		<div class="modal-mat-list">
			<input type="text" placeholder="제품명 입력">
			<button id="searchBtn"> 검색 </button>
			<c:forEach items="${keyMatList }" var="mat">
				<p> ${mat.materialName}</p>
				<p> ${mat.materialNo}</p>
			</c:forEach>
		</div>
		<div class="modal-cal-list"></div>
	</div> 
	
	
	<script type="text/javascript">
		v_modalBtn = document.querySelector('#modalBtn');
		v_modalBtn.addEventListener('click',()=>{
			document.getElementsByClassName('modal-box')[0].style.display = "flex";
		})
		
	</script>
	
</body>


</html>