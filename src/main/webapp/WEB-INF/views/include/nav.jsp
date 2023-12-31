<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="utf-8">

<head>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Favicon -->
    <link href="img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600&family=Inter:wght@700;800&display=swap" rel="stylesheet">
    
    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="lib/animate/animate.min.css" rel="stylesheet">
    <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="css/style.css" rel="stylesheet">
</head>

<body>
    <div class="container-xxl bg-white p-0">
        <!-- Spinner Start -->
        <div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
            <div class="spinner-border text-primary" style="width: 3rem; height: 3rem;" role="status">
                <span class="sr-only">Loading...</span>
            </div>
        </div>
        <!-- Spinner End -->


        <!-- Navbar Start -->
            <nav class="navbar navbar-expand-lg navbar-light py-0 px-4" style="z_index: 900;">
                <a href="/" class="navbar-brand d-flex align-items-center text-center">
                    <div class="p-2">
                        <img class="img-fluid" src="img/kidzpark.png" alt="Icon" style="width: 40px; height: 40px; margin-right:10px;">
                    </div>
                    <h1 class="m-0 text-primary">Kidzpark</h1>
                </a>
                <button type="button" class="navbar-toggler" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarCollapse">
                    <div class="navbar-nav ms-auto">
                        <a href="/" class="nav-item nav-link active">Home</a>
                        <a href="/Kidzzone" class="nav-item nav-link">YES 키즈존</a>
                        <a href="/UserNoticeList?m_no=99" class="nav-item nav-link">공지사항</a>
                        <div class="nav-item dropdown">
                            <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">게시판 목록</a>
                            <div class="dropdown-menu rounded-0 m-0">
                                <a href="/BoardList?m_no=1" class="dropdown-item">자유</a>
                                <a href="/BoardList?m_no=2" class="dropdown-item">건강</a>
                                <a href="/BoardList?m_no=3" class="dropdown-item">요리</a>
                                <a href="/BoardList?m_no=4" class="dropdown-item">육아</a>
                                <a href="/BoardList?m_no=5" class="dropdown-item">교육</a>
                            </div>
                        </div>
                         <a href="/room" class="nav-item nav-link" onclick="showLoginAlert(event)">채팅</a>
					<c:if test="${loginVo eq null }">
						<script>
							function showLoginAlert(event) {
								alert("로그인이 필요합니다!");
								event.preventDefault();
							}
						</script>
						<a href="/UserCsList?u_no=${loginVo.u_no }"
							class="nav-item nav-link" onclick="showLoginAlert(event)">고객센터</a>
					</c:if>
					<c:if test="${loginVo ne null and loginVo.u_no ne 99 }">
						<a href="/UserCsList?u_no=${loginVo.u_no }"
							class="nav-item nav-link">고객센터</a>
					</c:if>
					<c:if test="${loginVo.u_no eq 99 }">
						<a href="/CsList"
							class="nav-item nav-link">고객센터</a>
					</c:if>
                    </div>
                    <c:choose>
                    <c:when test="${loginVo eq null}">
                    	<li style="list-style-type: none"><a href="/LoginForm" class="btn btn-primary px-3 d-none d-lg-flex">로그인</a></li>
                    </c:when>
                    <c:when test="${loginVo ne null and loginVo.u_no ne 99}">
						<li style="list-style-type: none">
							<b> ${loginVo.u_nickname} 님 환영합니다 </b>
						</li>
						<li style="list-style-type: none" class="nav-item">
						  <img src="img/${loginVo.u_profileimg}" style="max-width: 80px; max-height: 80px; margin-right:10px;" class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false" >
							<ul class="dropdown-menu">
								<li><a class="dropdown-item" href="/UserInfo?u_id=${loginVo.u_id}">내정보 확인/수정</a></li>
								<li><a class="dropdown-item" href="/MyArticles?m_no=1&u_no=${loginVo.u_no}">내가 쓴 글</a></li>
                                <li><a class="dropdown-item" href="/UserLikeList?u_no=${loginVo.u_no }">내 관심매장</a></li>
								<li><hr class="dropdown-divider"></li>
								<li><a class="dropdown-item" href="/LogOut">로그 아웃</a></li>
							</ul>
						</li>
					</c:when>
					
					 <c:when test="${loginVo.u_no eq 99}">
					 	<li style="list-style-type: none">
							<b> ${loginVo.u_nickname} 님 환영합니다 </b>
						</li>
						<li style="list-style-type: none" class="nav-item">					
						 <img src="/img/logon.png" class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"">
							<ul class="dropdown-menu">
								<li><a class="dropdown-item" href="/KzList">Yes 키즈존 관리</a></li>
								<li><a class="dropdown-item" href="/NoticeList?m_no=99">게시판 관리 / 공지사항 관리</a></li>
								<li><a class="dropdown-item" href="/CsList">고객센터</a></li>
								<li><a class="dropdown-item" href="/AdminUserList">유저목록</a></li>
								<li><hr class="dropdown-divider"></li>
								<li><a class="dropdown-item" href="/LogOut">로그 아웃</a></li>
							</ul>
						</li>
					</c:when>
					
				</c:choose>
			</div>
            </nav>
        <!-- Navbar End -->

        <!-- Back to Top -->
        <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
    </div>

    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="lib/wow/wow.min.js"></script>
    <script src="lib/easing/easing.min.js"></script>
    <script src="lib/waypoints/waypoints.min.js"></script>
    <script src="lib/owlcarousel/owl.carousel.min.js"></script>

    <!-- Template Javascript -->
    <script src="js/main.js"></script>
</body>

</html>