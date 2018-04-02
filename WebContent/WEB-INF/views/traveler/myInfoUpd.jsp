<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <style type="text/css">
    p {
    margin: 0;
    padding: 0;
    list-style: none;
}

div{
	margin: 0;
    padding: 0;
    font-family: "NanumBarunGothic", "Arial", "돋움";
    font-weight: normal;

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
<div class="offset-md-4">
	<form action="myInfoUpdAf.do" id="frmForm" autocomplete="off">
	<table class="table">
		<tbody>
			<tr>
				<td>
					<label class="title">아이디 또는 이메일 주소</label>
				</td>
				<td colspan="2">
					${c_user.email }<input type="hidden" name="email" id="login_id" value="${c_user.email }">
				</td>
			</tr>
			<tr>
				<td>
					<label class="title">현재 비밀번호</label>
				</td>
				<td>
					<input type="password" name="nowpass" class="nowpass" title="현재 비밀번호">
				</td>
				<td class="invalid-nowpwd">
				</td>
			</tr>
			<tr>
				<td>
					<label class="title">새 비밀번호</label>
				</td>
				<td>
					<input type="password" name="newpass1" class="newpass1" title="새 비밀번호">
				</td>
				<td class="invalid-feedback">
				</td>
			</tr>
			<tr>
				<td>
					<label class="title">새 비밀번호 확인</label>
				</td>
				<td>
					<input type="password" name="password" class="newpass2" title="새 비밀번호 확인">
				</td>
				<td class="invalid-password">
				</td>
			</tr>
			<tr>
				<td>
					<label class="title">이름</label>
				</td>
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
		$(".invalid-nowpwd").html('<span style="font-size:80%;color:#dc3545;">완료</span>');
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










