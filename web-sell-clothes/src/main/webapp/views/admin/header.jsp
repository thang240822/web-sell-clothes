<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<script>
	$(document).ready(function() {
		$("a[href*=lang]").on("click", function() {
			var param = $(this).attr("href");
			$.ajax({
				url : "/home/index" + param,
				success : function() {
					location.reload();
				}
			});
			return false;
		})
	})
</script>
<!-- Start Top Nav -->
<nav class="navbar navbar-expand-lg bg-dark navbar-light d-none d-lg-block" id="templatemo_nav_top">
	<div class="container text-light">
		<div class="w-100 d-flex justify-content-between">
			<div>
				<i class="fa fa-envelope mx-2"></i> <a class="navbar-sm-brand text-light text-decoration-none" href="mailto:info@company.com">godedoc@gmail.com</a> <i class="fa fa-phone mx-2"></i> <a class="navbar-sm-brand text-light text-decoration-none" href="tel:010-020-0340">010-020-0340</a>
			</div>
			<div>
				<a class="text-light" href="https://fb.com/templatemo" target="_blank" rel="sponsored"><i class="fab fa-facebook-f fa-sm fa-fw me-2"></i></a> <a class="text-light" href="https://www.instagram.com/godedoc" target="_blank"><i class="fab fa-instagram fa-sm fa-fw me-2"></i></a> <a class="text-light" href="https://twitter.com/" target="_blank"><i class="fab fa-twitter fa-sm fa-fw me-2"></i></a> <a class="text-light" href="https://www.linkedin.com/" target="_blank"><i class="fab fa-linkedin fa-sm fa-fw"></i></a>
			</div>
		</div>
	</div>
</nav>
<!-- Close Top Nav -->


<!-- Header -->
<nav class="navbar navbar-expand-lg navbar-light shadow">
	<div class="container d-flex justify-content-between align-items-center">

		<a class="navbar-brand text-success logo h3 align-self-center" href="/index" style="text-decoration: line-through"> PEACEMINUSONE </a>

		<button class="navbar-toggler border-0" type="button" data-bs-toggle="collapse" data-bs-target="#templatemo_main_nav" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="align-self-center collapse navbar-collapse flex-fill  d-lg-flex justify-content-lg-between" id="templatemo_main_nav">
			<div class="flex-fill">
				<ul class="nav navbar-nav d-flex justify-content-between mx-lg-auto">
					<li class="nav-item"><a class="nav-link" href="/index"><s:message code="lo.mn.home"/></a></li>
					<li class="nav-item"><a class="nav-link" href="/about"><s:message code="lo.mn.about"/></a></li>
					<li class="nav-item"><a class="nav-link" href="/products"><s:message code="lo.mn.product"/></a></li>
					<li class="nav-item dropdown"><a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-expanded="false"><s:message code="lo.mn.account"/></a>
						<ul class="dropdown-menu">
							<c:choose>
								<c:when test="${isLogin == 2 }">
									<a class="dropdown-item" href="/logout"><s:message code="lo.mn.logout"/></a>
									<a class="dropdown-item" href="/infomation"><s:message code="lo.mn.infomation"/></a>
									<a class="dropdown-item" href="/products/cardItemInfo"><s:message code="lo.mn.cart"/></a>
									<a class="dropdown-item" href="/user/OrderDetail"><s:message code="lo.mn.orders"/></a>
								</c:when>

								<c:when test="${isLogin == 3 }">
									<a class="dropdown-item" href="/logout">Logout</a>
									<a class="dropdown-item" href="/infomation">Information</a>
									<a class="dropdown-item" href="/products/cardItemInfo">Cart</a>
									<a class="dropdown-item" href="/user/OrderDetail">Orders</a>
									<a class="dropdown-item" href="/admin/index">Admin</a>
								</c:when>

								<c:otherwise>
									<a class="dropdown-item" href="/login/form">Login</a>
									<a class="dropdown-item" href="/Register">Register</a>
								</c:otherwise>
							</c:choose>
						</ul></li>
						<li class="nav-item">
							<a href="?lang=vi" class="mr-3 text-warning nav-link">Tiếng việt</a>
						</li>
						<li class="nav-item">
							<a href="?lang=en" class="text-warning nav-link">English</a>
						</li>
				</ul>
			</div>
			<div class="navbar align-self-center d-flex">
				<div class="d-lg-none flex-sm-fill mt-3 mb-4 col-7 col-sm-auto pr-3">
					<div class="input-group">
						<input type="text" class="form-control" id="inputMobileSearch" placeholder="Search ...">
						<div class="input-group-text">
							<i class="fa fa-fw fa-search"></i>
						</div>
					</div>
				</div>
				<a class="nav-icon d-none d-lg-inline" href="#" data-bs-toggle="modal" data-bs-target="#templatemo_search"> <i class="fa fa-fw fa-search text-dark mr-2"></i>
				</a> <a class="nav-icon position-relative text-decoration-none" href="/products/cardItemInfo"> <i class="fa fa-fw fa-cart-arrow-down text-dark mr-1"></i> <span class="position-absolute top-0 left-100 translate-middle badge rounded-pill bg-light text-dark">7</span>
				</a> <a class="nav-icon position-relative text-decoration-none" href="/infomation"> <i class="fa fa-fw fa-user text-dark mr-3"></i> <span class="position-absolute top-0 left-100 translate-middle badge rounded-pill bg-light text-dark">+99</span>
				</a>
			</div>
		</div>

	</div>
</nav>
<!-- Close Header -->
