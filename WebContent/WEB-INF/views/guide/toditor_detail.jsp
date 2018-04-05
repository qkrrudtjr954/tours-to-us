<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<h1>투디터 pick!</h1>
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
					<span class="etc_date">${bbs.reg_date }</span>
				</div>
				</div>				
	</div>
	<hr>
	<div class="detailBody">
		<div class="detailBody_content">
			${bbs.content }
		</div>
		<hr>
		<div class="detailBody_like" align="center">
				<img class="hearticon" src="image/heart.png"><br>
				<span>좋아요</span>&nbsp;<strong>200</strong>
		</div>		
	</div>
	
	<div class="detailBottom">
	<hr class="comment_hr">
		<div class="commemt_size">
			<span>댓글</span>&nbsp;<span style="color: rgb(125, 195, 187); font-weight: bold; ">30</span>
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
					<input type="button" class="btn btn-outline-success" value="comment">
				</div>
		</div>
		<div class="comment_content">
		</div>
	</div>
</div>

</div> <!-- 내용 끝 -->