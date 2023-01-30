<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags"%>
<t:template title="The Dance Company">
	<jsp:attribute name="body">
	<section class="container text-white mb-5 mt-5">
		<h1 class="text-center text-bold mb-5">Timetable</h1>
		<hr>
		
		<%-- <div class="row d-flex justify-content-around align-items-center">
			<div class="col-3">
				<h3>Hip Hop - Beginner</h3>
			</div>
			<div class="col-3">
				<span>8:30 - 9:30</span>
			</div>
			<div class="col-3">
				<span>Teacher: Jason</span>
			</div>
			<div class="col-3">
				<a class="btn btn-primary" href="cancelOrder?id=${item.id}">Cancel this class</a>
			</div>
		</div>
		<hr> --%>
		
		<c:forEach var="item" items="${timetable}">
			<div class="row d-flex justify-content-around align-items-center">
			<div class="col-3">
				<h3>${item.name} - ${item.level}</h3>
			</div>
			<div class="col-3">
				<span>${item.time}</span>
			</div>
			<div class="col-3">
				<span>Teacher: ${item.teacher}</span>
			</div>
			<div class="col-3">
				<a class="btn btn-primary" href="cancelOrder?id=${item.id}">Cancel this class</a>
			</div>
		</div>
		<hr>
			
		</c:forEach>
	</section>
	
</jsp:attribute>
</t:template>