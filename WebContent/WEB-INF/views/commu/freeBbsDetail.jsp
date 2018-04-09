<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/> 



<div class="offset-md-2 col-md-8 col-xs-12">
	<hr>
</div>

<div class="after-title">
<div class="offset-md-2 col-md-4 col-xs-12">
<p>
<h4>제목: ${commufredetail.title }</h4>
</p>
</div>
</div>
<div class="myplan-title">
	<div class="offset-md-2 col-md-4 col-xs-12">
		<h2>자유게시판</h2>
	</div>
</div>


<div class="offset-md-2 col-md-8 col-xs-12">
<hr>
</div>
<div class="row offset-md-7">
<p>
	<b>작성자</b>
	${commufredetail.name }
	&nbsp;&nbsp;&nbsp;<b>작성일</b>
	${commufredetail.reg_date }&nbsp;&nbsp;&nbsp;
	</p>
</div>

<div class="after-title">
<div class="offset-md-2 col-md-4 col-xs-12">
	<br> <br>
	${commufredetail.content }
		<br> <br>
	</div>

</div>


<div class="after-title">
<div class="offset-md-2 col-md-6 col-xs-12">
<c:if test="${commufredetail.email eq current_user.email }">
<a href="freeBbsUpdate.do?seq=${commufredetail.seq }" id="_btnUpdate" title="글수정하기" class=" offset-md-6 col-md-2 btn btn-primary">글 수정하기</a>
<a href="freeBbsDelete.do?seq=${commufredetail.seq }" id="_btndelete" title="삭제하기" class="col-md-2 btn btn-primary">글 삭제하기</a> 
</c:if>
</div>
</div>

<br>
<div class="row">
	<div class="offset-md-2 col-md-8">
		<input type="text" class="form-control" name="content" id="content" size="90" placeholder="댓글을 입력해주세요">
	</div>
	
	<div class="col-md-2">
		<button class="btn btn-outline-success" onclick="addComment()">comment</button>
	</div>
</div>
<br><br> 
<span id="commentCount">${comments.size() }</span>
<div class="comment-area">
	<c:forEach begin="0" items="${commentlist }" var="comment"
		varStatus="i">
		<div class="row">
			<div class="offset-md-2 col-md-2 comment-email "
				style="height: 50px;">${comment.name }</div>
			<div class="col-md-5 comment-box" style="height: 50px;">
				<div class="comment-content">${comment.content }</div>
			</div>
			<div class="col-md-2 comment-date" style="height: 50px;">
				${comment.reg_date }</div>

		</div>
		<div class="offset-md-2 col-md-9">
			<hr>
		</div>
	</c:forEach>
</div> 



<script type="text/javascript">
	function addComment(seq) {
	var seq = ${commufredetail.seq};
   	var user_seq = ${current_user.seq};
   	
   	$.ajax({
	      url:"freeBbsComentAf.do",
	      type:"post",
	      data:{ target_free_seq : seq,target_user_seq:user_seq ,content : $('#content').val() },
	      success:function(data){
	            
	         $('.comment-area').children().remove();

	         for(var i=0; i <data.length; i++){
	            printCommentHtml(data[i]);
	         }
	         $('#content').val('');

		},
		error : function(request, status, error) {
			alert("실패");
		}
	});
}

	function printCommentHtml(comment) {
		var html = '<div class="row">'
				+ '<div class="offset-md-2 col-md-2 comment-email "style="height: 50px;">'
				+ comment.name + '</div>'
				+ '<div class="col-md-5 comment-box" style="height: 50px;">'
				+ '<div class="comment-content">'
				+ comment.content + '</div>' + '</div>'
				+ '<div class="col-md-2 comment-date" style="height: 50px;">'
				+ comment.reg_date + '</div>'
				+ '<div class="offset-md-2 col-md-9">'
				+ '<hr>'
				+'</div>';
				
		$('.comment-area').append(html);
	}
</script>




    