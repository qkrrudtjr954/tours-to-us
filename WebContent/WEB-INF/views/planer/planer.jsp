<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div class="planer-title">
	<div class="offset-md-2 col-md-4 col-xs-12">
		<h2>여행 계획</h2>
	</div>	
</div>
<div class="offset-md-2 col-md-8 col-xs-12">
	<hr>
</div>
<div class="planer-content">
	<div class="row">
		<div class="offset-md-2 col-md-4 col-xs-12">
			<img src="${pageContext.request.contextPath }/image/planer.jpg" alt="" style="width:100%; height:500px;" id="paper-canvas">
		</div>
		<div class="col-md-4 col-xs-12">
			${current_user }
			<form id="planerForm">
				<div class="form-group">
					<label for="name">여행 이름</label> 
					<input type="text" class="form-control" id="title" name="title" placeholder="Ex) 먹방 대만 여행">
				</div>
				<div class="form-group">
					<label for="location">여행 지역</label> 
					<select class="form-control" id="location" name="location">
						<option>1</option>
						<option>2</option>
						<option>3</option>
						<option>4</option>
						<option>5</option>
					</select>
				</div>
				<div class="form-group">
					<label for="location">여행 기간</label> 
					<div class="row">
						<div class="col">
							<input type="date" class="form-control" id="from_date" name="from_date">
						</div>
						<div class="col">
							<input type="date" class="form-control" id="to_date" name="to_date">
						</div>				
					</div>
				</div>
				
				<div class="form-group">
					<label for="paper">표지</label> 
					<div class="d-flex justify-content-center">
						<input type="hidden" value="" id="paper" name="paper">
						<div class="paper-image">
							<img alt="" src="${pageContext.request.contextPath }/image/paper1.png" width="75px" height="100px">					
						</div>
						<div class="paper-image">
							<img alt="" src="${pageContext.request.contextPath }/image/paper2.png" width="75px" height="100px">					
						</div>
						<div class="paper-image">
							<img alt="" src="${pageContext.request.contextPath }/image/paper3.png" width="75px" height="100px">					
						</div>
						<div class="paper-image">
							<img alt="" src="${pageContext.request.contextPath }/image/paper4.png" width="75px" height="100px">					
						</div>
						<div class="paper-image">
							<img alt="" src="${pageContext.request.contextPath }/image/paper5.png" width="75px" height="100px">					
						</div>
					</div>
				</div>
				
				<div class="next-button">
					<a href="#none" id="next-step">
						<img alt="next" src="${pageContext.request.contextPath }/image/next_button.png" width="50px" height="50px">
					</a>
				</div>
			</form>
		</div>
	</div>
</div>

				<input type="hidden" name="targer-planer-seq" value="">
				
				
<div class="add-friend">
	<div class="row">
		<div class="offset-md-2 col-md-4 col-xs-12">
			<form id="findFriendForm">
				<div class="input-group">
					<input type="text" class="form-control" placeholder="여행을 함께할 친구를 찾아보세요." aria-describedby="basic-addon2" id="friendName">
					<div class="input-group-append">
						<button class="btn btn-outline-secondary" type="button" id="findFriendBtn">
							<span data-feather="search"></span>
						</button>
					</div>
				</div>
				<span id="notice" style="margin-left: 10px;"></span>
			</form>
			
			<table class="table" id="findedFriendTable">
				<thead>
					<tr>
						<th>pic</th>
						<th>name</th>
						<th>email</th>
					</tr>
				</thead>
				<tbody>
					
				</tbody>
			</table>
		</div>
		<div class="col-md-4" >
			<div class="added-friend">
				test user
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">

	$('#findFriendBtn').on('click', function () {
		var name = $('#friendName').val();
		
		if(name == ""/*  || name.length < 3 */){
			$('#notice').text('이름을 3글자 이상 입력해주세요.');
			$('#notice').css('color', 'red').css('font-size', '13px');
			$('#friendName').focus();
		} else {
			$('#notice').text('');
			
			findFriend(name);
		}
	})
	
	function findFriend(name) {
		$.ajax({
			url : 'findFriend.do',
			method : 'POST',
			data : { name : name },
			success : function (data) {
				//	table 그리기 
				console.log(data);
				
				for(var i=0; i<data.length; i++){
					drawFindedFriends(data[i]);					
				}
				
				
			}
		})
	}
	
	function drawFindedFriends(friend) {
		var tableElement = 
			'<tr>'+
				'<td>'+friend.seq+'</td>'+
				'<td>'+friend.name+'</td>'+
				'<td>'+friend.email+'</td>'+
			'</tr>';
			
		$('#findedFriendTable tbody').append(tableElement);
	}

	$('div.paper-image img').on('mouseenter', function () {
		$('#paper-canvas').attr('src', $(this).attr('src'));
	})
	
	$('div.paper-image img').on('click', function () {
		for(var i=0; i< $('div.paper-image img').length; i++){
			$('div.paper-image img').css('border', 'none');
		}
		$(this).css('border', '2px solid skyblue');
		$('#paper-canvas').attr('src', $(this).attr('src'));
		
		var url = $(this).attr('src');
		var temp = url.substring(12);
		
		$('input[name="paper"]').val(temp);
	})
	
	
	$('#next-step').on('click', function () {
		var FormData = $('#planerForm').serialize();
		
		$.ajax({
			url: 'addPlaner.do',
			method: 'POST',
			data: FormData,
			success: function (data) {
				console.log(data);
				alert('planer add');
			}
		})
	})
	

</script>
