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

.planer-progress-bar{
	height: 200px;
	background-repeat: no-repeat;
	background-size: cover;
	background-position: center;
}

.planer-transportaion {
	background-repeat: no-repeat;
	background-size: contain;
	background-position: center;
}

#time-info-table{
	width: 80%;
	border: 1px solid #1ce7ce;
	height: 80%;
}
#time-info-table td{
	padding: 1px;
	text-align: center;
}
</style>

<div class="row">
	<div class="offset-md-2  myplanDetail-title">
		<div class="col-md-12 col-xs-12">
			<h2>${planer.title }</h2>
		</div>
	</div>
	<div class="offset-md-2 col-md-8 col-xs-12">
		<img src="${initParam.IMG_SERVER_PATH}/image/back.png" onclick="day_back(${planer.seq})" class="offset-md-11" style="cursor:pointer" title="돌아가기" width="30px" height="30px">
		<hr>
	</div>
</div>


<div id="myplanDetail-content">
	<div class="offset-md-2 col-md-8 col-xs-12">
		<div class="card">
			<c:forEach var="dayPlan" items="${planerMap.keySet() }" varStatus="i">
				<div class="row no-gutters">
					<c:set value="${planerMap.size()-1 }" var="last_index"/>
					<c:choose>
						<c:when test="${i.index == 0 }">
							<div class="col-md-4 planer-progress-bar" style="background-image: url('${initParam.IMG_SERVER_PATH }/image/first.png');"></div>
						</c:when>
						<c:when test="${i.index == last_index }">
							<c:choose>
								<c:when test="${planerMap.get(dayPlan).size() == 0 }">
									<div class="col-md-4 planer-progress-bar" id="last-progress-bar" style="background-image: url('${initParam.IMG_SERVER_PATH }/image/last.png');"></div>							
								</c:when>
								<c:otherwise>
									<div class="col-md-4 planer-progress-bar" style="background-image: url('${initParam.IMG_SERVER_PATH }/image/middle.png');"></div>
								</c:otherwise>
							</c:choose>
						</c:when>
						<c:otherwise>
							<div class="col-md-4 planer-progress-bar" style="background-image: url('${initParam.IMG_SERVER_PATH }/image/middle.png');"></div>
						</c:otherwise>
					</c:choose>
					<h1 class="mb-0" style="margin-top: 75px;">Day ${dayPlan.day_count }</h1>
				</div>
				<c:forEach var="timePlan" items="${planerMap.get(dayPlan) }" varStatus="t">
					<div class="row no-gutters">
						<c:set value="${planerMap.get(dayPlan).size()-1 }" var="last_sub_index"/>
						<c:choose>
							<c:when test="${planerMap.get(dayPlan).size() == 1 }">

								<c:choose>
									<c:when test="${t.index == last_sub_index && i.index == last_index}">
										<c:set var="url" value="${initParam.IMG_SERVER_PATH }/image/has-one-final.png"/>																								
									</c:when>
									<c:otherwise>
										<c:set var="url" value="${initParam.IMG_SERVER_PATH }/image/has-one.png"/>																
									</c:otherwise>
								</c:choose>						
							</c:when>
							<c:when test="${t.index == 0 }">
								<c:set var="url" value="${initParam.IMG_SERVER_PATH }/image/sub-first.png"/>							
							</c:when>
							<c:when test="${t.index == last_sub_index }">
								<c:choose>
									<c:when test="${i.index == last_index }">
										<c:set var="url" value="${initParam.IMG_SERVER_PATH }/image/sub-final.png"/>																								
									</c:when>
									<c:otherwise>
										<c:set var="url" value="${initParam.IMG_SERVER_PATH }/image/sub-last.png"/>															
									</c:otherwise>
								</c:choose>
							</c:when>
							<c:otherwise>
								<c:set var="url" value="${initParam.IMG_SERVER_PATH }/image/sub-middle.png"/>
							</c:otherwise>
						</c:choose>
						<div class="col-md-4 planer-progress-bar" style="background-image: url('${url}');"></div>
<%-- 						<div class="col-md-1 planer-transportaion" style="background-image: url('${initParam.IMG_SERVER_PATH }/image/${timePlaner.transportation }');"></div> --%>
						<div class="col-md-1 d-flex align-items-center planer-transportaion">
							<img src="${initParam.IMG_SERVER_PATH }/image/${timePlan.transportation}" alt="${timePlan.transportation}" width="50px"/>
						</div>
						<div class="col d-flex align-items-center">
							<table id="time-info-table">
								<tr><td>${timePlan.start_time } ~ ${timePlan.end_time }</td></tr>
								<tr><td>${timePlan.location }</td></tr>
								<tr><td>${timePlan.expected_cost }</td></tr>
								<tr><td>${timePlan.content }</td></tr>
							</table>
						</div>
					</div>
				</c:forEach>
			</c:forEach>
		</div>
	</div>
</div>

<script>
function day_back(seq) {
	window.open("guideDetail.do?seq="+seq, "_parent");
	window.close();
}
</script>