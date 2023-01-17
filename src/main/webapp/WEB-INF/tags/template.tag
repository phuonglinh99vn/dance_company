<!DOCTYPE html>
<%@tag description="Template" pageEncoding="UTF-8"%>
<%@attribute name="title"%>
<%@attribute name="header" fragment="true"%>
<%@attribute name="body" fragment="true"%>

<html>
<head>
<title>${title}</title>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<!-- Bootstrap 5.2 -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<!-- fonts style -->
<link href="https://fonts.cdnfonts.com/css/poppins" rel="stylesheet">
<!-- Helper Stylesheet -->
<link rel="stylesheet"
	href="http://localhost:8080/dance_company/css/helper.css"
	type="text/css" />
<jsp:invoke fragment="header" />
</head>
<body>
	<jsp:include page="/modules/navbar.jsp" />
	<jsp:invoke fragment="body" />
	<jsp:include page="/modules/footer.jsp" />
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous"></script>
	<script src="https://kit.fontawesome.com/29032ae126.js"
		crossorigin="anonymous"></script>
</body>
</html>
