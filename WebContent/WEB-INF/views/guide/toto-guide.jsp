<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

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
.list-text{
	height: 100%;
    width: 100%;
    vertical-align: super;
}

.card {
	padding: 0;
	/* border: 1px solid #7DC3BB; */
}

.card-body{
	padding: 0;
	height: 300px;
	width: 500px;
	background-repeat: no-repeat;
	background-size: cover;
	background-position: center;
}

.card-pic{

}

.card-content{
	padding: 0;
	height: 100px;
	width: 200px;
	border-top: 1px solid #000;
	border-top-width: thin;
	background-repeat: no-repeat;
	background-size: cover;
	background-position: center;
}

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

<div class="myplan-title">
	<div class="offset-md-2 col-md-4 col-xs-12">
		<h2 class="guide-title">투투 가이드북</h2>
	</div>
	<div class="offset-md-2 col-md-4 col-xs-12" id="title-sub">
		<span>투디터들과 투투 운영진이 엄선한 가이드북</span>
	</div>
</div>
<div class="offset-md-2  col-md-8 col-xs-12">
	<hr>
</div>


<div class="myplan-content">
	<div class="row">
		<div class="offset-md-2">
			<c:if test="${empty totolist }">
				<div class="col-md-11 text-center col-xs-12">
					<p>작성된 글이 없습니다</p>
				</div>
			</c:if>
			<div class="row no-gutters">
			<c:forEach items="${totolist }" var="toto" varStatus="i">
				<div class="card col-md-6 col-md-4 col-xs-4 box-shadow">
					<div class="card-body">
						<img class="card-pic" src="${toto.pic eq null ? './image/no-img.png' : toto.pic}">
					</div>
					<div class="card-content">
						<span class="toto-title">${toto.title }</span>
						<span></span>
					</div>
				</div>
			</c:forEach>
			</div>
			
		</div>
	</div>
</div>

