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
				<div class="modal-footer">
					<a href="Authentication?action=logout">Log out?</a>
				</div>


				<button type="button" class="btn btn-primary me-2"
					data-bs-toggle="modal" data-bs-target="#signupModal">Register</button>

				<!-- Register Modal -->
				<div class="modal fade" id="signupModal" tabindex="-1"
					aria-labelledby="signupModalLabel" aria-hidden="true">
					<div class="modal-dialog modal-dialog-centered">
						<div class="modal-content">
							<div class="modal-header flex">
								<h1 class="modal-title fs-5 text-center" id="signupModalLabel">Sign
									Up</h1>
								<button type="button" class="btn-close" data-bs-dismiss="modal"
									aria-label="Close"></button>
							</div>
							<div class="modal-body">
								<form>
									<div class="mb-3">
										<input type="text" class="form-control" id="firstName"
											aria-describedby="First Name" placeholder="First Name" />
									</div>
									<div class="mb-3">
										<input type="text" class="form-control" id="lastName"
											aria-describedby="Last Name" placeholder="Last Name" />
									</div>
									<div class="mb-3">
										<!-- <label for="username" class="form-label">Username</label> -->
										<input type="email" class="form-control" id="email"
											aria-describedby="Email" placeholder="Email" />
									</div>
									<div class="mb-3">
										<!-- <label for="username" class="form-label">Username</label> -->
										<input type="text" class="form-control" id="username"
											aria-describedby="Username" placeholder="Username" />
									</div>
									<div class="mb-3">
										<!-- <label for="password class="form-label">Password</label> -->
										<input type="password" class="form-control" id="password"
											placeholder="Password" />
									</div>
								</form>
							</div>
							<div class="modal-footer">
								<button type="submit" class="btn btn-primary">Sign Up</button>
								<button type="button" class="btn btn-secondary"
									data-bs-dismiss="modal">Close</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>