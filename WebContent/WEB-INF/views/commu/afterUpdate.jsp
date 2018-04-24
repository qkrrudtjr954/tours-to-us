<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/> 
    


 <!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
   <link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote-bs4.css" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="./css/main.css" rel="stylesheet">

    
 <div class="after-title">
   <div class="offset-md-2 col-md-4 col-xs-12">
      <h2>여행 후기 수정</h2>
   </div>
</div>

<%-- <div class="planer-info">
	<div class="col-md-2 col-xs-12">
		<p>
			${planer }
		</p>
	</div>
</div> --%>

<%-- ${planer.seq }
${afterbbs.seq } --%>



<div class="offset-md-2 col-md-8 col-xs-12">
   <hr>
</div>
<form action="afterUpdateAf.do" method="get" id="myform">
<input type="hidden" name="seq" value="${afterbbs.seq }">
<input type="hidden" name="target_planer_seq" value="${planer.seq }">
<div class="row">
   <div class=" offset-md-3 col-md-6 write-form">
      <div class="input-group-prepend">
         <span class="input-group-text">제목/${planer.seq }</span> 
         <input type="text" class="form-control" size="20" name="title" id="title"
            placeholder="제목" value="${afterbbs.title }">
      </div>   
   </div>

   <div class=" offset-md-3 col-md-6 write-form">
      <div class="input-group-prepend">
         <textarea id="summernote" name="content">${afterbbs.content }</textarea>
      </div>   
   </div>
</div>
 <div class="row">
             <input type="button" class="btn btn-success offset-md-4 col-md-2"  value="글쓰기" id="btnwrite">&nbsp;
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