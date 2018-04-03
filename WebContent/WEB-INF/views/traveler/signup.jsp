<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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
</style>
<div class="row">
	<div class="offset-md-3 col-md-6 order-md-1">
		<div class="sign-up-image justify-content-center">
			<div class="sign-up-text align-bottom">
				<h1
					style="color: white; text-shadow: -2px 0 black, 0 2px black, 2px 0 black, 0 -2px black;">Welcome!</h1>
				<h3
					style="color: black; text-shadow: -2px 0 white, 0 2px white, 2px 0 white, 0 -2px white;">
					<span style="color: #7DC3BB; font-size: 40px;">Tours to us</span>에
					오신 것을 환영합니다.
				</h3>
			</div>
		</div>
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
					<td>&nbsp;&nbsp; <input type="checkbox" class="check">이용약관에
						동의합니다.
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
					<td>&nbsp;&nbsp; <input type="checkbox" class="check">개인정보
						수집 및 이용에 대한 안내에 동의합니다.
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

		<div id="step1view">
			<form class="needs-validation" id="signUpForm" action="" method="POST" novalidate>
				<div class="step1-title">
					<span style="color:#7DC3BB; font-size:20px;">필수 입력 사항</span>
				</div>
				<hr>
				<div class="d-flex justify-content-center">
					<div class="text-center">
						<img alt="test" src="${pageContext.request.contextPath }/image/no-img.png" class="circle" id="user_image" width="200px">
						<input type="file" class="form-control-file" id="user_profile"> 
						<input type="hidden" class="form-control" id="user_profile" name="profile" value="no-img.png"> 
					</div>
				</div>
				<div class="mb-3">
					<label for="email">
						<span class="signup-step-number">01</span>Email <span class="red-star">*</span>
					</label> 
					<input type="email" class="form-control success" name="email" id="email" placeholder="you@example.com">
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
					
					<input type="password" class="form-control" name="password" id="password" required>
					<div class="invalid-feedback">비밀번호를 입력해주세요.</div>
				</div>

				<div class="mb-3">
					<label for="password">
						<span class="signup-step-number">04</span>Password 
						<span style="font-size: 15px;">(Confirm)</span>
						<span class="red-star">*</span>
					</label> 
					<input type="password" class="form-control" name="password2" id="password2" required>
					<div class="invalid-feedback">비밀번호를 확인해주세요.</div>
					<div class="invalid-password"></div>
				</div>

				


				<hr class="mb-4">
				<p>
					<span style="font-color: #7DC3BB; font-size: 4px;">선택 입력 사항</span>
				</p>
				회원님의 여행 타입은? (3개 선택)<br>
				<br>


				<div class="user_choice"
					style="background-color: green; width: 80%; height: 200px;">
					<input type="checkbox" onclick=CountChecked(this) id="choice"
						name="choice" value="aaa">aaa <input type="checkbox"
						onclick=CountChecked(this) id="choice" name="choice" value="bbb">bbb
					<input type="checkbox" onclick=CountChecked(this) id="choice"
						name="choice" value="ccc">ccc <input type="checkbox"
						onclick=CountChecked(this) id="choice" name="choice" value="ddd">ddd
					<input type="checkbox" onclick=CountChecked(this) id="choice"
						name="choice" value="ddd">ddd <input type="checkbox"
						onclick=CountChecked(this) id="choice" name="choice" value="ddd">ddd
					<input type="checkbox" onclick=CountChecked(this) id="choice"
						name="choice" value="ddd">ddd <input type="checkbox"
						onclick=CountChecked(this) id="choice" name="choice" value="ddd">ddd
					<input type="checkbox" onclick=CountChecked(this) id="choice"
						name="choice" value="ddd">ddd <input type="checkbox"
						onclick=CountChecked(this) id="choice" name="choice" value="ddd">ddd
					<input type="checkbox" onclick=CountChecked(this) id="choice"
						name="choice" value="ddd">ddd
				</div>

				<hr class="mb-4">

				<div class="custom-control custom-checkbox">
					<input type="checkbox" class="custom-control-input"
						id="same-address"> <label class="custom-control-label"
						for="same-address"> Shipping address is the same as my
						billing address </label>
				</div>
				<div class="custom-control custom-checkbox">
					<input type="checkbox" class="custom-control-input" id="save-info">
					<label class="custom-control-label" for="save-info"> Save
						this information for next time </label>
				</div>


				<div class="offset-md-11">
					<button type="button" id="btn_join"
						style="background: url(next_button.png) no-repeat; border: none; outline: none;">
						<img src="image/next_button.png" width="100px">
					</button>
				</div>
			</form>




		</div>


	</div>
</div>

<script type="text/javascript">
	$('#user_profile').change(function() {
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

				$('#user_image').attr('src',
						'${initParam.IMG_SERVER_PATH}/image/' + filename);

			}
		});
	}

	$('#btn_enter').on('click', function() {

		if ($('input.check').is(':checked') == false) {
			alert("모든 약관에 동의해주세요");
			return;
		} else {

			$(".join_terms").css("display", "none");
			$("#step1view").css("display", "block");
		}

	});

	/*         function hangul()	{
	 if((event.keyCode < 12592) || (event.keyCode > 12687))
	 event.returnValue = false
	 alert("한글을 입력해주세요");
	 }	
	
	 */

	$(document).ready(function() {
		$(".join_terms").css("display", "none");
		$("#step1view").css("display", "block");

		$("#join01").load("text/join01.txt");
		$("#join02").load("text/join02.txt");

		$('#email').keyup(function() {
			$.ajax({
				url : 'checkEmail.do',
				data : { email : $('#email').val() },
				type : 'GET',
				success : function(data) {
					if (data == 'no') {
						$('#email').attr('style', 'border-color:#dc3545;');
						$('#email').removeClass('success');
						$('.invalid-email').html('<span style="font-color:#dc3545;">이미 사용중인 이메일 입니다.</span>');
					} else {
						$('#email').attr('style','border-color:#28a745;');
						$('#email').addClass('success');
						$('.invalid-email').html('<span style="font-color:#28a745;">사용가능한 이메일 입니다.</span>');
					}
				}
			})
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
		} else if ($('#profile').val() == '') {

			alert("프로필을 등록해 주십시오");
			$('#profile').focus();
		} else {
			$("#signUpForm").attr({
				"target" : "_self",
				"action" : "signup1step.do"
			}).submit();
		}
	});
</script>