<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
   <link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote-bs4.css" rel="stylesheet">
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
<hr>

<div class="offset-md-1 col-md-10">
<form name="form1" action="CommuBbsController">
<div class="row">
	<div class="row col-md-3">
	<select class="custom-select" id="category" name="category">
			<option>지역을 골라주세요</option>
			<option>2</option>
			<option>3</option>
	</select>
	</div>
	<div class="col-md-8">
		<input type="text" class="form-control" name="title" id="title" size="70"	placeholder="제목을 입력해주세요">
	</div>
</div>	
	<div class="row">
	
	<div class="col-md-10">
	<br>
			<textarea name="content" id="summernote" name="content" width="100%" ></textarea>
	</div>

	</div>
	<br>
	<div class="row">
			<input class="btn btn-success offset-md-2 col-md-2" type="submit"
								id="btnWrite" value="글쓰기"> &nbsp;&nbsp;
			<button type="button" id="btnBack"
								class="btn btn-outline-secondary col-md-2">돌아가기</button>
	</div>
</form>
					
					
<!-- 내용 div  끝-->
</div>


<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote-bs4.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote-bs4.js"></script>
<script>
    $(document).ready(function() {
    	$('#summernote').summernote({
			height : 300, // set editor height
			minHeight : null, // set minimum height of editor
			maxHeight : null, // set maximum height of editor
			focus : true, // set focus to editable area after initializing summernote
			lang : 'ko-KR',
			callbacks : {onImageUpload : function(
							files, editor,welEditable) {
							sendFile(files[0], this);
							},
						},toolbar : [['style',['bold',
												'italic',
												'underline',
												'clear' ] ],
									['font',['strikethrough',
											'superscript',
												'subscript' ] ],
									[ 'fontsize',[ 'fontsize' ] ],
									[ 'color', [ 'color' ] ],
									['para',[ 'ul', 'ol','paragraph' ] ],
									[ 'height',[ 'height' ] ],
									[ 'insert',[ 'picture' ] ] ]
			});

   });
    
    
   
   
    
</script>