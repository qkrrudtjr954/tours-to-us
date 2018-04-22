<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
.top_bg{
background: url(image/hero4_medium.jpg);
background-size: 100%;

}

span{
font-size: 10pt;
font-weight: bold ;
font-family: '나눔고딕', 'Malgun Gothic', sans-serif;



}

#content{
margin-top: 100px;
margin-bottom: 100px;
background-color: rgb(102, 102, 102, 0.3);

}


#logo{
padding: 10px;
}

#desc{
padding: 20px;
padding-left: 150px;
color: #ffffff;
font-weight: 200;
font-size: 13px;

}
</style>

<div class="row top_bg" width="100%">

<div class="offset-md-2 col-md-4" id="content">
<form id="hetelprice" action="hotelSearch.do">
<br>
<label for="location" style="font-weight: bold;">목적지</label> <br>
<input type="text" id="city" name="city" class="form-control success" placeholder="국내 도시를 입력해주세요" required>
<div class="form-group">
<br>
					<label for="tripdate"  style="font-weight: bold;">여행 기간</label> 
					<br>
					<div class="row">
						<div class="col" id="checkin-container">
						<span>체크인</span>
							<input type="date" class="form-control" id="checkin" name="checkin" onchange="checktoday()">
							<span style="font-size:80%;color:#dc3545;display:none;">체크인 날짜를 확인해주세요</span>
						</div>
						<div class="col" id="checkout-container">
						<span>체크아웃</span>
							<input type="date" class="form-control" id="checkout" name="checkout" onchange="checkdate()">
							<span style="font-size:80%;color:#dc3545;display:none;">체크아웃 날짜를 확인해주세요</span>
						</div>				
					</div>
				</div>
			<div class="row">
				<div class="col">
					<span>성인</span> <select class="form-control" name="adults"
						id="adults">
						<option value="0">성인 0명</option>
						<option value="1">성인 1명</option>
						<option value="2">성인 2명</option>
						<option value="3">성인 3명</option>
						<option value="4">성인 4명</option>
						<option value="5">성인 5명</option>
						<option value="6">성인 6명</option>
						<option value="7">성인 7명</option>
						<option value="8">성인 8명</option>
					</select>

				</div>
				<div class="col">
					<span>어린이</span> <select class="form-control" name="children">
						<option value="0">아이 0명</option>
						<option value="1">아이 1명</option>
						<option value="2">아이 2명</option>
						<option value="3">아이 3명</option>
						<option value="4">아이 4명</option>
						<option value="5">아이 5명</option>
					</select>
				</div>
				<div class="col">
					<span>방 개수</span> 
					<select class="form-control" name="room_no">
						<option value="1">1개</option>
						<option value="2">2개</option>
						<option value="3">3개</option>
						<option value="4">4개</option>
						<option value="5">5개</option>
						<option value="6">6개</option>
					</select>
				</div>
			</div>


			<br>
<br>
<input type="submit"  id="searchBtn"class="form-control" style="background-color: #7DC3BB; border: none; color: #FFFFFF; font-weight: bold;" value="검색하기">
<br>
</form>

</div>

<p id="desc">*숙소 예약 서비스는 <span style="font-size: 15px; font-weight: bold;">booking닷컴</span>와 <span style="font-size: 15px; font-weight: bold;">Tours to-us </span>가 제휴를 맺어 제공하는 숙소 예약 서비스입니다. </p>
</div>

