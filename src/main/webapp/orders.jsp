<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
 				Orders</h1>
			<div class="row">
				<c:forEach var="order" items="${orders}">
					<div class="col-xl-3 mb-5">
						<div class="card">
							<img class="card-img-top w-100" style="height: 150px" src="http://localhost:8080/dance_company/images/${product.image}" alt="Card Image" />
							<div class="card-body d-flex flex-column">
								<div class="card-title fw-bold fs-4">${order.submitDate}</div>
								<div class="card-text">Level: ${order.approv}</div>
								<div class="mt-auto flex-row justify-content-between">
									<%-- <a class="btn btn-dark text-right" href="add-to-cart?id=<%=p.getId()%>">View Details</a>  --%>
									<a class="btn btn-primary" href="detail?id=${order.id}">View
										Details</a>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
</body>
</html>