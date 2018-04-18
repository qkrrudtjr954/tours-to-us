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

.ti-link:link {text-decoration: none; color: #000000;}
.ti-link:hover {text-decoration: underline; color: #7DC3BB;}
.ti-link:visited {text-decoration: none; color: #000000;}

.gu-link:link {text-decoration: none; color: #000000;}
.gu-link:hover {text-decoration: underline; color: #7DC3BB;}
.gu-link:visited {text-decoration: none; color: #000000;}

/* input.img_button {
	background: url(./image/search.png) no-repeat;
	width: 40px;
	height: 35px;
	border: none;
	cursor: pointer;
} */

.guide-info-over {
	position: absolute;
	background-color: #fff;
	padding: 15px;
	margin: 10px;
	width: 90%;
	border-radius: 15px;
	border: 1px solid #7DC3BB;
}

.gu-link{
	text-align: left;
}

.guide-label-icon{
text-align: center;
}

.guide-info-top{
	background-color: #7DC3BB;
	margin-top: 10px;
	margin-bottom: 10px;
	text-align: center;
}

.guide-label-atag{
	line-height: 1.5;
}

h2 {
    display: block;
    font-size: 2rem;
    -webkit-margin-before: 0.83em;
    -webkit-margin-after: 0.83em;
    -webkit-margin-start: 0px;
    -webkit-margin-end: 0px;

}
.list-text{
	height: 100%;
    width: 100%;
    vertical-align: super;
}

#title-sub{
	top: -20px;
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

.user-guide-table {
	width: 100%;
}

#_frmFormSearch {
	width : 100%;
}
#_frmFormSearch > div{
	margin: 10px 0px;
}

.editor-title-container {
	margin-top: 20px;
	width: 100%;
}

</style>

<div class="row no-gutters">
	<div class="editor-title-container">
		<div class="offset-md-2 col-md-8">
			<h3>투둥이 가이드북</h3>
			<p>투둥이 유저들의 여행 플랜들</p>

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
	<div class="col-md-8 col-xs-12">
		<div class="row no-gutters">
			<form action="guideSearch.do" method="get" id="_frmFormSearch">
				<div class="d-flex justify-content-center">
					<div class="input-group-prepend">
						<select class="custom-select" id="_s_category" name="s_category" style="width: 150px; height: 45px;">
							<option value="title">제목</option>
							<option value="location">지역</option>
						</select>
						<input type="text" class="form-control" aria-label="Text input with segmented dropdown button" size="50" name="s_keyword" id="text">
					</div>
					<div class="serach">
						<button class="btn btn-outline-secondary" type="button" id="btnSearch">
							<span data-feather="search"></span>
						</button>
					</div>
					<div class="total-list-button">
						<button class="btn btn-outline-secondary" type="button" id="list" onclick="user_guide()">
							<span data-feather="list"></span><span class="list-text">전체리스트</span>
						</button>
					</div>
				</div>
				<input type="hidden" name="pageNumber" id="_pageNumber" value="0" />
				<input type="hidden" name="recordCountPerPage" id="_recordCountPerPage" value="${(empty recordCountPerPage)?10:recordCountPerPage}" />
			</form>
		</div>

		<div class="row no-gutters">
			<div class="user-guide-table">
				<table class="table">
					<colgroup>
						<col style="width: 30px;" />
						<col style="width: 70px;" />
						<col style="width: 100px;" />
						<col style="width: 100px;" />
						<col style="width: 100px;" />
					</colgroup>
					<thead>
						<tr>
							<th>번호</th>
							<th>지역</th>
							<th>제목</th>
							<th>작성자</th>
							<th>여행기간</th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${empty planlist }">
							<div class="col-md-12 text-center col-xs-12">
								<p>작성된 글이 없습니다</p>
							</div>
						</c:if>

						<c:forEach items="${planlist }" var="plan" varStatus="i">
							<tr>
								<td>${i.count }</td>
								<td>${plan.location }</td>
								<td><a href="guideDetail.do?seq=${plan.seq }"
									class="ti-link">${plan.title }</a></td>
								<td>${plan.name }</td>
								<td>${plan.from_date }&nbsp;~&nbsp;${plan.to_date }</td>
							</tr>
						</c:forEach>

					</tbody>
				</table>
			</div>
		</div>
		<div id="paging_wrap">
			<jsp:include page="/WEB-INF/views/common/paging.jsp" flush="false">
			   <jsp:param value="${pageNumber }" name="pageNumber"/>
			   <jsp:param value="${pageCountPerScreen }" name="pageCountPerScreen"/>
			   <jsp:param value="${recordCountPerPage }" name="recordCountPerPage"/>
			   <jsp:param value="${totalRecordCount }" name="totalRecordCount"/>
			</jsp:include>
		</div>
	</div>
</div>



<script>
$(document).ready(function() {
    $("#_s_category > option[value="+'<c:out value="${ param.s_category }"/>'+"]").attr("selected","selected");

 });

 $("#btnSearch").click(function() {
    //alert('search');

	 var text = $("#text").val();
	   if(text===""){
		   alert("검색창이 비웠습니다");
			$("#text").focus();

	   }else{

    $("#_frmFormSearch").attr({ "target":"_self", "action":"user_guide.do" }).submit();
   }

});

 $("#text").keypress(function(event) {
		var text = $("#text").val();

		if (event.which == "13") {
			event.preventDefault();
			if (text === "") {
				alert("검색창이 비웠습니다");
				$("#text").focus();
			} else {
				$("#btnSearch").click();
			}

		}
	});



 function goPage(pageNumber) {
    $("#_pageNumber").val(pageNumber) ;
    $("#_frmFormSearch").attr("target","_self").attr("action","user_guide.do").submit();
 }

 function user_guide() {
	location.href="user_guide.do";
}
</script>

<script>
	$(function() {
		var sBtn = $("li");
		sBtn.find("a").click(function() { // sBtn에 속해 있는  a 찾아 클릭 하면.
			sBtn.removeClass("active"); // sBtn 속에 (active) 클래스를 삭제 한다.
			$(this).parent().addClass("active"); // 클릭한 a에 (active)클래스를 넣는다.
		})
	});

</script>

<script>
$(".cur").click(function () {
	var local = $(this).attr('value');

	$.ajax({
		url:"user_search.do",
		method:"post",
		data:{location:local},
		success:function(data){
			$(".table-ajax").children().remove();
			var leng=data.length;
			for(var i=0; i<data.length; i++ ){
				printUserlistHtml(data[i], i);
			}
		},
		error : function(req, sta, err){
			//alert("error");
		}
	})
});

function printUserlistHtml(plan, index) {
	var count =0;
	var html = '<tr>'
		+'<td>'+(index+1)+'</td>'
		+'<td>'+plan.location+'</td>'
		+'<td>'
		+'<a href="guideDetail.do?seq='+plan.seq+'" class="ti-link">'+plan.title+'</a>'
		+'</td>'
		+'<td>'+plan.name+'</td>'
		+'<td>'+plan.from_date+'&nbsp;~&nbsp;'+plan.to_date+'</td>'
		+'</tr>'
		$(".table-ajax").append(html);
		 /* for(var i=0;i<leng;i++){
			count ++;
		}  */
}
</script>
