<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<!DOCTYPE html>
<html>
<head>
<title>peaceminusone</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" />
<link rel="icon" type="image/png"
	href="views/uploads/images/GDicon2.ico" />





<link rel="stylesheet" href="assets/css/bootstrap.min.css">
<link rel="stylesheet" href="assets/css/templatemo.css">
<link rel="stylesheet" href="assets/css/custom.css">

<!-- Load fonts style after rendering the layout styles -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">
<link rel="stylesheet" href="assets/css/fontawesome.min.css">
<style type="text/css">
.center(text-align: center;)

</style>
</head>
<body>
	<!-- ${pageContext.request.contextPath} -->
	<div class="">

		<!-- ------------------------------------------------ -->
		<nav>
			<%@include file="header.jsp"%>
		</nav>
		<!-- ------------------------------------------------ -->
		<div class="center" style="text-align: center">
		<h3>ACCOUNT MANAGEMENT</h3>
		<jsp:include page="form.jsp" />
		</div>
		<hr>
		<jsp:include page="table.jsp" />
		<!-- ------------------------------------------------ -->
		<%@include file="footer.jsp"%>
	</div>
	<script src="assets/js/jquery-1.11.0.min.js"></script>
	<script src="assets/js/jquery-migrate-1.2.1.min.js"></script>
	<script src="assets/js/bootstrap.bundle.min.js"></script>
	<script src="assets/js/templatemo.js"></script>
	<script src="assets/js/custom.js"></script>
	<script>
		$('.carousel').carousel({
			interval : 2000
		})
	</script>
</body>
</html>