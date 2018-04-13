<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8" />
<style>
#floatMenu {
	position: absolute;
	width: 200px;
	height: 300px;
	left: 50px;
	top: 200px;
	background-color: #ffffff;
	color: black;
}

.writer_profile {
	border-radius: 50%;
}

.user_profileView {
	
}

.toditor_category {
	font-size: 15px;
	color: #6e6e6e;
	margin-right: 5px;
}

.toditor_title_bold {
	color: #323232;
	font-weight: bold;
}

.detailArea {
	margin-left: 100px;
	margin-right: 100px;
	margin-top: 5px;
	border: 1px solid #dcdcdc;
	padding: 10px;
}

.detailHead {
	padding-top: 20px;
	margin-left: 50px;
	margin-right: 50px;
}

.detailBody {
	margin-left: 50px;
	margin-right: 50px;
	margin-top: 30px;
	margin-bottom: 30px;
}

.detailBody_content {
	padding-bottom: 30px;
}

.comment_hr {
	margin-top: 5px;
	margin-bottom: 5px;
}

.commemt_size {
	padding-left: 20px;
	padding-bottom: 20px;
	font-size: 13px;
}

.comment_input {
	padding-left: 20px;
}

.user_comment_text {
	padding-top: 5px;
}

.user_comment_btn {
	padding-top: 5px;
}

.etc_date {
	font-size: 13px;
	color: #6e6e6e;
	padding-left: 5px;
}

.read_count {
	font-size: 13px;
	color: #6e6e6e;
	padding-left: 5px;
}

.comment-area {
	padding-left: 15px;
	padding-top: 20px;
	padding-bottom: 20px;
}

.comment_name {
	font-weight: bold;
}

.comment_time {
	padding-left: 10px;
	padding-top: 3px;
	font-size: 13px;
	color: #6e6e6e;
}

.comment_content {
	padding-top: 3px;
	font-size: 14px;
}

.nextprev {
	padding-top: 10px;
	padding-bottom: 15px;
	padding-left: 20px;
	padding-right: 20px;
	font-size: 13px;
}

.prev_title {
	padding-left: 5px;
}

.next_title {
	padding-left: 5px;
}

.tag {
	font-size: 13px;
	color: #6e6e6e;
}

.update_delete_box {
	padding-top: 20px;
	padding-left: 200px;
	font-size: 13px;
	color: #6e6e6e;
}

.update_delete_box a {
	color: #6e6e6e;
}

.delete_div {
	padding-left: 10px;
}

.update_div {
	margin-top: 20px;
	margin-right: 110px;
	color: #6e6e6e;
	font-size: 13px;
}

.comment-item {
	border-bottom: 1px solid gray;
	padding-top: 15px
}
</style>




<div id="floatMenu">
<ul style="width:100%; list-style-type: none;" class="menu_">
	<li class="title"><h2>가이드북</h2><hr></li>
<hr>	
</ul>

<div class="menu_table">
		<ul style="list-style-type: none">
			<li class="title">나의 플랜</li>
			<li class="menu_item">
				<a href="#none" onclick="url_myplan()" class="nav-link" title="나의 플랜보기" >나의 플랜보기</a>
			</li>
			<li class="title">회원정보관리</li>
			<li class="menu_item">
				<a href="mypage.do" class="nav-link" title="회원정보수정">회원정보수정</a>
			</li> 
		</ul>
	</div>
</div>




<div class="offset-md-2 col-md-9"> <!-- 내용 div -->
<div class="top_headline">
<h1>여행 후기</h1>
</div>
<hr>

<c:if test="${aftergetBbs.email eq current_user.email }">
	 <div class="d-flex justify-content-end">
		<div class="update_div">
			<span id="updateBBS" onclick="bbsUpdate()">수정</span>
			<span id="deleteBBS" onclick="bbsDelete()">삭제</span>
		</div>
	</div>
