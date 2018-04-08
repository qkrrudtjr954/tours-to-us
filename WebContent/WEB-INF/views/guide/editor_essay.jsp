<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
#floatMenu {
	position: absolute;
	width: 200px;
	height: 300px;
	left: 50px;
	top: 200px;
	background-color: #ffffff;
	color: black;
}

.best_edit {
	padding: 10px;
	margin: 20px;
	border-radius: 10px;
	background-color: rgb(224, 224, 224);
	padding-bottom: 20px;
}

#best_edit_head {
	display: inline-block;
	font-size: 11px;
	letter-spacing: 0.2em;
	background: #444;
	background-image: initial;
	background-position-x: initial;
	background-position-y: initial;
	background-size: initial;
	background-repeat-x: initial;
	background-repeat-y: initial;
	background-attachment: initial;
	background-origin: initial;
	background-clip: initial;
	background-color: rgb(68, 68, 68);
	background-color: #444444;
	color: #ffffff;
	padding: 6px 12px;
	padding-top: 6px;
	padding-right: 12px;
	padding-bottom: 6px;
	padding-left: 12px;
}

#location {
	margin-left: 5px;
	font-size: 14px;
}

#best_content {
	padding-left: 15px;
	padding-right: 15px;
}

.card-img {
	position: relative;
}

#like {
	position: absolute;
	top: 13px;
	right: 15px;
	color: #ffffff;
	text-shadow: 5px 5px 5px #444444;
}

#like_best{
	position: absolute;
	top: 5px;
	left: 240px;
	
}
#likecount{
	position: absolute;
	top: 17px;
	left: 290px;
	color: #ffffff;
	text-shadow: 5px 5px 5px #444444;
}

#hovereffect {
	width: 100%;
	height: 100%;
	float: left;
	overflow: hidden;
	position: relative;
	text-align: center;
	cursor: default;
}

.overlay {
	margin-left: 15px;
	margin-right: 15px;
	position: absolute;
	top: 0;
	bottom: 0;
	left: 0;
	right: 0;
	height: 100%;
	width: 92%;
	opacity: 0;
	transition: .5s ease;
	background-color: rgba(0, 0, 0, 0.63);
}

#hovereffect:hover .overlay {
	opacity: 1;
}

#hovereffect img {
	display: block;
	position: relative;
	-webkit-transition: all 0.35s;
	transition: all 0.35s;
}

.overlay-content {
	position: absolute;
	top: 200px;
	left: 15px;
	text-align: left;
	padding-left: 20px;
}

.overlay-content span {
	color: #ffffff;
}

.btn_write_div{
padding-top:15px;
}
/* hr{ 
  
    border:         none;
    border-left:    1px solid hsla(200, 10%, 50%,100);
    height:         100vh;
    width:          1px;       
} */
</style>

<div id="floatMenu">
<ul style="width:100%; list-style-type: none;" class="menu_">
	<li class="title"><h2>가이드북</h2></li>
</ul>

<div class="menu_table">
		<ul style="list-style-type: none">
			<li class="title">나의 플랜</li>
			<li class="menu_item">
				<a href="#none" onclick="url_myplan()" class="nav-link" title="나의 플랜보기" >나의 플랜보기</a>
			</li>
			<li class="title">회원정보관리</li>
			<li class="menu_item">
				<a href="mypage.do" class="nav-link" title="회원정보수정">회원정보수정</a>
			</li> 
		</ul>
	</div>
</div>




<div class="offset-md-2 col-md-9"> <!-- 내용 div -->
<br><br>

