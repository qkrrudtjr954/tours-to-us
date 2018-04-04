<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<style>
.sign-up-image {
	margin-top: 5px;
	background-image: url('./image/join_img.png');
	background-size: cover;
	background-repeat: no-repeat;
	height: 500px;
	text-align: center;
	position: relative;
}

.sign-up-text {
	position: absolute;
	bottom: 100px;
	width: 100%;
}

.signup-step-number {
	font-size: 50px;
	font-weight: 700;
	color: #7DC3BB;
}

.signup-step-title {
	margin-left: 20px;
	font-size: 20px;
	font-weight: 700;
}

.join_terms>table tr td {
	padding: 15px;
}

.join_terms>table tr td textarea {
	border: 2px solid #7DC3BB;
}

.red-star {
	padding: 5px;
	color: red;
	font-size: 25px;
}

#step1view label {
	font-size: 20px;
}

.likeBtnArea{
	border: 2px solid #7DC3BB;
	padding: 40px;
}
.likeBtn {
	margin: 5px;
}

#user_image {
	border-radius: 50%;
    border: 4px solid gray;
    margin: 10px;
}
</style>
<div class="row">
	<div class="offset-md-3 col-md-6 order-md-1">
		<div class="sign-up-image justify-content-center">
			<div class="sign-up-text align-bottom">
				<h1 style="color: white; text-shadow: -2px 0 black, 0 2px black, 2px 0 black, 0 -2px black;">Welcome!</h1>
				<h3 style="color: black; text-shadow: -2px 0 white, 0 2px white, 2px 0 white, 0 -2px white;">
					<span style="color: #7DC3BB; font-size: 40px;">Tours to us</span>에 오신 것을 환영합니다.
				</h3>
			</div>
		</div>
	</div>
</div>
<div class="row step1-container">
	<div class="offset-md-3 col-md-6 order-md-1">
		<div class="join_terms">
			<!--이용약관 테이블 시작-->
			<table style="width: 100%">
				<tr>
					<td><hr></td>
				</tr>
				<tr>
					<td>
						<div>
							<span class="signup-step-number">01</span> <span
								class="signup-step-title">이용약관</span>
						</div>
					</td>
				</tr>
				<tr>
					<td align=center><textarea name="tos" id="join01" rows="15"
							cols="100" readonly="readonly"></textarea></td>
				</tr>
				<tr>
					<td>
						<div class="custom-control custom-checkbox">
							<input type="checkbox" class="custom-control-input check" id="customCheck1"> 
							<label class="custom-control-label" for="customCheck1">이용약관에 동의합니다.</label>
						</div>
					</td>
				</tr>
				<tr>
					<td><hr></td>
				</tr>
				<tr>
					<td>
						<div>
							<span class="signup-step-number">02</span> <span
								class="signup-step-title">개인정보 수집 및 이용에 대한 안내</span>
						</div>
					</td>
				</tr>
				<tr>
					<td align=center><textarea name="tos" rows="15" cols="100"
							id="join02" readonly="readonly"></textarea></td>
				</tr>
				<tr>
					<td>
						<div class="custom-control custom-checkbox">
							<input type="checkbox" class="custom-control-input check" id="customCheck2"> 
							<label class="custom-control-label" for="customCheck2">개인정보	수집 및 이용에 대한 안내에 동의합니다.</label>
						</div>
					</td>
				</tr>
				<tr>
					<td><hr></td>
				</tr>
			</table>
			<div class="offset-md-5">
				<button class="btn btn-outline-secondary" id="btn_enter">회원가입</button>
				<button class="btn btn-outline-secondary" id="btn_back">돌아가기</button>
			</div>
		</div>
	</div>
</div>


