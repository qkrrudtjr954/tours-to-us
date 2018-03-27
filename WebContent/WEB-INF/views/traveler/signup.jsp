<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

	<br><br><br><br>
	<div class="row">
			<div class="offset-md-3 col-md-6 order-md-1">
				<form class="needs-validation" id="signUpForm" action="" method="POST" novalidate>
										
					<div class="mb-3">
						<label for="email">Email</label> 
							<input type="email" class="form-control success" name="email" id="email" placeholder="you@example.com">
						<div class="invalid-feedback">이메일을 입력해주세요.</div>
						<div class="invalid-email"></div>

					</div>
					
					<div class="mb-3">
						<label for="name">Name</label> 
							<input type="text" class="form-control success" name="name" id="name" placeholder="이름을 입력해주세요" onkeypress="hangul();">
						<div class="invalid-feedback">이름을 입력해주세요.</div>
						<div class="invalid-email"></div>

					</div>

					<div class="mb-3">
						<label for="password">Password</label> 
						<input type="password" class="form-control" name="password1" id="password1" required>
						<div class="invalid-feedback">비밀번호를 입력해주세요.</div>
					</div>

					<div class="mb-3">
						<label for="password">Password <span style="font-size: 12px;">(Confirm)</span></label> 
						<input type="password" class="form-control" name="password2" id="password2" required>
						<div class="invalid-feedback">비밀번호를 확인해주세요.</div>
						<div class="invalid-password"></div>
					</div>

					<hr class="mb-4">
					
					<div class="custom-control custom-checkbox">
						<input type="checkbox" class="custom-control-input" id="same-address"> 
						<label class="custom-control-label" for="same-address">
							Shipping address is the same as my billing address
						</label>
					</div>
					<div class="custom-control custom-checkbox">
						<input type="checkbox" class="custom-control-input" id="save-info">
						<label class="custom-control-label" for="save-info">
							Save this information for next time
						</label>
					</div>
					
					<hr class="mb-4">
					<div class="offset-md-11">
					<button type="submit" style="background: url(next_button.png) no-repeat;  border: none;  outline: none;"><img src="image/next_button.png" width="50"></button>
					</div>
				</form>
			</div>
		</div>
		
		<script>
		
		function hangul()	{
		if((event.keyCode < 12592) || (event.keyCode > 12687))
		event.returnValue = false
		}	  
			
			$(document).ready(function () {
				$('#email').keyup(function () {
					$.ajax({
		  				url : 'UserControl',
		  				data : { command:'checkEmail', email: $('#email').val() },
		  				type : 'POST',
		  				success : function (data) {
		  					if(data == 'no'){
		  						$('#email').attr('style', 'border-color:#dc3545;');
		  						$('#email').removeClass('success');
		  						$('.invalid-email').html('<span style="font-color:#dc3545;">이미 사용중인 이메일 입니다.</span>');
		  					}else{
		  						$('#email').attr('style', 'border-color:#28a745;');
		  						$('#email').addClass('success');
		  						$('.invalid-email').html('<span style="font-color:#28a745;">사용가능한 이메일 입니다.</span>');
		  					}
		  				}
					})
				});
		    	  
				$('#password2').keyup(function () {
					if(this.value != $('#password1').val()){
						$(this).attr('style', 'border-color:#dc3545;');
						$(this).removeClass('success');
						$('.invalid-password').html('<span style="font-size:80%;color:#dc3545;">비밀번호가 일치하지 않습니다..</span>');
							
					}else{
						$(this).attr('style', 'border-color:#28a745;');
						$(this).addClass('success');
						$('.invalid-password').html('<span style="font-size:80%;color:#28a745;">비밀번호가 일치합니다.</span>');
					}	
				});
			});
		
		
		
		</script>