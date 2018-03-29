<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="planer-title">
	<div class="offset-md-2 col-md-4 col-xs-12">
		<h2>여행 계획</h2>
	</div>	
</div>
<div class="offset-md-2 col-md-8 col-xs-12">
	<hr>
</div>
    
<div class="planer-info">
	<div class="col-md-2 col-xs-12">
		<p>
			${planer }
		</p>
	</div>
</div>

<div class="add-friend">
	<div class="row">
		<div class="offset-md-2 col-md-4 col-xs-12">
			
			<div class="input-group">
				<input type="text" class="form-control" placeholder="여행을 함께할 친구를 찾아보세요." aria-describedby="basic-addon2" id="friendName">
				<div class="input-group-append">
					<button class="btn btn-outline-secondary" type="button" id="findFriendBtn">
						<span data-feather="search"></span>
					</button>
				</div>
			</div>
			<span id="notice" style="margin-left: 10px;"></span>
		
			
			<table class="table" id="findedFriendTable">
				<colgroup>
					<col width="20%">
					<col width="25%">
					<col width="50%">
					<col width="5%">
				</colgroup>
				<thead>
					<tr>
						<th>pic</th>
						<th>name</th>
						<th>email</th>
						<th>button</th>
					</tr>
				</thead>
				<tbody>
					
				</tbody>
			</table>
		</div>
		<div class="col-md-4" style="height: 500px; border:2px solid red;">
			<div class="added-friend">
				<table class="table" id="addedFriendTable">
				<colgroup>
					<col width="20%">
					<col width="25%">
					<col width="50%">
					<col width="5%">
				</colgroup>
				<thead>
					<tr>
						<th>pic</th>
						<th>name</th>
						<th>email</th>
						<th>button</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${coTraveler }" varStatus="i" var="traveler">
						<c:choose>
							<c:when test="${current_user.email == traveler.email }">
								<tr>
									<td>${traveler.seq }</td>
									<td>${traveler.name }</td>
									<td>${traveler.email }</td>
									<td>나 </td>
								</tr>
							</c:when>
							<c:otherwise>
								<tr>
									<td>${traveler.seq }</td>
									<td>${traveler.name }</td>
									<td>${traveler.email }</td>
									<td><button onclick="deleteFriend(${traveler.seq }, this)">x</button></td>
								</tr>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</tbody>
			</table>
			</div>
			<div class="next-button">
				<a href="#none" id="next-step"> 
					<img alt="next" src="${pageContext.request.contextPath }/image/next_button.png" width="50px" height="50px">
				</a>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">

$('#next-step').on('click', function () {
	var planer = ${planer.seq};
	
	if(planer != ''){
		location.href="dayPlaner.do?seq="+planer;	
	} else {
		alert('다시 시도해주세요.');
		window.refresh();
	}
})


$('#friendName').on('keyup', function() {
	var name = $('#friendName').val();

	if (name == "" /* || name.length < 3 */) {
		$('#notice').text('이름을 3글자 이상 입력해주세요.');
		$('#notice').css('color', 'red').css('font-size', '13px');
		$('#friendName').focus();
	} else {
		$('#notice').text('');

		findFriend(name);
	}
});

function findFriend(name) {
	$.ajax({
		url : 'findFriend.do',
		method : 'POST',
		data : {
			name : name
		},
		success : function(data) {
			//	table 지우기 
			$('#findedFriendTable tbody').children().remove();

			if (data.length == 0) {
				var tableElement = '<tr><td colspan="3" style="text-align:center">검색 결과가 없습니다.</td></tr>';
				$('#findedFriendTable tbody').append(tableElement);
			}

			//	table 그리기
			for (var i = 0; i < data.length; i++) {
				drawFindedFriends(data[i]);
			}
			
		}
	})
}

function addFriend(seq, name){
	if(seq == ''){
		alert('추가할 수 없습니다.');
	} else {
		$.ajax({
			url: 'addFriend.do',
			method: 'POST',
			data: { target_user_seq : seq, target_planer_seq : ${planer.seq}, target_user_name : name },
			success: function (data) {
				if(data.seq == 0){
					alert('추가할 수 없습니다. 다시 시도해주세요.');
				} else if(data.seq == -1){
					alert('이미 추가되었습니다.');
				} else {					
					var tableElement = 
						'<tr>' + 
							'<td>' + data.seq + '</td>' + 
							'<td>' + data.name + '</td>' + 
							'<td>' + data.email + '</td>' + 
							'<td style="text-align:left;"><button class="addFriendBtn">x</button></td>' + 
						'</tr>';
						
					if(data.email != '${current_user.email}'){
						$('.added-friend tbody').append(tableElement);
					}
				}
			}
		})
	}
}


function drawFindedFriends(friend) {
	var tableElement = 
		'<tr>' + 
			'<td>' + friend.seq + '</td>' + 
			'<td>' + friend.name + '</td>' + 
			'<td>' + friend.email + '</td>' + 
			'<td style="text-align:left;"><button class="addFriendBtn" onclick="addFriend('+friend.seq+',\''+friend.name+'\')">+</button></td>' + 
		'</tr>';
		
	if(friend.email != '${current_user.email}'){
		$('#findedFriendTable tbody').append(tableElement);
	}
}

function deleteFriend(seq, td) {
	$.ajax({
		url: 'deleteFriend.do',
		method: 'POST',
		data: { target_user_seq : seq, target_planer_seq : ${planer.seq} },
		success: function (data) {
			$(td).parent().parent().remove();			
		}
	})
	
}
</script>