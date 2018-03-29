<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="planer-title">
	<div class="offset-md-2 col-md-4 col-xs-12">
		<h2>여행 계획</h2>
	</div>	
</div>
<div class="offset-md-2 col-md-8 col-xs-12">
	<hr>
</div>
    
<div class="planer-info">
	<div class="col-md-2 col-xs-12">
		<p>
			${planer }
		</p>
		<p>
			${coTraveler }
		</p>
	</div>
</div>

<div class="add-friend">
	<div class="row">
		<div class="offset-md-2 col-md-4 col-xs-12">
			
			<form>
				<div class="form-group">
					<label for="location"><span data-feather="map-pin"></span></label> 
					<input type="text" class="form-control" id="location" name="location" placeholder="Ex) 전주 한옥 마을">
				</div>
				<div class="form-group">
					<label for="location"><span data-feather="clock"></span></label> 
					<div class="row">
						<div class="col">
							<input type="text" class="form-control" id="location" placeholder="Ex) 전주 한옥 마을">
						</div>	
						<div class="col">
							<input type="text" class="form-control" id="location" placeholder="Ex) 전주 한옥 마을">
						</div>		
					</div>
				</div>
			
				<div class="form-group">
					<label for="exampleFormControlSelect1">Example select</label> 
					<select class="form-control" id="exampleFormControlSelect1">
						<option>1</option>
						<option>2</option>
						<option>3</option>
						<option>4</option>
						<option>5</option>
					</select>
				</div>
				
				<div class="form-group">
					<label for="exampleFormControlInput1">Email address</label> 
					<input type="email" class="form-control" id="exampleFormControlInput1" placeholder="name@example.com">
				</div>
				<div class="form-group">
					<label for="exampleFormControlSelect2">Example multiple
						select</label> <select multiple class="form-control"
						id="exampleFormControlSelect2">
						<option>1</option>
						<option>2</option>
						<option>3</option>
						<option>4</option>
						<option>5</option>
					</select>
				</div>
				<div class="form-group">
					<label for="exampleFormControlTextarea1">Example textarea</label>
					<textarea class="form-control" id="exampleFormControlTextarea1"
						rows="3"></textarea>
				</div>
			</form>

			<span id="notice" style="margin-left: 10px;"></span>
			
			
			
		</div>
		<div class="col-md-4" style="height: 500px; border:2px solid red;">
			
		</div>
	</div>
</div>

<script type="text/javascript">
</script>