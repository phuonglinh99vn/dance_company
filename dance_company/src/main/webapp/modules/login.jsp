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
			<div class="modal-body">
				<form action="user-login" method="POST" novalidate
					class="validated-form" id="loginForm">
					<div class="mb-3 flex justify-content-center">
						<label>Email</label> <input type="email" class="form-control"
							name="login-email" id="email" aria-describedby="Email"
							placeholder="user@mail.com" required />
						<div class="valid-feedback">Looks good!</div>
					</div>
					<div class="mb-3">
						<label>Password</label> <input type="password"
							class="form-control" name="login-password" id="password"
							minlength="6" maxlength="32"
							pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z])((?=.*\W)|(?=.*_))^[^ ]+$"
							required />
						<div class="valid-feedback">Looks good!</div>
					</div>
					<button type="submit"
						class="btn btn-primary login-btn text-center w-100">Login</button>
				</form>
			</div>
			<div class="modal-footer">
				<p class="text-center">Not a member yet?
					<a href="#">Sign Up</a>
				</p>
				
			</div>
		</div>
	</div>
</div>