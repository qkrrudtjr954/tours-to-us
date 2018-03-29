<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<style>
.main-container {
	background-image: url('${pageContext.request.contextPath}/image/background.jpg');
	background-size: contain;
    background-repeat: no-repeat;
    background-position: center;
}
</style>

<section class="jumbotron text-center main-container">
	<div class="container">
		<h1 class="jumbotron-heading">Tours To Us.</h1>
		<p class="lead text-muted">
			여행을 떠나자 
		</p>
	</div>
</section>

<%-- <img src="${initParam.IMG_SERVER_PATH }/image/${current_user.profile }" width="50" height="50"> --%>
<div class="album py-5 bg-light">
	<div class="container">
		<div class="row">
			<div class="col-md-4">
				<div class="card mb-4 box-shadow">
					<img class="card-img-top" data-src="holder.js/100px225?theme=thumb&bg=55595c&fg=eceeef&text=Thumbnail" alt="Card image cap">
					<div class="card-body">
						<p class="card-text">This is a wider card with supporting text
							below as a natural lead-in to additional content. This content is
							a little bit longer.</p>
						<div class="d-flex justify-content-between align-items-center">
							<div class="btn-group">
								<button type="button" class="btn btn-sm btn-outline-secondary">View</button>
								<button type="button" class="btn btn-sm btn-outline-secondary">Edit</button>
							</div>
							<small class="text-muted">9 mins</small>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="card mb-4 box-shadow">
					<img class="card-img-top"
						data-src="holder.js/100px225?theme=thumb&bg=55595c&fg=eceeef&text=Thumbnail"
						alt="Card image cap">
					<div class="card-body">
						<p class="card-text">This is a wider card with supporting text
							below as a natural lead-in to additional content. This content is
							a little bit longer.</p>
						<div class="d-flex justify-content-between align-items-center">
							<div class="btn-group">
								<button type="button" class="btn btn-sm btn-outline-secondary">View</button>
								<button type="button" class="btn btn-sm btn-outline-secondary">Edit</button>
							</div>
							<small class="text-muted">9 mins</small>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="card mb-4 box-shadow">
					<img class="card-img-top" data-src="holder.js/100px225?theme=thumb&bg=55595c&fg=eceeef&text=Thumbnail" alt="Card image cap">
					<div class="card-body">
						<p class="card-text">This is a wider card with supporting text
							below as a natural lead-in to additional content. This content is
							a little bit longer.</p>
						<div class="d-flex justify-content-between align-items-center">
							<div class="btn-group">
								<button type="button" class="btn btn-sm btn-outline-secondary">View</button>
								<button type="button" class="btn btn-sm btn-outline-secondary">Edit</button>
							</div>
							<small class="text-muted">9 mins</small>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>