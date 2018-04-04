<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<style>
.card {
	padding: 0;
	border: 1px solid #7DC3BB;
}
.card-body{
	padding: 0;
	height: 400px;
	background-repeat: no-repeat;
	background-size: cover;
	background-position: center;
	border: 1px solid #7DC3BB;
}

.card-container {
	background-color: rgb(0,0,0,0.5);
	position: absolute;
	padding: 20px 50px;
	bottom: 0;
	width: 100%;
}
#plan-title{
	font-size: 20px;
	font-weight: 500;
	text-decoration:none;
}
#plan-title,
.card-title {
	color: #fff;
}

#plan-title:hover {
	text-decoration: underline;
	color: #7DC3BB;
} 

.change-title-div {
	display: none;
}
.change-title-div,
.title-div {
	margin: 20px 0px;
}
</style>

<div class="myplan-title">
	<div class="offset-md-2 col-md-4 col-xs-12">
		<h2>투둥이 가이드북</h2>
	</div>
</div>
<div class="offset-md-2  col-md-8 col-xs-12">
	<hr>
</div>

<div class="user-guide-content">
	<div class="row">
		<div class="offset-md-2 col-md-8">
			<c:if test="${empty planlist }">
				<div class="col-md-12 text-center col-xs-12">
					<p>작성된 글이 없습니다</p>
				</div>
			</c:if>
			<div class="row no-gutters">
				<c:forEach items="${planlist }" var="plan" varStatus="i">
					<div class="card col-md-4 ">
						<div class="card-body" style="background-image:url('${pageContext.request.contextPath }/${plan.paper eq null ? 'image/no-img.png' : plan.paper}');">
							<div class="card-container">
								<div class="row">
									<h5 class="card-title">
										<span data-feather="calendar"></span>&nbsp; <span>${plan.from_date }</span>~<span>${plan.to_date }</span>
									</h5>
								</div>
								<div class="card-text">
									<div class="title-div">
										<a id="plan-title" href="planDetail.do?seq=${plan.seq }">${plan.title }</a>
									</div>
									<div class="change-title-div input-group mb-3">
										<input type="text" class="form-control" placeholder="${plan.title }">
									</div>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>			
			
		</div>
	</div>
</div>