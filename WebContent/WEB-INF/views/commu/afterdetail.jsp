<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/> 

<div class="after-title">
	<div class="offset-md-2 col-md-4 col-xs-12">
		<h2>여행 후기 보기</h2>
	</div>
</div>
<div class="offset-md-2 col-md-8 col-xs-12">
	<hr>
</div>

<div class="after-title">
<div class="offset-md-2 col-md-4 col-xs-12">
<p>
<h4>제목: ${aftergetBbs.title }</h4>
</p>
</div>
</div>

<div class="offset-md-2 col-md-8 col-xs-12">
<hr>
</div>

<div class="row offset-md-7">
<p>
	<b>작성자</b>
	${aftergetBbs.email }
	&nbsp;&nbsp;&nbsp;<b>작성일</b>
	${aftergetBbs.reg_date }&nbsp;&nbsp;&nbsp;
	</p>
</div>

<div class="after-title">
<div class="offset-md-2 col-md-4 col-xs-12">
	<br> <br>
	${aftergetBbs.content }
		<br> <br>
	</div>

</div>


<div class="after-title">
<div class="offset-md-2 col-md-6 col-xs-12">
<c:if test="${aftergetBbs.email eq current_user.email }">
<a href="afterUpdate.do?seq=${aftergetBbs.seq }" id="_btnUpdate" title="글수정하기" class=" offset-md-6 col-md-2 btn btn-primary">글 수정하기</a>
<a href="afterDelete.do?seq=${aftergetBbs.seq }" id="_btndelete" title="삭제하기" class="col-md-2 btn btn-primary">글 삭제하기</a> 
</c:if>
</div>
</div>	









 