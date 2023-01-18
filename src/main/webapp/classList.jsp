<%@page import="connection.DbCon"%>
<%@page import="dance_company.usermanagement.dao.ProductDao"%>
<%@page import="dance_company.usermanagement.model.*"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags"%>

<t:template title="The Dance Company | Class List">
	<jsp:attribute name="body">
<section class="bg-custom-dark pt-3 pb-5 shadow-sm">
		<div class="container">
			<h1 class="card-header text-center text-white mt-5 mb-5 fw-bold">All
				Classes</h1>
			<div class="row">
				<c:forEach var="product" items="${products}">
					<div class="col-xl-3 mb-5">
						<div class="card">
							<img class="card-img-top w-100" style="height: 150px" src="http://localhost:8080/dance_company/images/${product.image}" alt="Card Image" />
							<div class="card-body d-flex flex-column">
								<div class="card-title fw-bold fs-4">${product.name}</div>
								<div class="card-text">Level: ${product.level}</div>
								<div class="mb-4 cart-text">Teacher: ${product.teacher}</div>
								<div class="mt-auto flex-row justify-content-between">
									<%-- <a class="btn btn-dark text-right" href="add-to-cart?id=<%=p.getId()%>">View Details</a>  --%>
									<a class="btn btn-primary" href="detail?id=${product.id}">View
										Details</a>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</section>
</jsp:attribute>
</t:template>
