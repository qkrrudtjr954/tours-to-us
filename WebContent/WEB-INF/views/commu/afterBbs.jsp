<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>
 
 <h1>여행후기</h1>
 
 <%-- <div class="box_border" style="margin-top:5px; margin-bottom: 10px;">

<form name="frmForm1" id="_frmFormSearch" method="post" action="">

<table style="margin-left:auto; margin-right:auto; margin-top:3px; margin-bottom:3px; border:0; padding:0;">
<tr>
	<td>검색 : </td>
	<td style="padding-left:5px;">
		<select id="_s_category" name="s_category">
		
		<!-- 검색했을 경우 -->
		<option value="">선택</option>
		<option value="title">제목</option>
		<option value="contents">내용</option>	
		
			<c:choose>
			<c:when test="${s_category eq 'title' }">
			<option value="title" selected="selected">제목</option>
			</c:when>
			<c:when test="${s_category eq 'contents' }">
			<option value="contents" selected="selected">내용</option>
			</c:when>
			<c:otherwise>
			<option value="" selected="selected">선택</option>
			
			</c:otherwise>
			
			
			</c:choose>
			
										
		</select>
	</td>
	<td style="padding-left:5px;"><input type="text" id="_s_keyword" name="s_keyword" value="${s_keyword}"/></td>
	<td style="padding-left:5px;"><span class="button blue"><button type="button" id="_btnSearch"> 검색 </button></span></td>
</tr>
</table>
 
<input type="hidden" name="pageNumber" id="_pageNumber" value="0"/>						
<input type="hidden" name="recordCountPerPage" id="_recordCountPerPage" value="${(empty recordCountPerPage)?10:recordCountPerPage}"/>						

</form>
</div>
--%>
<%-- <jsp:useBean id="ubbs" class="kh.com.a.arrow.BbsArrow"/> --%>
 
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
	<c:if test="${empty afterBbslist}">
	<tr>
		<td colspan="3">작성된 글이 없습니다.</td>
	</tr>	
	</c:if>

	<c:forEach items="${afterBbslist}" var="bbs" varStatus="vs">
	<jsp:setProperty property="depth" name="ubbs" 
	value="${bbs.depth}"/>
	
	<tr class="_hover_tr">
		<td style="text-align: left">
		<jsp:getProperty property="arrow" name="ubbs"/>
		<c:if test="${bbs.status==0}">                   
		<a href='bbsdetail.do?seq=${bbs.seq}'>
		${bbs.title}</a>
		</c:if>
		<c:if test="${bbs.status eq 1}">
		관리자의해 삭제된 글입니다
		</c:if>
		</td>
		<td>${bbs.target_user_seq}</td> 
	</tr>
	</c:forEach>
</tbody>

</table>
