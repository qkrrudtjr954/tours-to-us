<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<div class="myplanDetail-title">
	<div class="offset-md-2 col-md-4 col-xs-12">
		<h2>${planer.title }</h2>
	</div>
</div>
<div class="offset-md-2  col-md-8 col-xs-12">
	<input type="button" onclick="day_back(${planer.seq})" class="offset-md-10 btn btn-primary" value="돌아가기">
	<hr>
</div>


<div id="myplanDetail-content">
	<div class="offset-md-3 col-md-5 col-xs-12">
		<div class="card">
			<c:forEach var="dayPlan" items="${planerMap.keySet() }">
					<h5 class="mb-0">
						Day ${dayPlan.day_count }
					</h5>
				<c:forEach var="timePlan" items="${planerMap.get(dayPlan) }" varStatus="i">
							${timePlan.start_time }<br>
							${timePlan.location }<br>
							${timePlan.transportation }<br>
							${timePlan.expected_cost }<br>
							${timePlan.content }<br><br>						
				</c:forEach>
			</c:forEach>
		</div>
	</div>
</div>

<script>
function day_back(seq) {
	location.href="planDetail.do?seq="+seq;
}
</script>