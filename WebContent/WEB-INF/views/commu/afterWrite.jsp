<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote-bs4.css" rel="stylesheet">
    
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



myplan-title{
	border-bottom: 2px solid #7cc4bb;
    width: 35%;
    margin-top: 50px;
}
.planer-info-over {
	background-color: #7DC3BB;
	padding: 15px;
	margin: 10px;
	width: 90%;
	text-align: center;
	border-radius: 15px;
}
.planer-label-icon {
    margin-top: 15px;
    color: white;
}
.planer-label-title {
	width: 100%;
	font-size: 18px;
	font-weight: 500;
	color: white;
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
	<div class="offset-md-2 col-md-7">
		<div class="after-title-container">
			<h3>후기 작성</h3>
			<p>당신의 여행을 자랑해주세요!</p>
			<hr>
		</div>
	</div>
</div>

<div class="row no-gutters">
	<div class="col-md-2 col-xs-12">
		<div class="planer-info-over">
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
	
	<div class="col-md-8 col-xs-12">
		<form action="afterWriteAf.do" method="post" id="myform">
			<input type="hidden" name="target_planer_seq" value="${planer.seq }">
			

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
            width : '100%',
            height: 500,                 // set editor height
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