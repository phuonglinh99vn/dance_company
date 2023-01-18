<%-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%> --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags"%>

<t:template title="The Dance Company">
	<jsp:attribute name="header">
		<link rel="stylesheet" href="http://localhost:8080/dance_company/css/index.css" type="text/css" />
	</jsp:attribute>

	<jsp:attribute name="body">
<!-- Main Carousel -->
	<header class="mb-5">
		<div id="carouselExampleIndicators" class="carousel slide carousel-fade" data-bs-ride="true">
			<div class="carousel-indicators">
				<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
				<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
				<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
			</div>
			<div class="carousel-inner">
				<div class="carousel-item active">
					<img src="images/carousel_slide_1.jpg" class="d-block w-100" alt="Slide 1">
				</div>
				<div class="carousel-item">
					<img src="images/carousel_slide_2.jpg" class="d-block w-100" alt="Slide 2">
				</div>
				<div class="carousel-item">
					<img src="images/carousel_slide_3.jpg" class="d-block w-100" alt="Slide 3">
				</div>
			</div>
			<button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Previous</span>
			</button>
			<button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Next</span>
			</button>
		</div>
	</header>

	<!-- Level Section -->
	<section class="text-white mt-100 mb-100">
		<div class="level-section container p-5">
			<h1 class="mb-3 fw-bold fs-1">Step-by-Step Learning for All
				Levels</h1>
			<p class="mb-5 fs-4">Whether you're just starting out or you've
				got some training under your belt - we got you covered.</p>
			<div class="row">
				<div class="col-3">
					<div class="card level-card bg-warning">
						<div class="card-body level-card-body brand-new">
							<h5 class="fw-bold fs-3">BRAND NEW</h5>
						</div>
						<div class="card-body bg-warning level-card-face">
							<p class="card-text" style="margin-top: 4em;">Got two left
								feet? Start with our 10-day intro program.</p>
						</div>
					</div>
				</div>
				<div class="col-3">
					<div class="card level-card bg-danger">
						<div class="card-body level-card-body beginner">
							<h5 class="fw-bold fs-3 mb-4">BEGINNER</h5>
						</div>
						<div class="card-body bg-danger level-card-face">
							<p class="card-text" style="margin-top: 4em;">Got the basics
								down? Level up with new moves and routines.</p>
						</div>
					</div>
				</div>
				<div class="col-3">
					<div class="card level-card bg-info">
						<div class="card-body level-card-body intermediate">
							<h5 class="fw-bold fs-3 mb-4">INTERMEDIATE</h5>
						</div>
						<div class="card-body bg-info level-card-face">
							<p class="card-text" style="margin-top: 4em;">Feel pretty
								confident? Learn more challenging skills and pieces.</p>
						</div>
					</div>
				</div>
				<div class="col-3">
					<div class="card level-card bg-success">
						<div class="card-body level-card-body advanced">
							<h5 class="fw-bold fs-3 mb-4">ADVANCED</h5>
						</div>
						<div class="card-body bg-success level-card-face">
							<p class="card-text" style="margin-top: 4em;">Already killin'
								it? Train with the top choreographers in the game.</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	
	<!-- Dance Styles section -->
	<section class="text-white mt-100 mb-100">
		<div class="container">
			<div class="mb-5">
				<h1 class="fw-bold fs-1">Learn A Variety Of Dance Styles</h1>
			</div>
			<div class="row mb-3">
				<div class="col-3 d-flex flex-column ">
					<div class="style-image">
						<img class="rounded w-100" src="images/dance-style-hiphop.jpg" alt="Hip hop" />
					</div>
					<h5 class="text-center mt-2">Hip Hop</h5>
				</div>
				<div class="col-3 d-flex flex-column">
					<div class="style-image">
						<img class="rounded w-100" src="images/dance-style-contemporary.jpg" alt="Contemporary" />
					</div>
					<h5 class="text-center mt-2">Contemporary</h5>
				</div>
				<div class="col-3 d-flex flex-column">
					<div class="style-image">
						<img class="rounded w-100" src="images/dance-style-reggaeton.jpg" alt="Reggaeton" />
					</div>
					<h5 class="text-center mt-2">Reggaeton</h5>
				</div>
				<div class="col-3 d-flex flex-column">
					<div class="style-image">
						<img class="rounded w-100" src="images/dance-style-kpop.jpg" alt="K-pop" />
					</div>
					<h5 class="text-center mt-2">K-Pop</h5>
				</div>
			</div>
			<div class="row mb-3">
				<div class="col-3 d-flex flex-column ">
					<div class="style-image">
						<img class="rounded w-100" src="images/dance-style-ballet.jpg" alt="Ballet" />
					</div>
					<h5 class="text-center mt-2">Ballet</h5>
				</div>
				<div class="col-3 d-flex flex-column">
					<div class="style-image">
						<img class="rounded w-100" src="images/dance-style-salsa.jpg" alt="Salsa" />
					</div>
					<h5 class="text-center mt-2">Salsa</h5>
				</div>
				<div class="col-3 d-flex flex-column">
					<div class="style-image">
						<img class="rounded w-100" src="images/dance-style-popping.jpg" alt="Popping" />
					</div>
					<h5 class="text-center mt-2">Popping</h5>
				</div>
				<div class="col-3 d-flex flex-column">
					<div class="style-image">
						<img class="rounded w-100" src="images/dance-style-jazz.jpg" alt="Jazz" />
					</div>
					<h5 class="text-center mt-2">Jazz</h5>
				</div>
			</div>
			<div class="row mb-3">
				<div class="col-3 d-flex flex-column ">
					<div class="style-image">
						<img class="rounded w-100" src="images/dance-style-tap-dance.jpg" alt="Tap Dance" />
					</div>
					<h5 class="text-center mt-2">Tap Dance</h5>
				</div>
				<div class="col-3 d-flex flex-column">
					<div class="style-image">
						<img class="rounded w-100" src="images/dance-style-ballroom.jpg" alt="Ballroom" />
					</div>
					<h5 class="text-center mt-2">Ballroom</h5>
				</div>
				<div class="col-3 d-flex flex-column">
					<div class="style-image">
						<img class="rounded w-100" src="images/dance-style-walz.jpg" alt="Walz" />
					</div>
					<h5 class="text-center mt-2">Waltz</h5>
				</div>
				<div class="col-3 d-flex flex-column">
					<div class="style-image">
						<img class="rounded w-100" src="images/dance-style-tango.jpg" alt="Tango" />
					</div>
					<h5 class="text-center mt-2">Tango</h5>
				</div>
			</div>
		</div>
	</section>

	<!-- Testamony section -->
	<section class="mb-100" style="background-color: #000">
		<div class="container text-white text-center">
			<h2 class="fs-1 fw-bold">Testimonial</h2>
			<p class="fs-3">See what our students say about the courses</p>
			<div>
				<div id="carouselControls" class="carousel slide" data-bs-ride="carousel">
					<div class="carousel-inner">
						<div class="carousel-item active">
							<img class="m-3" src="images/testimony_face_1.jpg" style="border-radius: 50%; width: 30rem" />
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
						<div class="carousel-item">
							<img class="m-3" src="images/testimony_face_2.jpg" style="border-radius: 50%; width: 30rem" />
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
					<button class="carousel-control-prev" type="button" data-bs-target="#carouselControls" data-bs-slide="prev">
						<span class="carousel-control-prev-icon" aria-hidden="true"></span>
						<span class="visually-hidden">Previous</span>
					</button>
					<button class="carousel-control-next" type="button" data-bs-target="#carouselControls" data-bs-slide="next">
						<span class="carousel-control-next-icon" aria-hidden="true"></span>
						<span class="visually-hidden">Next</span>
					</button>
				</div>
			</div>
		</div>
	</section>
</jsp:attribute>
</t:template>
