<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

    
<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote-bs4.css" rel="stylesheet">
<style>

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
.menu_item {
	font-size: 15px;
	text-align: left;
}
.planer-label-icon {
	vertical-align: middle;
	margin: 0px 3px;
}

.editor-title-container {
	margin-top: 20px;
	width: 100%;
}

#myform {
	width: 100%;
}

.after-form-label {
	font-size: 25px;
	font-weight: 700;
	margin: 30px 0px 30px 10px;
	border-bottom: 2px solid gray;
}
.after-title-container {
	margin-top: 20px;
	width: 100%;
}

</style>


<div class="row no-gutters">
	<div class="editor-title-container">
		<div class="offset-md-2 col-md-10">
			<h3>투디터 pick!</h3>
			<p>투디터님! 당신의 정보를 마음껏 공유해주세요!</p>
			<hr>
		</div>
	</div>
</div>

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
					<li class="menu_item">
						<a href="editor_essay.do" class="nav-link" title="투디터 pick">투디터 pick</a>
					</li>
					<li class="menu_item">
						<a href="user_guide.do" class="nav-link" title="투둥이 가이드북">투둥이 가이드북</a>
					</li>
					<li class="menu_item">
						<a href="toto_guide.do" class="nav-link" title="투투 가이드북">투투 가이드북</a>
					</li>
				</ul>
			</div>
		</div>
	</div>
	
	<div class="col-md-8 col-xs-12">
		<div class="row no-gutters">
			<form action="toditor_writeAf.do" id="myform" method="post">
				<input type="hidden" name="target_user_seq" value="${current_user.seq }">
				<input type="hidden" name="pic1" value="no-img.png" id="pic1"/>
				
				<div class="form-group">
					<label class="after-form-label" for="title">카테고리</label>
					<select class="custom-select" id="target_category_seq" name="target_category_seq">
						<c:forEach items="${categorylist }" var="category" varStatus="i">
							<option value="${category.seq }">${category.title }</option>
						</c:forEach>
					</select>
				</div>

				<div class="form-group">
					<label class="after-form-label" for="title">제목</label>
					<input type="text" class="form-control" name="title" id="title" size="70"	placeholder="제목을 입력해주세요">
				</div>
	
				<div class="form-group">
					<label class="after-form-label" for="title">내용</label>	
					<textarea name="content" id="summernote" name="content" style="width:100%;"></textarea>
				</div>
				<br>
				<div class="row no-gutters">
					<input class="btn btn-success offset-md-2 col-md-2" type="submit" id="btnWrite" value="글쓰기"> &nbsp;&nbsp;
					<button type="button" id="btnBack" class="btn btn-outline-secondary col-md-2">돌아가기</button>
				</div>
			</form>
		</div>
	</div>
</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote-bs4.js"></script>
<script src="js/summernote-map.js"></script>
<script>
    $(document).ready(function() {
	    	$('#summernote').summernote({
				height : 300, // set editor height
				minHeight : null, // set minimum height of editor
				maxHeight : null, // set maximum height of editor
				focus : true, // set focus to editable area after initializing summernote
				lang : 'ko-KR',
				callbacks : {
					onImageUpload : function(files, editor,welEditable) {
						sendFile(files[0], this);
					},
				},toolbar : [
						['style',['bold', 'italic', 'underline', 'clear' ] 
					],
					['font',['strikethrough', 'superscript', 'subscript' ] ],
					[ 'fontsize',[ 'fontsize' ] ],
					[ 'color', [ 'color' ] ],
					['para',[ 'ul', 'ol','paragraph' ] ],
					[ 'height',[ 'height' ] ],
					[ 'insert',[ 'picture'  ] ] 
				]
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
				var url = '${initParam.IMG_SERVER_PATH }/image/'+data.filename;

				if($('#pic1').val() == 'no-img.png'){
					$('#pic1').val(data.filename);
				}

				/* alert(url); */
				$('#hello').html(url);
				$(editor).summernote('editor.insertImage', url);
				$('#imageDiv > ul').append('<li><img src="'+url+'" width="480" height="auto"/></li>');
	        }
		});
	}
   
    
</script>