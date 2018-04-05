<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.4/sockjs.min.js"></script>

<style>
.planer-info-over {
	background-color: #7DC3BB;
	padding: 15px;
	margin: 10px;
	width: 90%;
	text-align: center;
	border-radius: 15px;
}
.planer-label-icon {
    margin-top: 15px;
    color: white;
}
.planer-label-title {
	width: 100%;
	font-size: 18px;
	font-weight: 500;
	color: white;
}

.time-planer-icon {
	margin: 0px 15px;
	color: #7DC3BB;
}

.time-planer-title {
	font-size: 20px;
	vertical-align: text-bottom;
}

.form-group {
	margin-bottom: 30px;
}

.chat-container {
	position: fixed;
    right: 0;
    height: 500px;
    bottom: 100px;
    z-index: 500;
    background-color: white;
    border: 1px solid #7DC3BB;
    background-color: lightpink;
    /* background-image: url("./image/chat-bg.jpg");
    background-repeat: no-repeat;
    background-size: cover;
    background-position: center; */
}
#data {
	font-size: 13px;
}
.chat-container2{
    overflow-x: hidden;
    overflow-y: auto;
    height: 100%;
}

.chat-right {
    margin: 5px 5px 0px 20px;
    float: right;
    clear: both;   
}
.chat-left {
    margin: 5px 20px 0px 5px;
    float: left;
    clear: both;
}

.chat-right > p,
.chat-left > p {
	word-break:break-all;
	padding: 3px;
	border-radius: 5px; 
	width: 100%;
	clear: both;
	margin: 0;
}

.chat-right > p {
	background: #7DC3BB;
	float: right;
}
.chat-left > p {
	background: skyblue;
	folat: left;
}
.chat-right > span,
.chat-left > span {
	clear: both;
}
.chat-right > span {
	float: right;
}
.chat-left > span {
	folat: left;
}

.commonBtn {
    border: 2px solid #7cc4bb;
    width: 100%;
    color: #7cc4bb;
    transition: color 0.6s, background-color 0.6s;
}

.commonBtn:hover {
    background-color: #7cc4bb;
    color: white;
    transition: color 0.6s, background-color 0.6s;
}

.form-group {
	margin-bottom: 30px;
}

.chat-info {
	text-align: center;
}
.chat-info > p {
    font-size: 12px;
    color: darkslategray;
}

.buttonArea a.btn.btn-outline-danger {
    border-radius: 50%;
}

</style>
<div class="offset-md-3 col-md-6 col-xs-12 planer-title">
	<div class="d-flex justify-content-around align-items-center">
		<div class="planer-title-button">
			<button class="btn btn-default commonBtn" id="prevDayPlaner">prev</button>
		</div>
		<div class="planer-title-content">
			<h2 id="title">Day <span id="day_count"></span><span data-feather="calendar" style="margin-left:5px"></span></h2>
			<span id="day"></span>
		</div>
		<div class="planer-title-button">
			<button class="btn btn-default commonBtn" id="nextDayPlaner">next</button>
		</div>
	</div>
</div>
<div class="offset-md-2 col-md-8 col-xs-12">
	<hr>
</div>
   
<div class="add-friend">
	<div class="row no-gutters">
		<div class="col-md-2 col-xs-12">
			<div class="planer-info-over">
				<p>
					<span class="planer-label-icon" data-feather="briefcase">여행 이름</span><br>
					<span class="planer-label-title">${planer.title }</span> 
				</p>
				<hr style="color:white; width:100%;">
				<p>
					<span class="planer-label-icon" data-feather="map"></span><br>
					<span class="planer-label-title">${planer.location }</span> 
				</p>
				<p>
					<span class="planer-label-icon" data-feather="calendar"></span><br>
					<span class="planer-label-title">${planer.from_date } ~ </span><br>
					<span class="planer-label-title">${planer.to_date }</span><br><br>
					<c:choose>
						<c:when test="${planer.range < 2 }">
							<span class="planer-label-title">당일 치기</span>								
						</c:when>
						<c:otherwise>
							<span class="planer-label-title">${planer.range-1 }박 ${planer.range }일</span>
						</c:otherwise>
					</c:choose>
				</p>
			</div>
		</div>
		<div class="col-md-4 col-xs-12">
			<form id="timePlanerForm">
				<input type="hidden" name="target_dayplaner_seq">
				<div class="form-group">
					<label for="location"><span class="time-planer-icon" data-feather="map-pin"></span><span class="time-planer-title">일정 장소</span></label> 
					<input type="text" class="form-control" id="location" name="location" placeholder="Ex) 전주 한옥 마을">
				</div>
				<div class="form-group">
					<label for="time"><span class="time-planer-icon" data-feather="clock"></span><span class="time-planer-title">일정 시간</span></label> 
					<div class="row no-gutters">
						<div class="col">
							<select class="form-control" id="start_time" name="start_time">
								<c:forEach varStatus="i" begin="0" end="24">
									<option>${(i.index lt 12)?'AM':'PM' } ${i.index} : 00</option>
									<option>${(i.index lt 12)?'AM':'PM' } ${i.index} : 30</option>
								</c:forEach>
							</select>
						</div>
						<div class="col-md-1 text-center">
							<span style="font-size:20px;font-weight:700;">~</span>
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
					<label for="transportation"><span class="time-planer-icon" data-feather="truck"></span><span class="time-planer-title">이동 수단</span></label> 
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
					<label for="expected_cost"><span class="time-planer-icon" data-feather="dollar-sign"></span><span class="time-planer-title">예상 경비</span></label> 
					<div class="input-group mb-3">
						<input type="number" class="form-control" id="expected_cost" name="expected_cost"  placeholder="Ex) 10000">
						<div class="input-group-append">
							<span class="input-group-text">원</span>
						</div>
					</div>
				</div>


				<div class="form-group">
					<label for="types"><span class="time-planer-icon" data-feather="shopping-cart"></span><span class="time-planer-title">일정 종류</span></label> 
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
					<label for="content"><span class="time-planer-icon" data-feather="file-text"></span><span class="time-planer-title">기타 사항</span></label>
					<textarea class="form-control" id="content" name="content" rows="3"></textarea>
				</div>
				
			</form>
		</div>
		<div class="col-md-4">
			<div class="row no-gutters">
				<div class="timePlanerContainer">
					<div class="timePlanersList"></div>
				</div>
			</div>
		</div>		
		<div class="col-md-2 chat-container">
			<div class="chat-container2">
			    <div id="chat-data"></div>
			</div>
			
			<div class="input-group chat-input">
				<input type="text" class="form-control" id="message">
				<div class="input-group-append">
					<button class="btn btn-default commonBtn" id="sendBtn" type="button">전송</button>
				</div>
			</div>
		</div>
	</div>
	<div class="row no-gutters">
		<div class="offset-md-2 col-md-4">
			<div class="d-flex justify-content-center">
				<div class="btn-area">
					<button id="addButton" class="btn btn-default commonBtn">일정 추가하기</button>			
				</div>
			</div>
		</div>
		<div class="col-md-4">
			<div class="d-flex justify-content-center">
				<button type="button" class="btn btn-default commonBtn" id="completePlaner" style="display:none;"  data-toggle="modal" data-target="#exampleModalCenter">
				  일정 확정하기
				</button>
			</div>
		</div>
	</div>
