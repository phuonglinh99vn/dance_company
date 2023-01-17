<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags"%>

<t:template title="The Dance Company">
	<jsp:attribute name="body">
	
	<section class="container">
		<h1 class="text-center text-white mb-5 mt-5">My Cart</h1>
	
	<%-- <table width="75%" border="1">
		
			<c:forEach var="cartItem" items="${sessionScope.cart }">
				<li>${cartItem.name}
				
				
				<li>
				
				
				
				<li>${cartItem.teacher}
				
				
				<li>
				
				
				
				<li>${cartItem.level}
				
				
				<li>
				
				
				
				<li>${cartItem.time}
				
				
				<li>
				<a href="CartServlet?action=remove&id=${cartItem.id}">Remove</a>
			
			
			
			</c:forEach>
			<tr>
				<td colspan="2"></td>
				<td></td>
			</tr>
	</table>
	<input type="button" value="Submit Cart"
			href="CartServlet?action=submmit_card" /> --%>
			
	<table class="table-info text-white">
  <thead>
    <tr>
      <th scope="col">Class</th>
      <th scope="col">Price</th>
      <th scope="col">Total</th>
      <th scope="col">Handle</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th scope="row">1</th>
      <td>Mark</td>
      <td>Otto</td>
      <td>@mdo</td>
    </tr>
    <tr>
      <th scope="row">2</th>
      <td>Jacob</td>
      <td>Thornton</td>
      <td>@fat</td>
    </tr>
    <tr>
      <th scope="row">3</th>
      <td colspan="2">Larry the Bird</td>
      <td>@twitter</td>
    </tr>
  </tbody>
</table>
	</section>
	

</jsp:attribute>
</t:template>







