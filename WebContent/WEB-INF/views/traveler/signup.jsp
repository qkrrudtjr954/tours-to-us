<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

	<br><br><br><br>
	<div class="row">
			<div class="offset-md-3 col-md-6 order-md-1">
				<div id="step1view">
				<form class="needs-validation" id="signUpForm" action="" method="GET" novalidate>										
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
					

					</div>

					<div class="mb-3">
						<label for="password">Password</label> 
						<input type="password" class="form-control" name="password" id="password" required>
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
					<button type="button" id="step1" style="background: url(next_button.png) no-repeat;  border: none;  outline: none;"><img src="image/next_button.png" width="50"></button>
					<!-- <a href="#none" id="_btnRegi" title="회원가입">
					<img src="image/next_button.png" width="50"></a> -->
					</div>
				</form>
				</div>
				
			
				<img src="image/map.png" width="100%">
				<h1>Welcome!</h1>
				<h3>Tours to us에 오신 것을 환영합니다. </h3>
				<br>
				<div id="step2view">
				당신의 성향은? <br><br>
				
				
				
				<form id="step2Form" action="" method="GET" novalidate>
				<div class="user_choice" style="background-color: green; width: 80%; height: 200px;">
						<input type="checkbox" onclick=CountChecked(this) id ="choice" name="choice" value="aaa">aaa	
						<input type="checkbox" onclick=CountChecked(this) id ="choice" name="choice" value="bbb">bbb	
						<input type="checkbox" onclick=CountChecked(this) id ="choice" name="choice" value="ccc">ccc
						<input type="checkbox" onclick=CountChecked(this) id ="choice" name="choice" value="ddd">ddd	
						<input type="checkbox" onclick=CountChecked(this) id ="choice" name="choice" value="ddd">ddd	
						<input type="checkbox" onclick=CountChecked(this) id ="choice" name="choice" value="ddd">ddd	
						<input type="checkbox" onclick=CountChecked(this) id ="choice" name="choice" value="ddd">ddd	
						<input type="checkbox" onclick=CountChecked(this) id ="choice" name="choice" value="ddd">ddd	
						<input type="checkbox" onclick=CountChecked(this) id ="choice" name="choice" value="ddd">ddd	
						<input type="checkbox" onclick=CountChecked(this) id ="choice" name="choice" value="ddd">ddd	
						<input type="checkbox" onclick=CountChecked(this) id ="choice" name="choice" value="ddd">ddd	
				</div>
				<div class="offset-md-11">
				<button type="button" id="step2" style="background: url(next_button.png) no-repeat;  border: none;  outline: none;"><img src="image/next_button.png" width="50"></button>		
				</div>
				</form>
				
				                
		
				</div>
				
		
			</div>
		</div>
		
		<script>
		
/* 		function hangul()	{
		if((event.keyCode < 12592) || (event.keyCode > 12687))
		event.returnValue = false
		alert("한글을 입력해주세요");
		}	   */
		
		
				
			$(document).ready(function () {
				
				$("#step1view").css("display", "block");
				$("#step2view").css("display", "none");	
				
				
				$('#email').keyup(function () {
					$.ajax({
		  				url : 'checkEmail.do',
		  				data : { email: $('#email').val() },
		  				type : 'GET',
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
					if(this.value != $('#password').val()){
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
		
			$('#step1').on('click', function () {
				$.ajax({
					url : 'signup1step.do',
	  				data : { email: $('#email').val(), name: $('#name').val(), password:$('#password').val() },
	  				type : 'GET',
	  				success : function (data) {
	  					$("#step1view").css("display", "none");
	  					$("#step2view").css("display", "block");	
	  				}
				})
			});
			
			$('#step2').on('click', function () {
				
				var checkboxValues = [];
			    $("input[name='choice']:checked").each(function(i) {
			        checkboxValues.push($(this).val());
			        console.log(checkboxValues);
			    });  			  
			    
			    $.ajax({
					url : 'signup2step.do',
	  				data : checkboxValues,
	  				type : 'GET',
	  				success : function (data) {
	  					$("#step1view").css("display", "none");
	  					$("#step2view").css("display", "block");	
	  				}
				}) 
			
			});
			
			  /*   
			$.ajax({
				url : 'signup2step.do',
  				data : checkboxValues,
  				type : 'GET',
  				success : function (data) {
  					$("#step1view").css("display", "none");
  					$("#step2view").css("display", "block");	
  				}
			}) */
			
			
			
			
	/* 		// 사용자 ID를 갖고 온다.
		    var checkedItem = $("#choice").val(); 
		    // name이 같은 체크박스의 값들을 배열에 담는다.
		    var checkboxValues = [];
		    $("input[name='choice']:checked").each(function(i) {
		        checkboxValues.push($(this).val());
		    });
		     
		    // 사용자 ID(문자열)와 체크박스 값들(배열)을 name/value 형태로 담는다.
		   //  var allData = { "userId": userId,  "checkArray": checkboxValues }; 
		    var allData = { "userId": userId,  "checkArray": checkboxValues };
		     
		    $.ajax({
		        url:"signup2step.do",
		        type:'GET',
		        data: allData,
		        success:function(data){
		        	$("#step1view").css("display", "none");
  					$("#step2view").css("display", "none");	
  					//$("#step3view").css("display", "block");	
		        },
		        error:function(jqXHR, textStatus, errorThrown){
		            alert("에러 발생~~ \n" + textStatus + " : " + errorThrown);
		            self.close();
		        }
		    }); */
			
		
			
			var maxChecked = 3;   //선택가능한 체크박스 갯수
			var totalChecked = 0; // 설정 끝

			function CountChecked(field) {
			    if (field.checked)
			        totalChecked += 1;
			    else
			        totalChecked -= 1;

			    if (totalChecked > maxChecked) {
			        alert ("최대 3개 까지만 선택 가능합니다.");
			    field.checked = false;
			    totalChecked -= 1;
			    }
			    
			}

			function ResetCount(){
			    totalChecked = 0;
			}
			
/* 			$("span").click(function(){
			    $(this).hide();
			    
			    var arr = [];
			    $.each($("input[name='userChoice[]']"),function(k,v){
			        arr[arr.length] = $(v).val();
			    });
			    
			   //$('.user_choice').append($('#choice1').val($(this).text())); 
			});
 	
			 $("span").click(function(){
		            var size = $("input[name='userChoice[]']").length;
		            var arr={$(this).text(), $(this).text(), $(this).text()};  
		            for(i=0;i<size;i++){
		            	
		                console.log("type1: "+$("input[name='userChoice[]']").eq(i).attr("value"));
		            }
		        });
	
			$("span").click(function(){
			    $(this).hide();
			    $('.user_choice').append($('#choice1').val($(this).text())); 
			});  */
		
		</script>