</div>

<!-- Button trigger modal -->

<!-- Modal -->
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLongTitle">일정 확정하기</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"> <span aria-hidden="true">&times;</span></button>
			</div>
			<form action="completePlaner.do" method="POST">
				<div class="modal-body">
					<p>
						일정을 확정하면 상태가 '완료'로 변경됩니다.<br>
						현재 화면을 닫아도 변경 사항은 저장되어 후에 확인할 수 있습니다.
					</p>
					<p>
						해당 일정을 다른 투둥이들에게 공개하시겠습니까?
					</p>
					<div class="d-flex justify-content-center">
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="radio" name="status" id="inlineRadio1" value="1">
							<label class="form-check-label" for="inlineRadio1">공개</label>
						</div>
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="radio" name="status" id="inlineRadio2" value="2">
							<label class="form-check-label" for="inlineRadio2">비공개</label>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<input type="hidden" name="seq" value="${planer.seq }"> 
					<input type="submit" class="btn btn-default commonBtn" value="complete">
					<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
				</div>
			</form>
		</div>
	</div>
</div>

<script type="text/javascript">
var sock = new SockJS("${pageContext.request.contextPath}/echo");

$(document).ready(function () {
	$("#sendBtn").click(function() {
        sendMessage();
    });
	
	getDayPlaner(1);
})

$("input[type=text]#message").keypress(function(e) { 
    if (e.keyCode == 13){
		sendMessage();
    }    
});

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
		'<div class="d-flex justify-content-around align-items-center">'+	
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


//자바스크립트 안에 function을 집어넣을 수 있음
//데이터가 나한테 전달되읐을 때 자동으로 실행되는 function
sock.onmessage = onMessage;

//데이터를 끊고싶을때 실행하는 메소드
sock.onclose = onClose;

sock.onopen = function(){
	message = {};
	message.room = ${planer.seq};
	message.msg = '${current_user.name}';
	message.isFirst = true;
    sock.send(JSON.stringify(message));
};

function sendMessage() {
    	message = {};
	message.room = ${planer.seq};
	message.msg = $("#message").val();
	message.isFirst = false;
    sock.send(JSON.stringify(message));
    	$("#message").val("");
}

//evt 파라미터는 웹소켓을 보내준 데이터다.(자동으로 들어옴)
function onMessage(evt) {
    var data = evt.data;
    addChat(data);
}

function addChat(data) {
	let name = data.split('-ReturnSecretKeyParker-');
	
	if(name[0] == '${current_user.name}'){
		drawSpan(name, 'chat-right');
	} else if(name[0] == 'info'){
		drawSpan(name, 'chat-info');
	} else {
		drawSpan(name, 'chat-left');				
	}
}

function drawSpan(name, align) {
	var other = '<div class="'+align+'">'+'<span>'+name[0]+'</span>'+'<p>'+name[1]+'</p>'+'</div>';
	var my = '<div class="'+align+'">'+'<p>'+name[1]+'</p>'+'</div>';
	var info = '<div class="'+align+'">'+'<p>'+name[1]+'</p>'+'</div>';
	
	if(align == 'chat-info'){
		$('#chat-data').append(info);
	} else {
		if($('#chat-data div:last-child').hasClass(align)){
			$('#chat-data').append(my);		
		} else {
			$('#chat-data').append(other);				
		}
	}
	
}

function onClose(evt) {
    $("#chat-data").append("연결 끊김");
}

</script>