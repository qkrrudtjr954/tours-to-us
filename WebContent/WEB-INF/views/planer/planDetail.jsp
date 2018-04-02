<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

 <style type="text/css">
#floatMenu {
	position: absolute;
	width: 200px;
	height: 1000px;
	left: 50px;
	top: 200px;
	color: #000;
}
</style>

<div class="myplanDetail-title">
	<div class="offset-md-2 col-md-4 col-xs-12">
		<h2>${planer.title }</h2>
	</div>
</div>
<div class="offset-md-2  col-md-8 col-xs-12">
	<input type="button" onclick="btn_update(${planer.seq})" class="offset-md-11 btn btn-primary" value="수정">
	<hr>
</div>

<div id="myplanDetail-content">
	<div class="offset-md-2 col-md-8 col-xs-12">
		<div class="card">
			<c:forEach var="dayPlan" items="${planerMap.keySet() }">
				<div class="card-header" id="heading">
					<h5 class="mb-0">
						<button class="btn btn-link collapsed" data-toggle="collapse"
							data-target="#collapse${dayPlan.day_count }" aria-expanded="false"
							aria-controls="collapse">Day ${dayPlan.day_count }</button>
					</h5>
				</div>
				<c:forEach var="timePlan" items="${planerMap.get(dayPlan) }" varStatus="i">
					<div id="collapse${dayPlan.day_count }" class="collapse" aria-labelledby="heading"
						data-parent="#accordion">
						<div class="card-body">${timePlan.content }</div>
					</div>
				</c:forEach>
			</c:forEach>
		</div>
	</div>
</div>

<script>
function btn_update(seq) {
	location.href="dayplaner.do?seq="+seq;
}
</script>
