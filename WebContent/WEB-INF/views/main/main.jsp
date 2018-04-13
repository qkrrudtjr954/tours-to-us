<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
.main-container {
	/* background-image: url('${pageContext.request.contextPath}/image/background.jpg'); */
	background-size: contain;
    background-repeat: no-repeat;
    background-position: center;
}
.carousel-inner{
position: relative;
}
.main_cover{
position: absolute;
top:300px;
left:100px;

}

.main_cover_right{
position: absolute;
top:200px;
left:600px;
}

#main_copy{
    font: normal 40px/40px "NanumBarunGothicBold";
    color: #FFF;
    letter-spacing: -2px;
    font-weight: bold;
    
}

.head_title p{
	font: normal 25px/40px "NanumBarunGothicBold";
    color: #444;   
    padding-top:10px;
    font-weight: bold;
    letter-spacing: -1px;
    margin-bottm:5px;
}



.bg_maincopy{
padding-bottom:10px;
padding-left:8px;
}
.main_cover a{
	display: inline-block;
    height: 32px;
    color: #FFF;
    font-size: 14px;
    line-height: 32px;
    padding: 0 14px;
    margin-top: 10px;
    background: #f37720;
    border-radius: 32px;
}
a, a:link {
    text-decoration: none;
    color: #232323;
    cursor: pointer;
}

#like {
	position: absolute;
	top: 13px;
	right: 15px;
	color: #ffffff;
	text-shadow: 5px 5px 5px #444444;
}

.first_best_head{
margin-top:30px;
}

.first_best_content{
padding-right: 200px;

}
.view_toditor{
font-size: 13px;
}

 .main_cover_right button{
    z-index: 2;
    position: absolute;
    display: block;
    width: 120px;
    height: 34px;
    font: 0/0 arial;
    line-height: 0;
    overflow: visible;
    border: 0 none;
    background: none;
    cursor: pointer;
    font-family: "NanumBarunGothic", "Arial", "돋움";
    outline: none;
}





</style>
<section>
			
			<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
			  <ol class="carousel-indicators">
			    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
			    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
			    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
			  </ol>
			  <div class="carousel-inner">
				   	 <div class="carousel-item active">
				     	 <img class="d-block w-100" src="image/back01.jpg" alt="First slide" height="640px">
				   	 </div>
				    <div class="carousel-item">
				     	 <img class="d-block w-100" src="image/back02.jpg" alt="Second slide" height="640px">
				    </div>
				    <div class="carousel-item">
				      <img class="d-block w-100" src="image/background.jpg" alt="Third slide" height="640px">
				    </div>
			  </div>
			  <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
			    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
			    <span class="sr-only">Previous</span>
			  </a>
			  <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
			    <span class="carousel-control-next-icon" aria-hidden="true"></span>
			    <span class="sr-only">Next</span>
			  </a>
			</div>
			
<div class="main_cover">
	<img src="image/bg_mainCopy.png" class="bg_maincopy"><br>
	<p id="main_copy">어디로 떠날까요?</p>
	<a href="#">
	<span>이달의 추천 도시 '서울'로 떠나보세요</span></a>
</div>

<div class="main_cover_right">
	<button>히히</button>
	<img src="image/map_ver2.png" height="540px;">
</div>



</section>


<div class="offset-md-2 col-md-10"><!--  하단부 내용 -->
<!-- 투디터 인기글 -->
	<div class="head_title">
		<p>BEST Toditor's Pick!</p>
	</div>
	<div class="offset-md-9 move_to_toditor" id="move_to_toditor">
	<a href="editor_essay.do"><p class="view_toditor">전체보기</p></a>
	</div>
	<div class="first_best_content">
	<div class="row content">
		<c:forEach items="${b1list }" begin="0" end="2" var="item" varStatus="i">
			<div class="col-md-4">
				<div class="card mb-4 box-shadow">
					<div class="card-img">
						<c:choose>
							<c:when test="${item.pic1 eq null }">
								<img class="card-img-top" src="image/no-img.png" height="300px">
							</c:when>
							<c:otherwise>
								<img class="card-img-top" src="${initParam.IMG_SERVER_PATH }/image/${item.pic1 }" height="300px">
							</c:otherwise>
						</c:choose>
						<span id="like"><img src="image/hearticon.png">${item.like_count }</span>
					</div>
					<div class="card-body" onclick="location.href='toditor_detail.do?seq=${item.seq }'" style="cursor: pointer;">
						<span data-feather="map-pin" style="color: rgb(26, 188, 156);"></span>
						<span id="location">${item.category }</span><br> 
						<span style="font-size: 15px; font-weight: bold;">${item.title }</span>&nbsp;<span style="font-size: 12px; color: #f37720;">[${item.comment_count }]</span><br>
						<span style="font-size: 14px; float: right; color: #484848; font-weight: 200;">Editor: ${item.name }</span>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>
	</div>
	
	<!-- 커뮤니티 인기글 -->
	<div class="commu_part">
		<div class="head_title">
			<p>투둥이 인기 여행플랜</p>
		</div>
		<div class="offset-md-9 move_to_" id="move_to_afterbbs">
			<a href="afterBbs.do"><p class="view_toditor">전체보기</p></a>
		</div>
		<div class="2nd_best_content">		
		
				<div class="row content col-md-10" style="border: 1px solid #dcdcdc; padding:20px; ">			
						
						<table class="col-md-6">
						<colgroup>
							<col style="width:50%" />
							<col style="width:10%" />
						</colgroup>
						<tbody>
						<c:forEach items="${commulist }" begin="0" end="4" var="item" varStatus="i">
							<tr><td>[지역]<a href="afterdetail.do?seq=${item.seq }">${item.title }&nbsp;<span style="font-size: 12px; color: #f37720;">[${item.comment_count }]</span></a></td><td>추천 ${item.like_count }</td></tr>
						</c:forEach>
						</tbody>
						</table>	
						
						<table class="col-md-6">
						<colgroup>
							<col style="width:50%" />
							<col style="width:10%" />
						</colgroup>
						<tbody>
						<c:forEach items="${commulist }" begin="5" end="9" var="item" varStatus="i">
							<tr><td>[지역]<a href="afterdetail.do?seq=${item.seq }">${item.title }&nbsp;<span style="font-size: 12px; color: #f37720;">[${item.comment_count }]</span></a></td><td>추천 ${item.like_count }</td></tr>
						</c:forEach>
						</tbody>
						</table>
					</div>
		
				
		</div>
	</div>
	
	
	
</div><!--  하단부 내용 -->