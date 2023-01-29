<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="dropdown">
	<c:if test="${sessionScope.name == null}">
		<a class="btn btn-primary dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"> <i class="fa-solid fa-user"></i>
		</a>
		<ul class="dropdown-menu">
			<li><a href="#loginModal" class="dropdown-item" data-bs-toggle="modal">Log In</a></li>
			<li><a href="#signupModal" class="dropdown-item" data-bs-toggle="modal">Sign Up</a></li>
		</ul>
		<jsp:include page="/modules/login.jsp" />
		<jsp:include page="/modules/register.jsp" />
	</c:if>
	<c:if test="${sessionScope.name != null}">
		<a class="btn btn-danger dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"> <i class="fa-solid fa-user me-2"></i> <span>Hi, ${sessionScope.name}</span>
		</a>
		<ul class="dropdown-menu">
			<li><a class="dropdown-item" href="/dance_company/OrderServlet?action=view_timetable">My Classes</a></li>
			<li><a class="dropdown-item" href="LogoutServlet">Log Out</a></li>
		</ul>
	</c:if>
</div>