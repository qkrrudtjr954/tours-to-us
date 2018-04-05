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
</style>

<div class="myplanDetail-title">
	<div class="offset-md-2 col-md-4 col-xs-12">
		<h2>${planer.title }</h2>
	</div>
</div>
<div class="offset-md-2 col-md-8 col-xs-12">
	<div class="offset-md-9 btn-img">
		<img src="./image/zoom-in.png" onclick="day_all(${planer.seq})" style="cursor:pointer" title="크게보기" width="30px" height="30px">
		&nbsp;
		<img src="./image/indent-all.png" onclick="day_show()"  style="cursor:pointer" title="전체보기" width="30px" height="30px">
		&nbsp;
		<img src="./image/dedent-all.png" onclick="day_remove()" style="cursor:pointer" title="전체접기" width="30px" height="30px">
		&nbsp;
		<img src="./image/updated.png" onclick="btn_update(${planer.seq})" style="cursor:pointer" title="수정하기" width="30px" height="30px">
		&nbsp;
		<img src="./image/garbage.png" onclick="btn_delete(${planer.seq})" style="cursor:pointer" title="삭제하기" width="30px" height="30px">
	</div>
		<hr>
</div>

<style>
.planer-progress-bar {
	height: 200px;
	background-repeat: no-repeat;
	background-size: cover;
	background-position: center;
}
</style>


<div id="myplanDetail-content">
	<div class="offset-md-3 col-md-6 col-xs-12">
		<div class="card">
			<c:forEach var="dayPlan" items="${planerMap.keySet() }" varStatus="i">
				<div class="row no-gutters">
					<div class="col-md-4 planer-progress-bar" style="background-image: url('${(i.index == 0) ? './image/first.png' : (i.index == planerMap.size()-1) ? './image/last.png' : './image/middle.png'  }');">
						<%-- <img src="${(i.index == 0) ? './image/first.png' : i.index == planerMap.size()-1 ?'./image/last.png':'./image/middle.png'  }" width="100%" height="100%"> --%> 
					</div>				
					<div class="col">
						<div class="card-head" id="heading"> 
							<h5 class="mb-0">
								<a class="btn" data-toggle="collapse" data-target="#collapse${i.count }" aria-controls="collapse">Day ${dayPlan.day_count }</a>
							</h5>
						</div> 					
					</div>
				</div>
				
				<div id="collapse${i.count }" class="collapse" aria-labelledby="heading" >
					<c:forEach var="timePlan" items="${planerMap.get(dayPlan) }" varStatus="t">
						<c:choose>
							<c:when test="${planerMap.get(dayPlan).size() == 1 }">
								<c:set var="url" value="./image/has-one.png"/>							
							</c:when>
							<c:when test="${t.index == 0 }">
								<c:set var="url" value="./image/sub-first.png"/>							
							</c:when>
							<c:when test="${t.index == planerMap.get(dayPlan).size()-1 }">
								<c:set var="url" value="./image/sub-last.png"/>							
							</c:when>
							<c:otherwise>
								<c:set var="url" value="./image/sub-middle.png"/>
							</c:otherwise>
						</c:choose>
						
						<div class="row no-gutters">
							<div class="col-md-4 planer-progress-bar"  style="background-image: url('${url}');"> 
								<!-- <img src="./image/taxi.png" class="tran-img"> -->
							</div>				
							<div class="col">
								<div class="card-body">
									${timePlan.start_time }<br>
									${timePlan.location }<br>
									${timePlan.transportation }<br>
									${timePlan.expected_cost }<br>
									${timePlan.content }<br>
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
