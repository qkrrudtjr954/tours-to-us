<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<style>
#signInBtn {
	padding: 15px;
    border: 2px solid #7cc4bb;
    border-radius: 10px;
    width: 100%;
    color: #7cc4bb;
    transition: color 1s, background-color 1s;
}

input#signInBtn:hover {
    background-color: #7cc4bb;
    color: white;
    transition: color 1s, background-color 1s;
}
</style>
<div class="d-flex justify-content-center text-center row no-gutters">
	<form class="form-signin" name="frmForm">
		<img class="mb-4" src="./image/signimg.png" alt="" width="150px" height="150px">
		<h1 class="h3 mb-3 font-weight-normal">Sign In</h1>
		
		<label for="inputEmail" class="sr-only">Email address</label> 
		<input type="email" id="inputEmail" name="email" class="form-control" placeholder="Email address" data-msg="ID를" required autofocus> 
		
		<label for="inputPassword" class="sr-only">Password</label> 
		<input type="password" id="inputPassword" name="password"  onkeypress="caps_lock(event)" class="form-control" placeholder="Password" data-msg="PassWord를" required>
		<p id="capslock" style="position:relative; border:1px solid #7cc4bb; width:450px; bottom:0px; display:none"> 
    		&nbsp;<span style="font-family: 고딕;font-size: medium ; color: #191970; "><b>CapsLock</b> 키가 눌려있습니다.&nbsp;</span>
		</p>

		
		<div class="checkbox mb-3">
			<label> 
				<input type="checkbox" value="remember-me"> Remember me
			</label>
		</div>
		<input class="btn btn-lg btn-defalut btn-block" type="button" id="signInBtn" value="Sign in">
		<p class="mt-5 mb-3 text-muted">&copy; 2017-2018</p>
	</form>
</div>

<script type="text/javascript">
$("#signInBtn").click(function() {
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
		$("#signInBtn").click();
	}
});

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

$('input[type="button"]#signInBtn').on('click', function () {
	// make validate function
	$.ajax({
		url : 'signinAf.do',
		method : 'POST',
		data : { email : $('#inputEmail').val(), password : $('#inputPassword').val() },
		success : function (data) {
			 var user = data;

			if(user === ""){
				alert('아이디와 비밀번호를 확인해주십시오.');
				$("#inputPassword").val("");
				$("#inputPassword").focus();
			} else {
				location.href="main.do";
			}
		}
	})
});

$(document).ready(function () {
	var user_id = $.cookie("user_id");
	if(user_id != null){
		$('#inputEmail').val(user_id);
		$('input[type="checkbox"]').attr('checked', 'checked');
	}
});

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