<div class="step2-container">
	<div class="row no-gutters">
		<div class="offset-md-3 col-md-6 order-md-1">
			<div class="step1-title">
				<span style="color:#7DC3BB; font-size:20px;">필수 입력 사항</span>
			</div>
			<hr>
		</div>
	</div>
	<div class="row no-gutters">
		<div id="step1view" class="offset-md-4 col-md-4 col-xs-12">
			<form class="needs-validation" id="signUpForm" method="POST" onsubmit="false">
				<div class="d-flex justify-content-center">
					<div class="text-center">
						<img alt="test" src="${pageContext.request.contextPath }/image/no-profile.png" class="circle" id="user_image" width="150px" height="150px">
						<input type="file" class="form-control-file" id="user_profile1">
						<input type="hidden" name="profile" class="form-control-file" value="no-profile.png">						
					</div>
				</div>
				<div class="mb-3">
					<label for="email">
						<span class="signup-step-number">01</span>Email <span class="red-star">*</span>
					</label> 
					<input type="email" class="form-control success" name="email" id="email" placeholder="you@example.com" autocomplete="off">
					<div class="invalid-feedback">이메일을 입력해주세요.</div>
					<div class="invalid-email"></div>
				</div>

				<div class="mb-3">
					<label for="name">
						<span class="signup-step-number">02</span>Name <span class="red-star">*</span>
					</label>
					<input type="text" class="form-control success" name="name" id="name" placeholder="이름을 입력해주세요" onkeypress="hangul();">
					<div class="invalid-feedback">이름을 입력해주세요.</div>
				</div>

				<div class="mb-3">
					<label for="password">
						<span class="signup-step-number">03</span>Password <span class="red-star">*</span>
					</label> 
					
					<input type="password" class="form-control" name="password" placeholder="비밀번호를 입력해주세요" id="password" required>
					<div class="invalid-feedback">비밀번호를 입력해주세요.</div>
				</div>

				<div class="mb-3">
					<label for="password">
						<span class="signup-step-number">04</span>Password 
						<span style="font-size: 15px;">(Confirm)</span>
						<span class="red-star">*</span>
					</label> 
					<input type="password" class="form-control"  placeholder="비밀번호를 확인해주세요" name="password2" id="password2" required>
					<div class="invalid-feedback">비밀번호를 확인해주세요.</div>
					<div class="invalid-password"></div>
				</div>
				<!-- <input type="text" name="like1" id="like1" value="없음">
				<input type="text" name="like2" id="like2" value="없음">
				<input type="text" name="like3" id="like3" value="없음"> -->
				
				<input type="hidden" name="like1" id="like1" value="없음">
				<input type="hidden" name="like2" id="like2" value="없음">
				<input type="hidden" name="like3" id="like3" value="없음">
			</form>
		</div>
	</div>
	<div class="row no-gutters">
		<div class="offset-md-3 col-md-6">
			<div class="step1-title">
				<span style="color:#7DC3BB; font-size:20px;">선택 입력 사항</span>
			</div>
			<hr>
			<div class="row no-gutters">
				<div id="step1view" class="offset-md-2 col-md-8 col-xs-12">
					<label for="likeBtn">
						성향을 선택해주세요. 
						<span style="font-size: 15px;">(3개)</span>
					</label> 
					<div class="mb-3">					
						<div class="likeBtnArea">
							<button class="btn btn-secondary likeBtn" onclick="addLike(this)">hello1</button>
							<button class="btn btn-secondary likeBtn" onclick="addLike(this)">hello2</button>
							<button class="btn btn-secondary likeBtn" onclick="addLike(this)">hello3</button>
							<button class="btn btn-secondary likeBtn" onclick="addLike(this)">hello4</button>
							<button class="btn btn-secondary likeBtn" onclick="addLike(this)">hello5</button>
							<button class="btn btn-secondary likeBtn" onclick="addLike(this)">hello6</button>
						</div>
					</div>
				
				</div>
			</div>
			<hr>
		</div>
	</div>
	<!-- <div class="row">
		<div class="offset-md-4 col-md-3">
			<div class="custom-control custom-checkbox">
				<input type="checkbox" class="custom-control-input" id="same-address"> 
				<label class="custom-control-label" for="same-address"> Shipping address is the same as my billing address </label>
			</div>
			
			<div class="custom-control custom-checkbox">
				<input type="checkbox" class="custom-control-input" id="save-info">
				<label class="custom-control-label" for="save-info"> Save this information for next time </label>
			</div>
		</div>
	</div> -->
	<div class="row no-gutters">
		<div class="offset-md-5 col-md-2 col-xs-12">
			<div class="text-center">
				<button type="button" id="btn_join" class="btn btn-primary">회원 가입</button>
			</div>
		</div>
	</div>
</div>


