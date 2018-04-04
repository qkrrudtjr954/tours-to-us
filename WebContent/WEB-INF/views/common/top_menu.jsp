<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<fmt:requestEncoding value="utf-8" />


<style>
.top-menu-nav {
	background-color: #7DC3BB; 
	
} 
ul {
	display: table;
	margin-left: auto;
	margin-right: auto;
}
.nav-link {
	color: white;
	margin: 0px 15px;
}
a.nav-link:hover{
	color: gray;
}
div.user-action a {
	color: #7DC3BB;
	
}
div.user-action a:hover {
	background-color: #7DC3BB;
	color: white;
	transition: color 1s, background-color 1s;
}

.dropdown-item {
	padding: 5px;
	margin: 9px auto;
}
.dropdown-item a{
	color: #7DC3BB;
	margin: 5px;
}

.user-action ul {
	list-style-type: none;
}
.user-action-item {
	padding: 5px;
	margin: 20px 5px 0px 5px;
	
}

.mypage-link-item{
	width: 200px;
	text-align: center;
}

</style>

<header class="blog-header py-3">
	<div class="row no-gutters">
		<div class="col-md-4">
			<a class="text-muted" href="#"></a>
		</div>
		<div class="col-md-4 text-center">
			<a class="blog-header-logo text-dark" href="main.do"> 
				<img alt="Tours To Us" src="${pageContext.request.contextPath }/image/logo.png" width="250" height="70">
			</a>
		</div>
		<c:choose>
			<c:when test="${current_user == null }">
				<div class="offset-md-1 col-md-2 user-action">
					<ul class="d-flex justify-content-end">	
						<li>
							<a class="user-action-item btn btn-sm" href="signin.do">로그인</a>
						</li>
						<li>
							<a class="user-action-item btn btn-sm" href="signup.do">회원 가입</a>
						</li>
					</ul>	
				</div>
			</c:when>
			<c:otherwise>
				<div class="offset-md-2 col-md-2 user-action">
					<ul class="d-flex justify-content-end">	
						<li>
							<a class="user-action-item btn btn-sm align-bottom" href="signout.do">로그아웃</a>
						</li>
						<li>							
							<a class="user-action-item btn btn-sm" data-toggle="dropdown" href="#">마이페이지</a>
								<ul class="dropdown-menu dropdown-menu-right mypage-link-list">		
									<li>
										<div class="profie-container">
											<img src="${initParam.IMG_SERVER_PATH }/image/${current_user.profile }" alt="" class="img-responsive circle" style="border:2px solid #7DC3BB;border-radius:50%;margin:5px;" width="50px" height="50px">
											<span style="padding:5px;">${current_user.name }</span>님
										</div>
									</li>							
									<li class="dropdown-item btn btn-sm mypage-link-item"><a href="myplan.do" class="nav-link" title="나의플랜보기" >나의 플랜보기</a></li>
									<li class="dropdown-item btn btn-sm mypage-link-item"><a href="mypage.do" class="nav-link" title="회원정보수정">회원정보수정</a></li>
								</ul>				
							</li>
						</ul>
					</div>
				</c:otherwise>
			</c:choose>
		</div>
</header>

<nav class="navbar navbar-expand-lg top-menu-nav" id="nav">
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"  style="color:white;">
	<span data-feather="align-justify"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
		<li class="dropdown">
			<a class="dropdown-toggle nav-link" data-toggle="dropdown" href="#">여행 계획</a>
			<ul class="dropdown-menu">
				<li class="dropdown-item"><a href="planer.do">계획 만들기</a></li>
				<li class="dropdown-item"><a href="myplan.do">계획 보기</a></li>
			</ul>
		</li>
		<li class="dropdown">
         	<a class="dropdown-toggle nav-link" data-toggle="dropdown" href="#">가이드</a>
	         <ul class="dropdown-menu">
				<li class="dropdown-item"><a href="editor_essay.do">투디터 pick</a></li>
				<li class="dropdown-item"><a href="#">투둥이 가이드북</a></li>
				<li class="dropdown-item"><a href="#">투투 가이드북</a></li>
			</ul>
       	</li>
		<li class="dropdown">
         	<a class="dropdown-toggle nav-link" data-toggle="dropdown" href="#">커뮤니티</a>
	         <ul class="dropdown-menu">
				<li class="dropdown-item"><a href="afterBbs.do">여행후기</a></li>
				<li class="dropdown-item"><a href="#">자유게시판</a></li>
				<li class="dropdown-item"><a href="#">Page 1-3</a></li>
			</ul>
       	</li>
		<li class="dropdown">
         	<a class="dropdown-toggle nav-link" data-toggle="dropdown" href="#">호텔</a>
	         <ul class="dropdown-menu">
				<li class="dropdown-item"><a href="hotelPrice.do">airbnb 예약하기</a></li>
			</ul>
       	</li>
		<li class="dropdown">
         	<a class="dropdown-toggle nav-link" data-toggle="dropdown" href="#">이벤트</a>
	         <ul class="dropdown-menu">
				<li class="dropdown-item"><a href="event.do">진행 중 EVENT</a></li>
			</ul>
       	</li>
    </ul>
  </div>
</nav>



