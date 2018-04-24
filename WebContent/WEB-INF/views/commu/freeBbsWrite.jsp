<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote-bs4.css" rel="stylesheet">
<style>
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
	<div class="offset-md-2 col-md-7">
		<div class="after-title-container">
			<h3>자유 게시판 글쓰기</h3>
			<p>당신이 원하는 모든 것을 공유해주세요!</p>
			<hr>
		</div>
	</div>
</div>

<div class="row no-gutters">
	<div class="offset-md-2 col-md-8 col-xs-12">
		<form action="freeBbsWriteAf.do" method="post" id="myform">
			<div class="form-group">
				<label class="after-form-label" for="title">카테고리</label> 
				<select class="form-control" id="location" name="target_category_seq" style="width: 200px">
					<c:forEach var="part" items="${category }">
						<option value="${part.seq }">${part.title }</option>
					</c:forEach>
				</select> 
			</div>
			<div class="form-group">
				<label class="after-form-label" for="title">제목</label> 
				<input type="text" class="form-control" size="20" name="title" id="title" placeholder="제목을 입력해주세요."> 
			</div>
	
			<div class="form-group">
				<label class="after-form-label" for="summernote">내용</label>
				<textarea id="summernote" name="content"></textarea>
			</div>

			<input type="submit" class="btn btn-success offset-md-4 col-md-2" value="글쓰기" onclick="" id="btnwrite">&nbsp; 
			<a href="afterBbs.do" class="btn btn-outline-secondary col-md-2 " id="btnBack">돌아가기</a>
		</form>
	</div>
</div>

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
  	
    $("#btnwrite").click(function() {
		var title = $("#title").val();
		var content = $("#summernote").val();

		if (title === "") {
			alert("제목을 입력해주세요 ");
			$("#title").focus();
			return false;
		} else if (content === "") {
			alert("내용을 입력해주세요 ");
			$("#summernote").focus();
			return false;

		} else {
			$("#myform").submit();

		}
	});
    
    
   
   
    
</script>