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
	<form action="mypageCheck.do" id="frmForm" autocomplete="off">
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
					<input type="password" name="nowpass" id="nowpass" title="현재 비밀번호">
				</td>
				<td class="invalid-nowpwd">
				</td>
			</tr>
			<tr>
				<td>
					<label class="title">새 비밀번호</label>
				</td>
				<td>
					<input type="password" name="newpass1" id="nowpass1" title="새 비밀번호">
				</td>
				<td class="invalid-feedback">
				</td>
			</tr>
			<tr>
				<td>
					<label class="title">새 비밀번호 확인</label>
				</td>
				<td>
					<input type="password" name="password" id="newpass2" title="새 비밀번호 확인">
				</td>
				<td class="invalid-password">
				</td>
			</tr>
			<tr>
				<td>
					<label class="title">이름</label>
				</td>
				<td colspan="2">
					<input type="text" name="name" id="name" value="${c_user.name }">
				</td>
			</tr>
			<tr>
				<td colspan="3" align="center">
					<input type="button" id="login_submit" class="btn btn-primary" value="확인">
				</td>
			</tr>
		</tbody>
	</table>									
	</form>	
	</div>
</div>
</div>