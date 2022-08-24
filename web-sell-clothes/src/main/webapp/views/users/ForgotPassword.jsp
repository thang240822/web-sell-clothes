<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<!DOCTYPE html>
<html>
<head>
<title>Forgot Password</title>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
</head>
<body>
	<!-- ${pageContext.request.contextPath} -->
	
	
	<div class="container mt-5">
    <div class="card">
        <div class="card-header text-center bg-danger text-light font-weight-bold">
            <h3>FORGOT PASSWORD</h3>
        </div>
       <div class="card-body">
            <form action="/ForgotPassword" method="POST">
                 <div class="form-group">
                     <Label for="username">Username</Label>
                     <input type="text" name="username" id="username" class="form-control">
                 </div>
                 <div class="form-group">
                     <label for="email">Email</label>
                     <input type="text" name="email" id="email" class="form-control">
                 </div>
                <div class=" form-group text-center">
                     <button class="btn btn-danger">SEND MAIL</button>
                     <a href="/login/form" class="btn btn-primary">LOGIN</a>
                 </div>
            </form>
        </div>
        <div class="card-footer">
            <h3>${messageEmail}</h3>
        </div>
    </div>
</div>
	
	
	
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.min.js"></script>
</body>
</html>