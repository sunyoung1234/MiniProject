<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content />
        <meta name="author" content />
        <title>Modern Business - Start Bootstrap Template</title>
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
         .cur-poi{
         	cursor: pointer;
         }
         .prof-img{
         	height: 200px;
         	width: 200px;
         	border-radius: 150px;
         	cursor: pointer;
         }
        </style>
        <script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
    </head>
    <body class="d-flex flex-column">
        <main class="flex-shrink-0">
            <!-- Navigation-->
            <nav class="navbar navbar-expand-lg navbar-light bg-white py-3">
                <div class="container px-5">
                    <a class="navbar-brand" href="index.html"><span class="fw-bolder text-primary">Start Bootstrap</span></a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="navbar-nav ms-auto mb-2 mb-lg-0 small fw-bolder">
                            <li class="nav-item"><a class="nav-link" href="index.html">Home</a></li>
                            <li class="nav-item"><a class="nav-link" href="resume.html">Resume</a></li>
                            <li class="nav-item"><a class="nav-link" href="projects.html">Projects</a></li>
                            <li class="nav-item"><a class="nav-link" href="contact.html">Contact</a></li>
                        </ul>
                    </div>
                </div>
            </nav>
            <!-- Page content-->
            <section class="py-5">
                <div class="container px-5">
                    <!-- Contact form-->
                    <div class="bg-light rounded-4 py-5 px-4 px-md-5">
                        <div class="text-center mb-5">
                            <div class="feature bg-primary bg-gradient-primary-to-secondary text-white rounded-3 mb-3"><i class="bi bi-envelope"></i></div>
                            <h1 class="fw-bolder">회원가입</h1>
                            <p class="lead fw-normal text-muted mb-0">Green Solution 회원가입!</p> 
                        </div>
                        <div class="row gx-5 justify-content-center">
                            <div class="col-lg-8 col-xl-6">
                                <!-- * * * * * * * * * * * * * * *-->
                                <!-- * * SB Forms Contact Form * *-->
                                <!-- * * * * * * * * * * * * * * *-->
                                <!-- This form is pre-integrated with SB Forms.-->
                                <!-- To make this form functional, sign up at-->
                                <!-- https://startbootstrap.com/solution/contact-forms-->
                                <!-- to get an API token!-->
                                <form id="contactForm" data-sb-form-api-token="API_TOKEN">
                                
                                	<!-- profile input-->
                                    <div class="form-floating mb-3">
                                    	<div class="d-flex justify-content-center">
                                    		<img class="prof-img" id="imgBox" src="${pageContext.request.contextPath }/assets/default-prof.jpg">
	                                        <input class="d-none" id="registProfile" type="file" accept="image/*" onchange = "readImg(this);" />
                                    	</div>
                                    </div> 
                                
                                
                                    <!-- id input-->
                                    <div class="form-floating mb-3">
                                        <input class="form-control" id="registId" type="text" placeholder="아이디" data-sb-validations="required" />
                                        <label for="registId">아이디</label>
                                        <div class="invalid-feedback" data-sb-feedback="registId:required">아이디를 입력해주세요.</div>
                                    </div>
                                    <!-- pw input--> 
                                    <div class="form-floating mb-3">
                                        <input class="form-control" id="registPw" type="password" placeholder="비밀번호(4자리 이상)" data-sb-validations="required" />
                                        <label for="registPw">비밀번호(4자리 이상)</label>
                                        <div class="invalid-feedback" data-sb-feedback="registPw:required">비밀번호를 입력해주세요.</div>
                                    </div>
                                    <!-- Email address input-->
                                    <div class="form-floating mb-3">
                                        <input class="form-control" id="registEmail" type="email" placeholder="name@example.com" data-sb-validations="required,email" />
                                        <label for="email">이메일</label>
                                        <div class="invalid-feedback" data-sb-feedback="registEmail:required">이메일을 입력해주세요.</div>
                                        <div class="invalid-feedback" data-sb-feedback="registEmail:email">유효하지 않은 이메일입니다.</div>
                                    </div>
                                    <!-- Phone number input-->
                                    <div class="form-floating mb-3">
                                        <input class="form-control" id="registPhone" type="tel" placeholder="(123) 456-7890" data-sb-validations="required" />
                                        <label for="registPhone">휴대폰번호</label> 
                                        <div class="invalid-feedback" data-sb-feedback="registPhone:required">휴대폰번호를 입력해주세요</div>
                                    </div>
                                    <!-- entp input-->
                                    <div class="form-floating mb-3">
                                        <input class="form-control" id="registEntp" type="text" placeholder="회사명" data-sb-validations="required" />
                                        <label for="registEntp">회사명</label>
                                        <div class="invalid-feedback" data-sb-feedback="registEntp:required">회사명을 입력해주세요.</div>
                                    </div>
                                     
                                    <!-- Submit Button-->
                                    <div class="d-grid"><button class="btn btn-primary btn-lg mb-2 cur-poi" id="submitButton" type="submit">회원가입</button></div>
                                    <div class="d-grid"><button class="btn btn-primary btn-lg " id="backBtn">뒤로가기</button></div> 
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </main>
        <!-- Footer-->
        <footer class="bg-white py-4 mt-auto">
            <div class="container px-5">
                <div class="row align-items-center justify-content-between flex-column flex-sm-row">
                    <div class="col-auto"><div class="small m-0">Copyright &copy; Your Website 2023</div></div>
                    <div class="col-auto">
                        <a class="small" href="#!">Privacy</a>
                        <span class="mx-1">&middot;</span>
                        <a class="small" href="#!">Terms</a>
                        <span class="mx-1">&middot;</span>
                        <a class="small" href="#!">Contact</a>
                    </div>
                </div>
            </div>
        </footer>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
        <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
        <!-- * *                               SB Forms JS                               * *-->
        <!-- * * Activate your form at https://startbootstrap.com/solution/contact-forms * *-->
        <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
        <script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
        
        <script type="text/javascript">
        	document.querySelector('#backBtn').addEventListener('click',()=>{
        		event.preventDefault();
        		location.href="${pageContext.request.contextPath}/loginView";
        	})
        	
        	document.querySelector('.prof-img').addEventListener('click',()=>{
        		document.querySelector('#registProfile').click();
        	})
	        
        	function readImg(p_this){
        		let v_file = p_this.files[0];
        		
        		let v_formData = new FormData();
        		v_formData.append('file', v_file);
				let v_url = "${pageContext.request.contextPath}/uploadProfile"
				
				$.ajax({
					type: 'POST',
					url: v_url,
					data: v_formData,
					contentType: false,
					processData: false,
					success: function(data){
						console.log(data)
					}
				});
				
        	} 
        
        </script>
    </body>
</html>

