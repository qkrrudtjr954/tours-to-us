<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

.content{
padding-top: 20px;
}

.category{
padding-left:20px;
}




#category_name{
padding-left: 5px;
padding-top:10px;
}



</style>

<div id="floatMenu">
	<ul style="width:100%; list-style-type: none;" class="menu_">
		<li class="title"><h2>가이드북</h2></li>	
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



 <!-- 내용 div -->
<div class="offset-md-2 col-md-9">
	<br><br>
	<h3>투디터  pick!</h3>
	<hr>
	<div class="offset-md-1 col-md-10">
		<form name="form1" action="toditor_updateAf.do">
			<input type="hidden" name="seq" value="${bbs.seq }">
			<div class="row">
				<div class="row col-md-3">
				<div class="category">
					<span id="category_name">#${bbs.category }</span>
				</div>
				</div>
				<div class="col-md-8">
					<input type="text" class="form-control" name="title" id="title" size="70"	 value="${bbs.title }">
				</div>
			</div>	
			<div class="row">
				<div class="content">
					<textarea name="content" class="summernote" id="summernote" name="content" style="width:100%;">${bbs.content }</textarea>
				</div>
			</div>
			<br>
			<div class="row">
				<input type="hidden" name="pic1" value="no-img.png" id="pic1"/>
				<input class="btn btn-success offset-md-2 col-md-2" type="submit" id="btnWrite" value="수정하기"> &nbsp;&nbsp;
				<button type="button" id="btnBack" class="btn btn-outline-secondary col-md-2">돌아가기</button>
			</div>
		</form>
	</div>						
</div>
<!-- 내용 div  끝-->

<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote-bs4.js"></script>
<script>
    $(document).ready(function() {
	    	$('#summernote').summernote({
	    		width: 900,
				height : 600, // set editor height
				minHeight : null, // set minimum height of editor
				maxHeight : null, // set maximum height of editor
				focus : true, // set focus to editable area after initializing summernote
				lang : 'ko-KR',
				callbacks : {
					onImageUpload : function(files, editor,welEditable) {
						sendFile(files[0], this);
					},
				},toolbar : [['style',['bold', 'italic', 'underline', 'clear' ] ],
							['font',['strikethrough', 'superscript', 'subscript' ] ],
							[ 'fontsize',[ 'fontsize' ] ],
							[ 'color', [ 'color' ] ],
							['para',[ 'ul', 'ol','paragraph' ] ],
							[ 'height',[ 'height' ] ],
							[ 'insert',[ 'picture' ] ] ]
		});
	});
    
    function sendFile(file, editor) {
		formdata = new FormData();
		formdata.append("userImage", file);

		$.ajax({
			data: formdata,
			type: "POST",
			url: '${initParam.IMG_SERVER_PATH}/upload',
			cache: false,
			contentType: false,
			processData: false,
			success: function(data) {
				console.log(data);
				var url = '${initParam.IMG_SERVER_PATH }/image/'+data.filename;

				if($('#pic1').val() == 'no-img.png'){
					$('#pic1').val(data.filename);
				}

				alert(url);
				$('#hello').html(url);
				$(editor).summernote('editor.insertImage', url);
				$('#imageDiv > ul').append('<li><img src="'+url+'" width="480" height="auto"/></li>');
	        }
		});
	}
   
    
</script>