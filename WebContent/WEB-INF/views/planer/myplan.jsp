<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<style>
.card {
	padding: 0;
	/* border: 1px solid #7DC3BB; */
}
.card-body{
	padding: 0;
	height: 400px;
	background-repeat: no-repeat;
	background-size: cover;
	background-position: center;
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
	/* margin: 10px 0px; */
}

.status-img{
	position: absolute;
    border-radius: 50px;
    left: 390px;
    top: 8px;
   
}



.plan-detail:link {text-decoration: none; color: #fff;}
.plan-detail:hover {text-decoration: underline; color: #fff;}
.plan-detail:visited {text-decoration: none; color: #fff;}


</style>


<div class="myplan-title">
   <div class="offset-md-2 col-md-4 col-xs-12">
      <h2>나의 플랜</h2> 
   </div>
</div>
<div class="offset-md-2  col-md-8 col-xs-12">
   <hr>
</div>


<div class="myplan-content">
	<div class="row">
		<div class="offset-md-2 col-md-8">
			<c:if test="${empty planlist }">
				<div class="col-md-12 text-center col-xs-12">
					<p>작성된 글이 없습니다</p>
				</div>
			</c:if>
			<div class="row no-gutters">
				<c:forEach items="${planlist }" var="plan" varStatus="i">
					<div class="card col-md-6 ">
						<div class="card-body" style="background-image:url('${pageContext.request.contextPath }/${plan.paper eq null ? 'image/no-img.png' : plan.paper}');">
							&nbsp;
							<c:if test="${plan.status == 0 }">
								<div class="ing-img">
									<img src="./image/ing.png" class="status-img" width="100px" height="100px">
								</div>
							</c:if>
							<div class="card-container">
								<div class="row">
									<h5 class="card-title">
										<span data-feather="calendar"></span>&nbsp;&nbsp; <span>${plan.from_date }</span>&nbsp;~&nbsp;<span>${plan.to_date }</span>
									</h5>
								</div>
								<div class="card-text">
									<div class="title-div">
										<a href="planDetail.do?seq=${plan.seq }" class="plan-detail"><span style="color: #fff; font-size: xx-large; font-weight: normal;" class="span-title">${plan.title }</span></a>
										<img class="change-pen" alt="pen" src="./image/pen1.png"
											onclick="showTitleInput(this)" width="25px" height="25px">
									</div>
									<div class="writer">
										<span style="color: #fff; font-size: large; font-weight: normal;">${plan.name }</span>
									</div>
									<div class="change-title-div input-group mb-3">
										<input type="text" class="form-control" placeholder="${plan.title }">
										<div class="input-group-append">
											<button class="btn btn-primary"
												onclick="changeTitle(this, ${plan.seq})">변경하기</button>
											<button class="btn btn-danger" onclick="hideTitleInput(this)">X</button>
										</div>
									</div>
								</div>
								<div class="offset-md-10 col-md-2 review-btn">
									<a href="afterWrite.do?seq=${plan.seq }"
										class="btn btn-primary">후기쓰기</a>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
</div>

<hr>
<div class="row content">
<div class="offset-md-2 col-md-8">
<div class="row no-gutters">
		<c:forEach items="${planlist }" var="plan" varStatus="i">
				<div class="card col-md-4 col-xs-4 box-shadow">
					<div class="card-img">
						<img class="card-img-top" src="${plan.paper eq null ? 'image/no-img.png' : plan.paper}" height="300px" width="300px">
						<%-- 진행중 이미지 
						<c:if test="${plan.status == 0 }">
							<div class="ing-img">
								<img src="./image/ing.png" class="status-img" width="100px" height="100px">
							</div>
						</c:if> --%>
					</div>
					<div class="card-body" onclick="location.href='planDetail.do?seq=${plan.seq }'" style="cursor: pointer;height: 100px;">
						<span style="font-size: 15px; font-weight: bold;" class="span-title">${plan.title }</span><br>
						<span style="font-size: 14px; float: right; color: #484848; font-weight: 200;">writer: ${plan.name }</span>
					</div>
				</div>
		</c:forEach>
		</div>
		</div>
	</div>

<script>
                                     
/* $(document).ready(function () {
	var title= $(".span-title").text().substr(0, 4);
	title+= "...";
	$(".span-title").after(title);
}); */

function showTitleInput(img){	
	$(img).parent().parent().find('.change-title-div').css('display', 'inline-flex');
	$(img).parent().parent().find('.title-div').css('display', 'none'); 
}
function hideTitleInput(img) {
	$(img).parent().parent().parent().find('.change-title-div').css('display', 'none');
	$(img).parent().parent().parent().find('.title-div').css('display', 'block');
}

function changeTitle(button, seq) {
	let title = $(button).parent().parent().find('input[type="text"]').val();
	$.ajax({
		url : 'changeTitle.do',
		data : { title : title , seq : seq },
		method : 'POST',
		success : function (data) {
			if(data === ""){
				alert('변경할 수 없습니다. 잠시 후 다시 시도해주세요.');
			}else{
				$(button).parent().parent().parent().find('a').text(data.title);
				hideTitleInput($(button).parent().parent().parent().find('img'));
			}
		}
	})
}

</script>
