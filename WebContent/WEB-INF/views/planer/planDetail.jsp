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

.tran-img{
	position:relative;
	width: 35px;
	height: 35px;
	left: 30px;
	top: 50px;
}

.card-head{
	margin: auto;
    margin-top: 70px;
}
.title-container {
    margin-top: 50px;
}


.plan-menu img {
	margin: 10px;
}

</style>


<div class="row no-gutters title-container">
	<div class="offset-md-3 col-md-4 col-xs-12">		
		<div class="myplanDetail-title">
			<h2 class="plan-label-title">${planer.title }</h2>
		</div>
	</div>
	<div class="col-md-3 col-xs-12">
		<div class="d-flex justify-content-end align-items-centers plan-menu">
			<img src="${initParam.IMG_SERVER_PATH}/image/zoom-in.png" onclick="day_all(${planer.seq})" style="cursor:pointer" title="크게보기" width="30px" height="30px">
			&nbsp;
			<img src="${initParam.IMG_SERVER_PATH}/image/indent-all.png" onclick="day_show()"  style="cursor:pointer" title="전체보기" width="30px" height="30px">
			&nbsp;
			<img src="${initParam.IMG_SERVER_PATH}/image/dedent-all.png" onclick="day_remove()" style="cursor:pointer" title="전체접기" width="30px" height="30px">
			&nbsp;
			<img src="${initParam.IMG_SERVER_PATH}/image/updated.png" onclick="btn_update(${planer.seq})" style="cursor:pointer" title="수정하기" width="30px" height="30px">
			&nbsp;
			<img src="${initParam.IMG_SERVER_PATH}/image/garbage.png" onclick="btn_delete(${planer.seq})" style="cursor:pointer" title="삭제하기" width="30px" height="30px">
		</div>
	</div>
</div>
<hr>

<style>
.planer-progress-bar {
	height: 200px;
	background-repeat: no-repeat;
	background-size: cover;
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
							<div class="col-md-4 planer-progress-bar" id="last-progress-bar" style="background-image: url('${initParam.IMG_SERVER_PATH }/image/last.png');"></div>							
						</c:when>
						<c:otherwise>
							<div class="col-md-4 planer-progress-bar" style="background-image: url('${initParam.IMG_SERVER_PATH }/image/middle.png');"></div>
						</c:otherwise>
					</c:choose>
					<div class="col">
						<div class="card-head d-flex justify-content-around align-items-center" id="heading"> 
							<c:choose>
								<c:when test="${i.index == last_index }">
									<a class="btn" data-toggle="collapse" data-target="#collapse${i.count }" onclick="changeLastBG()" aria-controls="collapse"><h1 class="mb-0">Day ${dayPlan.day_count }</h1></a>
								</c:when>
								<c:otherwise>
									<a class="btn" data-toggle="collapse" data-target="#collapse${i.count }" aria-controls="collapse"><h1 class="mb-0">Day ${dayPlan.day_count }</h1></a>
								</c:otherwise>								
							</c:choose>
							<br>
							<span>${dayPlan.day }</span>
						</div> 					
					</div>
				</div>
				
				<div id="collapse${i.count }" class="collapse" aria-labelledby="heading" >
					<c:set value="${planerMap.get(dayPlan).size()-1 }" var="last_sub_index"/>
					<c:forEach var="timePlan" items="${planerMap.get(dayPlan) }" varStatus="t">
						<c:choose>
							<c:when test="${planerMap.get(dayPlan).size() == 1 }">
								<c:choose>
									<c:when test="${t.index == last_sub_index }">
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
						<div class="row no-gutters">
							<div class="col-md-4 planer-progress-bar"  style="background-image: url('${url}');"></div>		
							<div class="col-md-1 d-flex align-items-center">
								<img src="${initParam.IMG_SERVER_PATH }/image/${timePlan.transportation}" alt="${timePlan.transportation}" width="50px"/>
							</div>		
							<div class="col d-flex align-items-center">
								<div class="card-body">
									<table id="time-info-table">
										<tr><td>${timePlan.start_time } ~ ${timePlan.end_time }</td></tr>
										<tr><td>${timePlan.location }</td></tr>
										<tr><td>${timePlan.expected_cost }</td></tr>
										<tr><td>${timePlan.content }</td></tr>
									</table>
								</div>			
							</div>
						</div>
					</c:forEach>
				</div>
			</c:forEach>
		</div>
	</div>
</div>

<script>
function btn_update(seq) {
	location.href="dayPlaner.do?seq="+seq;
}

function changeLastBG() {
	if($('#last-progress-bar').hasClass('is-opend')){
		//	열려있는걸 닫아야한다.
		$('#last-progress-bar').css('background-image', 'url("${initParam.IMG_SERVER_PATH}/image/last.png")');
		$('#last-progress-bar').removeClass('is-opend');
	} else {
		$('#last-progress-bar').addClass('is-opend');
		$('#last-progress-bar').css('background-image', 'url("${initParam.IMG_SERVER_PATH}/image/middle.png")');
	}
}

function btn_delete(seq) {
	 if(confirm("정말 삭제하시겠습니까?")==true){
		 location.href="planDelete.do?seq="+seq;	        
	}else{
		return;
	}
}

function day_show() {
	$(".collapse").addClass("show");
}

function day_remove() {
	$(".collapse").removeClass("show");
}

function day_all(seq) {
	window.open("planDetailAll.do?seq="+seq, "_blank" );
}
</script>
