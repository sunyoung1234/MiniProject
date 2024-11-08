<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<p>지역</p> 
	<p>외벽면적(m²)</p>
	<input id="outsideArea" type="number" value="0" min="0">
	<p>지붕면적(m²)</p>
	<input id="roofArea" type="number" value="0" min="0">
	<p>바닥면적(m²)</p>
	<input id="floorArea" type="number" value="0" min="0">
	<p>창호면적(m²)</p>
	<input id="windowArea" type="number" value="0" min="0">
	<p>유효 실내면적(평)</p>
	<input id="realArea" type="number" value="0" min="0">
	<p>출입문 수</p>
	<input id="doorEA" type="number" value="0" min="0">
	
	<select id="selectMethod">
		<option value="1">목조</option>
		<option value="2">철근/콘크리트</option>
	</select>
	   
	<button id="applyBtn">신청하기</button>
	
	<script type="text/javascript">
		let v_outside = document.querySelector('#outsideArea');
		let v_roof = document.querySelector('#roofArea');
		let v_floor = document.querySelector('#floorArea');
		let v_window = document.querySelector('#windowArea');
		let v_real = document.querySelector('#realArea');
		let v_door = document.querySelector('#doorEA');
		let v_method = document.querySelector('#selectMethod'); 
		 
		let v_outsideValue = v_outside.value;
		let v_roofValue = v_roof.value;
		let v_floorValue = v_floor.value;
		let v_windowValue = v_window.value;
		let v_realValue = v_real.value;
		let v_doorValue = v_door.value;
		let v_methodValue = v_method.value;
		
		v_method.addEventListener('change',()=>{
			console.log(v_methodValue);    
		})
		
		v_applyBtn = document.querySelector('#applyBtn');
		
		v_applyBtn.addEventListener('click',()=>{
			
			console.log(v_floorValue);
			
			if(v_methodValue == 1){
				let method = [0.174, 0.15, 0.096, 0.88, 1];
			}else if(v_methodValue == 2){
				let method = [0.154, 0.119, 0.095, 0.88, 1];
			}
			
			
			// 난방 열 손실 합계  passive  => 목조 (지붕 0.150 외벽 0.174 바닥 지면 0.096 창호 0.88 출입문 1) 철근콘크리트(지붕 0.119 외벽 0.154 바닥 0.095 창호 0.88 출입문 1)
			
			
			
			
		})
		
	</script>
	
</body>
</html>