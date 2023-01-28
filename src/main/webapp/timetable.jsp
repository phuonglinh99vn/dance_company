<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Timetable</title>
</head>
<body>
 				Timetable</h1>
			<div class="row">
				<c:forEach var="item" items="${timetable}">
					<div class="col-xl-3 mb-5">
						<div class="card">
							<div class="card-body d-flex flex-column">
								<div class="card-title fw-bold fs-4">${item.time}</div>	
								<div class="card-title fw-bold fs-4">${item.name}</div>	
								<div class="card-title fw-bold fs-4">${item.teacher}</div>	
								<div class="card-title fw-bold fs-4">${item.level}</div>	
								<div class="card-title fw-bold fs-4">${item.submitDate}</div>
								<div class="card-title fw-bold fs-4">${item.status}</div>								
								<div class="mt-auto flex-row justify-content-between">
									<a class="btn btn-primary" href="cancelOrder?id=${item.id}">Cancel this class</a>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
</body>
</html>