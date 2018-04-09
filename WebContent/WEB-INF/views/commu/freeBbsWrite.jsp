<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
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

<div class="offset-md-2 col-md-8 col-xs-12">
   <hr>
</div>
<form action="freeBbsWriteAf.do">
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
           <a href="freeBbsList.do" class="btn btn-outline-secondary col-md-2 "  id="btnBack">돌아가기</a>


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