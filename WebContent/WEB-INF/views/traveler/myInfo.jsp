<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <style type="text/css">

.guide-info-over {
	position: absolute;
	background-color: #fff;
	padding: 15px;
	margin: 10px;
	width: 90%;
	border-radius: 15px;
	border: 1px solid #7DC3BB;
	top: 100px;
}

.gu-link{
	text-align: left;
}

.guide-label-icon{
text-align: center;
}

.guide-info-top{
	background-color: #7DC3BB;
	margin-top: 10px;
	margin-bottom: 10px;
	text-align: center;
}

.guide-label-atag{
	line-height: 1.5;
}

.ti-link:link {text-decoration: none; color: #000000;}
.ti-link:hover {text-decoration: underline; color: #7DC3BB;}
.ti-link:visited {text-decoration: none; color: #000000;}

.gu-link:link {text-decoration: none; color: #000000;}
.gu-link:hover {text-decoration: underline; color: #7DC3BB;}
.gu-link:visited {text-decoration: none; color: #000000;}




.planer-info-over {
	background-color: #7DC3BB;
	margin: 30px 10px;
	width: 80%;
	text-align: center;
	border-radius: 15px;
	padding: 15px;
    margin: 10px;
}

.menu_table ul{
	list-style-type: none;
	padding: 0px;
}
.menu_table li{
	padding: 10px 0px;
	color: white;
}
.menu-title {
	font-size: 20px;
}
.menu-item {
	font-size: 15px;
}
.planer-label-icon {
	vertical-align: middle;
	margin: 0px 3px;
}
.editor-title-container {
	margin-top: 20px;
	width: 100%;
}
</style>

<div class="row no-gutters">
	<div class="offset-md-2 col-md-8">
		<div class="editor-title-container">
			<h3>회원 정보 수정</h3>
			<p>회원님의 정보를 안전하게 수정하세요!</p>
		</div>
		<hr>
	</div>
</div>


<div class="row no-gutters">
	<div class="col-md-2 col-xs-12">
		<div class="planer-info-over">
			<div class="menu_table">
				<ul style="list-style-type: none">
					<li class="menu-title">
						<span class="planer-label-icon" data-feather="user"></span>마이 페이지
					</li>
					<li><hr></li>
					<li class="menu_item">
						<a href="myplan.do" class="nav-link" title="나의 플랜보기">나의 플랜보기</a>
					</li>
					<li class="menu_item">
						<a href="mypage.do" class="nav-link" title="회원 정보 수정">회원 정보 수정</a>
					</li>
				</ul>
			</div>
		</div>
	</div>
	<div class="offset-md-1 col-md-6">
		<form action="myInfoUpd.do" id="frmForm" autocomplete="off">
			<table class="table">
				<tbody>
					<tr>
						<td>
							<label class="title">아이디 또는 이메일 주소</label>
						</td>
						<td>${c_user.email }
							<input type="hidden" name="email" id="login_id" value="${c_user.email }">
						</td>
					</tr>
					<tr>
						<td><label class="password">비밀번호</label></td>
						<td>
							<input type="password" name="password" id="password" title="비밀번호" onkeypress="caps_lock(event)">
							<p id="capslock" style="position: relative; border: 1px solid #7cc4bb; width: 220px; bottom: 0px; display: none;"> &nbsp;
								<span style="font-family: 고딕; font-size: medium; color: #191970;">CapsLock키가 눌려있습니다.&nbsp;</span>
							</p>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<p class="text-center">
								외부로부터 <span>${c_user.email }</span> 님의 정보를
								안전하게 보호하기 위해 비밀번호를 다시 한번 확인합니다.<br> 항상 비밀번호는 타인에게 노출되지 않도록
								주의해 주세요.
							</p>
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

function caps_lock(e) {
    var keyCode = 0;
    var shiftKey = false;
    keyCode = e.keyCode;
    shiftKey = e.shiftKey;
    if (((keyCode >= 65 && keyCode <= 90) && !shiftKey)
            || ((keyCode >= 97 && keyCode <= 122) && shiftKey)) {
        show_caps_lock();
        setTimeout("hide_caps_lock()", 3500);
    } else {
        hide_caps_lock();
    }
}

function show_caps_lock() {
 $("#capslock").show();
}

function hide_caps_lock() {
 $("#capslock").hide();
}

</script>