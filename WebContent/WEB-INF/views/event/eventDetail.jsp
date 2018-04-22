<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<style>
.editor-title-container {
	margin-top: 20px;
	width: 100%;
}
</style>
		
<div class="row no-gutters">
	<div class="editor-title-container">
		<div class="offset-md-2 col-md-8">
			<h3>
				<c:choose>
					<c:when test="${e_dto.category eq '항공'}">
						<span class="badge badge-pill" style="background-color: #3CC2FF; color: #fff">${e_dto.category }</span>&nbsp;								
					</c:when>
					<c:when test="${e_dto.category eq '호텔'}">
						<span class="badge badge-pill" style="background-color: #FF5050; color: #fff">${e_dto.category }</span>&nbsp;
					</c:when>
					<c:otherwise>
						<span class="badge badge-pill" style="background-color: #FFF064; color: #fff">${e_dto.category }</span>&nbsp;
					</c:otherwise>
				</c:choose>
				${e_dto.title }
			</h3>
			
			<hr>
		</div>
	</div>
</div>

<div class="row no-gutters">
	<div class="editor-title-container">
		<div class="offset-md-2 col-md-8">
			<div class="d-flex justify-content-end align-item-center">
				<span style="font-size: medium;padding: 15px;margin: 0px 10px;">${e_dto.from_date } ~ ${e_dto.to_date }</span>
				<div class="btn-area">
					<a href="event.do" class="btn btn-primary" style="padding: 10px;">돌아가기</a>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="row no-gutters">
	<div class="col-md-6 offset-md-3">
		${e_dto.content }
	</div>
</div>