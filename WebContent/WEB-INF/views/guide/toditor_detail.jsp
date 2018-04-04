<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
</style>

<div id="floatMenu">
<ul style="width:100%; list-style-type: none;" class="menu_">
	<li class="title"><h2>가이드북</h2></li>
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


</div> <!-- 내용 끝 -->