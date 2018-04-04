<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
.planer-label {
	border-bottom: 2px solid #7cc4bb;
    width: 30%;
    margin-bottom: 10px;
}
.planer-label-icon {
    margin: 0 10px;
    color: #7DC3BB;
}
.planer-label-title {
	font-size: 18px;
	font-weight: 500;
    vertical-align: text-bottom;
}

#next-step {
	padding: 15px;
    border: 2px solid #7cc4bb;
    border-radius: 10px;
    width: 40%;
    color: #7cc4bb;
    transition: color 1s, background-color 1s;
}

button#next-step:hover {
    background-color: #7cc4bb;
    color: white;
    transition: color 1s, background-color 1s;
}
</style>
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
			<img src="${pageContext.request.contextPath }/image/planer.jpg" alt="" style="width:100%; height:600px;" id="paper-canvas">
		</div>
		<div class="col-md-4 col-xs-12" style="position:relative;">
			<form id="planerForm">
				<div class="form-group">
					<label for="name" class="planer-label"><span class="planer-label-icon" data-feather="compass"></span><span class="planer-label-title">여행 제목</span></label> 
					<input type="text" class="form-control" id="title" name="title" placeholder="Ex) 먹방 대만 여행">
				</div>
				<div class="form-group">
					<label for="location" class="planer-label"><span class="planer-label-icon" data-feather="map"></span><span class="planer-label-title">여행 지역</span></label> 
					<select class="form-control" id="location" name="location">
						<c:forEach var="part" items="${korea }">
							<option>${part.name }</option>
						</c:forEach>
					</select>
				</div>
				<div class="form-group">
					<label for="location" class="planer-label"><span class="planer-label-icon" data-feather="briefcase"></span><span class="planer-label-title">여행 기간</span></label> 
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
					<label for="paper" class="planer-label"><span class="planer-label-icon" data-feather="book"></span><span class="planer-label-title">표지</span></label> 
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
				
				<div class="next-button d-flex justify-content-center" style="margin-top: 40px;">
					<button id="next-step" class="btn btn-default">플래너 만들기</button>
				</div>
			</form>
		</div>
	</div>
</div>

<script type="text/javascript">
	$('div.paper-image img').on('mouseenter', function() {
		$('#paper-canvas').attr('src', $(this).attr('src'));
	})

	$('div.paper-image img').on('click', function() {
		for (var i = 0; i < $('div.paper-image img').length; i++) {
			$('div.paper-image img').css('border', 'none');
		}
		$(this).css('border', '2px solid skyblue');
		$('#paper-canvas').attr('src', $(this).attr('src'));

		var url = $(this).attr('src');
		var temp = url.substring(12);

		$('input[name="paper"]').val(temp);
	})

	$('#next-step').on('click', function() {
		var FormData = $('#planerForm').serialize();

		$.ajax({
			url : 'addPlaner.do',
			method : 'POST',
			data : FormData,
			success : function(data) {
				if(data.seq != 0){
					location.href="addFriends.do?seq="+data.seq;
				}
			}
		})
	})
</script>