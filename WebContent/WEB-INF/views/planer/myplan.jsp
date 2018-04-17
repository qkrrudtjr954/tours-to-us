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
	background-color: rgb(0,0,0,0.7);
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


h2 {
    display: block;
    font-size: 2rem;
    -webkit-margin-before: 0.83em;
    -webkit-margin-after: 0.83em;
    -webkit-margin-start: 0px;
    -webkit-margin-end: 0px;
   
} 

.plan-detail:link {text-decoration: none; color: #fff;}
.plan-detail:hover {text-decoration: underline; color: #fff;}
.plan-detail:visited {text-decoration: none; color: #fff;}

.ing-img {
	position: absolute;
	top: 5px;
	right: 5px;
}

.ing-img img {
	border-radius: 50%;
}

.myplan-title{
	border-bottom: 2px solid #7cc4bb;
    width: 35%;
    margin-top: 50px;

}

.span-title {
	color: #fff; 
	font-size: xx-large; 
	font-weight: normal; 
}

.change-pen {
	vertical-align: inherit;
	padding-left: 30px;
}

.review-btn {
    position: absolute;
    right: 10px;
    bottom: 10px;
}

.plan-container {
	margin-bottom: 50px;
}

</style>


<div class="myplan-title-div">
   <div class="offset-md-2 col-md-4 col-xs-12">
      <h2 class="myplan-title">나의 플랜</h2> 
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
					<div class="card offset-md-3 col-md-6 plan-container">
						<div class="card-body" style="background-image:url('${initParam.IMG_SERVER_PATH }/image/${plan.paper eq null ? 'no-img.png' : plan.paper}'); background-size: contain;">
							&nbsp;
							<c:if test="${plan.status == 0 }">
								<div class="ing-img">
									<img src="${initParam.IMG_SERVER_PATH }/image/ing.png" class="status-img" width="100px" height="100px">
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
										<a href="planDetail.do?seq=${plan.seq }" class="plan-detail"><span class="span-title">${plan.title }</span></a>
										<img class="change-pen" alt="pen" src="./image/pen1.png" onclick="showTitleInput(this)" width="25px" height="25px">
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
								<div class="review-btn">
									<a href="afterWrite.do?seq=${plan.seq }" class="btn btn-primary">후기쓰기</a>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
</div>

<script>
                                     
/* $(document).ready(function () {
	var title= $(".span-title").text().substr(0, 4);
	title+= "...";
	$(".span-title").text(title);
});  */

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

<script>
$(function(){

    var count=1;
    
    //$(window).scroll(function() { });
    
    //문서가 로드되면 20 row 생성 그리고 생성이 완료되면 scroll 이벤트 바인딩
    for(var i = 1; i <= 20; i++) {
        count = i;
        
        $("<h1>"+count+" line scroll</h1>").appendTo("body");

        if(count == 20) {
            $(window).bind("scroll",infinityScrollFunction);
        }
    }

    function infinityScrollFunction() {

        //현재문서의 높이를 구함.
        var documentHeight  = $(document).height();
        console.log("documentHeight : " + documentHeight);
        
        //scrollTop() 메서드는 선택된 요소의 세로 스크롤 위치를 설정하거나 반환    
        //스크롤바가 맨 위쪽에 있을때 , 위치는 0
        console.log("window의 scrollTop() : " + $(window).scrollTop()); 
        //height() 메서드는 브라우저 창의 높이를 설정하거나 반환
        console.log("window의 height() : " + $(window).height());
        
        //세로 스크롤위치 max값과 창의 높이를 더하면 현재문서의 높이를 구할수있음.
        //세로 스크롤위치 값이 max이면 문서의 끝에 도달했다는 의미
        var scrollHeight = $(window).scrollTop()+$(window).height();         
        console.log("scrollHeight : " + scrollHeight);
            
        if(scrollHeight == documentHeight) { //문서의 맨끝에 도달했을때 내용 추가 
            for(var i = 0; i<10; i++) {
                //count = count + 1;
                count++;
                //$("<h1> infinity scroll </h>").appendTo("body");
                $("<h1>"+count+" line scroll</h1>").appendTo("body");
            }
        }
    }
</script>
