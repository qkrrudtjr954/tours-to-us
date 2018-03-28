<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<style>
	.card-body{
		position: absolute;
		top:230px; 
		left:16px;
		opacity: 0.5;
		width: 485px;
		height: 120px;
		background-color: #000;
		color: #fff;
	}
	a{
		color: #fff;
	}
</style>
<div class="myplan-title">
	<div class="offset-md-2 col-md-4 col-xs-12">
		<h2>나의 플랜</h2>
	</div>
</div>
<div class="offset-md-2  col-md-8 col-xs-12">
	<hr>
</div>

<div class="myplan-content">
<div class="row">
	<c:if test="${empty planlist }">
		<span class="offset-md-4">작성된 글이 없습니다</span>
	</c:if>
	<c:forEach items="${planlist }" var="plan" varStatus="i">
		<div class="offset-md-4 col-md-4">
			<div class="card mb-4 box-shadow">
			<img class="card-img-top" src="${(empty plan.paper) ? './image/no-img.png' : plan.paper  }" alt="./image/no-img.png" height="350">
			</div>
			<div class="card-body">
				<span>${plan.to_date }</span>~<span>${plan.from_date }</span>
				<br>
				<span><a href="#none">${plan.title }</a></span>
			</div>
		</div>
	</c:forEach>


</div>
</div>













<script>

</script>
