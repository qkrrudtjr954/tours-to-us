<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<fmt:requestEncoding value="utf-8" />

<%-- <div class="collapse bg-dark" id="navbarHeader">
	<div class="container">
		<div class="row">
			<div class="col-sm-8 col-md-7 py-4">
				<h4 class="text-white">About</h4>
				<p class="text-muted">
					Add some information about the album
					below, the author, or any other background context. Make it a few
					sentences long so folks can pick up some informative tidbits. Then,
					link them off to some social networking sites or contact
					information.
				</p>
			</div>
			<div class="col-sm-4 offset-md-1 py-4">
				<h4 class="text-white">Contact</h4>
				<ul class="list-unstyled">
					<li><a href="#" class="text-white">Follow on Twitter</a></li>
					<li><a href="#" class="text-white">Like on Facebook</a></li>
					<li><a href="#" class="text-white">Email me</a></li>
				</ul>
			</div>
		</div>
	</div>
</div>
<div class="navbar navbar-dark bg-dark box-shadow">
	<div class="container d-flex justify-content-between">
		<a href="#" class="navbar-brand d-flex align-items-center"> 
			<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="mr-2">
				<path d="M23 19a2 2 0 0 1-2 2H3a2 2 0 0 1-2-2V8a2 2 0 0 1 2-2h4l2-3h6l2 3h4a2 2 0 0 1 2 2z"></path>
				<circle cx="12" cy="13" r="4"></circle>
			</svg>
			<strong>Album</strong>
		</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarHeader" aria-controls="navbarHeader" aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
	</div>
</div> --%>

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
	
	.myInfo li {
    position: relative;
    float: left;
    display: inline-block;
    padding: 0 9px;
    background: url(//img.tourtips.com/images/cm/bg_myInfo.gif) left center no-repeat;
}

.myInfo .selectMypage ul li {
    float: none;
    display: block;
    width: 100%;
    height: 30px;
    padding: 0;
    margin: 0;
    clear: both;
}	

.myInfo .selectMypage {
    display: none;
    z-index: 100;
    position: absolute;
    top: 30px;
    left: 0;
    right:: 20px;
    width: 180px;
    height: 100px;
    background: #FFF;
    border: 1px solid #898989;
}
.navi { margin: 0; padding: 0; }
.navi li {
  float: left;
  list-style:none;
  position: relative;
	color: #7DC3BB;
}

.navi a {
  color: #7DC3BB;
  display: block;
  padding: 10px 20px;
  text-decoration: none;
}
.navi ul {
  background: #fff;
  border: 1px solid silver;
  display: none;
  padding: 0;
  position: absolute;
  left: 0;
  top: 100%;
  width: 170px;
  height: 180px;
}
.navi ul li { float: none; }
.navi ul li:hover { background: #fff; }
.navi ul li:hover a { color: #fff; }
.navi ul a { color: #7DC3BB; }
.navi ul ul { left: 100%; top: 0; }

.profilePhoto {
    position: absolute;
    top: 0;
    left: 0;
    right: 30px;
    width: 34px;
    height: 34px;
    overflow: hidden;
}
.profilePhoto .cover {
    z-index: 2;
    position: absolute;
    top: 0;
    left: 0;
    display: block;
    width: 34px;
    height: 34px;
    background: url(//img.tourtips.com/images/cm/bg_profilePhoto.png);
}
</style>

<header class="blog-header py-3">
	<div class="row flex-nowrap justify-content-between align-items-center">
		<div class="col-4 pt-1">
			<a class="text-muted" href="#"></a>
		</div>
		<div class="offset-col-4 col-4 text-center">
			<a class="blog-header-logo text-dark" href="#"> 
				<img alt="Tours To Us" src="${pageContext.request.contextPath }/image/logo.png" width="250" height="70">
			</a>
		</div>
		<c:choose>
			<c:when test="${current_user == null }">
			<div class="col-4 d-flex justify-content-end align-items-center user-action">
				
					<ul class="navi">
					<li><a class="btn btn-sm" href="signin.do">로그인</a></li>
					<li><a class="btn btn-sm" href="signup.do">회원 가입</a></li>
					</ul>	
					
			</div>
			</c:when>
			<c:otherwise>
				<div class="col-4 d-flex justify-content-end align-items-center user-action">
					<!-- <a class="btn btn-sm" href="signout.do">로그아웃</a>
					<a class="btn btn-sm" href="mypage.do">마이페이지</a>	 -->
						<%-- <p><span>${current_user.name }</span>님</p> --%>
						<ul class="navi">	
							<li><a class="btn btn-sm" href="signout.do">로그아웃</a></li>
							<li class="dropdown">							
								<a class="nav-link" data-toggle="dropdown" href="#">마이페이지</a>
									<ul class="dropdown-menu">		
										<li><span class="profilePhoto">
												<img src="${current_user.profile }" alt="나의 프로필 사진">
												<span class="cover"></span>
											</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											<span>${current_user.name }</span>님</li>							
										<li class="dropdown-item"><a href="myplan.do" class="nav-link" title="나의플랜보기" >나의 플랜보기</a></li>
										<li class="dropdown-item"><a href="mypage.do" class="nav-link" title="회원정보수정">회원정보수정</a></li>
									</ul>				
							</li>
						</ul>
						<!-- <span class="profilePhoto">
							<img src="./image/planer.jpg" alt="나의 프로필 사진">
							<span class="cover"></span>
						</span>  -->
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
				<li class="dropdown-item"><a href="#">Page 1-1</a></li>
				<li class="dropdown-item"><a href="#">Page 1-2</a></li>
				<li class="dropdown-item"><a href="#">Page 1-3</a></li>
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
				<li class="dropdown-item"><a href="#">Page 1-1</a></li>
				<li class="dropdown-item"><a href="#">Page 1-2</a></li>
				<li class="dropdown-item"><a href="#">Page 1-3</a></li>
			</ul>
       	</li>
		<li class="dropdown">
         	<a class="dropdown-toggle nav-link" data-toggle="dropdown" href="#">이벤트</a>
	         <ul class="dropdown-menu">
				<li class="dropdown-item"><a href="#">Page 1-1</a></li>
				<li class="dropdown-item"><a href="#">Page 1-2</a></li>
				<li class="dropdown-item"><a href="#">Page 1-3</a></li>
			</ul>
       	</li>
    </ul>
  </div>
</nav>



