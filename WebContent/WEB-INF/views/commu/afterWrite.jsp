<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
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

.ti-link:link {text-decoration: none; color: #000000;}
.ti-link:hover {text-decoration: underline; color: #7DC3BB;}
.ti-link:visited {text-decoration: none; color: #000000;}

.gu-link:link {text-decoration: none; color: #000000;}
.gu-link:hover {text-decoration: underline; color: #7DC3BB;}
.gu-link:visited {text-decoration: none; color: #000000;}

/* input.img_button {
	background: url(./image/search.png) no-repeat;
	width: 40px;
	height: 35px;
	border: none; 
	cursor: pointer;
} */

.guide-info-over {
	position: absolute;
	background-color: #fff;
	padding: 15px;
	margin: 10px;
	width: 90%;
	border-radius: 15px;
	border: 1px solid #7DC3BB;
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
    
    
    
    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
   <link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote-bs4.css" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="./css/main.css" rel="stylesheet">

    
 <div class="after-title">
   <div class="offset-md-2 col-md-4 col-xs-12">
      <h2>글 작성</h2>
   </div>
</div>



<div class="row no-gutters">
	<div class="col-md-2 col-xs-12">
		<div class="guide-info-over">
			<div class="guide-info-top">
				<p>
					<span class="guide-label-icon" data-feather="book-open"></span>
					<br>
					<span class="guide-label-title">나의 여행 후기</span> 
				</p>
			</div>
				<hr style="color:white; width:100%;">
				<div>		
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
</div>



<div class="offset-md-2 col-md-8 col-xs-12">
   <hr>
</div>
<form action="afterWriteAf.do">
<input type="hidden" name="target_planer_seq" value="${planer.seq }">
<div class="row">
   <div class=" offset-md-3 col-md-6 write-form">
      <div class="input-group-prepend">
         <span class="input-group-text">제목</span> 
         <input type="text" class="form-control" size="20" name="title" id="name"
            placeholder="제목">
      </div>   
   </div>

   <div class=" offset-md-3 col-md-6 write-form">
      <div class="input-group-prepend">
         <textarea id="summernote" name="content"></textarea>
      </div>   
   </div>

</div>
 <div class="row">
             <input type="submit" class="btn btn-success offset-md-4 col-md-2"  value="글쓰기" onclick="" id="btnwrite">&nbsp;
           <a href="afterBbs.do" class="btn btn-outline-secondary col-md-2 "  id="btnBack">돌아가기</a>


        </div>
</form>


<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote-bs4.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote-bs4.js"></script>
<script>
    $(document).ready(function() {
        $('#summernote').summernote({
              width : 1100,
            height: 300,                 // set editor height
            minHeight: null,             // set minimum height of editor
            maxHeight: null,             // set maximum height of editor
            focus: true,                  // set focus to editable area after initializing summernote
            lang: 'ko-KR',
         callbacks: {
            onImageUpload: function(files, editor, welEditable) {
                 sendFile(files[0], this);
              },
         },
         toolbar: [
            ['style', ['bold', 'italic', 'underline', 'clear']],
            ['font', ['strikethrough', 'superscript', 'subscript']],
            ['fontsize', ['fontsize']],
            ['color', ['color']],['para', ['ul', 'ol', 'paragraph']],
            ['height', ['height']],
            ['insert', ['picture']]
         ]
          });


      sendMasterTableSet();

   });
    
    
   
   
    
</script>