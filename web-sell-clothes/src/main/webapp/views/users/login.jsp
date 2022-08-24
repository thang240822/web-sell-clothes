<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>LOGIN</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
</head>
<body>
<style>
	body{
		background-image: url("/views/uploads/images/bg.png");
		background-size: cover;
	}
  .btn-login {
    font-size: 0.9rem;
    letter-spacing: 0.05rem;
    padding: 0.75rem 1rem;
  }
  
  .btn-google {
    color: white !important;
    background-color: #ea4335;
  }
  
  .btn-facebook {
    color: white !important;
    background-color: #3b5998;
  }
 .login{
   margin-left: 300px;
   margin-top: 150px;
 
  width: 100%;
 }

 .abcRioButton {
        width: 200px !important;
        text-align: center;
      
    }

    .abcRioButtonBlue {
        width: 350px !important;
        margin-left: -18px;
    }

     .abcRioButtonContentWrapper {
        width: 350px !important;
    } 



</style>
    <div class="row login">
      <div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
        <div class="card border-0 shadow rounded-10 my-5">
          <div class="card-body p-4 p-sm-5">
            <h5 class="card-title  mb-3 fw-light fs-5" ><b>LOGIN</b></h5>
            <form action="/index" method="post">
              <div class="form-floating mb-3">
                <label for="floatingInput">Username</label>              
                <input type="text" class="form-control"  name="username" placeholder="username">              
              </div>       
              <div class="form-floating mb-3">
                <label for="floatingPassword">Password</label>
                <input type="password" class="form-control" name="password" placeholder="password">
               
              </div>

              <div class="form-check mb-3">
                <input class="form-check-input" type="checkbox" value="" id="rememberPasswordCheck">
                <label class="form-check-label" for="rememberPasswordCheck">
                  Keep me logged in
                </label>
              </div>
              <div class= "text-center">
                <button class="btn btn-primary w-100" type="submit">LOGIN
                  </button>
              </div>
              <br>
              <p class="text-center"><i>Don't have an account? <b><a href="/Register">Register</a></b> </i></p>
               <p class="text-center"><a href="/ForgotPassword">Forgot password</a></p>
               <div class=" mb-2 text-center " >
               
              </div> 
            
            </form>
          </div>
        </div>
      </div>
    </div>
  
  
  
  
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.min.js"></script>
</body>
</html>