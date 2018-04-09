<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<style>


h2 {
    display: block;
    font-size: 2rem;
    -webkit-margin-before: 0.83em;
    -webkit-margin-after: 0.83em;
    -webkit-margin-start: 0px;
    -webkit-margin-end: 0px;
   
} 

.title:link {text-decoration: none; color: #000000;}
.title:hover {text-decoration: underline; color: #7DC3BB;}
.title:visited {text-decoration: none; color: #000000;}

</style>

<div class=event-title">
	<div class="offset-md-2 col-md-4 col-xs-12">
		<h2>진행 중 EVENT</h2>
	</div>
</div>
<div class="offset-md-2  col-md-8 col-xs-12">
	<hr>
</div>

<div class="event-table">
<div class="offset-md-2 col-md-8">
	<table class="table">
		<thead>
			<tr>
				<th>번호</th><th>제목</th><th>진행기간</th>  
			</tr>
		</thead>
		<tbody>
			<c:if test="${empty eventlist }">
				<div class="col-md-12 text-center col-xs-12">
					<p>작성된 글이 없습니다</p>
				</div>
			</c:if>			
			
			<c:forEach items="${eventlist }" var="event" varStatus="i">
				<tr>
					<td>${i.count }</td>
				
					<td> 
						<c:choose>
							<c:when test="${event.category eq '항공'}">
								<span class="badge badge-pill" style="background-color: #3CC2FF; color: #fff">${event.category }</span>&nbsp;								
							</c:when>
							<c:when test="${event.category eq '호텔'}">
								<span class="badge badge-pill" style="background-color: #FF5050; color: #fff">${event.category }</span>&nbsp;
							</c:when>
							<c:otherwise>
								<span class="badge badge-pill" style="background-color: #FFF064; color: #fff">${event.category }</span>&nbsp;
							</c:otherwise>
						</c:choose>
						<a href="eventDetail.do?seq=${event.seq }" class="title">${event.title }</a>
					</td>
				
					<td>${event.from_date } ~ ${event.to_date }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>
</div>