<br>
<div class="row offset-md-1 col-md-10">
<c:if test="${list.size()==0 }">
<div class="offset-md-5">
<img src="image/giphy.gif"><br>
<script>
alert("죄송합니다. 화면을 다시 새로고침 해주세요");
</script>
</div>
</c:if>
<c:forEach items="${list }" var="item" varStatus="i">
	
		<div class="col-md-4">
			<div class="card mb-4 box-shadow">
				<img class="card-img-top" src="${item.pic }" height="300px">
				
					<div class="card-body">				
						<!-- <p class="card-text"> -->
							<c:choose>
								<c:when test="${empty item.desc}"> 
									<span style="font-size: 10px; color: rgb(155, 49, 67);">평범함</span>
								</c:when>
								<c:otherwise>
									<span style="font-size: 10px; color: rgb(155, 49, 67);">${item.desc }</span>
								</c:otherwise>
							</c:choose>
								<br><!-- </p> -->
							
							<a href="${item.link }" target="_blank">
								<span style="font-size: 15px; font-weight: bold;">${item.name }</span>
							</a>
							<br>
							<c:choose>
								<c:when test="${empty item.price}">
									<span style="color: #484848; font-weight: 200;">홈페이지 확인</span>
								</c:when>
								<c:otherwise>
									<span style="color: #484848; font-weight: 200;">${item.price }</span>		
								</c:otherwise>
							</c:choose>								
					</div>
				
			</div>
		</div>

	</c:forEach>
		</div>
<hr>
	<div class="row offset-md-5">
		<a href="https://www.booking.com" style="color: rgb(155, 49, 67);">더 많은 숙소 정보 확인하러 가기</a>
	</div>


<script>



function checktoday() {
	 var now = new Date();

	    var year= now.getFullYear();
	    var mon = (now.getMonth()+1)>9 ? ''+(now.getMonth()+1) : '0'+(now.getMonth()+1);
	    var day = now.getDate()>9 ? ''+now.getDate() : '0'+now.getDate();
	            
	    var chan_val = year + '-' + mon + '-' + day;
	    
	    var strDate1 = $('#checkin').val();
		
		var arr1 = strDate1.split('-');
		var arr2 = chan_val.split('-');
		var dat1 = new Date(arr1[0], arr1[1], arr1[2]);
		var dat2 = new Date(arr2[0], arr2[1], arr2[2]);
		
		var diff = dat2 - dat1;
		//alert("선택날짜 : " + strDate1 +" / 오늘 날짜 : " + chan_val +" 뺴기 " + diff);
		
		if( diff>=0){
			//alert("체크인 날짜를 확인해주세요");
			if($('#checkin-container span:last-child').css('display') == 'none'){
				$('#checkin-container span:last-child').css('display', 'block');
			}
		}else{
			$('#checkin-container span:last-child').css('display', 'none'); 

		}
	     
}


function checkdate() {
	
	if( $('#checkin').val()==''){
		alert("체크인 날짜를 먼저 설정해주세요");
		$('#checkout').val('');
	}
	var strDate1 = $('#checkin').val();
	var strDate2 = $('#checkout').val();
	var arr1 = strDate1.split('-');
	var arr2 = strDate2.split('-');
	var dat1 = new Date(arr1[0], arr1[1], arr1[2]);
	var dat2 = new Date(arr2[0], arr2[1], arr2[2]);
	
	var diff = dat2 - dat1;
	
	if(diff<0){
		if($('#checkout-container span:last-child').css('display') == 'none'){
			$('#checkout-container span:last-child').css('display', 'block');
		}
	}else{
		$('#checkout-container span:last-child').css('display', 'none'); 
	}
	
}

$('#searchBtn').on('click', function(e){
	var state = $('#adults option:selected').val();
	if($('#city').val()==''){
		alert("도시를 입력해주세요.");
	}else if($('#checkin').val()==''){
		alert("체크인 날짜를 입력해주세요.");
	}else if($('#checkiout').val()==''){
		alert("체크아웃 날짜를 입력해주세요.");
	}else if(state == '0') {
		alert("성인 1명 이상 선택해주세요.");
	}else if($('#checkout-container span:last-child').css('display') != 'none'){
		alert("체크아웃 날짜를 확인해주세요");
		 e.preventDefault();
	}else if($('#checkin-container span:last-child').css('display') != 'none'){
		alert("체크인 날짜를 확인해주세요");
		 e.preventDefault();
	}
});
</script>