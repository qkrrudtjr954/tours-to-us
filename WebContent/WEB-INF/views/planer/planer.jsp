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
			<form>
				<div class="form-group">
					<label for="name">여행 이름</label> 
					<input type="text" class="form-control" id="name" name="name" placeholder="Ex) 먹방 대만 여행">
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
			</form>
		</div>
	</div>
	
	<script type="text/javascript">
	
		$('div.paper-image img').on('mouseenter', function () {
			// $('#paper-canvas').attr('src', $(this).attr('src'));
		})
		
		$('div.paper-image img').on('click', function () {
			for(var i=0; i< $('div.paper-image img').length; i++){
				$('div.paper-image img').css('border', 'none');
			}
			$(this).css('border', '2px solid skyblue');
			// $('#paper-canvas').attr('src', $(this).attr('src'));
			
			var url = $(this).attr('src');
			var temp = url.substring(12);
			
			$('input[name="paper"]').val(temp);
		})
		
	
	</script>
	

</div>