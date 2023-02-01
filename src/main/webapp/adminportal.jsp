<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>

<head>
<title>The Dance Company | User Management</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<!-- fonts style -->
<link href="https://fonts.cdnfonts.com/css/poppins" rel="stylesheet">
<!-- Helper Stylesheet -->
<link rel="stylesheet"
	href="http://localhost:8080/dance_company/css/helper.css"
	type="text/css" />
<link rel="stylesheet"
	href="http://localhost:8080/dance_company/css/footer.css"
	type="text/css" />
<body>
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
					<span class="navbar-brand">User Management</span>
				</div>
			</div>
			<div class="d-flex align-items-center">
				<jsp:include page="modules/userNavDropdown.jsp" />
			</div>
		</div>
	</nav>

	<section class="container text-white mt-5 mb-5 vh-100">
		<!-- <div class="alert alert-success" *ngIf='message'>{{message}}</div> -->
		<div class="">
			<h2 class="text-center text-uppercase">List of Students</h2>
			<hr style="color: #C69749; opacity: 1">

			<div class="float-end mt-2 mb-4">
				<a href="<%=request.getContextPath()%>/new"
					class="btn btn-outline-success">Add New User</a>
			</div>

			<table class="table table-dark table-hover text-center">
				<thead>
					<tr class="table-active">
						<th>ID</th>
						<th>Name</th>
						<th>Email</th>
						<th>Mobile</th>
						<th>Actions</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="user" items="${listUser}">
						<tr class="">
							<td><c:out value="${user.id}" /></td>
							<td><c:out value="${user.name}" /></td>
							<td><c:out value="${user.email}" /></td>
							<td><c:out value="${user.mobile}" /></td>
							<td><a class="btn btn-outline-light me-2"
								data-bs-toggle="tooltip" data-bs-placement="bottom"
								data-bs-title="Edit"
								href="edit?id=<c:out
										value='${user.id}' />"> <i
									class="fa-solid fa-pen-to-square"></i>
							</a> <a class="btn btn-outline-danger" data-bs-toggle="tooltip"
								data-bs-placement="bottom" data-bs-title="Delete"
								href="UserServlet?action=delete&id=<c:out value='${user.id}' />"><i
									class="fa-solid fa-trash"></i></a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</section>

	<jsp:include page="modules/footer.jsp"></jsp:include>
</body>

<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
	crossorigin="anonymous"></script>
<script src="https://kit.fontawesome.com/29032ae126.js"
	crossorigin="anonymous"></script>
<script>
const tooltipTriggerList = document.querySelectorAll('[data-bs-toggle="tooltip"]')
const tooltipList = [...tooltipTriggerList].map(tooltipTriggerEl => new bootstrap.Tooltip(tooltipTriggerEl))
</script>
</html>