<h3>투디터  pick!</h3>
<p>투디터들이 엄선한 여행지 꿀팁&맛집 pick! </p>
<hr>
<div class="best_edit"><!-- 베스트 에디터  div -->
	<div id="header" align="center" style="padding: 10px;">
		<span id="best_edit_head">TO-ditor's BEST PICK</span>
	</div>

 	<div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
  <div class="carousel-inner">
    <div class="carousel-item active">
      <div class="row">
      <c:forEach items="${b1list }" var="item" begin="0" end="2" varStatus="i">
      	 <div class="col-md-4" id="hovereffect">
						<img class="card-img-top" src="${item.pic1 }" height="300px">			
				<div class="overlay">
				<span id="like_best"><img src="image/hearticon.png"></span><span id="likecount">${item.like_count }</span>
					<div class="overlay-content">					
					<span data-feather="map-pin" style="color: rgb(26, 188, 156);  "></span>
					<span>${item.category }<br>
					<b>${item.title }</b><br>
					Editor: ${item.name }</span>
					</div>
				</div>
		  </div>
		  	</c:forEach>	
      </div>
    </div>
    <div class="carousel-item">
  <div class="row">
      	   <c:forEach items="${b1list }" var="item" begin="3" end="5"  varStatus="i">
      	 <div class="col-md-4" id="hovereffect">
						<img class="card-img-top" src="${item.pic1 }" height="300px">			
				<div class="overlay">
				<span id="like_best"><img src="image/hearticon.png"></span><span id="likecount">${item.like_count }</span>
					<div class="overlay-content">
					<span data-feather="map-pin" style="color: rgb(26, 188, 156);  "></span>
					<span>${item.category }<br>
					<b>${item.title }</b><br>
					Editor: ${item.name }</span>
					</div>
				</div>
		  </div>
		</c:forEach>	
	
      </div>
    </div>
  </div>
  <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>
</div>


<div class="row search_menu">
	<div class="col-md-2 serch_select">	
	<form name="frmForm1" id="_frmFormSearch" method="post" action="">	
		<select class="custom-select" id="_s_category" name="s_category">
			<option value="title">제목</option>
			<option value="contents">내용</option>
		</select>
	</div>
	<div class="input-group col-md-6">
 		 <input type="text" class="form-control" id="_s_keyword" name="s_keyword" value="${s_keyword}" placeholder="검색어를 입력해주세요" aria-label="Recipient's username" aria-describedby="basic-addon2">
 		 <div class="input-group-append">
 			   <button class="btn btn-outline-secondary" type="button" id="_btnSearch" ><span data-feather="search"></span></button>
 			   <input type="hidden" name="pageNumber" id="_pageNumber" value="0"/>						
			   <input type="hidden" name="recordCountPerPage" id="_recordCountPerPage" value="${(empty recordCountPerPage)?9:recordCountPerPage}"/>		
 		 </div>
	</div>	
	</form>	
	
	
</div>
<div class="row btn_write_div">
		<button class="form-control offset-md-9 col-md-2" id="btn_write">에디터 글쓰기</button>
	</div>
<br>


<div class="row content">
		<c:forEach items="${bbslist }" var="item" varStatus="i">
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
					<div class="card-body" onclick="location.href='toditor_detail.do?seq=${item.seq }'">
						<span data-feather="map-pin" style="color: rgb(26, 188, 156);"></span>
						<span id="location">${item.category }</span><br> 
						<span style="font-size: 15px; font-weight: bold;">${item.title }</span><br>
						<span style="font-size: 14px; float: right; color: #484848; font-weight: 200;">Editor: ${item.name }</span>
					</div>
				</div>
			</div>
		</c:forEach>


	</div>

<!-- 페이징처리 -->

<div id="paging_wrap">
<jsp:include page="/WEB-INF/views/common/paging.jsp" flush="false">
	<jsp:param value="${pageNumber }" name="pageNumber"/>
	<jsp:param value="${pageCountPerScreen }" name="pageCountPerScreen"/>
	<jsp:param value="${recordCountPerPage }" name="recordCountPerPage"/>
	<jsp:param value="${totalRecordCount }" name="totalRecordCount"/>
</jsp:include>

</div>

<!-- 페이징처리 -->


<!-- 내용 div 끝 -->
</div>

<script>
$('#btn_write').click(function () {
	location.href="toditor_write.do";
});

$(document).ready(function() {
	
	$("#_s_category > option[value="+'<c:out value="${ pv.s_category }"/>'+"]").attr("selected","selected");
	
				
});

$("#_btnSearch").click(function() {
	//alert('search');						
	$("#_frmFormSearch").attr({ "target":"_self", "action":"editor_essay.do" }).submit();
});
function goPage(pageNumber) {	
	$("#_pageNumber").val(pageNumber) ;
	$("#_frmFormSearch").attr("target","_self").attr("action","editor_essay.do").submit();
}

</script>