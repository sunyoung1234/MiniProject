<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content />
    <meta name="author" content />
    <title>회원가입</title>
    <!-- Favicon-->
    <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
    <!-- Custom Google font-->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@100;200;300;400;500;600;700;800;900&amp;display=swap" rel="stylesheet" />
    <!-- Bootstrap icons-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css" rel="stylesheet" />
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="css/styles.css" rel="stylesheet" />

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
        
        /* Adjusting form button colors to match theme */
        .btn-primary {
            background-color: #10bd66;
            border-color: #10bd66;
        }

        .btn-primary:hover {
            background-color: #0a994c;
            border-color: #0a994c;
        }
        
        .idBtn{
        	width:150px;
        	height:60px;
        	border-radius: 5px;
        }
        
    </style>
    <script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
</head>
<body class="d-flex flex-column">
    <main class="flex-shrink-0">
        
        <%@ include file="/WEB-INF/inc/top.jsp" %>

        <!-- Page content-->
        <section class="py-5">
            <div class="container px-5">
                <!-- Contact form-->
                <div class="bg-light rounded-4 py-5 px-4 px-md-5">
                    <div class="text-center mb-5">
                        <h1 class="fw-bolder">회원가입</h1>
                        <p class="lead fw-normal text-muted mb-0">Green Solution 회원가입</p>
                    </div>
                    <div class="row gx-5 justify-content-center">
                        <div class="col-lg-8 col-xl-6">
                            <form id="registForm" action="${pageContext.request.contextPath }/registDo" method="POST" enctype="multipart/form-data">
                                <!-- profile input-->
                                <div class="form-floating mb-3">
                                    <div class="d-flex justify-content-center">
                                        <img class="prof-img" id="imgBox" src="${pageContext.request.contextPath }/assets/default-prof.jpg">
                                        <input name="img" class="form-control d-none" id="registProfile" type="file" accept="image/*" />
                                    </div>
                                </div>

                                <!-- id input-->
                                <div class="form-floating mb-3">
                                	<div style="display: flex;">  
	                                    <input name="id" class="form-control" id="registId" type="text" placeholder="아이디" data-sb-validations="required" />
	                                    <button id="idCheck" class="idBtn" type="button">ID 중복체크</button>
                                	</div>
                                	<div class="invalid-feedback" id="checkIdLength">아이디는 4자리 이상</div>
                                	<div class="invalid-feedback" id="idOkay" style="color: green;">사용가능 ID 입니다</div>
                                    <div class="invalid-feedback" data-sb-feedback="registId:required">아이디를 입력해주세요.</div>
                                </div>

                                <!-- pw input-->
                                <div class="form-floating mb-3">
                                    <input name="pw" class="form-control" id="registPw" type="password" placeholder="비밀번호(4자리 이상)" data-sb-validations="required" />
                                    <label for="registPw">비밀번호(4자리 이상)</label>
                                    <div class="invalid-feedback" data-sb-feedback="registPw:required">비밀번호를 입력해주세요.</div>
                                </div>
                                <!-- 비밀번호 확인 -->
                                <div class="form-floating mb-3">
                                    <input class="form-control" id="confirmPw" type="password" placeholder="비밀번호 확인" data-sb-validations="required" />
                                    <label for="confirmPw">비밀번호 확인</label>
                                    <div class="invalid-feedback" id="checkPwFalse" >비밀번호가 일치하지 않습니다.</div>
                                    <div class="invalid-feedback" id="checkPwTrue" style="color: yellowGreen;">비밀번호가 일치합니다.</div>
                                </div>

                                <!-- Email address input-->
                                <div class="form-floating mb-3">
                                    <input name="email" class="form-control" id="registEmail" type="email" placeholder="name@example.com" data-sb-validations="required,email" />
                                    <label for="email">이메일</label>
                                    <div class="invalid-feedback" data-sb-feedback="registEmail:required">이메일을 입력해주세요.</div>
                                    <div class="invalid-feedback" data-sb-feedback="registEmail:email">유효하지 않은 이메일입니다.</div>
                                </div>

                                <!-- Phone number input-->
                                <div class="form-floating mb-3">
                                    <input name="phone" class="form-control" id="registPhone" type="tel" placeholder="(123) 456-7890" data-sb-validations="required" />
                                    <label for="registPhone">휴대폰번호</label>
                                    <div class="invalid-feedback" data-sb-feedback="registPhone:required">휴대폰번호를 입력해주세요</div>
                                </div>

                                <!-- entp input-->
                                <div class="form-floating mb-3">
                                    <input name="entp" class="form-control" id="registEntp" type="text" placeholder="회사명" data-sb-validations="required" />
                                    <label for="registEntp">회사명</label>
                                    <div class="invalid-feedback" data-sb-feedback="registEntp:required">회사명을 입력해주세요.</div>
                                </div>

                                <!-- Submit Button-->
                                <div class="d-grid">
                                    <button class="btn btn-primary btn-lg mb-2 cur-poi" id="submitButton" type="submit">회원가입</button>
                                </div>
                            </form>
                            <div class="d-grid">
                                <button class="btn btn-primary btn-lg" id="backBtn">뒤로가기</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </main>
    <%@ include file="/WEB-INF/inc/footer.jsp"%>
    <!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    <script src="js/scripts.js"></script>
    <script type="text/javascript">
        $("#imgBox").click(function(){
            $("#registProfile").click();
        });

        $("#registProfile").change(function(e){
            var reader = new FileReader();
            reader.onload = function(e){
                $("#imgBox").attr("src", e.target.result);
            };
            reader.readAsDataURL(e.target.files[0]);
        });

        $("#backBtn").click(function(){
            window.history.back();
        });
        
        let idLength = false;
        let idValid = false;
        let checkPw = false;
        
        let v_registForm = document.querySelector('#registForm');
		let v_submitBtn = document.querySelector('#submitButton');
		let v_idCheck = document.querySelector('#idCheck');
		
		let v_id = document.querySelector('#registId');
		let v_pw = document.querySelector('#registPw');
		let v_email = document.querySelector('#registEmail');
		let v_phone = document.querySelector('#registPhone');
		let v_entp = document.querySelector('#registEntp');
		
		let v_confirmPw = document.querySelector('#confirmPw');
		
		
		v_id.addEventListener('input',()=>{
			
			idValid = false;
			document.querySelector('#idOkay').style.display = "none";
			if(v_id.value.length < 4){
				document.querySelector('#checkIdLength').style.display = "block";
				idLength = false;
			}else{
				document.querySelector('#checkIdLength').style.display = "none";
				idLength = true;
			}
		})
		
		v_confirmPw.addEventListener('input',()=>{
			
			if(v_confirmPw.value != v_pw.value){
				document.querySelector('#checkPwTrue').style.display = "none";
				document.querySelector('#checkPwFalse').style.display = "block";
				checkPw = false;
			}else{
				document.querySelector('#checkPwTrue').style.display = "block";
				document.querySelector('#checkPwFalse').style.display = "none";
				checkPw = true;
			}
		})
		
		v_idCheck.addEventListener('click',()=>{
			if(!idLength){
				alert('ID 4자리 이상 입력해주세요');
			}else{
				$.ajax({
					url: '${pageContext.request.contextPath}/idCheck',
					type: 'POST',
					contentType: 'application/json',
					data: JSON.stringify({
						id : v_id.value.trim()
					}), 
					success: function(response){
						
						if(response == 1){
							alert('중복된 아이디가 존재합니다!');
							idValid = false;
							document.querySelector('#idOkay').style.display = "none";
						}else{
							alert('사용가능한 아이디 입니다.')
							idValid = true;
							document.querySelector('#idOkay').style.display = "block";
						}
					}
				})
			}
		})
		
		v_submitBtn.addEventListener('click',()=>{
			if(!idValid){
				alert('ID 중복체크를 해주세요');
				event.preventDefault();
				return;
			}
			
			if(!checkPw){
				alert('비밀번호 확인이 일치하지 않습니다');
				event.preventDefault();
				return;
			}
			
			if(!v_pw.value){
				alert('비밀번호를 입력해주세요');
				event.preventDefault();
				return;
			}
			
			if(!v_email.value){
				alert('이메일을 입력해주세요');
				event.preventDefault();
				return;
			}
			
			if(!v_phone.value){
				alert('전화번호를 입력해주세요');
				event.preventDefault();
				return;
			}
			
			if(!v_entp.value){
				alert('업체명을 입력해주세요');
				event.preventDefault();
				return;
			}
			
			alert('회원가입을 축하드립니다.')
		})
		
		
        
        
    </script>
</body>
</html>
