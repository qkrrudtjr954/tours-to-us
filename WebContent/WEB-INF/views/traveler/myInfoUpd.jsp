<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<style>

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
		<form action="myInfoUpdAf.do" id="frmForm" autocomplete="off">
			<table class="table">
				<tbody>
					<tr>
						<td><label class="title">아이디 또는 이메일 주소</label></td>
						<td colspan="2">${c_user.email }
							<input type="hidden" name="email" id="login_id" value="${c_user.email }">
						</td>
					</tr>
					<tr>
						<td><label class="title">현재 비밀번호</label></td>
						<td>
							<input type="password" name="nowpass" class="nowpass" title="현재 비밀번호">
							<div class="invalid-nowpwd"></div>
						</td>
					</tr>
					<tr>
						<td><label class="title">새 비밀번호</label></td>
						<td>
							<input type="password" name="newpass1" class="newpass1" title="새 비밀번호">
							<div  class="invalid-feedback"></div>
						</td>
					</tr>
					<tr>
						<td><label class="title">새 비밀번호 확인</label></td>
						<td>
							<input type="password" name="password" class="newpass2" title="새 비밀번호 확인">
							<div  class="invalid-password"></div>
						</td>
					</tr>
					<tr>
						<td><label class="title">이름</label></td>
						<td colspan="2">
							<input type="text" name="name" class="name" value="${c_user.name }">
						</td>
					</tr>
					<tr>
						<td colspan="3" align="center">
							<input type="button" id="upd-btn" class="btn btn-primary" value="확인">
						</td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>
</div>
<script>
$(".nowpass").keyup(function () {
	var pwd = "${c_user.password}";
	//alert($("#nowpass").val());
	if($(".nowpass").val() != pwd){
		$(this).removeClass('success');
		$(".invalid-nowpwd").html('<span style="font-size:80%;color:#dc3545;">비밀번호가 일치하지 않습니다.</span>');
	}else{
		$(this).addClass('success');
		$(".invalid-nowpwd").html('<span style="font-size:80%;color:#28a745;">완료</span>');
	}
});

$('.newpass2').keyup(function () {
	if(this.value != $('.newpass1').val()){
		//$(this).attr('style', 'border-color:#dc3545;');
		$(this).removeClass('success');
		$('.invalid-password').html('<span style="font-size:80%;color:#dc3545;">비밀번호가 일치하지 않습니다..</span>');
			
	}else{
		//$(this).attr('style', 'border-color:#28a745;');
		$(this).addClass('success');
		$('.invalid-password').html('<span style="font-size:80%;color:#28a745;">비밀번호가 일치합니다.</span>');
	}	
});

$("#upd-btn").click(function name() {
	var nowpwd = $(".nowpass").val();
	var newpwd1 = $(".newpass1").val();
	var newpwd2 = $(".newpass2").val();
	
	if(nowpwd === ""){
		alert("현재 비밀번호를 입력해 주십시오");
		$(".nowpass").focus();
		return;
	}else if(newpwd1 === ""){
		alert("새 비밀번호를 입력해 주십시오");
		$(".newpass1").focus();
	}else if(newpwd2 === ""){
		alert("새 비밀번호 확인을 입력해 주십시오");
		$(".newpass2").focus();
	}else{
		$("#frmForm").submit();
	}
});

</script>










