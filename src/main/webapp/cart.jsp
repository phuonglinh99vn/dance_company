<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags"%>

<t:template title="The Dance Company">
	<jsp:attribute name="header">
	<link rel="stylesheet"
			href="http://localhost:8080/dance_company/css/cart.css"
			type="text/css" />
</jsp:attribute>

	<jsp:attribute name="body">
	<section class="h-100 h-custom" style="background-color: #000">
  		<div class="container py-5 h-100">
    		<div
					class="row d-flex justify-content-center align-items-center h-100">
      			<div class="col-12">
        			<div class="card card-registration card-registration-2"
							style="border-radius: 15px;">
          				<div class="card-body p-0">
            				<div class="row">
              					<div class="col">
                					<div class="p-5">
                  						<div
												class="d-flex justify-content-between align-items-center mb-5">
                    						<h1 class="fw-bold mb-0 text-black">My Booking</h1>
                    						<h6 class="mb-0 text-muted">${empty sessionScope.cart? 0 : sessionScope.cart.size()} classes</h6>
                  						</div>
                  						
                  						<hr class="m-0">

										<c:forEach var="cartItem" items="${sessionScope.cart}">					
											<div
													class="cart-item row d-flex justify-content-between align-items-center p-4">
                    							<div class="col-md-2 col-lg-2 col-xl-2">
                      								<img
															src="http://localhost:8080/dance_company/images/${cartItem.image}"
															class="img-fluid rounded-3" alt="Cotton T-shirt">
                    							</div>
                    							<div class="col-md-3 col-lg-3 col-xl-3">
                      								<h6 class="text-black mb-0">${cartItem.name}</h6>
                       								<h6 class="text-muted">Instructor: ${cartItem.teacher}</h6>
                    </div>
                    
                    <div class="col-md-3 col-lg-3 col-xl-2 d-flex">
                       <h6 class="text-black"> ${cartItem.level}</h6>
                    </div>
                    
                    <div class="col-md-3 col-lg-2 col-xl-2 offset-lg-1">
                      <h6 class="mb-0"> ${cartItem.time}</h6>
                    </div>
                    <div class="col-md-1 col-lg-1 col-xl-1 text-end">
                      <a
															href="CartServlet?action=remove&id=${cartItem.id}"
															class="text-muted"><i class="fas fa-times"></i></a>
                    </div>
                  </div>

                  <hr class="m-0">
					</c:forEach>
				<h6 class="text-black"> ${noti}</h6>

                  <div class="pt-5">
                    <h6 class="mb-0">
						<a href="/dance_company/BookingServlet" class="text-body"><i
														class="fas fa-long-arrow-alt-left me-2"></i>Back to classes</a>
					</h6>
                  </div>
                  
 				  <div class="container text-end">
 				  	 <a href="CartServlet?action=submit_cart"
													class="btn btn-dark btn-block btn-lg"
													data-mdb-ripple-color="dark">Submit Cart</a>
 				  </div>
                 
                </div>
                </div>
              </div>
              <!-- <div class="col-lg-4 bg-grey">
                <div class="p-5">
                  <h3 class="fw-bold mb-5 mt-2 pt-1">Summary</h3>
                  <hr class="my-4">

                  <div class="d-flex justify-content-between mb-4">
                    <h5 class="text-uppercase">items 3</h5>
                    <h5>â¬ 132.00</h5>
                  </div>

                  <h5 class="text-uppercase mb-3">Shipping</h5>

                  <div class="mb-4 pb-2">
                    <select class="select">
                      <option value="1">Standard-Delivery- â¬5.00</option>
                      <option value="2">Two</option>
                      <option value="3">Three</option>
                      <option value="4">Four</option>
                    </select>
                  </div>

                  <h5 class="text-uppercase mb-3">Give code</h5>

                  <div class="mb-5">
                    <div class="form-outline">
                      <input type="text" id="form3Examplea2" class="form-control form-control-lg" />
                      <label class="form-label" for="form3Examplea2">Enter your code</label>
                    </div>
                  </div>

                  <hr class="my-4">

                  <div class="d-flex justify-content-between mb-5">
                    <h5 class="text-uppercase">Total price</h5>
                    <h5>137.00</h5>
                  
              </div>
            </div> -->
          </div>
        </div>
        </div>
      </div>
    </div>

</section>
	

</jsp:attribute>
</t:template>