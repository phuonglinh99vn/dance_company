<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="mt" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<head>
<!-- Basic -->
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<!-- Mobile Metas -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<!-- Site Metas -->
<meta name="keywords" content="" />
<meta name="description" content="" />
<meta name="author" content="" />
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<title>The Dance Company</title>

<!-- Bootstrap 5.2 -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">


<!-- fonts style -->
<link
	href="https://fonts.googleapis.com/css?family=Poppins:400,700&display=swap"
	rel="stylesheet" />
<!-- Custom styles for this template -->
<link href="css/style.css" rel="stylesheet" />
<!-- responsive style -->
<!-- <link href="css/responsive.css" rel="stylesheet" /> -->
</head>

<body>
	<!-- Navbar -->
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
						<li class="nav-item"><a class="nav-link" href="/contact_us">Contact
								Us</a></li>
					</ul>
					<form class="d-flex" role="search">
						<input class="form-control me-2" type="search"
							placeholder="Search" aria-label="Search" />
					</form>
					<c:if test="${sessionScope.name == null}">
						<button type="button" class="btn btn-danger me-2"
							data-bs-toggle="modal" data-bs-target="#loginModal">
							Login</button>
					</c:if>
					<c:if test="${sessionScope.name != null}">
						<button type="button" class="btn btn-danger me-2"
							data-bs-toggle="modal" data-bs-target="#logoutModal">
							${sessionScope.name}</button>
					</c:if>


					<!-- Login Modal -->
					<div class="modal fade" id="loginModal" tabindex="-1"
						aria-labelledby="loginModalLabel" aria-hidden="true">
						<div class="modal-dialog modal-dialog-centered">
							<div class="modal-content">
								<div class="modal-header flex">
									<h1 class="modal-title fs-5 text-center" id="loginModal">Log
										In</h1>

									<button type="button" class="btn-close" data-bs-dismiss="modal"
										aria-label="Close"></button>
									<title>E-Commerce Cart</title>
									</head>
									<body>

										<div class="container">
											<div class="card w-50 mx-auto my-5">
												<div class="card-header text-center">User Login</div>
												<div class="card-body">
													<form action="user-login" method="post">
														<div class="form-group">
															<label>Email address</label> <input type="email"
																name="login-email" class="form-control"
																placeholder="Enter email">
														</div>
														<div class="form-group">
															<label>Password</label> <input type="password"
																name="login-password" class="form-control"
																placeholder="Enter password">
														</div>
														<div class="text-center">
															<button type="submit" class="btn btn-primary">Login</button>
														</div>
													</form>
												</div>
											</div>
										</div>


									</body>
								</div>
							</div>
						</div>
					</div>

					<!-- Login Modal -->

					<!-- Logout Modal -->
					<div class="modal fade" id="logoutModal" tabindex="-1"
						aria-labelledby="loginModalLabel" aria-hidden="true">
						<div class="modal-dialog modal-dialog-centered">
							<div class="modal-content">
								<div class="modal-header flex">
									<h1 class="modal-title fs-5 text-center" id="loginModal">Not you?</h1>

									<button type="button" class="btn-close" data-bs-dismiss="modal"
										aria-label="Close"></button>
									<title>E-Commerce Cart</title>
									</head>
									<body>
										<h3 class="modal-title text-center">Hi,${sessionScope.name}</h3>


									</body>
								</div>
								<div class="modal-footer">

									<a href="LogoutServlet">Log out?</a>

								</div>
							</div>
						</div>
					</div>
</html>
</script>
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
</nav>

<!-- Main Carousel section -->
<div id="carouselExampleSlidesOnly" class="carousel slide"
	data-ride="carousel">
	<div class="carousel-inner">
		<div class="carousel-item active">
			<img class="d-block w-100" style="height: 45em"
				src="images/dance_carousel.jpg" alt="First slide" />
		</div>
	</div>
</div>
</div>

<!-- Class Section -->

<section class="class_section" style="height: 50vh">
	<div class="container-fluid">
		<h2 class="custom_heading mt-5 mb-5">Step-by-Step Learning for
			All Levels</h2>
		<div class="row">
			<div class="col-3">
				<div class="card" style="height: 11rem; width: 18rem">
					<div class="card-body bg-warning">
						<h5 class="card-title level-card-title">BRAND NEW</h5>
						<p class="card-text">Got two left feet? Start with our 10-day
							intro program.</p>
					</div>
				</div>
			</div>
			<div class="col-3">
				<div class="card" style="height: 11rem; width: 18rem">
					<div class="card-body bg-danger">
						<h5 class="card-title level-card-title">BEGINNER</h5>
						<p class="card-text">Got the basics down? Level up with new
							moves and routines.</p>
					</div>
				</div>
			</div>
			<div class="col-3">
				<div class="card" style="height: 11rem; width: 18rem">
					<div class="card-body bg-info">
						<h5 class="card-title level-card-title">INTERMEDIATE</h5>
						<p class="card-text">Feel pretty confident? Learn more
							challenging skills and pieces.</p>
					</div>
				</div>
			</div>
			<div class="col-3">
				<div class="card" style="height: 11rem; width: 18rem">
					<div class="card-body bg-success">
						<h5 class="card-title level-card-title">ADVANCED</h5>
						<p class="card-text">Alreadu killin' it? Train with the top
							choreographers in the game.</p>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>

