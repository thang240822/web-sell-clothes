<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" />
<link rel="icon" type="image/png" href="views/uploads/images/GDicon2.ico" />

<link rel="stylesheet" href="assets/css/bootstrap.min.css">
<link rel="stylesheet" href="assets/css/templatemo.css">
<link rel="stylesheet" href="assets/css/custom.css">

<!-- Load fonts style after rendering the layout styles -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">
<link rel="stylesheet" href="assets/css/fontawesome.min.css">
</head>
<body>
	<!-- ${pageContext.request.contextPath} -->
	<div class="">

		<!-- ------------------------------------------------ -->
		<nav>
			<%@include file="header.jsp"%>
		</nav>
		<!-- ------------------------------------------------ -->
		<main>
			<div class="card-header text-center">
	<h3>Product List</h3>
</div>
<div class="card-body">


	<table class="table table-bordered table-hover">
		<thead>
			<tr class="text-center">
				<th scope="col" class="font-weight-bold">Image</th>
				<th scope="col" class="font-weight-bold">Product name</th>
				<th scope="col" class="font-weight-bold">Price</th>
				<th scope="col" class="font-weight-bold">Quantity</th>				
				<th scope="col" class="font-weight-bold">Edit</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="item" items="${lstCart}">
				<tr>
					<th><img src="${pageContext.request.contextPath}/views/uploads/products/${item.image}" alt="" style="width: 150px; height: 200px;" /></th>
					<td>${item.name}</td>
					<td>${item.price}</td>
					<td>${item.quantity}</td>
				

					<td>
					<a href="#" class="btn btn-danger w-100 mt-2">Delete</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>

</div>
		</main>
		<!-- ------------------------------------------------ -->
		<%@include file="footer.jsp"%>
	</div>
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.min.js"></script>
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