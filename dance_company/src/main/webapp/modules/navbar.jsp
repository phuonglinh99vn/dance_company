<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<nav class="navbar navbar-expand-lg bg-light">
	<div class="container">
		<div class="me-auto">
			<img src="images/logo.png" alt="Logo" style="width: 45px" /> <a
				class="navbar-brand fw-bold fs-3" href="/">The Dance Company</a>
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
						href="/">Home</a></li>
					<li class="nav-item"><a class="nav-link" href="#">About</a></li>
					<li class="nav-item"><a class="nav-link" href="/booking">Book
							A Class</a></li>
					<li class="nav-item"><a class="nav-link" href="http://localhost:8080/dance_company/contactUs.jsp">Contact
							Us</a></li>
				</ul>
				<form class="d-flex" role="search">
					<input class="form-control me-2" type="search" placeholder="Search"
						aria-label="Search" />
				</form>
				<c:if test="${sessionScope.name == null}">
					<jsp:include page="login.jsp" />	
				</c:if>
				<c:if test="${sessionScope.name != null}">
					<jsp:include page="logout.jsp" />	
				</c:if> 				
				<jsp:include page="register.jsp" />

			</div>
		</div>
	</div>
</nav>