<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt"   uri="http://java.sun.com/jsp/jstl/fmt" %>
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

.top_headline{
padding-top:17px;
padding-left:17px;

}

.writer_profile{
 border-radius: 50%;


}
.user_profileView{

}

.toditor_category{
font-size: 15px;
color: #6e6e6e;
margin-right: 5px;

}

.toditor_title_bold{
color: #323232;
font-weight: bold;
}

.detailArea{

margin-left: 100px;
margin-right: 100px;
margin-top: 30px;
border: 1px solid #dcdcdc;
padding: 10px;
}

.detailHead{
padding-top: 20px;
margin-left: 50px;
margin-right: 50px;
}

.detailBody{

margin-left: 50px;
margin-right: 50px;
margin-top: 30px;
margin-bottom: 30px;

}

.detailBody_content{

padding-bottom:30px;
}

.comment_hr{
margin-top:5px;
margin-bottom:5px;
}

.commemt_size{
padding-left:20px;
padding-bottom:20px;
font-size: 13px;
}

.comment_input{

padding-left: 20px;
}

.user_comment_text{
padding-top:5px;
}


.user_comment_btn{
padding-top:5px;
}

.etc_date{
font-size: 13px;
color: #6e6e6e;
padding-left:5px;
}

.read_count{
font-size: 13px;
color: #6e6e6e;
padding-left:5px;
}
.comment-area{
padding-left:15px;
padding-top:20px;
padding-bottom:20px;
}

.comment_name{
font-weight: bold;
}

.comment_time{
padding-left:10px;
padding-top:3px;
font-size: 13px;
color: #6e6e6e;
}

.comment_content{
padding-top:3px;
font-size: 14px;
}

.nextprev{
padding-top:10px;
padding-bottom:15px;
padding-left:20px;
padding-right:20px;
font-size: 13px;
}

.prev_title{
padding-left:5px;
}
.next_title{
padding-left:5px;
}

.tag{
font-size: 13px;
color: #6e6e6e;
}

.update_delete_box{
padding-top:20px;
padding-left:200px;
font-size:13px;
color: #6e6e6e;

}
.update_delete_box a{
color: #6e6e6e;
}

.delete_div{
padding-left:10px;

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
<h1>투디터 pick!</h1>
</div>
<hr>
<div class="detailArea">
	<div class="row detailHead">			
				<div class="user_profileView">
					<c:choose>
							<c:when test="${bbs.profile eq 'no-profile.png' }">
								<img class="no_profile" src="image/user.png" height="50px">
							</c:when>
							<c:otherwise>
								<img class="writer_profile" src="${initParam.IMG_SERVER_PATH }/image/${bbs.profile }" height="50px">
							</c:otherwise>
						</c:choose>
				</div>
				
				<div class="col-md-8 toditor_title">
				<span class="toditor_category">#${bbs.category }</span>
				<span class="toditor_title_bold">${bbs.title }</span>
				<div class="toditor_etc">
					<span class="etc_writer">${bbs.name }</span>
					<span class="etc_date"><fmt:formatDate value="${bbs.reg_date}" pattern="yyyy/MM/dd" /></span>
					<span class="read_count">조회 : ${bbs.readcount }</span>
					
					
				</div>
				</div>				
	</div>
	<hr>
	<div class="detailBody">
		<div class="detailBody_content">
			${bbs.content }
		</div>
		<div class="tag">
			<span><b>태그</b>  #부산 #맛집 #먹방</span>
		</div>	
		<hr>
		<div class="detailBody_like" align="center">
				<img class="hearticon" src="${ isLiked == 1 ? './image/heart.png' : './image/empty_heart.png' }" id="like_btn" width="100px"><br>
				<span>좋아요</span>&nbsp;<strong id="like_count">${like_count }</strong>
		</div>	
				
	</div>
	
	<div class="detailBottom">
	<hr class="comment_hr">
		<div class="commemt_size">
			<span>댓글</span>&nbsp;<span style="color: rgb(125, 195, 187); font-weight: bold; ">${commentlist.size() }</span>
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
						</div>
						<hr>
					</c:forEach>
					
				

			</div>
			
		</div>
	</div>
	<div class="nextprev">
		<div class="prev">
			<span class="prev_bbs">이전글</span>
			<span class="prev_title"><c:if test="${bbs.prev_seq==0}">이전글이 없습니다.</c:if><a href='toditor_detail.do?seq=${bbs.prev_seq}'>${bbs.prev_title}</a></span>
		</div>
			<hr>
		<div class="next">
			<span class="next_bbs">다음글</span>
			<span class="next_title"><c:if test="${bbs.next_seq==0}">다음글이 없습니다.</c:if><a href='toditor_detail.do?seq=${bbs.next_seq}'>${bbs.next_title}</a></span>
		</div>
</div>


</div>

<div class="update_delete_box">
<div class="row">
<div class="copyright">
<span>Copyright(c)2018 by ${bbs.name } All pictures cannot be copied without permission. </span> 
</div>
<div class="update_div">
	<span><a href="toditor_update.do?seq=${bbs.seq }">수정</a></span>
</div>
<div class="delete_div">
	<span onclick="bbsDelete()">삭제</span>
</div>
</div>
</div>

</div> <!-- 내용 끝 -->


<script>

function bbsDelete() {
	  if(confirm("정말 삭제하시겠습니까?")==true){
		  location.href="toditor_delete.do?seq=${bbs.seq }";
	         
	        }else{
	        	return;
	        }
	
}

$('#like_btn').click(function () {
	
	
	$.ajax({
		url:"likebtn_click.do",
		data: {bbs_category: 3, target_user_seq: ${current_user.seq }, target_bbs_seq: ${bbs.seq }},
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
	var seq = ${bbs.seq};
	var user_seq = ${current_user.seq};
	$.ajax({
		url:"addcomment.do",
		type:"post",
		data:{ target_editor_seq : seq, target_user_seq:user_seq ,content : $('#content0').val() },
		success:function(data){
				
			$('.comment-area').children().remove();

			for(var i=0; i <data.length; i++){
				printCommentHtml(data[i]);
			}
			$('#content0').val('');
			
			
		},
		error:function(request, status, error){
			alert("실패");
		}
	});
}

function printCommentHtml(comment ){		

	var html ='<div class="row">'+
					'<div class="col-md-1 comment_profile">'+
						'<img class="writer_profile" src="${initParam.IMG_SERVER_PATH }/image/'+comment.profile+'" height="50px">'+
					'</div>'+
					'<div class="col-md-10">'+
						'<div class=row>'+
								'<div class="comment_name">'+comment.name+'</div>'+
								'<div class="comment_time">'+dateTest(comment.reg_date)+'</div>'+
						'</div>'+
						'<div class=row>'+
								'<div class="comment_content">'+comment.content+'</div>'+
						'</div>'+
					'</div>'+
				'</div>'+
				'<hr>';
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