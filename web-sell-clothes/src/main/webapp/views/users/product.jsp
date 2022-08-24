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
			<div class="container py-5">
				<div class="row">

					<div class="col-lg-3">
						<h1 class="h2 pb-4">Categories</h1>
						<c:forEach var="item" items="${lstCategory}">
							<ul class="list-unstyled ">
								<li class="pb-3">
									<a class=" d-flex justify-content-between  text-decoration-none" href="/products/${item.id }"> ${item.name}</a>
								</li>
							</ul>
						</c:forEach>
					</div>

					<div class="col-lg-9">

						<div class="row">
							<c:forEach var="item" items="${page.content}">
								<div class="col-md-4 ">
									<div class="card mb-4 product-wap rounded-0">
										<div class="card rounded-0 mb-4 product-wap ">
											<a href="/products/productInfomation/${item.id}">
												<img class="card-img rounded-0 img-fluid" src="${pageContext.request.contextPath}/views/uploads/products/${item.image}">
											</a>
											<div class="card-img-overlay rounded-0 product-overlay d-flex align-items-center justify-content-center">
												<ul class="list-unstyled">
													<li>
														<a class="btn btn-success text-white" href="shop-single.html">
															<i class="far fa-heart"></i>
														</a>
													</li>
													<li>
														<a class="btn btn-success text-white mt-2" href="shop-single.html">
															<i class="far fa-eye"></i>
														</a>
													</li>
													<li>
														<a class="btn btn-success text-white mt-2" href="/products/productInfomation/${item.id}">
															<i class="fas fa-cart-plus"></i>
														</a>
													</li>
												</ul>
											</div>
										</div>
										<div class="card-body">
											<a href="shop-single.html" class="h3 text-decoration-none">${item.name}</a>
											<ul class="w-100 list-unstyled d-flex justify-content-between mb-0">
												<li>M/L/X/XL</li>
												<li class="pt-2">
													<span class="product-color-dot color-dot-red float-left rounded-circle ml-1"></span> <span class="product-color-dot color-dot-blue float-left rounded-circle ml-1"></span> <span class="product-color-dot color-dot-black float-left rounded-circle ml-1"></span> <span class="product-color-dot color-dot-light float-left rounded-circle ml-1"></span> <span class="product-color-dot color-dot-green float-left rounded-circle ml-1"></span>
												</li>
											</ul>
											<ul class="list-unstyled d-flex justify-content-center mb-1">
												<li>
													<i class="text-warning fa fa-star"></i> <i class="text-warning fa fa-star"></i> <i class="text-warning fa fa-star"></i> <i class="text-muted fa fa-star"></i> <i class="text-muted fa fa-star"></i>
												</li>
											</ul>
											<p class="text-center mb-0">$ ${item.price}</p>
										</div>
									</div>
								</div>
							</c:forEach>

						</div>
						<div div="row">
							<ul class="pagination pagination-lg justify-content-end">
								<li class="page-item disabled">
									<a class="page-link active rounded-0 mr-3 shadow-sm border-top-0 border-left-0" href="/products?p=0" tabindex="-1">1</a>
								</li>
								<li class="page-item">
									<a class="page-link rounded-0 mr-3 shadow-sm border-top-0 border-left-0 text-dark" href="/products?p=1">2</a>
								</li>
								<li class="page-item">
									<a class="page-link rounded-0 shadow-sm border-top-0 border-left-0 text-dark" href="/products?p=2">3</a>
								</li>
							</ul>
						</div>
					</div>

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