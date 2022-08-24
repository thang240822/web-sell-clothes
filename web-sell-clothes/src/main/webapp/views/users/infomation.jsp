<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>

	<!-- ${pageContext.request.contextPath} -->
	<div class="container">
			<div class="card">
		<form action="/infomation" method="post" enctype="multipart/form-data">
			<div class="card-header text-center">
				<h3>User Management</h3>
				<h3>${successCreate}</h3>
			</div>
			<div class="card-body">
				<div class="row">
					<div class="col-4">
						<c:if test="${photos != null }">
							<img  id="myID" src="${pageContext.request.contextPath}/views/uploads/users/${photos}" alt="" style="width: 300px; height:300px" />
						</c:if>
						<c:if test="${ photos == null}">
							<img id="myID" src="${pageContext.request.contextPath}/views/uploads/users/default-image.jpg" alt="" style="width: 300px; height:300px" />
						</c:if>
						<div class="form-group mt-3">
							<div class="input-group mt-3">
								<div class="input-group-prepend">
									<span class="input-group-text bg-primary text-light" id="inputGroupFileAddon01">Upload</span>
								</div>
								<div class="custom-file">
									<input type="file" name="photo"  onchange="onFileSelected(event)" class="custom-file-input" id="inputGroupFile01" aria-describedby="inputGroupFileAddon01" > <label class="custom-file-label" for="inputGroupFile01" >Choose file</label>
								</div>
							</div>
						</div>
					</div>
					<div class="col-8">
						<div class="form-group">
							<label for="username">Username</label> <input type="text" name="username" readonly="readonly" value="${account.username}" id="username" class="form-control" />
						</div>
						<div class="form-group">
							<label for="password">Password</label> <input type="password" name="password" value="${account.password}" id="password" class="form-control" />
						</div>
						<div class="form-group">
							<label for="fullname">Fullname</label> <input type="text" name="fullname" value="${account.fullname}" id="fullname" class="form-control" />
						</div>
						<div class="form-group">
							<label for="email">Email</label> <input type="text" name="email" value="${account.email}" id="email" class="form-control" />
						</div>
					
						
					</div>
				</div>
			</div>
			<div class="card-footer text-center">
				<button class="btn btn-info" formaction="/infomation/create">Update</button>			
			</div>
		</form>
	</div>
	</div>
	<script>
	function onFileSelected(event) {
		var selectedFile = event.target.files[0];
		var reader = new FileReader();

		var imgtag = document.getElementById("myID");
		console.log(imgtag);
		imgtag.title = selectedFile.name;
		reader.onload = function(event) {
			imgtag.src = event.target.result;
		};
		reader.readAsDataURL(selectedFile);
	}

	
</script>
