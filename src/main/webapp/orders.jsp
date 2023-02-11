<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
							<div class="card-body d-flex flex-column">
							<div class="col-3"><span>user Id: ${order.userId}</span>
								<div class="col-3"><span>Date submitted: ${order.submitDate}</span>							
								<div class="mt-auto flex-row justify-content-between">
									<%-- <a class="btn btn-dark text-right" href="add-to-cart?id=<%=p.getId()%>">View Details</a>  --%>
									<a class="btn btn-primary" href="OrderBOServlet?action=orderdetails&id=${order.id}">View
										Details</a>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
</body>
</html>