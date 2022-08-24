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
			<div class="card">
				<div class="row">
					<div class="col-7 text-center">
						<img src="${pageContext.request.contextPath}/views/uploads/products/${photo}" class="img-fluid" alt="" />
					</div>
					<div class="col-5 pl-5">
						<div>
							<h3>${product.name}</h3>
							<p>${product.price}</p>
							<p>
								<span>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Amet veritatis illo molestias recusandae maiores impedit sint fuga optio deserunt suscipit in magni odit molestiae possimus quod! Doloribus tempora voluptatibus. Earum.</span>
								<span>Esse excepturi modi temporibus eligendi vero fugiat obcaecati illo quia non vel maxime voluptate sapiente incidunt reprehenderit asperiores laborum nisi nostrum ipsam magni ea minima facilis officia autem harum odit!</span>
								<span>Itaque nulla quaerat unde architecto ipsa recusandae molestias suscipit excepturi consequatur id! Distinctio dicta perferendis eaque error iure quo enim iusto veritatis dolores cupiditate nihil doloremque nulla accusamus sit sequi.</span>
							</p>
						</div>
						
					</div>
					<form action="/products/cartItem" method="get">
						<input type="text" value="${product.id}" name="productId" hidden />
						<button class="btn btn-info">Add to Cart</button>
					</form>
				</div>
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