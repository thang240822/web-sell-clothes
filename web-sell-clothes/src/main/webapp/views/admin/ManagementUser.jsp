<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<div class="container">
	<div class="card">
		<form action="/ManagementAccount" method="post" enctype="multipart/form-data">
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
							<label for="username">Username</label> <input type="text" name="username" value="${account.username}" id="username" class="form-control" />
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
						<div class="form-group row">
							<div class="col-2">Active:</div>
							<div class="col-10 pl-4">
								<input type="checkbox" name="activated" value="userChecked" ${ (account.activated != null ) && (account.activated) ? 'checked' : ' ' } class="form-check-input alight-top">
							</div>
						</div>
						<div class="form-group row">
							<div class="col-2">Role:</div>
							<div class="col-10">
								<div class="form-check-inline">
									<label class="form-check-label"> <input type="radio" ${ account.admin ? 'checked' : '' } name="admin" value="true" class="form-check-input" /> Admin
									</label>
								</div>
								<div class="form-check-inline">
									<label class="form-check-label"> <input type="radio" ${ account.admin ? '' : 'checked' } name="admin" value="false" class="form-check-input" /> User
									</label>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="card-footer text-center">
				<button class="btn btn-info" formaction="/ManagementAccount/create">Add</button>
				<button class="btn btn-warning" formaction="/ManagementAccount/create">Update</button>
				<a class="btn btn-danger" href="/ManagementAccount/delete/${account.username}">Delete</a>
				 <a class="btn btn-success" href="/ManagementAccount">Reset</a>
			</div>
		</form>
	</div>

</div>
	<!-- table -->
	
		<div class="card-header text-center">
			<h3>User List</h3>
		</div>
		<div class="card-body">
			<table class="table table-bordered table-hover">
				<thead>
					<tr class="text-center">
						<th scope="col" class="font-weight-bold">Image</th>
						<th scope="col" class="font-weight-bold">User name</th>
						<th scope="col" class="font-weight-bold">Password</th>
						<th scope="col" class="font-weight-bold">Full name</th>
						<th scope="col" class="font-weight-bold">Email</th>
						<th scope="col" class="font-weight-bold">Activated</th>
						<th scope="col" class="font-weight-bold">Admin</th>
						<th scope="col" class="font-weight-bold">Edit</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="item" items="${lstAccount}">
						<tr>
							<th><img src="${pageContext.request.contextPath}/views/uploads/users/${item.photo}" alt="" style="width: 150px; height: 200px;" /></th>
							<td>${item.username}</td>
							<td>${item.password}</td>
							<td>${item.fullname}</td>
							<td>${item.email}</td>
							<td>${item.activated? 'YES' : 'NO'}</td>
							<td>${item.admin ? 'YES' : 'NO'}</td>
							<td>
							<a href="/ManagementAccount/edit/${item.username}" class="btn btn-warning w-100">Edit</a>
							<a  href="/ManagementAccount/delete/${item.username}" class="btn btn-danger w-100 mt-2">Delete</a>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div class="card-footer"></div>
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
	