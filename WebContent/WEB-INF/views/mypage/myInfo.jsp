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


<script>
	document.getElementById('login_pw').focus();
</script>

<script>
$("#login_submit").click(function () {
	if($("#login_pw").val() === ""){
		alert("비밀번호를 입력해 주십시오");
		$("#login_pw").focus();
	}else{
		$("#frmForm").submit();
	}
})
</script>