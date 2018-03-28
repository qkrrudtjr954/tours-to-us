<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style type="text/css">
   .nav-link {
	color: white;
	
}

a.nav-link:hover {
	color: gray;
}

#floatMenu {
	position: absolute;
	width: 200px;
	height: 300px;
	left: 50px;
	top: 200px;
	background-color: #7DC3BB;
	color: #fff;
}
	
</style>
<div class="myplan-title">
	<div class="offset-md-2 col-md-4 col-xs-12">
		<h2>나의 플랜</h2>
	</div>
</div>
<div class="offset-md-2  col-md-8 col-xs-12">
	<hr>
</div>

<div style="height:2000px">
</div>
<div id="floatMenu">
<ul style="width:100%; list-style-type: none;" class="menu_">
	<li class="title"><h2>My<br>Page</h2></li>
</ul>

<div class="menu_table">
		<ul style="list-style-type: none">
			<li class="title">나의 플랜</li>
			<li class="menu_item">
				<a href="#none" onclick="url_myplan()" class="nav-link" title="나의 플랜보기">나의 플랜보기</a>
			</li>
			<li class="title">회원정보관리</li>
			<li class="menu_item">
				<a href="mypage.do" class="nav-link" title="회원정보수정">회원정보수정</a>
			</li> 
		</ul>
	</div>
</div>


<script>
$(document).ready(function() {
	// 기존 css에서 플로팅 배너 위치(top)값을 가져와 저장한다.
	var floatPosition = parseInt($("#floatMenu").css('top'));
	// 250px 이런식으로 가져오므로 여기서 숫자만 가져온다. parseInt( 값 );

	$(window).scroll(function() {
		// 현재 스크롤 위치를 가져온다.
		var scrollTop = $(window).scrollTop();
		var newPosition = scrollTop + floatPosition + "px";

		/* 애니메이션 없이 바로 따라감
		 $("#floatMenu").css('top', newPosition);
		 */

		$("#floatMenu").stop().animate({
			"top" : newPosition
		}, 500);

	}).scroll();

});

function url_myplan() {
	location.href="myplan.do";
}
</script>
