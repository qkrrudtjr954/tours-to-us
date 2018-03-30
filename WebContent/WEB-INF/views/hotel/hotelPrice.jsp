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

</style>

<div class="row top_bg" width="100%">

<div class="offset-md-2 col-md-4" id="content">
<form id="hetelprice" action="hotelSearch.do">
<br>
<label for="location" style="font-weight: bold;">목적지</label> <br>
<input type="text" id="city" name="city" class="form-control success" placeholder="국내 도시를 입력해주세요">
<div class="form-group">
<br>
					<label for="tripdate"  style="font-weight: bold;">여행 기간</label> 
					<br>
					<div class="row">
						<div class="col">
						<span>체크인</span>
							<input type="date" class="form-control" id="checkin" name="checkin">
						</div>
						<div class="col">
						<span>체크아웃</span>
							<input type="date" class="form-control" id="checkout" name="checkout">
						</div>				
					</div>
				</div>
					<div class="row">
						<div class="col">
						<span>성인</span>
					<select class="form-control" name="adults">
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


</div>
	<c:if test="${list.size()==0 }">
					<span style="margin:0 auto;width:900px;">검색결과 없음.</span>
				</c:if>
	<c:forEach items="${list }" var="item" varStatus="i">
					<div class="col-md-4">
						<div class="card mb-4 box-shadow">
							<img class="card-img-top"
								src="${(empty item.pic) ? './image/no-img.png' : item.pic  }"
								alt="./img/no-img.png" height="348">
							<div class="card-body">
								<p class="card-text">
								<span id="aftertitle">
									${item.name } </span><br>
								<p>
									${item.desc} <span style="font-size: 12px;"></span>
								</p>
								<div class="d-flex justify-content-between align-items-center">
									<div class="btn-group">
										<a
											href="${item.link }" target="_blank"
											class="btn btn-sm btn-outline-secondary">View</a>
									</div>

									



									<small class="text-muted">${item.price }</small>

								</div>
							</div>
						</div>
					</div>
				</c:forEach>
${list }

<script>

/* $('#searchBtn').click(function () {
	var FormData = $('#hetelprice').serialize();
	
	$.ajax({
		url : 'hotelSearch.do',
		data : FormData,
		method : 'POST',
		success : function (data) {
			console.log(data);
		}
	})
}) 
 */

 



</script>