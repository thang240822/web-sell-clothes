<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<table class="table">
	<thead class="thead-dark">
		<tr>

			<th scope="col">Username</th>
			<th scope="col">Password</th>
			<th scope="col">#</th>
		</tr>
	</thead>
	<c:forEach var="item" items="${items}">
	<tbody>
		<tr>
			<td>${item.username}</td>
			<td>${item.password}</td>
			<td><a href="/acc/edit/${item.username}">Edit</a></td>


		</tr>
	</tbody>
		</c:forEach>
</table>