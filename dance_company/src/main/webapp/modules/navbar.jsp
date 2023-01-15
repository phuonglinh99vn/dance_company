<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg bg-light">
	<div class="container d-flex justify-content-between">
		<div class="">
			<img src="images/logo.png" alt="Logo" style="width: 45px" /> <a
				class="navbar-brand fw-bold fs-3" href="/dance_company/HomeServlet">The
				Dance Company</a>
		</div>
		<div>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link" aria-current="page"
						href="/dance_company/HomeServlet">Home</a></li>
					<li class="nav-item"><a class="nav-link" href="">About</a></li>
					<li class="nav-item"><a class="nav-link"
						href="/dance_company/BookingServlet">Book A Class</a></li>
					<li class="nav-item"><a class="nav-link"
						href="/dance_company/ContactUsServlet">Contact Us</a></li>
				</ul>
			</div>
		</div>
		<div class="d-flex align-items-center">
			<jsp:include page="userNavDropdown.jsp" />
			<a class="nav-link ms-3" href="CartServlet?action=view_cart" style="display: inline-block">
				<i class="fa-solid fa-cart-shopping">Cart(${empty sessionScope.cart? 0: sessionScope.cart.size()})</i>
			</a>
		</div>
	</div>
</nav>