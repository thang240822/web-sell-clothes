<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<div class="container">
	<div class="card">
		<form action="/ManagementProduct" method="post" enctype="multipart/form-data">
			<div class="card-header text-center">
				<h3>Product Management</h3>
				<h3>${successCreate}</h3>
			</div>
			<div class="card-body">
				<div class="row">
					<div class="col-4">
						<c:if test="${photos != null }">
							<img id="myID" src="${pageContext.request.contextPath}/views/uploads/products/${photos}" alt="" style="width: 300px; height: 300px" />
						</c:if>
						<c:if test="${ photos == null}">
							<img id="myID" src="${pageContext.request.contextPath}/views/uploads/products/default-image.jpg" alt="" style="width: 300px; height: 300px" />
						</c:if>
						<div class="form-group mt-3">
							<div class="input-group mt-3">
								<div class="input-group-prepend">
									<span class="input-group-text bg-primary text-light" id="inputGroupFileAddon01">Upload</span>
								</div>
								<div class="custom-file">
									<input type="file" name="image" onchange="onFileSelected(event)" class="custom-file-input" id="inputGroupFile01" aria-describedby="inputGroupFileAddon01"> <label class="custom-file-label" for="inputGroupFile01">Choose file</label>
								</div>
							</div>
						</div>
					</div>
					<div class="col-8">
						<div class="form-group">
							<label for="name">Product Name</label> <input type="text" name="name" value="${product.name}" id="name" class="form-control" />
						</div>
						<div class="form-group">
							<label for="price">Price</label> <input type="text" name="price" value="${product.price}" id="price" class="form-control" />
						</div>
						<div class="form-group">
							<label for="createDate">Create Date</label> <input type="date" name="createDate" value="${product.createDate}" id="createDate" class="form-control" />
						</div>
						<div class="form-group row">
							<div class="col-2">Available :</div>
							<div class="col-10 pl-4">
								<input type="checkbox" name="available" value="available" ${ (product.available != null ) && (product.available) ? 'checked' : ' ' } class="form-check-input alight-top">
							</div>
						</div>
						<div class="form-group row">
							<label for="exampleFormControlSelect1" class="col-2 mt-2">Category </label> <select class="form-control  col-10" id="exampleFormControlSelect1" name="categoryId">
								<c:forEach var="item" items="${lstCategory}">
									<option class="" value="${item.id}" ${item.id == isChoose ? 'selected' : ' ' }>${item.name}</option>
								</c:forEach>
							</select>
						</div>
					</div>
				</div>
			</div>
			<div class="card-footer text-center">
				<button class="btn btn-info" formaction="/ManagementProduct/create">Add</button>
				<button class="btn btn-warning" formaction="/ManagementProduct/update/${product.id}">Update</button>
				<a class="btn btn-danger" href="/ManagementProduct/delete/${product.id}">Delete</a> <a class="btn btn-success" href="/ManagementProduct">Reset</a>
			</div>
		</form>
	</div>

</div>
<!-- table -->

<div class="card-header text-center">
	<h3>Product List</h3>
</div>
<div class="card-body">
<div class="row">
	<div class="col-8"></div>
	<div class="col-4">
		<form action="/ManagementProduct" method="get">
			<input type="text" name="keyworks" value="${keyworks}" />
			<button class="btn btn-danger">Search</button>
		</form>
	</div>
</div>

	<table class="table table-bordered table-hover">
		<thead>
			<tr class="text-center">
				<th scope="col" class="font-weight-bold">Image</th>
				<th scope="col" class="font-weight-bold">Product name</th>
				<th scope="col" class="font-weight-bold">Price</th>
				<th scope="col" class="font-weight-bold">Create Date</th>
				<th scope="col" class="font-weight-bold">Available</th>

				<th scope="col" class="font-weight-bold">Edit</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="item" items="${page.content}">
				<tr>
					<th><img src="${pageContext.request.contextPath}/views/uploads/products/${item.image}" alt="" style="width: 150px; height: 200px;" /></th>
					<td>${item.name}</td>
					<td>${item.price}</td>
					<td>${item.createDate}</td>
					<td>${item.available? 'YES' : 'NO'}</td>

					<td><a href="/ManagementProduct/edit/${item.id}" class="btn btn-warning w-100">Edit</a> 
					<a href="/ManagementProduct/delete/${item.id}" class="btn btn-danger w-100 mt-2">Delete</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div class="text-center mt-5 mb-3">
		<a href="/ManagementProduct?p=0" class="btn btn-info"></a>
		<a href="/ManagementProduct?p=${page.number-1}" class="btn btn-info"></a>
		<a href="/ManagementProduct?p=${page.number+1}" class="btn btn-info"></a>
		<a href="/ManagementProduct?p=${page.totalPages-1}" class="btn btn-info"></a>
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