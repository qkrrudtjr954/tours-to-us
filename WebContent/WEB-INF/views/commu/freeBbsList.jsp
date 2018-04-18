<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>

<style>
.thead{
font-size: 12px;
}

.comment_count{
font-size: 12px;
color: #f37720;
}

#freebbs_title:link { color: black; text-decoration: none;}
#freebbs_title:visited { color: black; text-decoration: none;}
#freebbs_title:hover { color: black; text-decoration: underline;}

.editor-title-container {
	margin-top: 20px;
	width: 100%;
}
.user-guide-table {
	width: 100%;
}

#_frmFormSearch {
	width : 100%;
}
#_frmFormSearch > div{
	margin: 10px 0px;
}
.list-text{
	height: 100%;
    width: 100%;
    vertical-align: super;
}
</style>

<div class="row no-gutters">
	<div class="editor-title-container">
		<div class="offset-md-2 col-md-8">
			<h3>자유 게시판</h3>
			<p>원하는 글을 마음껏 작성해주세요!</p>
			
			<hr>
		</div>
	</div>
</div>

<%-- 
<div class="offset-md-2 col-md-8 col-xs-12">
	<hr>
</div>
<br>
<div class="offset-md-1">
	<form action="freeBbsList.do" method="get" id="_frmFormSearch">
   <div class="row" style="margin:0 auto;width:900px;">
      <div class="input-group-prepend">
         <select class="custom-select" id="_s_category" name="s_category" style="width: 150px; height: 45px;">
            <option value="title">제목</option>
         	<!-- <option value="contents">내용</option> -->
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
      &nbsp;
	<input type="button" class="btn btn-outline-secondary" id="btnwrite" value="글쓰기" onclick="writeFreeBbs()">
   </div>
</form>

</div>
<br>

<div class="offset-md-2">
<table style="width:85%;" class="table">
<colgroup>
		<col style="width:10%" />
		<col style="width:60%" />
		<col style="width:10%" />
		<col style="width:10%" />
		<col style="width:10%" />
</colgroup>


<thead>
	<tr align="center">
		<th>번호</th><th>제목</th> <th>추천수</th><th>작성자</th> <th>작성일</th>  
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
		
		<td align="center">
			<span  style="font-size: 14px; color: black;">${i.count }</span>
		</td>
	
		<td >
			<a id="freebbs_title" href="freeBbsDetail.do?seq=${free.seq }">${free.title }</a>&nbsp;<span class="comment_count">[${free.comment_count }]</span>
		</td>
		
		<td align="center">
			<span  style="font-size: 13px; color: black;">${free.like_count }</span>
		</td>
		
		<td align="center">
			${free.name }
		</td>
		
		<td align="center"  style="font-size: 13px; color: color: #6e6e6e;">
			<fmt:parseDate value="${free.reg_date }" var="date" pattern="yyyy-MM-dd"/>
			<fmt:formatDate value="${date}" pattern="yyyy/MM/dd"/>
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
 --%>
 
 <div class="row no-gutters">
	<div class="offset-md-2 col-md-8 col-xs-12">
		<div class="row no-gutters">
			<form action="freeBbsList.do" method="get" id="_frmFormSearch">
				<div class="d-flex justify-content-center">
					<div class="input-group-prepend">
						<select class="custom-select" id="_s_category" name="s_category" style="width: 150px; height: 45px;">
							<option value="title">제목</option>
							<option value="location">지역</option>
						</select>
						<input type="text" class="form-control" aria-label="Text input with segmented dropdown button" size="50" name="s_keyword" id="text">
					</div>
					<div class="serach">
						<button class="btn btn-outline-secondary" type="button" id="btnSearch">
							<span data-feather="search"></span>
						</button>
					</div>
					<div class="total-list-button">
						<button class="btn btn-outline-secondary" type="button" id="list" onclick="user_guide()">
							<span data-feather="list"></span><span class="list-text">전체리스트</span>
						</button>
					</div>
					<input type="button" class="btn btn-outline-secondary" id="btnwrite" value="글쓰기" onclick="writeFreeBbs()">
				</div>
				
				<input type="hidden" name="pageNumber" id="_pageNumber" value="0" />
				<input type="hidden" name="recordCountPerPage" id="_recordCountPerPage" value="${(empty recordCountPerPage)?10:recordCountPerPage}" />
			</form>
		</div>

		<div class="row no-gutters">
			<div class="user-guide-table">
				<table class="table">
					<colgroup>
						<col style="width: 10%" />
						<col style="width: 60%" />
						<col style="width: 10%" />
						<col style="width: 10%" />
						<col style="width: 10%" />
					</colgroup>


					<thead>
						<tr align="center">
							<th>번호</th>
							<th>제목</th>
							<th>추천수</th>
							<th>작성자</th>
							<th>작성일</th>
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

									<td align="center"><span
										style="font-size: 14px; color: black;">${i.count }</span></td>

									<td><a id="freebbs_title"
										href="freeBbsDetail.do?seq=${free.seq }">${free.title }</a>&nbsp;<span
										class="comment_count">[${free.comment_count }]</span></td>

									<td align="center"><span
										style="font-size: 13px; color: black;">${free.like_count }</span>
									</td>

									<td align="center">${free.name }</td>

									<td align="center"
										style="font-size: 13px; color: color: #6e6e6e;"><fmt:parseDate
											value="${free.reg_date }" var="date" pattern="yyyy-MM-dd" />
										<fmt:formatDate value="${date}" pattern="yyyy/MM/dd" /></td>
								</tr>
							</c:if>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
		<div id="paging_wrap">
			<jsp:include page="/WEB-INF/views/common/paging.jsp" flush="false">
			   <jsp:param value="${pageNumber }" name="pageNumber"/>
			   <jsp:param value="${pageCountPerScreen }" name="pageCountPerScreen"/>
			   <jsp:param value="${recordCountPerPage }" name="recordCountPerPage"/>
			   <jsp:param value="${totalRecordCount }" name="totalRecordCount"/>
			</jsp:include>
		</div>
	</div>
</div>


<script>
$(document).ready(function() {
   	$("#_s_category > option[value="+'<c:out value="${ param.s_category }"/>'+"]").attr("selected","selected");         
});

$("#btnSearch").click(function() {
	   //alert('search'); 
	   var text = $("#text").val();
	   if(text===""){
		   alert("검색창이 비웠습니다");
			$("#text").focus();
		   
	   }else{
		   $("#_frmFormSearch").attr({ "target":"_self", "action":"afterBbs.do" }).submit(); 
		   
	   }
	   
});

$("#text").keypress(function(event) {
	var text = $("#text").val();

	if (event.which == "13") {
		event.preventDefault();
		if (text === "") {
			alert("검색창이 비웠습니다");
			$("#text").focus();
		} else {
			$("#btnSearch").click();
		}

	}
});
	
	
function goPage(pageNumber) {   
   $("#_pageNumber").val(pageNumber) ;
   $("#_frmFormSearch").attr("target","_self").attr("action","freeBbsList.do").submit();
}

function writeFreeBbs() {
	location.href="freeBbsWrite.do";
}


function user_guide(){
	location.href="freeBbsList.do";
}



</script>


   