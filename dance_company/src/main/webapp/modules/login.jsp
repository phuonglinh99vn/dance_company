<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<button type="button" class="btn btn-danger me-2" data-bs-toggle="modal"
	data-bs-target="#loginModal">Login</button>

<div class="modal fade" id="loginModal" tabindex="-1"
	aria-labelledby="loginModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
			<div class="modal-header flex">
				<h1 class="modal-title fs-5 text-center" id="loginModal">Log In</h1>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<form method="POST" novalidate class="validated-form">
				<div class="modal-body">
					<div class="mb-3 flex justify-content-center">
						<input type="email" class="form-control" name="email" id="email"
							aria-describedby="Email" placeholder="Your email..." required />
						<div class="valid-feedback">Looks good!</div>
					</div>
					<div class="mb-3">
						<input type="password" class="form-control" name="password"
							id="password" placeholder="Your password..." minlength="6"
							maxlength="32"
							pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z])((?=.*\W)|(?=.*_))^[^ ]+$"
							required />
						<div class="valid-feedback">Looks good!</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="submit" class="btn btn-primary">Log in</button>
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Close</button>
				</div>
			</form>
		</div>
	</div>
</div>