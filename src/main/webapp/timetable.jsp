<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags"%>
<t:template title="The Dance Company">
	<jsp:attribute name="header">
		<style>
			.row:hover {
				background-color: #735F32;
				opacity: 0.8;
			}
			hr {
				margin: 0;
			}
		</style>
	</jsp:attribute>
	
	<jsp:attribute name="body">
	<section class="container text-white mb-5 mt-5 vh-100">
		<h1 class="text-center text-bold mb-5">My Timetable</h1>
		<hr>
		
		<c:forEach var="item" items="${timetable}">
			<div class="row d-flex align-items-center p-3">
			<div class="col-4">
				<span class="fs-3 me-3">${item.name}</span>
				<span class="badge level-badge">${item.level}</span>
			</div>
			<div class="col-3">
				<span class>${item.time}</span>
			</div>
			<div class="col-3">
				<span>Teacher: ${item.teacher}</span>
			</div>
			<div class="col-2">
				<a class="btn btn-primary" href="OrderServlet?action=delete_Class&id=${item.id}">Cancel</a>
			</div>
		</div>
		<hr>
			
		</c:forEach>
	</section>
	
	<script>
		const levelBadges = document.querySelectorAll(".level-badge");
		levelBadges.forEach((levelBadge) => {
			const level = levelBadge.textContent;
			if (level == "Beginner") {
				levelBadge.classList.add("text-bg-warning");
			} else if (level == "Intermediate") {
				levelBadge.classList.add("text-bg-info");
			} else if (level == "Advanced") {
				levelBadge.classList.add("text-bg-success");
			} else {
				levelBadge.classList.add("text-bg-danger");
			}
		});
	</script>
</jsp:attribute>
</t:template>