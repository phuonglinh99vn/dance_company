<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags"%>

<t:template title="The Dance Company">
	<jsp:attribute name="body">
<section class="text-white"
			style="background-image: url(images/contact_us_background.jpg); height: 86vh;">
		<div class="container flex">
			<div class="row justify-content-left align-items-center"
					style="height: 86vh">
				<div class="col-md-10 col-lg-7">
					<div class="p-md-5" style="width: 35rem">
						<h3 class="mb-5">GET IN TOUCH WITH US</h3>
						<div id="form-message-warning" class="mb-4"></div>
						<form method="POST" id="contactForm" name="contactForm"
								class="contactForm" novalidate="novalidate">
							<div class="row">
								<div class="col-md-6 mb-3">
									<div class="form-group">
										<label class="label fw-bold" for="name">Full Name</label> <input
												type="text" class="form-control" name="name" id="name"
												placeholder="Name" />
									</div>
								</div>
								<div class="col-md-6 mb-3">
									<div class="form-group">
										<label class="label fw-bold" for="email">Email Address</label>
										<input type="email" class="form-control" name="email"
												id="email" placeholder="Email" />
									</div>
								</div>
								<div class="col-md-12 mb-3">
									<div class="form-group">
										<label class="label fw-bold" for="subject">Subject</label> <input
												type="text" class="form-control" name="subject" id="subject"
												placeholder="Subject" />
									</div>
								</div>
								<div class="col-md-12 mb-3">
									<div class="form-group">
										<label class="label fw-bold" for="#">Message</label>
										<textarea name="message" class="form-control" id="message"
												cols="30" rows="4" placeholder="Message"></textarea>
									</div>
								</div>
								<div class="col-md-12">
									<div class="form-group">
										<input type="submit" value="Send Message"
												class="btn btn-danger" />
										<div class="submitting"></div>
									</div>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</section>
</jsp:attribute>
</t:template>
