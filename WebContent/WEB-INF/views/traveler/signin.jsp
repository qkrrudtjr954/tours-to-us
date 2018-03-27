<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<div class="d-flex justify-content-center text-center">
	<form class="form-signin" action="signinAf.do" name="frmForm">
		<img class="mb-4" src="https://getbootstrap.com/assets/brand/bootstrap-solid.svg" alt="" width="72" height="72">
		<h1 class="h3 mb-3 font-weight-normal">Please sign in</h1>
		
		<label for="inputEmail" class="sr-only">Email address</label> 
		<input type="email" id="inputEmail" name="email" class="form-control" placeholder="Email address" data-msg="ID를" required autofocus> 
		
		<label for="inputPassword" class="sr-only">Password</label> 
		<input type="password" id="inputPassword" name="password" class="form-control" placeholder="Password" data-msg="PassWord를" required>
		
		
		<div class="checkbox mb-3">
			<label> 
				<input type="checkbox" value="remember-me"> Remember me
			</label>
		</div>
		<input class="btn btn-lg btn-primary btn-block" type="submit" id="SigninBtn" value="Sign in">
		<p class="mt-5 mb-3 text-muted">&copy; 2017-2018</p>
	</form>
</div>

<script type="text/javascript">
$("#SigninBtn").click(function() {
	//alert("SigninBtn");
	if($("#inputEmail").val()==""){
		alert($("#inputEmail").attr("data-msg")+" 입력해 주십시요");
		$("#inputEmail").focus();
	}
	else if($("#inputPassword").val()==""){
		alert($("#inputPassword").attr("data-msg")+" 입력해 주십시요");
		$("#inputPassword").focus();
	}
	else{
		$("#frmForm").attr("target","_self").submit();
	} 
});

$("#inputEmail").keypress(function(event) {
	if(event.which == "13"){
		//action="#"과같이 위로올라가는것을 하지않도록 막아주는 코드
		event.preventDefault();
		$("#inputPassword").focus();
	}
});
$("#inputPassword").keypress(function(event) {
	if(event.which == "13"){
		event.preventDefault();
		//버튼클릭부분으로 이동시킴
		$("#SigninBtn").click();
	}
});
</script>
<script type="text/javascript">
//session, 쿠키저장 
$('input[type="checkbox"]').on('click', function () {
	//alert($("#inputEmail").val());
	if($(this).is(':checked')){
		// insert into session
		if($('#inputEmail').val() == ''){
			$('input[type="checkbox"]').prop('checked', false);
			alert("아이디를 입력해 주십시오");
			$('#inputEmail').focus();
		}else{
			alert('session!')
			$.cookie('user_id', $('#inputEmail').val(), {expires: 7, path: '/'});
		}
	}else{
		// delete from session
		alert("delete!");
		$.removeCookie("user_id", {path: '/'});
	}
});

$(document).ready(function () {
	var user_id = $.cookie("user_id");
	if(user_id != null){
		$('#inputEmail').val(user_id);
		$('input[type="checkbox"]').attr('checked', 'checked');
	}
});

</script>
