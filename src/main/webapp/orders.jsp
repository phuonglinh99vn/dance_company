<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags"%>
<t:template title="The Dance Company">
	<jsp:attribute name="header">
		<style>
			.row:hover {
				background-color: #735F32;
				opacity: 0.8;
			}
			hr {
				margin: 0;
			}
		</style>
	</jsp:attribute>
	
	<jsp:attribute name="body">
	<section class="container text-white mb-5 mt-5 vh-100">
		<h1 class="text-center text-bold mb-5">Orders</h1>
		<hr>
			<table class="table table-dark table-hover text-center">
				<thead>
					<tr class="table-active">
						<th>ORDER ID</th>
						<th>USER ID</th>
						<th>USER NAME</th>
						<th>DATE SUBMITTED</th>
						<th>ACTION</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="order" items="${orders}">
						<tr class="">
							<td><c:out value="${order.id}" /></td>
							<td><c:out value="${order.userId}" /></td>
							<td><c:out value="${order.userName}" /></td>
							<td><c:out value="${order.submitDate}" /></td>
							<td><a class="btn btn-primary" href="OrderBOServlet?action=orderdetails&id=${order.id}">View
										Details</a>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		<hr>	
		
	</section>
</jsp:attribute>
</t:template>