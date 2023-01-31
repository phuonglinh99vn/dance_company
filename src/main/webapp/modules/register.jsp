<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!-- Register Modal -->
<div class="modal hide fade" id="signupModal" tabindex="-1" aria-labelledby="signupModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
			<div class="modal-header flex">
				<h1 class="modal-title fs-5 text-center" id="signupModalLabel">Sign Up</h1>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<form action="Authentication?action=register" method="POST" class="">
					<div class="mb-3">
						<label for="name" class="form-label">Name</label> <input type="text" class="form-control" name="name" id="name" aria-describedby="Name" placeholder="John Doe" />
					</div>
					<div class="mb-3">
						<label for="email" class="form-label">Email</label> <input type="email" class="form-control" name="email" id="email" aria-describedby="Email" placeholder="john.doe@example.com" />
					</div>
					<div class="mb-3">
						<label for="pwd" class="form-label">Password</label> <input type="password" class="form-control" name="pwd" id="pwd" />
					</div>
					<div class="mb-3">
						<label for="mobile" class="form-label">Mobile Phone</label> <input type="text" class="form-control" name="mobile" id="mobile" aria-describedby="Mobile" placeholder="(555) 555-555" />
					</div>
					<div>
						<button type="submit" class="btn btn-primary register-btn text-center w-100">Register</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>