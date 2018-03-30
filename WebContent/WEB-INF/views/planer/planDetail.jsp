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
		<div class="card">
			<c:forEach items="${timeplanlist }" varStatus="i" var="timeplan">
				<c:forEach items="${dayPlanlist }" varStatus="i" var="dayplan">
					<div class="card-header" id="headingOne">
						<h5 class="mb-0">
							<button class="btn btn-link collapsed" data-toggle="collapse"
								data-target="#collapse" aria-expanded="false"
								aria-controls="collapse">Day ${dayplan.day_count }</button>
						</h5>
					</div>
					<div id="collapse" class="collapse" aria-labelledby="heading"
						data-parent="#accordion">
						<div class="card-body">${timeplan.content }</div>
					</div>
				</c:forEach>
			</c:forEach>
		</div>
	</div>
</div>