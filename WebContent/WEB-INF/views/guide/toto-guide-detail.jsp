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

.toto-downcount{
	font-size: 13px;
	color: #484848;
	margin-left: 140px;
}

.toto-readcount{
	font-size: 13px;
	color: #484848;
	margin-left: 900px;
}

.toto-content{
	font-size: 13px;
	color: #000;
    width: 370px;
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
	margin-left: -30px;
    margin-top: 60px;
}

.toto-downBtn{
    margin-top: 50px;
}

#toto-pic-box{
    margin-right: 90px;
    margin-left: 0;
    /* border-right: 1px solid #DCDCDC; */
}

#downBtn{
	width: 300px;
	margin-left: 30px;
}

</style>

<div class="toto-location">
	<div class="offset-md-2 col-md-4 col-xs-12">
		<h2 class="guide-title">${toto.location }</h2>
	</div>
</div>
<div class="offset-md-2  col-md-8 col-xs-12">
	<span class="toto-readcount">조회수 : ${toto.readcount }</span>
	<hr>
</div>

<div class="toto-div">
	<div class="row">
		<div class="offset-md-3 col-md-4 ">
			<div class="row no-gutters" id="toto-pic-box">
				<div class="toto-img">
					<img class="toto-img-top"  src="${toto.pic eq null ? 'image/no-img.png' : toto.pic}" width="300px" height="355px">
				</div>
			</div>
		</div>
		<div class="col-md-5" id="toto-box">
			<div class="row toto-body">
				<span class="toto-title" style="font-weight: bold; font-size: 20px;">${toto.title }</span>
			</div>
			<div class="row toto-content-sub">
				<span class="toto-updated" style="font-weight: bold;">업데이트 : </span>&nbsp;<span class="toto-updated">${fn:substring(toto.last_updated, 0, 10) }</span>
				<span class="toto-downcount" style="font-weight: bold;">다운로드 수 : </span>&nbsp;<span class="toto-updated">${toto.downcount }</span>
			</div>
			<div class="row col-md-8" id="under-line">
				<hr>
			</div>
			<div class="row row-content">
				<span class="toto-content" style="fo">추가 설명 : ${toto.content }</span>
			</div>
			<div class="row toto-downBtn">
				<button class="btn btn-outline-secondary" id="downBtn" onclick="filedown('${toto.filename}','${toto.seq}')"><span data-feather="download"></span><span>다운로드</span></button>
			</div>
		</div>
	</div>
</div>
<form name="delfileup" action="toto_download.do" method="post">
<input type="hidden" name="filename" />
<input type="hidden" name="seq" />
</form>

<script>
function filedown(filename,seq){
	//alert(filename+'  '+seq);
	var doc=document.delfileup;
	doc.filename.value=filename;
	doc.seq.value=seq;
	doc.submit();
}

//'저장' 버튼을 누르는 등 저장을 위한 액션을 했을 때 submitContents가 호출된다고 가정한다.
function submitContents(elClickedObj) {
   // 에디터의 내용이 textarea에 적용된다.
   oEditors[0].exec("UPDATE_CONTENTS_FIELD", []);
 
   // 에디터에 입력된 내용의 검증은 이곳에서
   // document.getElementById("ir1").value 값을 이용해서 처리한다.
   //alert(ares+'------------------------');
   try{
       // 이 라인은 현재 사용 중인 폼에 따라 달라질 수 있다.
       //elClickedObj.action.value=ares;
       elClickedObj.submit();
   }catch(e){}
}

var oEditors = [];
nhn.husky.EZCreator.createInIFrame({
    oAppRef: oEditors,
    elPlaceHolder: "_content",
    sSkinURI: "./se2/SmartEditor2Skin.html",
    fCreator: "createSEditor2"
});
</script>