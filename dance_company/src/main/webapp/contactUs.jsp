<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<!-- Basic -->
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<!-- Mobile Metas -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />

<title>Contact Us</title>

<!-- Bootstrap 5.2 -->
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
</head>
<body>
	<jsp:include page="modules/navbar.jsp" />
	<section class="text-white"
		style="background-image: url(images/contact_us_background.jpg); height: 86vh;">
		<div class="container flex">
			<div class="row justify-content-left align-items-center"
				style="height: 86vh">
				<div class="col-md-10 col-lg-7">
					<div class="p-md-5" style="width: 35rem">
						<h3 class="mb-5">GET IN TOUCH WITH US</h3>
						<div id="form-message-warning" class="mb-4"></div>
						<!-- <div id="form-message-success" class="mb-4">
              Your message was sent, thank you!
            </div> -->
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
	<jsp:include page="modules/footer.jsp" />
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous"></script>
	<script src="https://kit.fontawesome.com/29032ae126.js"
		crossorigin="anonymous"></script>
</body>
</html>