<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<style>
a .title{
text-decoration:none;
color: #000;
}
a .titile:hover {
text-decoration: underline; 
color: #7DC3BB;
}

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
						<span class="badge badge-pill" style="background-color: #7DC3BB; color: #fff">${event.category }</span>&nbsp;
						<a href="eventDetail.do?seq=${event.seq }" class="title">${event.title }</a>
					</td>
				
					<td>${event.from_date } ~ ${event.to_date }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>
</div>