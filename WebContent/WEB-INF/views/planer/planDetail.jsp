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
	<hr>
</div>

<div id="myplanDetail-content">
	<div class="offset-md-2 col-md-8 col-xs-12">
		<div class="card">
			<c:forEach items="${dayPlanlist }" varStatus="i" var="dayplan">
				<div class="card-header" id="heading">
					<h5 class="mb-0">
						<button class="btn btn-link collapsed" data-toggle="collapse"
							data-target="#collapse${dayplan.day_count }" aria-expanded="false"
							aria-controls="collapse">Day ${dayplan.day_count }</button>
					</h5>
				</div>
				<c:forEach items="${timePlanlist }" varStatus="i" var="timeplan">
					<div id="collapse${dayplan.day_count }" class="collapse" aria-labelledby="heading"
						data-parent="#accordion">
						<div class="card-body">${timeplan.content }</div>
					</div>
				</c:forEach>
			</c:forEach>
		</div>
	</div>
</div>

<div style="height:2000px">
</div>
<div id="floatMenu">
<span style="color: skyblue">day : </span>${dayPlanlist }
<br>
<span style="color: skyblue">time : </span>${timePlanlist }
</div>
