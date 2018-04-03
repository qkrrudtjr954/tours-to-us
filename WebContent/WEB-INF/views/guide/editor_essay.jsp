<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <style>
    #floatMenu {
	position: absolute;
	width: 200px;
	height: 300px;
	left: 50px;
	top: 200px;
	background-color: #ffffff;
	color: black;
}

.best_edit{
padding: 10px;
margin: 20px;
border-radius: 10px;
background-color: rgb(224, 224, 224);
padding-bottom: 20px;
}

#best_edit_head{

 display: inline-block;
 font-size: 11px;
 letter-spacing: 0.2em;
background: #444;
    background-image: initial;
    background-position-x: initial;
    background-position-y: initial;
    background-size: initial;
    background-repeat-x: initial;
    background-repeat-y: initial;
    background-attachment: initial;
    background-origin: initial;
    background-clip: initial;
    background-color: rgb(68, 68, 68);

background-color: #444444;
color: #ffffff;

padding: 6px 12px;
    padding-top: 6px;
    padding-right: 12px;
    padding-bottom: 6px;
    padding-left: 12px;


}

#location{
	margin-left: 5px;
	font-size: 14px;
}

#best_content{
padding-left: 15px;
padding-right: 15px;

}
.card-img{
 position:relative;
 
}

#like{
position:absolute;
top:15px;
right:10px;
color: #ffffff;
text-shadow: 5px 5px 5px #444444;
}



/* hr{ 
  
    border:         none;
    border-left:    1px solid hsla(200, 10%, 50%,100);
    height:         100vh;
    width:          1px;       
} */
    </style>

<div id="floatMenu">
<ul style="width:100%; list-style-type: none;" class="menu_">
	<li class="title"><h2>가이드북</h2></li>
<hr>	
</ul>

<div class="menu_table">
		<ul style="list-style-type: none">
			<li class="title">나의 플랜</li>
			<li class="menu_item">
				<a href="#none" onclick="url_myplan()" class="nav-link" title="나의 플랜보기" >나의 플랜보기</a>
			</li>
			<li class="title">회원정보관리</li>
			<li class="menu_item">
				<a href="mypage.do" class="nav-link" title="회원정보수정">회원정보수정</a>
			</li> 
		</ul>
	</div>
</div>




<div class="offset-md-2 col-md-9"> <!-- 내용 div -->
<br><br>

<h3>투디터  pick!</h3>
<p>투디터들이 엄선한 여행지 꿀팁&맛집 pick! </p>
<hr>
<div class="best_edit"><!-- 베스트 에디터  div -->
	<div id="header" align="center" style="padding: 10px;">
		<span id="best_edit_head">TO-ditor's BEST PICK</span>
	</div>

 	<div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
  <div class="carousel-inner">
    <div class="carousel-item active">
      <div class="row">
      	 <div class="col-md-4">
						<img class="card-img-top" src="image/example.jpg" height="300px">					
		 </div>

		 
		 
		 <div class="col-md-4">
						<img class="card-img-top" src="image/example.jpg" height="300px">					
		 </div>
		 
		 <div class="col-md-4">
						<img class="card-img-top" src="image/example.jpg" height="300px">					
		 </div>
      </div>
    </div>
    <div class="carousel-item">
      <div class="row">
      	 <div class="col-md-4">
						<img class="card-img-top" src="image/example.jpg" height="300px">					
		 </div>
		 
		 <div class="col-md-4">
						<img class="card-img-top" src="image/example.jpg" height="300px">					
		 </div>
		 
		 <div class="col-md-4">
						<img class="card-img-top" src="image/example.jpg" height="300px">					
		 </div>
      </div>
    </div>
  </div>
  <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>
</div>


<div class="row search_menu">
	<div class="col-md-2" id="serch_select">
	<select class="custom-select">
		<option>제목</option>
		<option>아이디</option>
	</select>
	</div>
	<div class="input-group  col-md-5">
 		 <input type="text" class="form-control" placeholder="검색어를 입력해주세요" aria-label="Recipient's username" aria-describedby="basic-addon2">
 		 <div class="input-group-append">
 			   <button class="btn btn-outline-secondary" type="button"><span data-feather="search"></span></button>
 		 </div>
	</div>
</div>



<div class="row content">


<div class="col-md-4">
			<div class="card mb-4 box-shadow">
					<div class="card-img">
					<img class="card-img-top" src="image/example.jpg" height="300px">
					<span id="like"><img src="image/hearticon.png">100</span>
					</div>
				<div class="card-body">
					<span data-feather="map-pin" style="color: rgb(26, 188, 156);  "></span><span id="location">제주도</span><br>
					<span style="font-size: 15px; font-weight: bold;">전복이 꽉 차있는 제주 [김만복 김밥]</span><br>
					<span style="font-size: 14px; float:right;  color: #484848; font-weight: 200; ">Editor: 김아무개</span>
				</div>
			</div>		
	 </div>
	 
	 

</div>




<!-- 내용 div 끝 -->
</div>