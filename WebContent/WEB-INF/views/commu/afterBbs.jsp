<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>
 
 <h1>dkdkdkdkd</h1>
 
  <table class="list_table" style="width:85%;">
	<colgroup>
		<col style="width:70px;" />
		<col style="width:auto;" />
		<col style="width:100px;" />
	</colgroup>

<thead>
	<tr>
		<th>순서</th> <th>제목</th> <th>작성자</th> 
	</tr>
</thead>

<tbody>	
	<c:if test="${empty getAfterBbslist}">
	<tr>
		<td colspan="3">작성된 글이 없습니다.</td>
	</tr>	
	</c:if>
 
 </tbody>
</table> 
