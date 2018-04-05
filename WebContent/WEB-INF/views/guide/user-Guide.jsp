<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<style>
.card {
	padding: 0;
	border: 1px solid #7DC3BB;
}
.card-body{
	padding: 0;
	height: 400px;
	background-repeat: no-repeat;
	background-size: cover;
	background-position: center;
	border: 1px solid #7DC3BB;
}

.card-container {
	background-color: rgb(0,0,0,0.5);
	position: absolute;
	padding: 20px 50px;
	bottom: 0;
	width: 100%;
}
#plan-title{
	font-size: 20px;
	font-weight: 500;
	text-decoration:none;
}
#plan-title,
.card-title {
	color: #fff;
}

#plan-title:hover {
	text-decoration: underline;
	color: #7DC3BB;
} 

.change-title-div {
	display: none;
}
.change-title-div,
.title-div {
	margin: 20px 0px;
}
#floatMenu {
	position: absolute;
	width: 200px;
	height: 300px;
	left: 50px;
	top: 200px;
	background-color: #7DC3BB;
	color: #fff;
}

.ti-link:link {text-decoration: none; color: #000000;}
.ti-link:hover {text-decoration: underline; color: #7DC3BB;}
.ti-link:visited {text-decoration: none; color: #000000;}

.gu-link:link {text-decoration: none; color: #000000;}
.gu-link:hover {text-decoration: underline; color: #7DC3BB;}
.gu-link:visited {text-decoration: none; color: #000000;}

input.img_button {
	background: url(./image/search.png) no-repeat;
	width: 40px;
	height: 35px;
	border: none; 
	cursor: pointer;
}

.guide-info-over {
	position: absolute;
	background-color: #fff;
	padding: 15px;
	margin: 10px;
	width: 90%;
	border-radius: 15px;
}

.gu-link{
	text-align: left;
}

.guide-label-icon{
text-align: center;
}

.guide-info-top{
	background-color: #7DC3BB;
	margin-top: 10px;
	margin-bottom: 10px;
	text-align: center;
}

.guide-label-atag{
	line-height: 1.5;
}

</style>

<div class="myplan-title">
	<div class="offset-md-2 col-md-4 col-xs-12">
		<h2>투둥이 가이드북</h2>
	</div>
</div>
<div class="offset-md-2  col-md-8 col-xs-12">
	<hr>
</div>

<div class="row no-gutters">
	<div class="col-md-2 col-xs-12">
		<div class="guide-info-over">
			<div class="guide-info-top">
				<p>
					<span class="guide-label-icon" data-feather="book-open"></span>
					<br>
					<span class="guide-label-title">투둥이 가이드북</span> 
				</p>
			</div>
				<hr style="color:white; width:100%;">		
				<p>
					<div class="guide-label-icon" style="text-align: center;">
						<span data-feather="bookmark"></span><br>
					</div>
					<span class="guide-label-atag"><a href="editor_essay.do" class="gu-link">투디터 pick</a></span> 
					<br>
					<span class="guide-label-atag"><a href="user_guide.do" class="gu-link">투둥이 가이드북</a></span>
					<br>
					<span class="guide-label-atag"><a href="#" class="gu-link">투투 가이드북</a></span>	
				</p>		
		</div>
	</div>
</div>

<form action="guideSearch.do" method="get">
	<div class="row" style="margin:0 auto;width:900px;">
		<div class="offset-md-2 input-group-prepend">
			<select class="custom-select" id="inputGroupSelect01" name="Searchtype" style="width: 150px">
				<option value="target_user_seq">작성자</option>
				<option value="title">제목</option>
				<option value="location">지역</option>
			</select> 
			<input type="text" class="form-control"
				aria-label="Text input with segmented dropdown button" size="50"
				name="SearchWord" id="text">
		</div>
		&nbsp;&nbsp;
		<div class="serach">
			<input type="submit" class="img_button" id="btnsearch" value="">
		</div>
	</div>
</form>
<br>

<div class="user-guide-table">
	<div class="offset-md-2 col-md-8">
		<table class="table">
			<colgroup>
				<col style="width:30px;" />
				<col style="width:70px;" />
				<col style="width:100px;" />
				<col style="width:100px;" />
				<col style="width:100px;" />
			</colgroup>
				<thead>
				<tr>	
					<th>번호</th><th>위치</th><th>제목</th><th>작성자</th><th>여행기간</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${empty planlist }">
					<div class="col-md-12 text-center col-xs-12">
						<p>작성된 글이 없습니다</p>
					</div>
				</c:if>	
				
				<c:forEach items="${planlist }" var="plan" varStatus="i">
					<tr>
						<td>${i.count }</td>
						<td>${plan.location }</td>
						<td>
							<a href="planDetail.do?seq=${plan.seq }" class="ti-link">${plan.title }</a>
						</td>
						<td>${plan.name }</td>	
						<td>
							${plan.from_date }&nbsp;~&nbsp;${plan.to_date }
						</td>					
					</tr>	
				</c:forEach>
						
			</tbody>
		</table>					
	</div>
</div>


<!-- 
<div id="floatMenu">

<div class="menu_table">
		<ul style="list-style-type: none" >
			<li class="list-title"></li>
			<li class="list-title"></li>			
			<li class="list-title">투투 가이드북</li>			
		</ul>
	</div>
</div> -->