</c:if>
<!-- -->
<div class="detailArea">
	<div class="row detailHead">			
				<div class="user_profileView">
					<c:choose>
							<c:when test="${aftergetBbs.profile eq 'no-profile.png' }">
								<img class="no_profile" src="image/user.png" height="50px">
							</c:when>
							<c:otherwise>
								<img class="writer_profile" src="${initParam.IMG_SERVER_PATH }/image/${aftergetBbs.profile }" height="50px">
							</c:otherwise>
						</c:choose>
				</div>
				
				<div class="col-md-8 toditor_title">
				<span class="toditor_category">#여행후기</span>
				<span class="toditor_title_bold">${aftergetBbs.title }</span>
				<div class="toditor_etc">
					<span class="etc_writer">${aftergetBbs.name }</span>
					<span class="etc_date"><fmt:parseDate value="${aftergetBbs.reg_date }" var="date" pattern="yyyy-MM-dd"/>
														<fmt:formatDate value="${date}" pattern="yyyy/MM/dd"/></span>
					<span class="read_count">조회 : </span>
					
					
				</div>
				</div>				
	</div>
	<hr>
	<div class="detailBody">
		<div class="detailBody_content">
			${aftergetBbs.content }
		</div>
<!-- 		<div class="tag">
			<span><b>태그</b>  #부산 #맛집 #먹방</span>
		</div>	 -->
		<hr>
		<div class="detailBody_like" align="center">
				<img class="hearticon" src="${ isLiked == 1 ? './image/heart.png' : './image/empty_heart.png' }" id="like_btn" width="100px"><br>
				<span>좋아요</span>&nbsp;<strong id="like_count">${like_count }</strong>
		</div>	
				
	</div>
	
	<div class="detailBottom">
	<hr class="comment_hr">
		<div class="commemt_size">
			<span>댓글</span>&nbsp;<span id="commentCount" style="color: rgb(125, 195, 187); font-weight: bold; ">${commentlist.size() }</span>
		</div>
		
		<div class="row comment_input">
			<div class="col-md-1 user_comment_profile">
					<c:choose>
							<c:when test="${current_user eq 'no-profile.png' }">
								<img class="no_profile" src="image/user.png" height="50px">
							</c:when>
							<c:otherwise>
								<img class="writer_profile" src="${initParam.IMG_SERVER_PATH }/image/${current_user.profile }" height="50px">
							</c:otherwise>
						</c:choose>
				</div>
				
				<div class="col-md-9 user_comment_text">
					<input type="text" class="form-control"  name="content" id="content0" size="90" placeholder="댓글을 입력해주세요"> 
				</div>
				<div class="col-md-2 user_comment_btn">
					<input type="button" class="btn btn-outline-success" value="comment" onclick="addComment()">
				</div>
		</div>
		<div class="comment_content">
	<div class="comment-area">
					
				<c:forEach begin="0" items="${commentlist }" var="comment" varStatus="i">
						<div class="row">
							<div class="col-md-1 comment_profile">						
								<img class="writer_profile" src="${initParam.IMG_SERVER_PATH }/image/${comment.profile }" height="50px">						
							</div>
							<div class="col-md-10">
								<div class=row>
										<div class="comment_name">${comment.name }</div>
										<div class="comment_time"><fmt:formatDate value="${comment.reg_date}" pattern="yyyy/MM/dd" /></div>										
								</div>
								
								<div class=row>
										<div class="comment_content">${comment.content }</div>
								</div>
							</div>
							<div class="col-md-1">
								<div class="comment_delete">삭제</div>
							</div>
						</div>
						<hr>
					</c:forEach>
					
				

			</div>
			
		</div>
	</div>
		<div class="nextprev">
				<div class="prev">
					<span class="prev_bbs">이전글</span>
					<span class="prev_title"><c:if test="${aftergetBbs.prev_seq==0}">이전글이 없습니다.</c:if><a href='afterdetail.do?seq=${aftergetBbs.prev_seq}'>${aftergetBbs.prev_title}</a></span>
				</div>
					<hr>
				<div class="next">
					<span class="next_bbs">다음글</span>
					<span class="next_title"><c:if test="${aftergetBbs.next_seq==0}">다음글이 없습니다.</c:if><a href='afterdetail.do?seq=${aftergetBbs.next_seq}'>${aftergetBbs.next_title}</a></span>
				</div>
		</div> 


