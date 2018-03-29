<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>    
    
   

<div class="after-title">
	<div class="offset-md-2 col-md-4 col-xs-12">
		<h2>회원 정보 수정</h2>
	</div>
</div>
<div class="offset-md-2 col-md-8 col-xs-12">
	<hr>
</div>
<div class="search">
<div class="row" style="margin:0 auto;width:1200px;">
	<div class="offset-md-1 input-group-prepend">
	<select class="custom-select" id="inputGroupSelect01"name="Searchtype" style="width: 150px">
		<option value="target_user_seq">글쓴이</option>
		<option value="title">제목</option>
		<option value="location">지역</option>
	</select> 
	<input type="text" class="form-control"
		aria-label="Text input with segmented dropdown button" size="10"
		name="SearchWord" id="text">
	</div>
	<div class="serach">
		<input type="button" class="btn btn-success" id="btnsearch" style="background-color: #28A745; color: #fff"
			value="검색">
	</div>
	<div class="offset-md-6">
		<input type="button" class="btn btn-success" id="btnwrite" style="background-color: #28A745; color: #fff"
			value="글쓰기" onclick="writeAfBbs()">
	</div>
</div>
</div>




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
		<th>번호</th> <th>제목</th> <th>작성자</th> <th>작성일</th>  
	</tr>
</thead>
<tbody>	
	<c:if test="${empty afterBbslist}">
	<tr>
		<td colspan="11">작성된 글이 없습니다.</td>
	</tr>	
	</c:if>

	<c:forEach items="${afterBbslist }" var="after" varStatus="i">
	<tr>
		
		<td>
			${i.count }
		</td>
	
		<td>
			<a href="commuafterdetail.do?seq=${after.seq }">${after.title }</a>
		</td>
		
		<td>
			${after.name }
		</td>
		
		<td>
			${after.reg_date }
		</td>	
		
	</tr>
	</c:forEach>
</tbody>
</table>
</div>

<script>
function writeAfBbs() {
	
	location.href="afterWrite.do";
	
}
</script>
