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

.img-icon {
	width: 30px;
	height: 30px;
	margin: 5px;
	cursor: pointer;
}

.myplanDetail-title {
	margin: 10px;
}

.title-container {
    margin-top: 50px;
}


.planer-info-over {
	background-color: #7DC3BB;
	margin: 30px 10px;
	width: 80%;
	text-align: center;
	border-radius: 15px;
	padding: 15px;
    margin: 10px;
}

.menu_table ul{
	list-style-type: none;
	padding: 0px;
}
.menu_table li{
	padding: 10px 0px;
	color: white;
}
.menu-title {
	font-size: 20px;
}
.menu_item {
	font-size: 15px;
	text-align: left;
}
.planer-label-icon {
	vertical-align: middle;
	margin: 0px 3px;
}

</style>

<div class="row no-gutters title-container">

<!-- <div class="row no-gutters">
	<div class="col-md-2 col-xs-12">
		<div class="planer-info-over">
			<div class="menu_table">
				<ul style="list-style-type: none">
					<li class="menu-title">
						<span class="planer-label-icon" data-feather="briefcase"></span>나의 플랜
					</li>
					<li class="menu_item">
						<a href="#none" onclick="url_myplan()" class="nav-link" title="나의 플랜보기">나의 플랜보기</a>
					</li>
					<li><hr></li>
					<li class="menu_item">
						<a href="editor_essay.do" class="nav-link" title="투디터 pick">투디터 pick</a>
					</li>
					<li class="menu_item">
						<a href="user_guide.do" class="nav-link" title="투둥이 가이드북">투둥이 가이드북</a>
					</li>
					<li class="menu_item">
						<a href="toto_guide.do" class="nav-link" title="투투 가이드북">투투 가이드북</a>
					</li>
				</ul>
			</div>
		</div>
	</div>
	 -->
	
	<div class="offset-md-3 col-md-4 col-xs-12">
		<div class="myplanDetail-title">
			<h2 class="plan-label-title">${planer.title }</h2>
		</div>
	</div>
	<div class="col-md-3 col-xs-12">
		<div class="d-flex justify-content-end align-items-centers plan-menu">
			<img src="${initParam.IMG_SERVER_PATH}/image/zoom-in.png" class="img-icon" onclick="day_all(${planer.seq})" title="크게보기">
			&nbsp;
			<img src="${initParam.IMG_SERVER_PATH}/image/indent-all.png" class="img-icon" onclick="day_show(); openLastBG();" title="전체보기">
			&nbsp;
			<img src="${initParam.IMG_SERVER_PATH}/image/dedent-all.png" class="img-icon" onclick="day_remove(); closeLastBG();" title="전체접기">
		</div>
	</div>
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
<div class="row no-gutters">
	<div class="col-md-2 col-xs-12">
		<div class="planer-info-over">
			<div class="menu_table">
				<ul style="list-style-type: none">
					<li class="menu-title">
						<span class="planer-label-icon" data-feather="briefcase"></span>나의 플랜
					</li>
					<li class="menu_item">
						<a href="#none" onclick="url_myplan()" class="nav-link" title="나의 플랜보기">나의 플랜보기</a>
					</li>
					<li><hr></li>
					<li class="menu_item">
						<a href="editor_essay.do" class="nav-link" title="투디터 pick">투디터 pick</a>
					</li>
					<li class="menu_item">
						<a href="user_guide.do" class="nav-link" title="투둥이 가이드북">투둥이 가이드북</a>
					</li>
					<li class="menu_item">
						<a href="toto_guide.do" class="nav-link" title="투투 가이드북">투투 가이드북</a>
					</li>
				</ul>
			</div>
		</div>
	</div>
	<div class=" col-md-8 col-xs-12">
		<div class="card">
			<c:forEach var="dayPlan" items="${planerMap.keySet() }" varStatus="i">
				<div class="row no-gutters">
					<c:set value="${planerMap.size()-1 }" var="last_index"/>
					<c:choose>
						<c:when test="${i.index == 0 }">
							<div class="col-md-4 planer-progress-bar" style="background-image: url('${initParam.IMG_SERVER_PATH }/image/first.png');"></div>
						</c:when>
						<c:when test="${i.index == last_index }">
							<div class="col-md-4 planer-progress-bar is-closed" id="last-progress-bar" style="background-image: url('${initParam.IMG_SERVER_PATH }/image/last.png');"></div>
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
									<c:when test="${i.index == last_index }">
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
	<!-- 좋아요 -->
	<div class="detailBody_like" align="center">
			<img class="hearticon" src="${ isLiked == 1 ? './image/heart.png' : './image/empty_heart.png' }" id="like_btn" width="100px"><br> <span>좋아요</span>&nbsp;<strong
			id="like_count">${like_count }</strong>
	</div>
	<!-- 좋아요 -->
	</div>
</div>

<script>

$('#like_btn').click(function () {


	$.ajax({
		url:"likebtn_click.do",
		data: {bbs_category: 2, target_user_seq: ${current_user.seq }, target_bbs_seq: ${planer.seq }},
		type:"post",
		success : function (data) {

			var result = JSON.parse(data);

			if(result.status == 404){

				$('img.hearticon').attr('src', './image/empty_heart.png');
			} else {

				$('img.hearticon').attr('src', './image/heart.png');
			}

			$('strong#like_count').html(result.like_count);
		}
	})
});

function changeLastBG() {
  if($('#last-progress-bar').hasClass('is-opend')){
    closeLastBG();
  } else if($('#last-progress-bar').hasClass('is-closed')){
    openLastBG();
  }
}

function openLastBG() {
  if($('#last-progress-bar').hasClass('is-closed')){
    $('#last-progress-bar').addClass('is-opend');
    $('#last-progress-bar').removeClass('is-closed');
    $('#last-progress-bar').css('background-image', 'url("${initParam.IMG_SERVER_PATH}/image/middle.png")');
  }
}

function closeLastBG() {
  if($('#last-progress-bar').hasClass('is-opend')){
    $('#last-progress-bar').addClass('is-closed');
    $('#last-progress-bar').removeClass('is-opend');
    $('#last-progress-bar').css('background-image', 'url("${initParam.IMG_SERVER_PATH}/image/last.png")');
  }
}

function day_show() {
	$(".collapse").addClass("show");
}

function day_remove() {
	$(".collapse").removeClass("show");
}

function day_all(seq) {
	window.open("guideDetailAll.do?seq="+seq, "_blank" );
}
</script>
