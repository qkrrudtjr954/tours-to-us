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
.card-body:hover{
	height: 450px;
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
						<div class="card-container">
							<h5 class="card-title">
								<span data-feather="calendar"></span>&nbsp;&nbsp;
								<span>${plan.from_date }</span>&nbsp;~&nbsp;<span>${plan.to_date }</span>
							</h5>
							<div class="card-text">
								<div class="title-div"> 
									<a id="plan-title" href="planDetail.do?seq=${plan.seq }">${plan.title }</a> 
									<img class="change-pen" alt="pen" src="./image/pen1.png" onclick="showTitleInput(this)" width="15px" height="15px">
								</div> 
								
								<div class="change-title-div input-group mb-3">
									<input type="text" class="form-control" placeholder="${plan.title }">
									<div class="input-group-append">
										<button class="btn btn-primary" onclick="changeTitle(this, ${plan.seq})">변경하기</button>
										<button class="btn btn-danger" onclick="hideTitleInput(this)">X</button>
									</div>
								</div>
							</div>
							<a href="afterWrite.do?seq=${plan.seq }" class="btn btn-primary">후기쓰기</a>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
</div>
</div>

<script>
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
