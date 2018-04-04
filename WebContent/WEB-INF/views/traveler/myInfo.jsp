<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <style type="text/css">
p {
	margin: 0;
	padding: 0;
	list-style: none;
}

 .nav_link {
	color: white;
	padding: 0px 15px;
}

a.nav_link:hover {
	color: gray;
	padding: 0px 15px;
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
    
<div class="mypage-title">
	<div class="offset-md-2 col-md-4 col-xs-12">
		<h2>회원 정보 수정</h2>
	</div>
</div>
<div class="offset-md-2 col-md-8 col-xs-12">
	<hr>
</div>
<div class="check-Box">
<div class="row">
<div class="offset-md-3">
	<form action="myInfoUpd.do" id="frmForm" autocomplete="off">
	<table class="table">
		<tbody>
			<tr>
				<td>
					<label class="title">아이디 또는 이메일 주소</label>
				</td>
				<td>
					${c_user.email }<input type="hidden" name="email" id="login_id" value="${c_user.email }">
				</td>
			</tr>
			<tr>
				<td>
					<label class="title">비밀번호</label>
				</td>
				<td>
					<input type="password" name="password" id="password" title="비밀번호">
				</td>
			</tr>
			<tr>
				<td colspan="2">
						외부로부터  <span>${c_user.email }</span> 님의 정보를 안전하게 보호하기 위해 비밀번호를 다시 한번 확인합니다.<br>
						항상 비밀번호는 타인에게 노출되지 않도록 주의해 주세요.				
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="button" id="login_submit" class="btn btn-primary" value="확인">
				</td>
			</tr>
		</tbody>
	</table>									
	</form>	
	</div>
</div>
</div>

<div style="height:500px">
</div>
<div id="floatMenu">
<ul style="width:100%; list-style-type: none;" class="menu_">
	<li class="title"><h2>My<br>Page</h2></li>
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

<script>
	document.getElementById('password').focus();
</script>

<script>
$("#login_submit").click(function () {
	if($("#login_pw").val() === ""){
		alert("비밀번호를 입력해 주십시오");
		$("#login_pw").focus();
	}else{
		$("#frmForm").submit();
	}
});

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