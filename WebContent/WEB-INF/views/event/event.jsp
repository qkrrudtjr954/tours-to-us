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


.editor-title-container {
	margin-top: 20px;
	width: 100%;
}
</style>

<div class="row no-gutters">
	<div class="editor-title-container">
		<div class="offset-md-2 col-md-8">
			<h3>진행중인 이벤트</h3>
			<p>Tours - to - us 가 제공하는 다양한 이벤트를 만나보세요!</p>
			<hr>
		</div>
	</div>
</div>
<div class="row no-gutters">
	<div class="offset-md-2 col-md-8">
		<div class="event-table">
			<table class="table text-center">
				<col width="15%">
				<col width="50%">
				<col width="35%">
				<thead>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>진행기간</th>
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
</div>