<script type="text/javascript">
	var regEmailExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;

	$(document).ready(function() {
 		$(".step1-container").css("display", "block");
		$(".step2-container").css("display", "none"); 
	
		$("#join01").load("text/join01.txt");
		$("#join02").load("text/join02.txt");
	
	});


	$('#user_profile1').change(function() {
		sendFile(this.files[0]);
	});

	function sendFile(file, dom) {
		formdata = new FormData();
		formdata.append("userImage", file);
		$.ajax({
			data : formdata,
			type : "POST",
			url : '${initParam.IMG_SERVER_PATH}/upload',
			cache : false,
			contentType : false,
			processData : false,
			success : function(data) {
				console.log(data);
				var filename = data.filename;

				$('input[name="profile"]').val(filename);
				$('#user_image').attr('src', '${initParam.IMG_SERVER_PATH}/image/' + filename);

			}
		});
	}

	
	$('#btn_enter').on('click', function() {
		let checkBoxs = $('input[type="checkbox"]');
		let flag = true;
		for(let i=0; i<checkBoxs.length; i++){
			if ($(checkBoxs[i]).is(':checked') == false) {
				alert("모든 약관에 동의해주세요");
				$(checkBoxs[i]).focus();
				flag = false;
				break;
			}			
		}
		if(flag){
			$(".step1-container").css("display", "none");
			$(".step2-container").css("display", "block");
			$('html, body').stop().animate( { scrollTop : 660 } );
		}
	});
 
	/*         function hangul()	{
	 if((event.keyCode < 12592) || (event.keyCode > 12687))
	 event.returnValue = false
	 alert("한글을 입력해주세요");
	 }	
	 */

	
	$('#email').keyup(function() {
		if ($('#email').val().match(regEmailExp) == null) {
			$('#email').attr('style', 'border-color:#dc3545;');
			$('#email').removeClass('success');
			$('.invalid-email').html('<span style="font-size:80%;color:#dc3545;">이메일 형식이 아닙니다.</span>');
		} else {			
			$.ajax({
				url : 'checkEmail.do',
				method : 'GET',
				data : { email : $('#email').val() },
				success : function(data) {
					if (data == 'no') {
						$('#email').attr('style', 'border-color:#dc3545;');
						$('#email').removeClass('success');
						$('.invalid-email').html('<span style="font-size:80%;color:#dc3545;">이미 사용중인 이메일 입니다.</span>');
					} else {
						$('#email').attr('style','border-color:#28a745;');
						$('#email').addClass('success');
						$('.invalid-email').html('<span style="font-size:80%;color:#28a745;">사용가능한 이메일 입니다.</span>');
					}
				}
			})
		}
	});

	$('#password2').keyup(function() { 
		if (this.value != $('#password') .val()) { 
			$(this).attr('style','border-color:#dc3545;');
			$(this).removeClass('success');
			$('.invalid-password').html('<span style="font-size:80%;color:#dc3545;">비밀번호가 일치하지 않습니다..</span>');
		} else {
			$(this).attr('style','border-color:#28a745;');
			$(this).addClass('success');
			$('.invalid-password').html('<span style="font-size:80%;color:#28a745;">비밀번호가 일치합니다.</span>');
		}
	});


	var maxChecked = 3; //선택가능한 체크박스 갯수
	var totalChecked = 0; // 설정 끝

	function CountChecked(field) {
		if (field.checked)
			totalChecked += 1;
		else
			totalChecked -= 1;

		if (totalChecked > maxChecked) {
			alert("최대 3개 까지만 선택 가능합니다.");
			field.checked = false;
			totalChecked -= 1;
		}

	}

	function ResetCount() {
		totalChecked = 0;
	}

	$('#btn_join').on('click', function() {
		// insert into session
		if ($('#email').val() == '') {
			alert("이메일을 입력해 주십시오");
			$('#email').focus();
		} else if ($('#name').val() == '') {
			alert("이름을 입력해 주십시오");
			$('#name').focus();
		} else if ($('#password').val() == '') {
			alert("비밀번호를 입력해 주십시오");
			$('#password').focus();
		} else if ($('#profile').val() == '') {
			alert("프로필을 등록해 주십시오");
			$('#profile').focus();
		} else if (!$('#email').hasClass('success')) {
			alert("중복된 이메일 입니다.");
			$('#email').focus();
		} else if (!$('#password2').hasClass('success')) {
			alert("비밀번호가 일치하지 않습니다.");
			$('#password2').focus();
		} else if ($('#email').val().match(regEmailExp) == null) {
			alert("이메일 형식을 확인해주십시오");
			$('#email').focus();
		} else {
			submitForm();
		}
	});
	
	function addLike(button) {
		let val = $(button).text();
		if($(button).hasClass('btn-secondary')){			
			for(let i=1; i<=3; i++){	
				if($('input[name="like'+i+'"]').val() == '없음'){
					$('input[name="like'+i+'"]').val(val);
					$(button).removeClass('btn-secondary');
					$(button).addClass('btn-primary');
					break;
				}
			}
		} else {
			for(let i=1; i<=3; i++){			
				if($('input[name="like'+i+'"]').val() == val){
					$('input[name="like'+i+'"]').val('없음');
					$(button).addClass('btn-secondary');
					$(button).removeClass('btn-primary');	
					break;
				}
			}
		}
		
	}
	
	function submitForm() {
		let FormData = $('#signUpForm').serialize();
		
		$.ajax({
			url : 'signupAf.do',
			data : FormData,
			method : 'POST',
			success : function (data) {
				if(data == '500'){
					alert('회원 가입할 수 없습니다. 잠시후 다시 시도해주세요.');
				} else if(data == '200'){
					alert('회원 가입에 성공했습니다.');
					location.href = 'signin.do';
				}
			}
		}); 
		
	}
</script>