</div>
 <!-- -->

<%-- <div class="offset-md-2 col-md-8 col-xs-12">
	<hr>
</div>
<div class="row offset-md-7">
	<p>
		<b>작성자</b> ${aftergetBbs.email } &nbsp;&nbsp;&nbsp;<b>작성일</b>
		${aftergetBbs.reg_date }&nbsp;&nbsp;&nbsp;
	</p>
</div>

<div class="after-title">
	<div class="offset-md-2 col-md-4 col-xs-12">
		<br> <br> ${aftergetBbs.content } <br> <br>
	</div>

</div>
${commList }

<div class="after-title">
	<div class="offset-md-2 col-md-6 col-xs-12">
		<c:if test="${aftergetBbs.email eq current_user.email }">
			<a href="afterUpdate.do?seq=${aftergetBbs.seq }" id="_btnUpdate"
				title="글수정하기" class=" offset-md-6 col-md-2 btn btn-primary">글
				수정하기</a>
			<a href="afterDelete.do?seq=${aftergetBbs.seq }" id="_btndelete"
				title="삭제하기" class="col-md-2 btn btn-primary">글 삭제하기</a>
		</c:if>
	</div>
</div>

<br>
<div class="offset-md-2 col-md-8 detailBottom">
	<hr class="comment_hr">
	<div class="commemt_size">
		<span>댓글</span>&nbsp;<span id="commentCount"
			style="color: rgb(125, 195, 187); font-weight: bold;">${commentlist.size() }</span>
	</div>

	<div class="row comment_input">
		<div class="col-md-1 user_comment_profile">
			<c:choose>
				<c:when test="${current_user eq 'no-profile.png' }">
					<img class="no_profile" src="image/user.png" height="50px">
				</c:when>
				<c:otherwise>
					<img class="writer_profile"
						src="${initParam.IMG_SERVER_PATH }/image/${current_user.profile }"
						height="50px">
				</c:otherwise>
			</c:choose>
		</div>
		
		<div class="col-md-9 user_comment_text">
			<input type="text" class="form-control" name="content" id="content0"
				size="90" placeholder="댓글을 입력해주세요">
		</div>
		
		<div class="col-md-2 user_comment_btn">
			<input type="button" id="addComment" class="btn btn-outline-success" value="comment"
				onclick="addComment(${comment.seq})">
		</div>
		
		
	
		
	</div>
	<div class="comment_content">
		<div class="comment-area">

			<c:forEach begin="0" items="${commentlist }" var="comment" >
				<div class="row comment-item">
					<div class="col-md-1 comment_profile">
						<img class="writer_profile" src="${initParam.IMG_SERVER_PATH }/image/${comment.profile }" height="50px">
					</div>
					<div class="col-md-10">
						<div class=row>
							<div class="comment_name">${comment.name }</div>
							<div class="comment_time">
								<fmt:formatDate value="${comment.reg_date}" pattern="yyyy/MM/dd" />
							</div>
						</div>
						<div class=row>
							<div class="comment_content">${comment.content }</div>
						</div>						
					</div>
					<div class="col-md-1">
					<div class="comment-email col-md-1" style="height: 50px;">
							<input type="button" class="btn btn-link" id="delBtn" onclick="delete_Comment(${comment.seq}, this)" style="size: 2em; color: #696969" value="삭제">
						</div>
					</div>
				</div>
			</c:forEach>
		</div>

	</div>
</div> --%>



<script>

function bbsDelete() {
	  if(confirm("정말 삭제하시겠습니까?")==true){
		  location.href="afterDelete.do?seq=${aftergetBbs.seq }";
	         
	        }else{
	        	return;
	        }
	
}

function bbsUpdate() {
	location.href="afterUpdate.do?seq=${aftergetBbs.seq }";
}

