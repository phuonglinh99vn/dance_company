<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags"%>

<t:template title="The Dance Company | Class Details">
	<jsp:attribute name="body">
	
	<section class="mb-5 position-relative" style="height: auto">
		<div class="container pt-5">
        	<h6 class="mb-0">
				<a href="/dance_company/BookingServlet"
						class="text-white text-decoration-none"><i
						class="fas fa-long-arrow-alt-left me-2"></i>Back to classes</a>
			</h6>
        </div>
		<div class="container mt-5">
			<div class="row">
				<div class="col me-5">
					<img
							src="http://localhost:8080/dance_company/images/${detail.image}"
							class="w-100 rounded" />
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
						<form action="CartServlet" method="post" id="cart-form">
						<input type="hidden" name="productId" value="${detail.id}" />
						<div class="d-flex justify-content-between mb-3">
							<label for="timetable">Select Time: </label> <select
										name="schedule" id="scheduleId" class="form-select"
										style="width: 50%" aria-label=".form-select">
								<c:forEach var="schedule" items="${schedule}">
									<option name="scheduleId" value="${schedule.id}">${schedule.time}</option>
								</c:forEach>	
							</select>
						
						</div>
						</form>
						<hr style="color: #C69749; opacity: 1">
  						<button
								class="btn btn-warning float-end d-flex align-items-center"
								type="submit" form="cart-form">
							<i class="fa-solid fa-cart-shopping fs-4 me-2"></i> 
							<span>Add to Cart</span>
						</button>
						
						<c:if test="${noti != null}">
							<div class="position-absolute top-0 end-0">
								<div class="alert alert-danger alert-dismissible fade show"
										role="alert">
									<span>${noti}</span>
  									<button type="button" class="btn-close"
											data-bs-dismiss="alert" aria-label="Close"></button>
								</div>
							</div>
						</c:if>
					
					</div>
					<h1>Submit Review</h1>
 	<form action="ReviewServlet?action=addReview" method="post">
    <input type="hidden" name="productId" value="${detail.id}" />
    <p>
      <label for="review">Review:</label>
      <textarea id="comment" name="comment" required></textarea>
    </p>
    <p>
      <label for="rating">Rating:</label>
      <input type="number" id="rating" name="rating" min="1" max="5"
									required />
    </p>
    <p>
      <input type="submit" value="Submit Review" />
    </p>
  </form>
					
					
					<div>
					<c:forEach var="review" items="${reviews}">
					<div class="col-xl-3 mb-5">
						<div class="card">
							<div class="card-body d-flex flex-column">
								<div class="card-title fw-bold fs-4">${review.userName}</div>
								<div class="card-title fw-bold fs-4">${review.date}</div>
								<div class="card-text">Rating: ${review.rating}</div>
								<div class="mb-4 cart-text">Comment: ${review.comment}</div>
								<div class="mt-auto flex-row justify-content-between">
								</div>
							</div>
						</div>
					</div>
				</c:forEach> 
					</div>
				</div>
			</div>
		</div>
	</section>
	<script>
		const toastTrigger = document.getElementById('liveToastBtn');
		const toastLiveExample = document.getElementById('liveToast');
		if (toastTrigger) {
	  		toastTrigger.addEventListener('click', () => {
	    	const toast = new bootstrap.Toast(toastLiveExample);
	    	toast.show();
	  })
	}
	</script>
</jsp:attribute>
</t:template>