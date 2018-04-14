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



.planer-info-over {
	background-color: #7DC3BB;
	margin: 30px 10px;
	width: 80%;
	text-align: center;
	border-radius: 15px;
	padding: 15px;
    margin: 10px;
}

.menu_table ul{
	list-style-type: none;
	padding: 0px;
}
.menu_table li{
	padding: 10px 0px;
	color: white;
}
.menu-title {
	font-size: 20px;
}
.menu-item {
	font-size: 15px;
}
.planer-label-icon {
	vertical-align: middle;
	margin: 0px 3px;
}


.editor-title-container {
	margin-top: 20px;
	width: 100%;
}
.update-label {
	font-size: 30px;
	font-weight: 700;
	margin: 10px 0px;s
}

.button-area {
	margin: 20px 0px;
}

#summitBtn {
    border: 2px solid #7cc4bb;
    color: #7cc4bb;
}
#cancelBtn {
	border: 2px solid gray;
    color: gray;
}
#cancelBtn,
#summitBtn {
    border-radius: 10px;
    background: white;
    transition: color 1s, background-color 1s;

}

input#summitBtn:hover {
    background-color: #7cc4bb;
    color: white;
}

button#cancelBtn:hover {
    background-color: gray;
    color: white;
}
input#summitBtn:hover,
button#cancelBtn:hover {
    transition: color 1s, background-color 1s;
}
</style>


<div class="row no-gutters">
	<div class="editor-title-container">
		<div class="offset-md-2 col-md-10">
			<h3>투디터 pick!</h3>
			<p>투디터들이 엄선한 여행지 꿀팁&맛집 pick!</p>
		</div>
	</div>
	<hr>
</div>


 <!-- 내용 div -->
<div class="row no-gutters">
	<div class="col-md-2 col-xs-12">
		<div class="planer-info-over">
			<div class="menu_table">
				<ul style="list-style-type: none">
					<li class="menu-title">
						<span class="planer-label-icon" data-feather="briefcase"></span>나의 플랜
					</li>
					<li class="menu_item">
						<a href="#none" onclick="url_myplan()" class="nav-link" title="나의 플랜보기">나의 플랜보기</a>
					</li>
					<li><hr></li>
					<li class="menu-title">
						<span class="planer-label-icon" data-feather="user"></span>회원정보관리
					</li>
					<li class="menu_item">
						<a href="mypage.do" class="nav-link" title="회원정보수정">회원정보수정</a>
					</li>
				</ul>
			</div>
		</div>
	</div>
	<div class="col-md-8 col-xs-12">
		<form name="form1" action="toditor_updateAf.do">
			<input type="hidden" name="seq" value="${bbs.seq }">
			<input type="hidden" name="pic1" value="no-img.png" id="pic1"/>
				
			<div class="row no-gutters">
				<div class="col-sm-6 col-xs-12">
					<span id="category_name">#${bbs.category }</span>
				</div>	
			</div>	
			
			<div class="row no-gutters">
				<div class="col-md-6 col-xs-12">
					<label for="title" class="update-label">Title</label>
					<input type="text" class="form-control" name="title" id="title" value="${bbs.title }">
				</div>
			</div>
			<div class="row no-gutters">
				<div class="col-md-12 col-xs-12">
					<label for="summernote" class="update-label">Content</label>
					<textarea name="content" class="summernote" id="summernote" name="content" style="width:100%;">${bbs.content }</textarea>
				</div>
			</div>
			
			<div class="row no-gutters">
				<div class="col-md-12 col-xs-12 text-center button-area">			
					<input class="btn btn-success" type="submit" id="summitBtn" value="수정하기"> &nbsp;&nbsp;
					<button type="button" id="cancelBtn" class="btn btn-outline-secondary">돌아가기</button>
				</div>
			</div>
		</form>
	</div>						
</div>
<!-- 내용 div  끝-->

<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote-bs4.js"></script>
<script>
	$('#cancelBtn').on('click', function () {
		history.back();
	});
	
    $(document).ready(function() {
	    	$('#summernote').summernote({
	    		width: '100%',
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