$('#like_btn').click(function () {
	
	
	$.ajax({
		url:"likebtn_click.do",
		data: {bbs_category: 1, target_user_seq: ${current_user.seq }, target_bbs_seq: ${aftergetBbs.seq }},
		type:"post",
		success : function (data) {
			
			var result = JSON.parse(data);
			
			if(result.status == 404){
				
				$('img.hearticon').attr('src', './image/empty_heart.png');
			} else {
				
				$('img.hearticon').attr('src', './image/heart.png');
			}
			
			$('strong#like_count').html(result.like_count);
		}
	})
});





	function addComment(seq) {
	//alert("dadddd");
	var seq = ${aftergetBbs.seq};
   	var user_seq = ${current_user.seq};
   	var text = $("#content0").val();
	if(text==""){
  		alert("댓글을 입력해 주세요");
		$("#content0").focus();
   		
 	}else{
   	$.ajax({
	      url:"AfterComentAf.do",
	      method:"post",
	      data:{ target_bbs_seq : seq,target_user_seq:user_seq ,content : $('#content0').val() },
	      success:function(data){
	            
	         $('.comment-area').children().remove();
			
	         for(var i=0; i <data.length; i++){
	            printCommentHtml(data[i]);
	         }
	         
			 $('#commentCount').html(data.length);
			$('#content0').val('');
			

		},
		error : function(request, status, error) {
			alert("실패");
		}
	});
  }
	 	
}
	$("#content0").keypress(function(event) {
		if(event.which == "13"){
			event.preventDefault();
			//버튼클릭부분으로 이동시킴
			$("#addComment").click();
		}
	});	

	
	

	function printCommentHtml(comment) {
		var html ='<div class="row comment-item">'
		+'<div class="col-md-1 comment_profile">'
		+'<img class="writer_profile" src="${initParam.IMG_SERVER_PATH }/image/'+comment.profile+'" height="50px">'
		+'</div>'
		+'<div class="col-md-10">'
		+'<div class=row>'
		+'<div class="comment_name">'+comment.name+'</div>'
		+'<div class="comment_time">'+dateTest(comment.reg_date)+'</div>'
		+'</div>'
		+'<div class=row>'
		+'<div class="comment_content">'+comment.content+'</div>'
		+'</div>'
		+'</div>'
		+'<div class="col-md-1">'
		+'<div class="comment-email col-md-1" style="height: 50px;">'
		+'<input type="button" class="btn btn-link" id="delBtn" onclick="delete_Comment('+comment.seq+', this)" style="size: 2em; color: #696969" value="삭제">'
		+'</div>'
		+'</div>'
		+'</div>'
		+'</div>';
		$('.comment-area').append(html);
	}
	function dateTest(date) {
		var date = new Date(date);
		var result =date.getFullYear()+'/'+
	    ((date.getMonth()+1)<10 ? '0'+(date.getMonth()+1) : (date.getMonth()+1))+'/'+
	    (date.getDate()<10 ? '0'+date.getDate() : date.getDate() ) ;
		return result;
	}
	
	
	
	
	
</script>

<script>
function delete_Comment(seq, dom) {
	//alert("deleteComment" + seq);
   	var user_seq = ${current_user.seq};
	//var target_test_seq =${comment.target_user_seq};
	var dom2 = dom;
	
	$.ajax({
	      url:"AfterComentDelete.do",
	      method:"post",
	      data:{seq : seq, target_user_seq : user_seq},
	      success:function(data){
	    	  //alert("data"+date);
	    	  if(data){
	    		  $('#commentCount').html(parseInt($('#commentCount').html()) -1)
	    		  
	    		  var count = parseInt($('#commentCount').html());
	    		  
	    		  if(count < 1){
	    			  $('#commentCount').html(0);
	    		  } else {
	    			  $('#commentCount').html(count-1);
	    		  }
	    		  $(dom2).parent().parent().parent().remove();
	    	  }else{
	         	alert('본인만 삭제가 가능합니다.');
	    	  }
		},
		error : function(request, status, error) {
			alert("실패");
		} 
	}); 
	
	
}
</script>




