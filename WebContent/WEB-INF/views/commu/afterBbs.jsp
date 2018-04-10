<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>    
    
   

<div class="after-title">
	<div class="offset-md-2 col-md-4 col-xs-12">
		<h2>여행 후기</h2>
	</div>
</div>

<div class="offset-md-2 col-md-8 col-xs-12">
	<hr>
</div>
<div class="search">
<div class="row" style="margin:0 auto;width:1200px;">
	<div class="offset-md-1 input-group-prepend">
			<form action="guideSearch.do" method="get" id="_frmFormSearch">
   <div class="row" style="margin:0 auto;width:900px;">
      <div class="input-group-prepend">
         <select class="custom-select" id="_s_category" name="s_category" style="width: 150px; height: 45px;">
            <option value="title">제목</option>
         	<option value="contents">내용</option>
         	<option value="name">작성자</option>
         </select> 
         <input type="text" class="form-control"
            aria-label="Text input with segmented dropdown button" size="50"
            name="s_keyword" id="text">
      </div>
      <div class="serach">
         <button class="btn btn-outline-secondary" type="button" id="btnSearch"><span data-feather="search"></span></button>
         <button class="btn btn-outline-secondary" type="button" id="list" onclick="user_guide()"><span data-feather="list"></span><span class="list-text">전체리스트</span></button>
         <input type="hidden" name="pageNumber" id="_pageNumber" value="0" />
            <input type="hidden" name="recordCountPerPage"
               id="_recordCountPerPage"
               value="${(empty recordCountPerPage)?10:recordCountPerPage}" />
      </div>
   </div>
</form>

</div>
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
	<c:if test="${empty afterBbslist}">
	<tr>
		<td colspan="11">작성된 글이 없습니다.</td>
	</tr>	
	</c:if>

	<c:forEach items="${afterBbslist }" var="after" varStatus="i">
	<c:if test="${after.status==0 }">
	<tr>
		
		<td>
			${i.count }
		</td>
	
		<td>
			<a href="afterdetail.do?seq=${after.seq }">${after.title }</a>
		</td>
		
		<td>
			${after.name }
		</td>
		
		<td>
			${after.reg_date }
		</td>	
		
	</tr>
	</c:if>
	</c:forEach>
</tbody>
</table>
</div>

<!-- 페이징 처리 -->

<div id="paging_wrap">
<jsp:include page="/WEB-INF/views/common/paging.jsp" flush="false">
	<jsp:param value="${pageNumber }" name="pageNumber"/>
	<jsp:param value="${pageCountPerScreen }" name="pageCountPerScreen"/>
	<jsp:param value="${recordCountPerPage }" name="recordCountPerPage"/>
	<jsp:param value="${totalRecordCount }" name="totalRecordCount"/>
</jsp:include>
</div>

<!-- 페이징 처리 -->


<script>
$(document).ready(function() {
	   
	   $("#_s_category > option[value="+'<c:out value="${ param.s_category }"/>'+"]").attr("selected","selected");
	   
	            
	});

	$("#btnSearch").click(function() {
	   //alert('search');                  
	   $("#_frmFormSearch").attr({ "target":"_self", "action":"afterBbs.do" }).submit();
	});
	function goPage(pageNumber) {   
	   $("#_pageNumber").val(pageNumber) ;
	   $("#_frmFormSearch").attr("target","_self").attr("action","afterBbs.do").submit();
	}
function user_guide() {
	
	location.href="afterBbs.do";
	
}
</script>
