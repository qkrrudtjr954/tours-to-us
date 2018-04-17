<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
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
.overlay-like-info {
	margin-right: 15px;
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

#like_best {
	position: absolute;
	top: 5px;
	left: 240px;
}

#likecount {
	color: #ffffff;
	text-shadow: 5px 5px 5px #444444;
}

.overlay {
	position: absolute;
	top: 0;
	bottom: 0;
	left: 0;
	right: 0;
	height: 100%;
	width: 100%;
	opacity: 0;
	transition: .5s ease;
	background-color: rgba(0, 0, 0, 0.63);
}

#hovereffect:hover .overlay {
	opacity: 1;
}

.overlay-content span {
	color: #ffffff;
}

.btn_write_div {
	padding-top: 15px;
}
#_btnSearch {
	border-radius: 3px;
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
.menu-item {
	font-size: 15px;
}
.planer-label-icon {
	vertical-align: middle;
	margin: 0px 3px;
}

.editor-title-container {
	margin-top: 20px;
	width: 100%;
}

.overlay-container {
	height: 300px;
}
.overlay-content {
	position: absolute;
    bottom: 10px;
    left: 20px;
}

.overlay-like-info {s
	position: absolute;
    right: 7%;
    top: 3%;
}
</style>

<div class="row no-gutters">
	<div class="editor-title-container">
		<div class="offset-md-2 col-md-10">
			<h3>투디터 pick!</h3>
			<p>투디터들이 엄선한 여행지 꿀팁&맛집 pick!</p>
			<hr>
		</div>
	</div>
