<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<form id="hetelprice">
<br>
<label for="location" style="font-weight: bold;">목적지</label> <br>
<input type="text" id="location" name="location" class="form-control success" placeholder="국내 도시를 입력해주세요">
<div class="form-group">
<br>
					<label for="tripdate"  style="font-weight: bold;">여행 기간</label> 
					<br>
					<div class="row">
						<div class="col">
						<span>체크인</span>
							<input type="date" class="form-control" id="from_date" name="from_date">
						</div>
						<div class="col">
						<span>체크아웃</span>
							<input type="date" class="form-control" id="to_date" name="to_date">
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
<input type="submit"  class="form-control" value="검색하기" style="background-color: #7DC3BB; border: none; color: #FFFFFF; font-weight: bold;">
<br>
</form>
</div>


</div>