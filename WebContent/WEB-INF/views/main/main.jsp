<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
/* 가이드북 */
.tag-location{
	float: left;
	display: inline-block;
    height: 49px;
    margin-left: -50px;
}

.tag-location ul {
    display: block;
    height: 39px;
}

.tag-location li {
    float: left;
    display: inline-block;
    padding: 0 5px;
}

.tag-location li a {
    display: inline-block;
    height: 100%;
    font-size: 15px;
    line-height: 39px;
    padding: 0 10px;
}

.tag-location li a:hover {
    height: 37px;
    line-height: 39px;
    text-decoration: none;
    color: #7DC3BB;
    border-bottom: 3px solid #7DC3BB;
}

.tag-location .active a.cur {
    height: 37px;
    font-size: 15px;
    line-height: 39px;
    border-bottom: 3px solid #7DC3BB;
    text-decoration: none;
    color: #000000;
}

.cur:link {text-decoration: none; color: #000000;}
.cur:hover {text-decoration: none; color: #7DC3BB;}
.cur:visited {text-decoration: none; color: #000000;}

.book-card{
	padding: 0;
    width: 162px;
    height: 250px;
    /*margin: 2px 60px -30px 2px; */
    margin-left:3px;
    margin-right:3px;
    border-top: 2px solid #7DC3BB;
}


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


.map_background{
	z-index: 3;
    position: absolute;
}

.main_cover_right button{
    border: 0 none;
    background: none;
    cursor: pointer;
    font-family: "NanumBarunGothic", "Arial", "돋움";
    outline: none;
     z-index: 4;
    position: absolute;
    display: block;
    width: 120px;
    height: 34px;
    font: 0/0 arial;
    line-height: 0;
    overflow: visible;
}


.main_cover_right button:hover{
    border: 3px solid #FFF;
}

.main_cover_right span:hover{
   top: -2px;
   left: 0;
}

.seoul{
    top: 95px;
    left: 20px;
}

.busan{
  top: 320px;
  left: 380px;

}

.gangwondo{
  top: 50px;
  left: 360px;
}

.junla{
	top: 350px;
}
.jeju{
  top: 460px;
  left: 190px;
}
 .continents {
    z-index: 2;
    position: absolute;
    top: 0;
    left: 0;
    display: block;
    width: 100%;
    height: 100%;
	cursor: pointer;
    font: normal 16px/33px "NanumBarunGothicBold";
    font-weight:bold;
    text-align: center;
    color: #FFF;
}
.cover{
	z-index: 1;
    position: absolute;
    top: 0;
    left: 0;
     cursor: pointer;
    display: block;
    width: 100%;
    height: 100%;
    background: #000;
    opacity: 0.4;
}

.span_seoul{
    z-index: 2;
    position: absolute;
    top: 0;
    left: 0;
    display: block;
    width: 100%;
    height: 100%;
    font: normal 16px/33px "NanumBarunGothicBold";
    text-align: center;
    color: #FFF;
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
    margin-bottm:0px;
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

.update-text{
font-size: 13px;
color: #232323;

}

.downloadcount{
padding-left:30px;

}

/*
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
} */





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
	<div class="map_background">
		<img src="image/map_ver2.png" width="480px">

	</div>
	<button type="button" class="seoul" title="서울 자세히 보기">
					<span class="continents">서울</span>
					<span class="cover"></span>
	</button>

	<button type="button" class="busan" title="부산 자세히 보기">
					<span class="continents">부산</span>
					<span class="cover"></span>
	</button>

	<button type="button" class="gangwondo" title="강원도 자세히 보기">
					<span class="continents">강원도</span>
					<span class="cover"></span>
	</button>

	<button type="button" class="jeju" title="제주 자세히 보기">
					<span class="continents">제주</span>
					<span class="cover"></span>
	</button>

	<button type="button" class="junla" title="전라도 자세히 보기">
					<span class="continents">전라도</span>
					<span class="cover"></span>
	</button>




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
						<c:forEach items="${planlist }" begin="0" end="4" var="item" varStatus="i">
							<tr><td>&nbsp;<a href="guideDetail.do?seq=${item.seq }">[${item.location }]&nbsp;${item.title }</a></td><td> <img src="${initParam.IMG_SERVER_PATH}/image/heart.png" width="30px" height="30px">${item.like_count }</td></tr>
						</c:forEach>
						</tbody>
						</table>

						<table class="col-md-6">
						<colgroup>
							<col style="width:50%" />
							<col style="width:10%" />
						</colgroup>
						<tbody>
						<c:forEach items="${planlist }" begin="5" end="9" var="item" varStatus="i">
							<tr><td>&nbsp;<a href="guideDetail.do?seq=${item.seq }">[${item.location }]&nbsp;${item.title }</a></td><td> <img src="${initParam.IMG_SERVER_PATH}/image/heart.png" width="30px" height="30px">${item.like_count }</td></tr>
						</c:forEach>
						</tbody>
						</table>
					</div>


		</div>
	</div>

	<div class="community_part">
		<div class="head_title">
			<p>커뮤니티 인기글</p>
		</div>
		<div class="offset-md-9 move_to_" id="move_to_afterbbs">
			<a href="afterBbs.do"><p class="view_toditor">전체보기</p></a>
		</div>
		<div class="3rd_best_content">

				<div class="row content col-md-10" style="border: 1px solid #dcdcdc; padding:20px; ">

						<table class="col-md-6">
						<colgroup>
							<col style="width:50%" />
							<col style="width:10%" />
						</colgroup>
						<tbody>
						<c:forEach items="${commulist }" begin="0" end="4" var="item" varStatus="i">
							<tr><td>&nbsp;<a href="afterdetail.do?seq=${item.seq }">${item.title }&nbsp;<span style="font-size: 12px; color: #f37720;">[${item.comment_count }]</span></a></td><td> <img src="${initParam.IMG_SERVER_PATH}/image/heart.png" width="30px" height="30px">${item.like_count }</td></tr>
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
							<tr><td>&nbsp;<a href="afterdetail.do?seq=${item.seq }">${item.title }&nbsp;<span style="font-size: 12px; color: #f37720;">[${item.comment_count }]</span></a></td><td> <img src="${initParam.IMG_SERVER_PATH}/image/heart.png" width="30px" height="30px">${item.like_count }</td></tr>
						</c:forEach>
						</tbody>
						</table>
					</div>


		</div>

	</div>

<div class="download_part">
		<div class="head_title">
			<p>투투 가이드북</p>
		</div>
		<div class="offset-md-9 move_to_">
			<a href="afterBbs.do"><p class="view_toditor">전체보기</p></a>
		</div>
		<div class="4th_best_content">

				<div class="row content col-md-10" style="border: 1px solid #dcdcdc; padding:20px; ">
						<div class="row col-md-9">
						<div class="tag-location">
								<ul>
									<li class="active">
										<a href="toto_guide.do" class="cur">전체</a>
									</li>
									<li class="">
										<a href="#" class="cur" onclick="location_search()">서울</a>
									</li>
									<li class="">
										<a href="#" class="cur" onclick="location_search()">강원도</a>
									</li>
									<li class="">
										<a href="#" class="cur" onclick="location_search()">충청도</a>
									</li>
									<li class="">
										<a href="#" class="cur" onclick="location_search()">경상도</a>
									</li>
									<li class="">
										<a href="#" class="cur" onclick="location_search()">전라도</a>
									</li>
									<li class="">
										<a href="#" class="cur" onclick="location_search()">제주도</a>
									</li>
								</ul>
						</div>
						</div>
						<div class="col-md-3">
							<div class="downloadcount">
							<span><strong>전체 다운로드 수</strong></span>&nbsp;<span style="color: #7DC3BB;"><strong><fmt:formatNumber value="${downcount }" type="number"/></strong></span>
							</div>
						</div>

						<div class="myplan-content">
						<div class="row">

								<c:if test="${empty totolist }">
									<div class="col-md-11 text-center col-xs-12">
										<p>작성된 글이 없습니다</p>
									</div>
								</c:if>
								<div class="row no-gutters">
									<c:forEach items="${totolist }" var="toto" varStatus="i">

										<div class="book-card">
											<div class="book-img" onclick="location.href='toto_detail.do?seq=${toto.seq }'">
												<img class=book-img-top" src="${toto.pic eq null ? 'image/no-img.png' : toto.pic}" style="cursor: pointer; width: 162px; heigh:200px;">
											</div>
											<div class="book-info" style="height: 25px; width: 162px; text-align: center;">
													<span class="update-text">${toto.location }</span>
											</div>
										</div>
									</c:forEach>
									</div>


						</div>
						</div>


				</div>


		</div>

	</div>



</div><!--  하단부 내용 -->


<script>
function move_to_aaa() {
	location.href="editor_essay.do";
}

$(function() {
	var sBtn = $("li");
	sBtn.find("a").click(function() { // sBtn에 속해 있는  a 찾아 클릭 하면.
		sBtn.removeClass("active"); // sBtn 속에 (active) 클래스를 삭제 한다.
		$(this).parent().addClass("active"); // 클릭한 a에 (active)클래스를 넣는다.
	})
});

</script>