</div>

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
	<div class="col-md-9">
		<div class="row no-gutters">
			<div class="best_edit">
				<!-- 베스트 에디터  div -->
				<div id="header" align="center" style="padding: 10px;">
					<span id="best_edit_head">TO-ditor's BEST PICK</span>
				</div>

				<div id="carouselExampleControls" class="carousel slide"
					data-ride="carousel">
					<div class="carousel-inner">
						<div class="carousel-item active">
							<div class="row no-gutters">
								<c:forEach items="${b1list }" var="item" begin="0" end="2" varStatus="i">
									<div class="col-md-4" style="padding: 0px 5px; height: 300px;"  id="hovereffect">
										<img class="card-img-top" src="${initParam.IMG_SERVER_PATH }/image/${item.pic1 }" height="300px">

										<div class="overlay" onclick="location.href='toditor_detail.do?seq=${item.seq }'">
											<div class="overlay-like-info d-flex justify-content-end align-items-center">
												<img src="image/hearticon.png">
												<span id="likecount">${item.like_count }</span>
											</div>
											<div class="overlay-content">
												<span data-feather="map-pin" style="color: rgb(26, 188, 156);"></span>
												<span>${item.category }<br> <b>${item.title }</b><br>
													Editor: ${item.name }
												</span>
											</div>
										</div>
									</div>
								</c:forEach>
							</div>
						</div>
						<div class="carousel-item">
							<div class="row no-gutters">
								<c:forEach items="${b1list }" var="item" begin="3" end="5" varStatus="i">
									<div class="col-md-4" style="padding: 0px 5px; height: 300px;"  id="hovereffect">
										<img class="card-img-top" src="${initParam.IMG_SERVER_PATH }/image/${item.pic1 }" height="300px">
										<div class="overlay" onclick="location.href='toditor_detail.do?seq=${item.seq }'">
											<div class="overlay-like-info d-flex justify-content-end align-items-center">
												<img src="image/hearticon.png">
												<span id="likecount">${item.like_count }</span>
											</div>
											<div class="overlay-content">
												<span data-feather="map-pin" style="color: rgb(26, 188, 156);"></span>
												<span>${item.category }<br> <b>${item.title }</b><br>
													Editor: ${item.name }
												</span>
											</div>
										</div>
									</div>
								</c:forEach>

							</div>
						</div>
					</div>
					<a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev"> <span class="carousel-control-prev-icon" aria-hidden="true"></span> <span class="sr-only">Previous</span></a>
					<a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next"> <span class="carousel-control-next-icon" aria-hidden="true"></span> <span class="sr-only">Next</span></a>
				</div>
			</div>
		</div>

		<div class="row no-gutters">
			<div class="col-md-12 col-xs-12 search_menu">
				<form name="frmForm1" id="_frmFormSearch" method="post" action="">
					<div class="d-flex justify-content-around align-items-center">
						<div class="d-flex justify-content-center align-items-center" style="width:100%">
							<div class="serch_select">
								<select class="custom-select" id="_s_category" name="s_category">
									<option value="title">제목</option>
									<option value="contents">내용</option>
								</select>
							</div>
							<div class="input-group" style="width: 70%;">
								<input type="text" class="form-control" id="_s_keyword" name="s_keyword" value="${s_keyword}" placeholder="검색어를 입력해주세요">
								<div class="input-group-append">
									<button class="btn btn-outline-secondary" type="button" id="_btnSearch">
										<span data-feather="search"></span>
									</button>
									<input type="hidden" name="pageNumber" id="_pageNumber" value="0" />
									<input type="hidden" name="recordCountPerPage" id="_recordCountPerPage" value="${(empty recordCountPerPage)?9:recordCountPerPage}" />
								</div>
							</div>
						</div>

						<button class="btn btn-outline-secondary" id="btn_write">에디터 글쓰기</button>

					</div>
				</form>
			</div>
		</div>

		<br>


		<div class="row">
			<c:forEach items="${bbslist }" var="item" varStatus="i">
				<div class="col-md-4">
					<div class="card mb-4 box-shadow">
						<div class="card-img">
							<c:choose>
								<c:when test="${item.pic1 eq null }">
									<img class="card-img-top" src="image/no-img.png" height="300px">
								</c:when>
								<c:otherwise>
									<img class="card-img-top"
										src="${initParam.IMG_SERVER_PATH }/image/${item.pic1 }"
										height="300px">
								</c:otherwise>
							</c:choose>
							<span id="like"><img src="image/hearticon.png">${item.like_count }</span>
						</div>
						<div class="card-body"
							onclick="location.href='toditor_detail.do?seq=${item.seq }'"
							style="cursor: pointer;">
							<span data-feather="map-pin" style="color: rgb(26, 188, 156);"></span>
							<span id="location">${item.category }</span><br> <span
								style="font-size: 15px; font-weight: bold;">${item.title }</span>&nbsp;<span style="font-size: 12px; color: #f37720;">[${item.comment_count }]</span><br>
							<span
								style="font-size: 14px; float: right; color: #484848; font-weight: 200;">Editor:
								${item.name }</span>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>

		<!-- 페이징처리 -->

		<div id="paging_wrap">
			<jsp:include page="/WEB-INF/views/common/paging.jsp" flush="false">
				<jsp:param value="${pageNumber }" name="pageNumber" />
				<jsp:param value="${pageCountPerScreen }" name="pageCountPerScreen" />
				<jsp:param value="${recordCountPerPage }" name="recordCountPerPage" />
				<jsp:param value="${totalRecordCount }" name="totalRecordCount" />
			</jsp:include>
		</div>

		<!-- 페이징처리 -->


		<!-- 내용 div 끝 -->
	</div>
</div>

<script>
	$('#btn_write').click(function() {
		location.href = "toditor_write.do";
	});

	$(document).ready(function() {
		$("#_s_category > option[value=" + '<c:out value="${ pv.s_category }"/>' + "]").attr("selected", "selected");
	});

	$("#_btnSearch").click(function() {
		//alert('search');
		$("#_frmFormSearch").attr({
			"target" : "_self",
			"action" : "editor_essay.do"
		}).submit();
	});
	function goPage(pageNumber) {
		$("#_pageNumber").val(pageNumber);
		$("#_frmFormSearch").attr("target", "_self").attr("action",
				"editor_essay.do").submit();
	}
</script>
