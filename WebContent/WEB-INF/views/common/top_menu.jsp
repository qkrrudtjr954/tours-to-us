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
	
</style>

<header class="blog-header py-3">
	<div class="row flex-nowrap justify-content-between align-items-center">
		<div class="col-4 pt-1">
			<a class="text-muted" href="#"></a>
		</div>
		<div class="offset-col-4 col-4 text-center">
			<a class="blog-header-logo text-dark" href="#"> 
				<img alt="Tours To Us" src="${pageContext.request.contextPath }/image/logo.jpeg" width="150" height="70">
			</a>
		</div>
		<div class="col-4 d-flex justify-content-end align-items-center user-action">
			<a class="btn btn-sm" href="#">로그인</a>
			<a class="btn btn-sm" href="#">회원 가입</a>
		</div>
		
	</div>
</header>

<nav class="navbar navbar-expand-lg top-menu-nav">
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"  style="color:white;">
	<span data-feather="align-justify"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto" >
      	<li>
      		<a class="nav-link" href="#">여행 계획</a> 
      	</li>
      	<li>
      		<a class="nav-link" href="#">가이드북</a> 
      	</li>
      	<li>
      		<a class="nav-link" href="#">커뮤니티</a> 
      	</li>
      	<li>
      		<a class="nav-link" href="#">호텔</a> 
      	</li>
      	<li>
      		<a class="nav-link" href="#">이벤트</a> 
      	</li>
    </ul>
  </div>
</nav>

<!-- Icons -->
<script src="https://unpkg.com/feather-icons/dist/feather.min.js"></script>
<script>
feather.replace();
</script>