<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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
	<input type="button" onclick="day_all(${planer.seq})" class="offset-md-6 btn btn-primary" value="크게보기">
	<input type="button" onclick="day_show()" class="btn btn-primary" value="전체보기">
	<input type="button" onclick="day_remove()" class="btn btn-primary" value="전체접기">
	<input type="button" onclick="btn_update(${planer.seq})" class=" btn btn-primary" value="수정">
	<hr>
</div>


<div id="myplanDetail-content">
	<div class="offset-md-4 col-md-5 col-xs-12">
		<div class="card">
			<c:forEach var="dayPlan" items="${planerMap.keySet() }" varStatus="i">
				<div class="card-header" id="heading">
					<h5 class="mb-0">
						<button class="btn btn-link collapsed" data-toggle="collapse"
							data-target="#collapse${i.count }" aria-expanded="false"
							aria-controls="collapse">Day ${dayPlan.day_count }</button>
					</h5>
				</div>
				<c:forEach var="timePlan" items="${planerMap.get(dayPlan) }">
					<div id="collapse${i.count }" class="collapse" aria-labelledby="heading"
						data-parent="#accordion">
						<div class="card-body">
							${timePlan.start_time }<br>
							${timePlan.location }<br>
							${timePlan.transportation }<br>
							${timePlan.expected_cost }<br>
							${timePlan.content }<br>
						</div>
					</div>
				</c:forEach>
			</c:forEach>
		</div>
	</div>
</div>

<script>
function btn_update(seq) {
	location.href="dayPlaner.do?seq="+seq;
}

function day_show() {
	$(".collapse").addClass("show");
}

function day_remove() {
	$(".collapse").removeClass("show");
}

function day_all(seq) {
	location.href="planDetailAll.do?seq="+seq;
}
</script>
