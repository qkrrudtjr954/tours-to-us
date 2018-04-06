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

.preview-container {
	background-image: url('${pageContext.request.contextPath }/image/planer.jpg');
	background-repeat: no-repeat;
	background-position: center;
	background-size: cover;
	width:100%; 
	height:600px;
	position: relative;
}

.paper-image {
	width: 100%;
    height: 100%;
    margin: 5px;
}
.paper-image img {
	width: 100%;
    height: 100%;
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
		<div class="offset-md-2 col-md-4 col-xs-12 preview-container"></div>
		<div class="col-md-4 col-xs-12" style="position:relative;">
			<form id="planerForm" onsubmit="false">
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
					<label for="from_date" class="planer-label"><span class="planer-label-icon" data-feather="briefcase"></span><span class="planer-label-title">여행 기간</span></label> 
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
					<input type="hidden" value="" id="paper" name="paper">
					<label for="paper" class="planer-label"><span class="planer-label-icon" data-feather="book"></span><span class="planer-label-title">표지</span></label> 
					<div class="d-flex justify-content-center">
						<div class="paper-image">
							<img alt="" src="${pageContext.request.contextPath }/image/paper1.jpeg">					
						</div>
						<div class="paper-image">
							<img alt="" src="${pageContext.request.contextPath }/image/paper2.jpeg">					
						</div>
						<div class="paper-image">
							<img alt="" src="${pageContext.request.contextPath }/image/paper3.jpeg">					
						</div>
					</div>
					<div class="d-flex justify-content-center">
						<div class="paper-image">
							<img alt="" src="${pageContext.request.contextPath }/image/paper4.jpeg">					
						</div>
						<div class="paper-image">
							<img alt="" src="${pageContext.request.contextPath }/image/paper5.jpeg">					
						</div>
						<div class="paper-image">
							<img alt="" src="${pageContext.request.contextPath }/image/paper6.jpeg">					
						</div>
					</div>
				</div>
				
			</form>
			<div class="next-button d-flex justify-content-center" style="margin-top: 40px;">
				<button id="next-step" class="btn btn-default">플래너 만들기</button>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
	$('div.paper-image img').on('click', function() {
		for (var i = 0; i < $('div.paper-image img').length; i++) {
			$('div.paper-image img').css('border', 'none');
		}

		var url = $(this).attr('src');
		var temp = url.substring(19);
		
		$(this).css('border', '2px solid #7cc4bb');
		$('.preview-container').css('background-image', 'url("${pageContext.request.contextPath}/image/'+temp+'")');
		$('.preview-container').css('background-size', 'contain');

		$('input[name="paper"]').val(temp);
	})
	
	$('#next-step').on('click', function() {
		if(validation($('#title'), '제목을 입력해주세요.') && validation($('#from_date'), '출발 일자를 입력해주세요.') && validation($('#to_date'), '도착 일자를 입력해주세요.')){
			if(checkDateRange()){
				makePlaner();
			}
		}
	});
	
	function removeSpan(dom) {
		$(dom).parent().find('span').remove();
	}
	
	function checkDateRange() {
		let result = true;
		let from = new Date($('#from_date').val());
		let to = new Date($('#to_date').val());
			
		if(from > to){
			$('#from_date').parent().append('<span style="font-size:80%;color:#dc3545;">출발 일자와 도착 일자를 확인해주세요.</span>');
			$('#from_date').focus();
			result = false;
		} else {
			removeSpan($('#from_date'));
		}
		return result;
	}
	
	function validation(dom, msg) {
		let result = true;
		
		if($(dom).val() == ''){
			removeSpan($(dom));
			$(dom).parent().append('<span style="font-size:80%;color:#dc3545;">'+msg+'</span>');
			$(dom).focus();
			result = false;
		} else{
			removeSpan($(dom));
			result = true;
		}
		return result;
	}
	
	function makePlaner() {
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
		});
	}
</script>