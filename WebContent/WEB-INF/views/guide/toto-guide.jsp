<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<style>
#title-sub{
	top: -20px;
}
.guide-info-over {
	position: absolute;
	background-color: #fff;
	padding: 15px;
	margin: 10px;
	width: 90%;
	border-radius: 15px;
	border: 1px solid #7DC3BB;
	top: 100px;
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

.gu-link:link {text-decoration: none; color: #000000;}
.gu-link:hover {text-decoration: underline; color: #7DC3BB;}
.gu-link:visited {text-decoration: none; color: #000000;}

h2 {
    display: block;
    font-size: 2rem;
    -webkit-margin-before: 0.83em;
    -webkit-margin-after: 0.83em;
    -webkit-margin-start: 0px;
    -webkit-margin-end: 0px;

}

.book-card{
	float: left;
	padding: 0;
    width: 138px;
    height: 305px;
    margin: 30px;
    border-top: 2px solid #7DC3BB;
}

.title-sub-content{
	padding: 0 400px 0 0;
}

.update-text{
	font-size: 13px;
	color: #484848;
}

.toto-title{
	margin-bottom: -20px;
}

.tag-location{
	float: left;
	display: inline-block;
    height: 49px;
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

li.cur.active{
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

.cur-all:link {text-decoration: none; color: #000000;}
.cur-all:hover {text-decoration: none; color: #7DC3BB;}
.cur-all:visited {text-decoration: none; color: #000000;}

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

.editor-title-container {
	margin-top: 20px;
	width: 100%;
}
.myplan-content {
	width: 100%;
}
b{
font-size: x-large;
color: #7DC3BB;
}
</style>


<div class="row no-gutters">
	<div class="editor-title-container">
		<div class="row no-gutters">
			<div class="offset-md-2 col-md-7">
				<h3>투투 가이드북</h3>
				<p>투디터들과 투투 운영진이 엄선한 가이드북</p>
			</div>
		</div>
		<div class="row no-gutters">
			<div class="offset-md-8 col-md-2">
				<strong>전체 다운로드 수</strong> &nbsp; 
				<c:choose>
					<c:when test="${totolist.get(0).total_downcount eq 0 }">
						<strong style="color: #7DC3BB;">0</strong>
					</c:when>
					<c:otherwise>
						<strong style="color: #7DC3BB;"><fmt:formatNumber value="${totolist.get(0).total_downcount }" type="number" /></strong>							
					</c:otherwise>
				</c:choose>
			</div>
		</div>
		<div class="row no-gutters">
			<div class="offset-md-2 col-md-8"><hr></div>
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
	<div class="col-md-8">
		<div class="d-flex justify-content-between">
			<div class="tag-location">
				<ul>
						<li class="active">
					<a href="toto_guide.do" class="cur-all">전체</a>
				</li>
				<li class="">
					<a href="#" class="cur" value="서울">서울</a>
				</li>
				<li class="">
					<a href="#" class="cur" value="강원">강원도</a>
				</li>
				<li class="">
					<a href="#" class="cur" value="충청">충청도</a>
				</li>
				<li class="">
					<a href="#" class="cur" value="경상">경상도</a>
				</li>
				<li class="">
					<a href="#" class="cur" value="전라">전라도</a>
				</li>
				<li class="">
					<a href="#" class="cur" value="제주">제주도</a>
				</li>
				</ul>
			</div>
		</div>
		<div class="row no-gutters">
			<div class="myplan-content text-center">
				<c:if test="${empty totolist }">
					<div class="d-flex justify-content-center align-items-center" style="height:400px;">
						<p>작성된 글이 없습니다</p>
					</div>
				</c:if>


				<c:forEach items="${totolist }" var="toto" varStatus="i">
					<div class="book-card">
						<div class="book-img" onclick="location.href='toto_detail.do?seq=${toto.seq }'">
							<img class=book-img-top" src="${initParam.IMG_SERVER_PATH}/image/${toto.pic}" style="cursor: pointer; width="300px" height="200px">
						</div>
						<div class="book-info">
								<span class="update-text">업데이트 : ${fn:substring(toto.last_updated, 0, 10) }</span>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>

</div>




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
	//alert("local"+location);

	$.ajax({
		url:"toto_search.do",
		method:"post",
		data:{location:local},
		success:function(data){
			$(".myplan-content").children().remove();

			for(var i=0; i<data.length; i++ ){
				printTotolistHtml(data[i]);
			}
		},
		error : function(req, sta, err){
			//alert("error");
		}
	})
});

function printTotolistHtml(toto) {
	var last = toto.last_updated;
	var str = last.substring(0, 10);
	var html = '<div class="book-card">'
		+'<div class="book-img" onclick="location.href=toto_detail.do?seq='+toto.seq+'">'
		+'<img class="book-img-top" src="${initParam.IMG_SERVER_PATH}/image/'+toto.pic+'" style="cursor: pointer; width:137px; height:200px;">'
		+'</div>'
		+'<div class="book-info">'
		+'<span class="update-text">업데이트 : '+str+'</span>'
		+'</div>'
		+'</div>';
		$(".myplan-content").append(html);
}
</script>