<!-- Testamony section -->
<section class="p-3" style="background-color: #000">
	<div class="container text-white text-center">
		<h2 class="custom_heading">Testimonial</h2>
		<p class="custom_heading-text">See what your former students say
			about the courses</p>
		<div>
			<div id="carouselControls" class="carousel slide"
				data-bs-ride="carousel">
				<div class="carousel-inner">
					<div class="carousel-item active">
						<div class="client_container layout_padding2">
							<img class="d-block" src="images/testimony_face_1.jpg"
								style="border-radius: 50%" />
							<div class="client_detail">
								<h3>John</h3>
								<p class="custom_heading-text">One of the best experience
									that I've ever had. The teaching quality is beyond excellent.
									Lessons are well structured and everyday at The Dance Company
									brings joy to my life. My dance technique improves
									significantly within just two months. Highly recommend this
									place.</p>
							</div>
						</div>
					</div>
					<div class="carousel-item">
						<div class="client_container layout_padding2">
							<img class="d-block" src="images/testimony_face_2.jpg"
								style="border-radius: 50%" />
							<div class="client_detail">
								<h3>Anna</h3>
								<p class="custom_heading-text">The Dance Company is the best
									place to experience world-class teaching quality and
									facilities. My journey starts with no skills and techniques on
									jazz dance. After just 6 months my skill has increased
									significantly.</p>
							</div>
						</div>
					</div>
				</div>
				<button class="carousel-control-prev" type="button"
					data-bs-target="#carouselControls" data-bs-slide="prev">
					<span class="carousel-control-prev-icon" aria-hidden="true"></span>
					<span class="visually-hidden">Previous</span>
				</button>
				<button class="carousel-control-next" type="button"
					data-bs-target="#carouselControls" data-bs-slide="next">
					<span class="carousel-control-next-icon" aria-hidden="true"></span>
					<span class="visually-hidden">Next</span>
				</button>
			</div>
		</div>
	</div>
</section>
<!-- end client section -->

<!-- map section -->
<section class="map_section">
	<div id="map" class="h-100 w-100"></div>
</section>

<!-- Link -->
<section class="m-5">
	<div class="container">
		<div class="row">
			<div class="col-md-3">
				<h5>Fruits</h5>
				<ul>
					<li>randomised</li>
					<li>words which</li>
					<li>don't look even</li>
					<li>slightly</li>
					<li>believable. If you</li>
					<li>are going to use</li>
					<li>a passage of</li>
					<li>Lorem Ipsum,</li>
				</ul>
			</div>
			<div class="col-md-3">
				<h5>Services</h5>
				<ul>
					<li>randomised</li>
					<li>words which</li>
					<li>don't look even</li>
					<li>slightly</li>
					<li>believable. If you</li>
					<li>are going to use</li>
					<li>a passage of</li>
					<li>Lorem Ipsum,</li>
				</ul>
			</div>
			<div class="col-md-3">
				<h5>List</h5>
				<ul>
					<li>randomised</li>
					<li>words which</li>
					<li>don't look even</li>
					<li>slightly</li>
					<li>believable. If you</li>
					<li>are going to use</li>
					<li>a passage of</li>
					<li>Lorem Ipsum,</li>
				</ul>
			</div>
			<div class="col-md-3">
				<div class="social_container">
					<h5>Follow Us</h5>
					<div class="social-box">
						<a href=""> <img src="images/fb.png" alt="" />
						</a> <a href=""> <img src="images/twitter.png" alt="" />
						</a> <a href=""> <img src="images/linkedin.png" alt="" />
						</a> <a href=""> <img src="images/instagram.png" alt="" />
						</a>
					</div>
				</div>
				<div class="subscribe_container">
					<h5>Subscribe Now</h5>
					<div class="form_container">
						<form action="">
							<input type="email" />
							<button type="submit">Subscribe</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>

<!-- Footer -->
<footer class="container-fluid text-center bg-dark p-3">
	<p class="text-white m-0">
		Copyright &copy; 2022. All Rights Reserved By <b>The Dance Company</b>
	</p>
</footer>

<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
	crossorigin="anonymous"></script>
</body>
</html>
