<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags"%>

<t:template title="The Dance Company | Class Details">
	<jsp:attribute name="body">
<section class="mb-5" style="height: auto">
		<div class="container mt-5">
			<div class="row">
				<div class="col me-5">
					<img src="http://localhost:8080/dance_company/images/${detail.image}" class="w-100 rounded" />
				</div>
				<div class="col">
					<div class="text-white">
						<h1 class="mb-2 fw-bold">${detail.name}</h1>
						<h5 class="mb-4 fw-bold">${detail.level}</h5>
						<h5 class="">Instructor: ${detail.teacher}</h5>
						<hr style="color: #C69749; opacity: 1">
						<p>A beginner level class for dancers in their first few years
							of Ballet. In a friendly, relaxed and well-structured atmosphere
							practice the foundations of classical ballet including the
							positions, alignment, lines and co-ordination required for basic
							ballet. The class starts with exercises at the bare followed by
							work in the centre of the floor. Ballet is perfect for improving
							core strength, posture, grace and muscle tone! This class is for
							adults aged 16 and over. If you have never done any Ballet before
							we encourage you to enroll in an Introduction to Ballet short
							course with us prior to attending the Beginner Ballet class.
						
							
							<p>Please discuss with your teacher if you feel you are ready
							to progress up to the next level.
						
							
							<hr style="color: #C69749; opacity: 1">
						<div class="d-flex justify-content-between mb-3">
							<label for="timetable">Select Time: </label> <select name="timetable" id="timetable" class="form-select" style="width: 50%" aria-label=".form-select">
								<c:forEach var="item" items="${schedule}">
									<option value="${item.id}"><c:out value="${item.time}" /></option>
								</c:forEach>
								
							</select>
						</div>
						<hr style="color: #C69749; opacity: 1">
						<a class="btn btn-warning float-end d-flex align-items-center" href="CartServlet?action=add&id=${detail.id}">
							<i class="fa-solid fa-cart-shopping fs-4 me-2"></i> 
							<span>Add to Cart</span>
						</a>
						<div class="text-white">${noti}</div>
						
					</div>
				</div>
			</div>
		</div>
	</section>
</jsp:attribute>
</t:template>
