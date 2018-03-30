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
a {
text-decoration:none;
color: #fff;
}
a:hover {
text-decoration: underline; 
color: #7DC3BB;
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
	<div class="offset-md-2 col-md-8">
		<c:if test="${empty planlist }">
			<div class="col-md-12 text-center col-xs-12">
				<p>작성된 글이 없습니다</p>
			</div>
		</c:if>
		<div class="row">
			<c:forEach items="${planlist }" var="plan" varStatus="i">
				<div class="col-md-6 col-xs-12">
					<div class="card mb-4 box-shadow">
					<img class="card-img-top" src="${pageContext.request.contextPath }/${plan.paper}" alt="no-cover" height="350">
					</div>
					<div class="card-body">
						<span>${plan.from_date }</span>~<span>${plan.to_date }</span>
						<br>
						<span><a href="#none">${plan.title }</a></span>
						<a href="afterWrite.do?seq=${plan.seq }" class="offset-md-10 btn btn-primary">후기쓰기</a>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
</div>
</div>













<script>

</script>
