<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<style>
.toto-img{
	width: 305px;
    height: 360px;
    margin-top: 30px;
    border-top: 2px solid #7DC3BB;
}

.toto-body{
	margin-top: 30px;
}

.toto-updated{
	font-size: 13px;
	color: #484848;
}

.toto-content{
	font-size: 13px;
	color: #000;
}

.row-content{
	margin-top: 10px;
}

.toto-content-sub{
	margin-left: -13px;
}

h2 {
    display: block;
    font-size: 2rem;
    -webkit-margin-before: 0.83em;
    -webkit-margin-after: 0.83em;
    -webkit-margin-start: 0px;
    -webkit-margin-end: 0px;
}

#under-line {
    border-bottom: 1px solid #000;
    width: 375px;
    margin-bottom: 10px;
    margin-top: -25px;
}

#toto-box{
	margin-left: -10px;
}

.toto-downBtn{
    margin-top: 50px;
}
</style>

<div class="toto-location">
	<div class="offset-md-2 col-md-4 col-xs-12">
		<h2 class="guide-title">${toto.location }</h2>
	</div>
</div>
<div class="offset-md-2  col-md-8 col-xs-12">
	<hr>
</div>

<div class="toto-div">
	<div class="row">
		<div class="offset-md-3 col-md-4 ">
			<div class="row no-gutters">
				<div class="toto-img">
					<img class="toto-img-top"  src="${toto.pic eq null ? 'image/no-img.png' : toto.pic}" width="300px" height="355px">
				</div>
			</div>
		</div>
		<div class="col-md-5" id="toto-box">
			<div class="row toto-body">
				<span class="toto-title" style="font-weight: bold; font-size: large;">${toto.title }</span>
			</div>
			<div class="row toto-content-sub">
				<span class="toto-updated">업데이트 : ${fn:substring(toto.last_updated, 0, 10) }</span>
			</div>
			<div class="row col-md-8" id="under-line">
				<hr>
			</div>
			<div class="row row-content">
				<span class="toto-content" style="fo">추가 설명 : ${toto.content }</span>
			</div>
			<div class="row toto-downBtn">
				<button class="btn btn-outline-secondary" style="width: 300px" onclick="filedown('${toto.filename}','${toto.seq}')"><span data-feather="download"></span><span>다운로드</span></button>
			</div>
		</div>
	</div>
</div>

<script>

</script>