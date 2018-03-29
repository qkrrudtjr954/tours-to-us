<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<div class=event-title">
	<div class="offset-md-2 col-md-4 col-xs-12">
		<h2>진행 중 EVENT</h2>
	</div>
</div>
<div class="offset-md-2  col-md-8 col-xs-12">
	<hr>
</div>

<div class="event-detail">
	<div class="row">
		<div class="offset-md-2 col-md-4 col-xs-12">
			<span class="badge badge-pill" style="background-color: #7DC3BB; color: #fff">${e_dto.category }</span>&nbsp;
			<h2>${e_dto.title }</h2>
		</div>
	</div>
	<br>
	
	<div class="row">
		<div class="offset-md-8">
			<span style="font-size: medium; font-weight: initial;">${e_dto.from_date } ~ ${e_dto.to_date }</span>
		</div>
	</div>
		<br><br><br>

	<div class="row">
		<div class="offset-md-3 col-md-8 col-xs-12">
			<span>${e_dto.content }</span>
		</div>
	</div>
</div>