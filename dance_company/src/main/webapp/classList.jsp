<%@page import="connection.DbCon"%>
<%@page import="dance_company.usermanagement.dao.ProductDao"%>
<%@page import="dance_company.usermanagement.model.*"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%
user auth = (user) request.getSession().getAttribute("auth");
if (auth != null) {
	request.setAttribute("person", auth);
}
ProductDao pd = new ProductDao(DbCon.getConnection());
List<Product> products = pd.getAllProducts();
ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
if (cart_list != null) {
	request.setAttribute("cart_list", cart_list);
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- Bootstrap  -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous" />
<link rel="stylesheet" href="./css/helper.css">
<link href="https://fonts.cdnfonts.com/css/poppins" rel="stylesheet">

<title>E-Commerce Cart</title>

<title>The Dance Company | Book A Class</title>
</head>

<body>
	<jsp:include page="modules/navbar.jsp" />
	<section class="bg-custom-dark pt-3 pb-5 shadow-sm">
		<div class="container">
			<h1 class="card-header text-center text-white mt-5 mb-5 fw-bold">All Classes</h1>
			<div class="row">
				<%
				if (!products.isEmpty()) {
					for (Product p : products) {
				%>
				<div class="col-xl-3 mb-5">
					<div class="card">
						<img class="card-img-top w-100" style="height: 150px"
							src="http://localhost:8080/dance_company/images/<%=p.getImage()%>"
							alt="Card Image" />
						<div class="card-body d-flex flex-column">
							<div class="card-title fw-bold fs-4"><%=p.getName()%></div>
							<div class="card-text">
								Level:
								<%=p.getLevel()%></div>
							<div class="mb-4 cart-text">
								Teacher:
								<%=p.getTeacher()%></div>
							<div class="mt-auto flex-row justify-content-between">
								<%-- <a class="btn btn-dark text-right" href="add-to-cart?id=<%=p.getId()%>">View Details</a>  --%>
								<a class="btn btn-primary" href="detail?id=<%=p.getId()%>">View
									Details</a>
							</div>
						</div>
					</div>
				</div>
				<%
				}
				} else {
				out.println("There are no classes available");
				}
				%>
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