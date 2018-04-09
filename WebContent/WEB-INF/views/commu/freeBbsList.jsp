<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>

 <div class="after-title">
	<div class="offset-md-2 col-md-4 col-xs-12">
		<h2>자유 게시판</h2>
	</div>
</div>


<div class="offset-md-2 col-md-8 col-xs-12">
	<hr>
</div>
<br>
<div class="offset-md-10">
	<input type="button" class="btn btn-success" id="btnwrite" value="글쓰기" onclick="writeFreeBbs()">
</div>
<br>

<div class="offset-md-2">
<table style="width:85%;" class="table">
<colgroup>
		<col style="width:100px;" />
		<col style="width:100px;" />
		<col style="width:100px;" />
		<col style="width:100px;" />
</colgroup>


<thead>
	<tr>
		<th>번호</th><th>제목</th> <th>작성자</th> <th>작성일</th>  
	</tr>
</thead>
<tbody>	
	<c:if test="${empty freelist}">
	<tr>
		<td colspan="11">작성된 글이 없습니다.</td>
	</tr>	
	</c:if>
	
	<c:forEach items="${freelist }" var="free" varStatus="i">
	<c:if test="${free.status==0 }">
	<tr>
		
		<td>
			${i.count }
		</td>
	
		<td>
			<a href="freeBbsDetail.do?seq=${free.seq }">${free.title }</a>
		</td>
		
		<td>
			${free.name }
		</td>
		
		<td>
			${free.reg_date }
		</td>	
		
	</tr>
	</c:if>
	</c:forEach>
</tbody>
</table>
</div>

<script>
function writeFreeBbs() {
	
	location.href="freeBbsWrite.do";
	
}



</script>


   