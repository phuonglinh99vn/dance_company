<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<button type="button" class="btn btn-danger me-2" data-bs-toggle="modal"
	data-bs-target="#logoutModal">${sessionScope.name}</button>

<div class="modal fade" id="logoutModal" tabindex="-1"
	aria-labelledby="loginModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
			<div class="modal-header flex">
				<h1 class="modal-title fs-5 text-center" id="loginModal">Not
					you?</h1>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
				<h3 class="modal-title text-center">Hi,${sessionScope.name}</h3>
			</div>
			<div class="modal-footer">
				<a href="LogoutServlet">Log out?</a>
			</div>
		</div>
	</div>
</div>