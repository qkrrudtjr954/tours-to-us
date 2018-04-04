<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

 <style type="text/css">

.tran-img{
	position:relative;
	width: 35px;
	height: 35px;
	left: 30px;
	top: 50px;
}
</style>

<div class="row">
	<div class="offset-md-2  myplanDetail-title">
		<div class="col-md-10 col-xs-12">
			<h2>${planer.title }</h2>
		</div>
	</div>
	<div class="offset-md-2 col-md-8 col-xs-12">
		<img src="./image/back.png" onclick="day_back(${planer.seq})" class="offset-md-11" style="cursor:pointer"  width="30px" height="30px">
		<hr>
	</div>
</div>


<div id="myplanDetail-content">
	<div class="offset-md-3 col-md-6 col-xs-12">
		<div class="card">
			<c:forEach var="dayPlan" items="${planerMap.keySet() }" varStatus="i">
				<div class="row no-gutters">
					<div class="col-md-2">
						<img
							src="${(i.index == 0) ? './image/first.png' : i.index == planerMap.size()-1 ?'./image/last.png':'./image/middle.png'  }" width="100%" height="100%">
					</div>
					<h5 class="mb-0">Day ${dayPlan.day_count }</h5>
				</div>
				<c:forEach var="timePlan" items="${planerMap.get(dayPlan) }"
					varStatus="t">
					<div class="row no-gutters">
						<div class="col-md-2">
							<img src="./image/taxi.png" class="tran-img">
						</div>
						<div class="col">
							${timePlan.start_time }<br> ${timePlan.location }<br>
							${timePlan.transportation }<br> ${timePlan.expected_cost }<br>
							${timePlan.content }<br>
							<br>
						</div>
					</div>
				</c:forEach>
			</c:forEach>
		</div>
	</div>
</div>

<script>
function day_back(seq) {
	window.open("planDetail.do?seq="+seq, "_parent");
	window.close();
}
</script>