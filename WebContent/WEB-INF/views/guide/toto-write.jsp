<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@ page contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<fmt:requestEncoding value="UTF-8" />

<style>
h2 {
    display: block;
    font-size: 2rem;
    -webkit-margin-before: 0.83em;
    -webkit-margin-after: 0.83em;
    -webkit-margin-start: 0px;
    -webkit-margin-end: 0px;
   
} 
</style>

<div class="toto-title">
	<div class="offset-md-2 col-md-6 col-xs-12">
		<h2 class="guide-title">가이드북 작성</h2>
	</div>
</div>
<div class="offset-md-2  col-md-8 col-xs-12">
	<hr>
</div>

<div class="offset-md-3">
<form name="frmForm" id="_frmForm" action="toto_upload.do" method="GET" enctype="multipart/form-data">
	<%-- <input type="hidden" name="seq" value="${ }"> --%>
	<div class="row">
		<div class="col-md-6">
			<label class="input-title">제목</label>
			<input type="text" name="title">
		</div>
	</div>
	<div class="row">
		<div class="col-md-6">
			<label class="input-file">파일</label>
			<input type="file" name="fileload">
		</div>
	</div>
	<div class="row">
		<div class="col-md-10">
			<label class="input-location">지역</label>
			<select class="form-control" id="location" name="location" style="width: 200px">
				<c:forEach var="part" items="${korea }">
					<option>${part.name }</option>
				</c:forEach>
			</select>
		</div>
	</div>
	<div class="row">
		<div class="col-md-6">
			<label class="input-content">내용</label>
			<textarea rows="10" cols="50" 	name="content" id="_content"></textarea>
		</div>
	</div>
	<div class="row">
		<div class="col-md-6">
			<!-- <span><a href="#none" id="_btnLogin" title="글쓰기" class="btn btn-outline-secondary">글쓰기</a></span> -->
			<input type="submit" value="업로드"> 
		</div>
	</div>
</form>
</div>

<script>
$("#_btnLogin").click(function() {	
	alert('글쓰기');	
	$("#_frmForm").submit();
});
</script>
