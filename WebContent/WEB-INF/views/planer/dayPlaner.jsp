<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="planer-title">
	<div class="offset-md-2 col-md-4 col-xs-12">
		<h2 id="title">Day <span id="day_count"></span><span data-feather="calendar" style="margin-left:5px"></span></h2>
		<span id="day"></span>
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
		<p>
			${coTraveler }
		</p>
	</div>
</div>

<div class="add-friend">
	<div class="row">
		<div class="offset-md-2 col-md-4 col-xs-12">
			
			<form id="timePlanerForm">
				<input type="hidden" name="target_dayplaner_seq">
				<div class="form-group">
					<label for="location"><span data-feather="map-pin"></span></label> 
					<input type="text" class="form-control" id="location" name="location" placeholder="Ex) 전주 한옥 마을">
				</div>
				<div class="form-group">
					<label for="time"><span data-feather="clock"></span></label> 
					<div class="row">
						<div class="col">
							<select class="form-control" id="start_time" name="start_time">
								<c:forEach varStatus="i" begin="0" end="24">
									<option>${(i.index lt 12)?'AM':'PM' } ${i.index} : 00</option>
									<option>${(i.index lt 12)?'AM':'PM' } ${i.index} : 30</option>
								</c:forEach>
							</select>
						</div>	
						<div class="col">
							<select class="form-control" id="end_time" name="end_time">
								<c:forEach varStatus="i" begin="0" end="24">
									<option>${(i.index lt 12)?'AM':'PM' } ${i.index} : 00</option>
									<option>${(i.index lt 12)?'AM':'PM' } ${i.index} : 30</option>
								</c:forEach>
							</select>
						</div>		
					</div>
				</div>
			
				<div class="form-group">
					<label for="transportation"><span data-feather="truck"></span></label> 
					<select class="form-control" id="exampleFormControlSelect1" name="transportation">
						<option>자동차 </option>
						<option>대중 교통 </option>
						<option>택시 </option>
						<option>기차 </option>
						<option>자전거 </option>
						<option>도보 </option>
						<option>기타 </option>
					</select>
				</div>
				
				<div class="form-group">
					<label for="expected_cost"><span data-feather="dollar-sign"></span></label> 
					<div class="input-group mb-3">
						<input type="number" class="form-control" id="expected_cost" name="expected_cost"  placeholder="Ex) 10000">
						<div class="input-group-append">
							<span class="input-group-text">원</span>
						</div>
					</div>
				</div>


				<div class="form-group">
					<label for="types"><span data-feather="shopping-cart"></span></label> 
					<select class="form-control" id="types" name="types">
						<option>쇼핑 </option>
						<option>관광 </option>
						<option>숙소 </option>
						<option>식당 </option>
						<option>체험 </option>
						<option>휴식 </option>
					</select>
				</div>
				
				<div class="form-group">
					<label for="content"><span data-feather="file-text"></span></label>
					<textarea class="form-control" id="content" name="content" rows="3"></textarea>
				</div>
				
			</form>
			
			<div class="btn-area d-flex justify-content-center">
				<button id="addButton" class="btn btn-primary">+</button>			
			</div>
		</div>
		<div class="col-md-5">
			<div class="row">
				<div class="timePlanerContainer">
					<div class="timePlanersList"></div>
				</div>
			</div>
			
			<div class="row justify-content-around">
				<button class="btn btn-primary" id="prevDayPlaner">prev</button>
				<form action="myplan.do" method="POST">
					<input type="hidden" name="status" value="2">
					<input type="hidden" name="seq" value="${planer.seq }">
					<input type="submit" class="btn btn-primary" id="completePlaner" style="display:none;" value="complete">
				</form>
				
				<button class="btn btn-primary" id="nextDayPlaner">next</button>
			</div>
		</div>
		
		
	</div>
</div>

<script type="text/javascript">
$(document).ready(function () {
	getDayPlaner(1);
})

$('#nextDayPlaner').on('click', function () {
	var nextDay = parseInt($('#day_count').text())+1;
	getDayPlaner(nextDay);
})
$('#prevDayPlaner').on('click', function () {
	var prevDay = parseInt($('#day_count').text())-1;
	getDayPlaner(prevDay);
})

function getDayPlaner(day_count) {
	$.ajax({
		url: 'getDayPlaner.do',
		method: 'GET',
		data: { target_planer_seq : ${planer.seq}, day_count : day_count },
		success: function (data) {
			console.log(data);
			$('#day_count').text(data.day_count);
			$('input[name="target_dayplaner_seq"]').val(data.seq);
			$('#day').text(data.day);
			$('.timePlanersList').children().remove();
			
			if(data.day_count == ${planer.range}){
				$('#completePlaner').css('display', 'block');
			} else {
				$('#completePlaner').css('display', 'none');				
			}
			
			getTimePlaners(data.seq);
		}
	})
}

function getTimePlaners(seq) {
	$.ajax({
		url : 'getTimePlaners.do',
		data : { seq : seq },
		method : 'GET',
		success : function (data) {
			console.log(data);
			
			for(var i=0; i<data.length; i++){
				drawTimePlaner(data[i]);
			}
		}
	})
}

$('#addButton').on('click', function () {
	var FormData = $('#timePlanerForm').serialize();
	
	$.ajax({
		url : 'addTimePlaner.do',
		data : FormData,
		method : 'POST',
		success : function (data) {
			console.log(data);
			drawTimePlaner(data);
		}
	})
})


function drawTimePlaner(data) {
	var html = 
		'<div class="d-flex justify-content-around">'+	
			'<div class="timePlaner">'+
				'<ul>'+
					'<li>'+data.location+'</li>'+
					'<li>'+data.start_time+' ~ '+data.end_time+'</li>'+
					'<li>'+data.transportation+'</li>'+
					'<li>'+data.expected_cost+'</li>'+
					'<li>'+data.types+'</li>'+
					'<li>'+data.content+'</li>'+
				'</ul>'+	
			'</div>'+
			'<div class="buttonArea">'+
				'<a href="deleteTimePlaner.do" class="btn btn-outline-danger">X</a>'+
			'</div>'+
		'</div>';
	
	$('.timePlanersList').append(html);	
}

</script>