<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<style>
.toto-img{
	width: 305px;
    height: 360px;
    margin-top: 30px;
    border-top: 2px solid #7DC3BB;
}

.toto-body{
	margin-top: 30px;
}

.toto-updated{
	font-size: 13px;
	color: #484848;
}

.toto-downcount{
	font-size: 13px;
	color: #484848;
	margin-left: 140px;
}

.toto-readcount{
	font-size: 13px;
	color: #484848;
	margin-left: 900px;
}

.toto-content{
	font-size: 13px;
	color: #000;
    width: 370px;
}

.row-content{
	margin-top: 10px;
}

.toto-content-sub{
	margin-left: -13px;
}

h2 {
    display: block;
    font-size: 2rem;
    -webkit-margin-before: 0.83em;
    -webkit-margin-after: 0.83em;
    -webkit-margin-start: 0px;
    -webkit-margin-end: 0px;
}

#under-line {
    border-bottom: 1px solid #000;
    width: 375px;
    margin-bottom: 10px;
    margin-top: -25px;
}

#toto-box{
	margin-left: -30px;
    margin-top: 60px;
}

.filesown-button{
    width: 100px;
}

#toto-pic-box{
    margin-right: 90px;
    margin-left: 0;
    /* border-right: 1px solid #DCDCDC; */
}

.editor-title-container {
	margin-top: 20px;
	width: 100%;
}

</style>

<div class="row no-gutters">
	<div class="editor-title-container">
		<div class="offset-md-2 col-md-10">
			<h3>${toto.location }</h3>
			<p>Tours to us가 제공하는 ${toto.location } 가이드북!</p>
		</div>
	</div>
	<hr>
</div>
<div class="row no-gutters">
	<div class="offset-md-2 col-md-8">
		<div class="d-flex justify-content-end" style="width: 100%">
			<span class="toto-readcount">조회수 : ${toto.readcount }</span>
		</div>	
		<div class="row no-gutters">
			<div class="offset-md-1 col-md-5">
				<div class="row no-gutters" id="toto-pic-box">
					<div class="toto-img">
						<img class="toto-img-top"  src="${initParam.IMG_SERVER_PATH}/image/${toto.pic}" width="300px" height="355px">
					</div>
				</div>
			</div>
			<div class="col-md-6">
				<div class="row no-gutters">
					<span class="toto-title" style="font-weight: bold; font-size: 20px;">${toto.title }</span>
				</div>
				<div class="row no-gutters">
					<span class="toto-updated" style="font-weight: bold;">업데이트 : </span>&nbsp;<span class="toto-updated">${fn:substring(toto.last_updated, 0, 10) }</span>
					<span class="toto-downcount" style="font-weight: bold;">다운로드 수 : </span>&nbsp;<span class="toto-updated downcount">${toto.downcount }</span>
				</div>
				<hr>
				<div class="row no-gutters">
					<span class="toto-content" style="fo">추가 설명 : ${toto.content }</span>
				</div>
				<div class="row no-gutters">
					<div class="d-flex justify-content-center" style="width: 100%;">
						<a id="filedown-button" class="btn btn-outline-secondary" href="${initParam.FILE_SERVER_PATH }/download?filename=${toto.filename }">다운로드</a>
					</div>
				</div>		
					
			</div>		
		</div>
		
	</div>
</div>
<div class="row no-gutters">
	<div class="detailBody_like">
		<img class="hearticon" src="${ isLiked == 1 ? './image/heart.png' : './image/empty_heart.png' }" id="like_btn" width="100px"><br> <span>좋아요</span>&nbsp;<strong id="like_count">${like_count }</strong>
	</div>
	<hr class="offset-md-2 col-md-8">
</div>


<script>
$('#filedown-button').on('click', function () {
	$.get('${initParam.FILE_SERVER_PATH }/download?filename=${toto.filename }', function () {
		$.ajax({
			url: 'downCount.do',
			data : { seq : ${toto.seq}},
			method : 'POST',
			success : function (data) {
				if(data){
					var downcount = parseInt($('span.downcount').text()) + 1;
					$('span.downcount').text(downcount);
				}
			}
		})	
	});
})

$('#like_btn').click(function () {
	$.ajax({
		url:"likebtn_click.do",
		data: {bbs_category: 5, target_user_seq: ${current_user.seq }, target_bbs_seq: ${toto.seq }},
		type:"post",
		success : function (data) {
			var result = JSON.parse(data);
			if(result.status == 404){
				$('img.hearticon').attr('src', './image/empty_heart.png');
			} else {
				$('img.hearticon').attr('src', './image/heart.png');
			}
			$('strong#like_count').html(result.like_count);
		}
	})
});
</script>