<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

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
		<c:forEach items="${timeplanlist }" varStatus="i" var="timeplan">
			<div class="card">
				<div class="card-header" id="headingOne">
					<c:forEach items="${dayPlanlist }" varStatus="i" var="dayplan">
						<h5 class="mb-0">
							<button class="btn btn-link collapsed" data-toggle="collapse" data-target="#collapseOne" aria-expanded="false" aria-controls="collapseOne">Day ${dayplan.day_count }</button>
						</h5>
					</c:forEach>
				</div>

				<div id="collapseOne" class="collapse"
					aria-labelledby="headingOne" data-parent="#accordion">
					<div class="card-body">내용</div>
				</div>

			</div>
		</c:forEach>
	</div>
</div>