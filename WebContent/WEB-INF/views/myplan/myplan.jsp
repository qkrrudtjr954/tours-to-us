<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
    
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
	${planlist }
	<c:forEach items="${planlist }" var="plan" varStatus="i">
		<div class="offset-md-4 col-md-4">
			<div class="card mb-4 box-shadow">
			<img class="card-img-top" src="${(empty plan.paper) ? './image/no-img.png' : plan.paper  }" alt="./image/no-img.png" height="348">
			</div>
		</div>
	</c:forEach>


</div>
</div>













<script>

</script>
