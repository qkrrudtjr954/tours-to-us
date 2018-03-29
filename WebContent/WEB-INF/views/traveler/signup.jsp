<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div class="row">
<div class="offset-md-3 col-md-6 order-md-1">
	<br>
	<img src="image/img">
            <h1>Welcome!</h1>
			<h3>Tours to us에 오신 것을 환영합니다. </h3>
       
  <br>

       <div class="join_terms">
          <!--이용약관 테이블 시작-->
          <table width=810>
            <tr>
              <td>
                <div>
                 <font color="#7DC3BB" size=4>01</font> <font size=3>이용약관</font>
                </div>
             </td>
           </tr>
           <tr>
             <td align=center>
               <textarea name="tos" id ="join01" rows=15 cols=100 readonly="readonly"></textarea>
              </td>
            </tr>
            <tr>
              <td>
                &nbsp;&nbsp;<input type="checkbox" class="check">이용약관에 동의합니다.<br><br><br><br>
              </td>
            </tr>
            <tr>
              <td>
                <div>
                 <font color="#7DC3BB" size=4>02</font> <font size=3>개인정보 수집 및 이용에 대한 안내</font>
                </div>
             </td>
           </tr>
           <tr>
             <td align=center>
               <textarea name="tos" rows=15 cols=100 id="join02" readonly="readonly">
               
                  </textarea>
              </td>
            </tr>
            <tr>
              <td>
                &nbsp;&nbsp;<input type="checkbox" class="check">개인정보 수집 및 이용에 대한 안내에 동의합니다.
              </td>
            </tr>
          </table>
          <br><br>
          <div class="offset-md-5">
		<button id="btn_enter">회원가입</button>
		<button id="btn_back">돌아가기</button>
		</div>
			<br><br>
	</div>
               
               
               
               
				
				<div id="step1view">
				<form class="needs-validation" id="signUpForm" action="" method="GET" novalidate>										
					<div class="mb-3">
					<p><font color="#7DC3BB" size=4>필수 입력 사항</font></p>
						<label for="email">Email*</label> 
							<input type="email" class="form-control success" name="email" id="email" placeholder="you@example.com">
						<div class="invalid-feedback">이메일을 입력해주세요.</div>
						<div class="invalid-email"></div>

					</div>
					
					<div class="mb-3">
						<label for="name">Name*</label> 
							<input type="text" class="form-control success" name="name" id="name" placeholder="이름을 입력해주세요" onkeypress="hangul();">
						<div class="invalid-feedback">이름을 입력해주세요.</div>
					

					</div>

					<div class="mb-3">
						<label for="password">Password*</label> 
						<input type="password" class="form-control" name="password" id="password" required>
						<div class="invalid-feedback">비밀번호를 입력해주세요.</div>
					</div>

					<div class="mb-3">
						<label for="password">Password* <span style="font-size: 12px;">(Confirm)</span></label> 
						<input type="password" class="form-control" name="password2" id="password2" required>
						<div class="invalid-feedback">비밀번호를 확인해주세요.</div>
						<div class="invalid-password"></div>
					</div>
					
					<div class="mb-3">
						<label for="profile" >profile*</label>
						<input type="file" class="form-control" id="user_profile">
						<input type="hidden" class="form-control" id="user_profile" name="profile" value="no-img.png">
						<img alt="test" src="${pageContext.request.contextPath }/image/no-img.png" class="circle" id="user_image"  width="300px">
					</div>

								
					<hr class="mb-4">
					<p><font color="#7DC3BB" size=4>선택 입력 사항</font></p>
					회원님의 여행 타입은? (3개 선택)<br><br>
				
				
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
					
					
				<div class="offset-md-11">
				<button type="button" id="btn_join" style="background: url(next_button.png) no-repeat;  border: none;  outline: none;">
				<img src="image/next_button.png" width="100px">
				</button>
				</div>
				</form>
				
			
				                
		
				</div>
				
		
			</div>
		</div>

		<script type="text/javascript">

$('#user_profile').change(function () {
	sendFile(this.files[0]);
});


function sendFile(file, dom) {
	   formdata = new FormData();
	   formdata.append("userImage", file);

	   $.ajax({
	      data: formdata,
	      type: "POST",
	      url: '${initParam.IMG_SERVER_PATH}/upload',
	      cache: false,
	      contentType: false,
	      processData: false,
	      success: function(data) {
	         console.log(data);
	         var filename = data.filename;
			
	         $('input[name="profile"]').val(filename);
	         
	         $('#user_image').attr('src', '${initParam.IMG_SERVER_PATH}/image/'+filename);
	        
			}
	   });
	}

		
			$('#btn_enter').on('click', function () {
			
				if ($('input.check').is(':checked')==false) {
				alert("모든 약관에 동의해주세요");
					return;
				}else{
								
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
				
			$(document).ready(function () {
				$(".join_terms").css("display", "block");
				$("#step1view").css("display", "none");

               	 $("#join01").load("text/join01.txt");
               	 $("#join02").load("text/join02.txt");
				

					
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
					

			
	/*  $(function() {
            $("#profile").on('change', function(){
                readURL(this);
            });
        });

        function readURL(input) {
            if (input.files && input.files[0]) {
            var reader = new FileReader();

            reader.onload = function (e) {
                    $('#blah').attr('src', e.target.result);
                }

              reader.readAsDataURL(input.files[0]);
            }
        }
 */




			
		
			
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
			
			
		$('#btn_join').on('click', function () {
	      // insert into session
	      if($('#email').val() == ''){
	         
	         alert("이메일을 입력해 주십시오");
	         $('#email').focus();
	      }
	      else if($('#name').val() == ''){
	         
	         alert("이름을 입력해 주십시오");
	         $('#name').focus();
	      }
	      else if($('#password').val() == ''){
	         
	         alert("비밀번호를 입력해 주십시오");
	         $('#password').focus();
	      }
	      else if($('#profile').val() == ''){
	         
	         alert("프로필을 등록해 주십시오");
	         $('#profile').focus();
	      }
	      else if($('#profile').val() == ''){
	         
	         alert("프로필을 등록해 주십시오");
	         $('#profile').focus();
	      }
	      else{
	         $("#signUpForm").attr({"target":"_self", "action":"signup1step.do"}).submit();
	      }
	});

		</script>