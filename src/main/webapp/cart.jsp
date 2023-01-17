<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
</head>

<body>
	
	<p>
		<font face="Verdana, Arial, Helvetica, sans-serif"><strong>Shopping
				Cart</strong></font>
	</p>
	<table width="75%" border="1">
		
			<c:forEach var="cartItem" items="${sessionScope.cart }">
				<li>${cartItem.name}<li>
				<li>${cartItem.teacher}<li>
				<li>${cartItem.level}<li>
				<li>${cartItem.time}<li>
				<a href = "CartServlet?action=remove&id=${cartItem.id}">Remove</a>
			</c:forEach>
			<tr>
				<td colspan="2"></td>
				<td></td>
			</tr>
	</table>
	<input type="button" value="Submit Cart" href="CartServlet?action=submmit_card"/>
	
</body>
</html>