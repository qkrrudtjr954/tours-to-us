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
	padding: 0;
    width: 138px;
    height: 305px;
    margin: 2px 60px -30px 2px;
    border-top: 2px solid #7DC3BB;
}

.book-img{
	width: 211px;
    height: 305px;
}

.title-sub-content{
	padding: 0 400px 0 0;
}

.book-info{
    margin: -90px 0px 5px -40px;
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
    margin-left: -30px;
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
</style>

<div class="row no-gutters">
	<div class="col-md-2 col-xs-12">
		<div class="guide-info-over">
			<div class="guide-info-top">
				<p>
					<span class="guide-label-icon" data-feather="download"></span>
					<br>
					<span class="guide-label-title">투투 가이드북</span> 
				</p>
			</div>
				<hr style="color:white; width:100%;">		
				<p>
					<div class="guide-label-icon" style="text-align: center;">
						<span data-feather="bookmark"></span><br>
					</div>
					<span class="guide-label-atag"><a href="editor_essay.do" class="gu-link">투디터 pick</a></span> 
					<br>
					<span class="guide-label-atag"><a href="user_guide.do" class="gu-link">투둥이 가이드북</a></span>
					<br>
					<span class="guide-label-atag"><a href=toto_guide.do" class="gu-link">투투 가이드북</a></span>	
				</p>		
		</div>
	</div>
</div>

<div class="toto-title">
	<div class="offset-md-2 col-md-6 col-xs-12">
		<h2 class="guide-title">투투 가이드북</h2>
	</div>
	<div class="offset-md-2 col-md-12" id="title-sub">
		<span class="title-sub-content">투디터들과 투투 운영진이 엄선한 가이드북</span>
		<span>전체 누적 다운로드 수 : <b style="font-size: x-large;color: #7DC3BB;" class="downcount-font">${totalDowncount }</b></span>
	</div>
</div>
<div class="offset-md-2  col-md-8 col-xs-12">
	<hr>
</div>
<div class="row">
	<div class="offset-md-2 col-md-10">
		<div class="tag-location">
			<ul>
				<li class="active">
					<a href="toto_guide.do" class="cur">전체</a>
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
</div>

<br>

<div class="toto-content">
	<div class="row">
		<div class="offset-md-2 col-md-8 ">
			<c:if test="${empty totolist }">
				<div class="col-md-11 text-center col-xs-12">
					<p>작성된 글이 없습니다</p>
				</div>
			</c:if>
			<div class="row no-gutters toContent">
				<c:forEach items="${totolist }" var="toto" varStatus="i">
					<div class="book-card">
						<div class="book-img" onclick="location.href='toto_detail.do?seq=${toto.seq }'">
							<img class=book-img-top" src="${toto.pic eq null ? 'image/no-img.png' : toto.pic}" style="cursor: pointer; width="300px" height="200px">
						</div>
						<div class="book-info" style="height: 25px; width: 210px; text-align: center;">
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
			alert("toto"+data);
			$(".toContent").children().remove();
			
			for(var i=0; i<data.length; i++ ){
				printTotolistHtml(data[i]);
			}
		},
		error : function(req, sta, err){
			alert("error");
		}
	})
});

function printTotolistHtml(toto) {
	var html = '<div class="book-card">'
		+'<div class="book-img" onclick="location.href=toto_detail.do?seq='+toto.seq+'">'
		+'<img class="book-img-top" src="${'+toto.pic+' eq null ? "image/no-img.png" : '+toto.pic+'}" style="cursor: pointer;" width="300px" height="200px">'
		+'</div>'
		+'<div class="book-info" style="height: 25px; width: 210px; text-align: center;">'
		+'<span class="update-text">업데이트 : ${fn:substring('+toto.last_updated+', 0, 10) }</span>'			
		+'</div>'
		+'</div>';
		$(".toContent").append(html);
}
</script>
