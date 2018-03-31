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

a:link { color: black; text-decoration: none;}
a:visited { color: black; text-decoration: none;}
a:hover { color: black; text-decoration: none;}

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
						<div class="col">
						<span>체크인</span>
							<input type="date" class="form-control" id="checkin" name="checkin" onchange="checktoday()">
						</div>
						<div class="col">
						<span>체크아웃</span>
							<input type="date" class="form-control" id="checkout" name="checkout" onchange="checkdate()">
						</div>				
					</div>
				</div>
					<div class="row">
						<div class="col">
						<span>성인</span>
					<select class="form-control" name="adults" id="adults" >
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
						<span>어린이</span>
					<select class="form-control" name="children">
			    	<option value="0">아이 0명</option>
					<option value="1">아이 1명</option>
					<option value="2">아이 2명</option>
					<option value="3">아이 3명</option>
					<option value="4">아이 4명</option>
					<option value="5">아이 5명</option>
				   </select>
						</div>				
					</div>
				

<br>
<br>
<input type="submit"  id="searchBtn"class="form-control" style="background-color: #7DC3BB; border: none; color: #FFFFFF; font-weight: bold;" value="검색하기">
<br>
</form>

</div>

<p id="desc">*숙소 예약 서비스는 <span style="font-size: 15px; font-weight: bold;">airbnb</span>와 <span style="font-size: 15px; font-weight: bold;">Tours to-us </span>가 제휴를 맺어 제공하는 숙소 예약 서비스입니다. </p>
</div>
<!-- <div class="offset-md-1">숙소 예약 서비스는 에어비엔비와 <span style="font-size: 15px; font-weight: bold;">Tours to-us </span>가 제휴를 맺어 제공하는 숙소 예약 서비스입니다. </div>
<br> -->
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
			<a href="${item.link }" target="_blank">
			<div class="card-body">				
				<!-- <p class="card-text"> -->
					<span style="font-size: 10px; color: rgb(155, 49, 67);">
					<c:choose>
						<c:when test="${item.desc eq '·' }"> 
						개인실·침대 2개</span>
						</c:when>
						<c:otherwise>
						${item.desc }</span>
						</c:otherwise>
					</c:choose>
						<br><!-- </p> -->
					
					<span style="font-size: 15px; font-weight: bold;">${item.name }</span>
					<br>
					<span style="color: #484848; font-weight: 200;">
					<c:choose>
						<c:when test="${item.price eq '/박' }">
						홈페이지 확인</span>
						</c:when>
						<c:otherwise>
						${item.price }</span>		
						</c:otherwise>
					</c:choose>								
			</div></a>
			</div>
		</div>

	</c:forEach>
		</div>
<hr>
	<div class="row offset-md-5">
	<p style="color: rgb(155, 49, 67);">더 많은 숙소 정보 확인하러 가기</p></div>


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
			alert("체크인 날짜를 확인해주세요");
			$('#checkin').val('');
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
		alert("체크인과 체크아웃 날짜를 다시 확인해주세요.");
		$('#checkin').val('');
		$('#checkout').val('');
	}
	
}

$('#searchBtn').click(function() {
	var state = $('#adults option:selected').val();
	if($('#city').val()==''){
		alert("도시를 입력해주세요.");
	}else if($('#checkin').val()==''){
		alert("체크인 날짜를 입력해주세요.");
	}else if($('#checkiout').val()==''){
		alert("체크아웃 날짜를 입력해주세요.");
	}else if(state == '0') {
		alert("성인 1명 이상 선택해주세요.");
	} 
});
</script>