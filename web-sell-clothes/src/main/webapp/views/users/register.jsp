<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<!DOCTYPE html>
<html>
<head>
<title>Register</title>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
</head>
<body>


	<!-- ${pageContext.request.contextPath} -->
	<div class="container" style="margin-top: 50px;">
    
            <div class="row" style="border: 1px darkgrey solid; border-radius: 10px;width: 50%; margin: 0 auto; padding: 20px;" >
                <div class="col-sm-12">
                <h3>Đăng Ký</h3>
           		<h3>${messageRegister}</h3>
                <form  action="/register" method="post" enctype="multipart/form-data" >
                    <div class="form-group">
                        <label for="username">UserName</label>
                        <input type="text" class="form-control" name="username" placeholder="Enter UserName">
                    </div>
                    <div class="form-group">
                        <label for="password">New Password:</label>
                        <input type="password" class="form-control" name="password" placeholder="Enter password">
                    </div>
                     <div class="form-group">
                        <label>Full name :</label>
                        <input type="text" class="form-control" name="fullname" placeholder="Enter Full name">
                    </div>
                      <div class="form-group">
                        <label>Email :</label>
                        <input type="text" class="form-control" name="email" placeholder="Enter Email">
                    </div>
                      
                      
                      
                      <div class="form-group ">
								<div class="input-group mt-3">
									<div class="input-group-prepend">
										<span class="input-group-text bg-primary text-light" id="inputGroupFileAddon01">Upload</span>
									</div>
									<div class="custom-file">
										<input type="file" name="photo" class="custom-file-input" id="inputGroupFile01" aria-describedby="inputGroupFileAddon01">
										<label class="custom-file-label" for="inputGroupFile01">Choose file</label>
									</div>
								</div>
							</div>
                      
                    
                    <div class="checkbox">
                        <label><input type="checkbox"> Remember me</label>
                    </div>
                    
                    <button  type="submit" class="btn btn-primary">Đăng Ký</button>
                    <button type="reset" class="btn btn-primary">Cancel</button>
                    <p style="margin: 10px; font-size: 16px;"><a href="/login/form">Đã có tài khoản?</a></p>                         
                </form>
                ${message}
                </div>
            </div>
        </div>
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.min.js"></script>
</body>
</html>