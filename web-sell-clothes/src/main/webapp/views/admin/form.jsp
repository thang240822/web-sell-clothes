<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<form:form action="/acc/list" modelAttribute="item">

	<form:input path="username" placeholder="Username?" />
	<form:input path="password" placeholder="Password?" />
	<hr>
	<button formaction="/acc/create">Create</button>
	<button formaction="/acc/update">Update</button>
	<button formaction="/acc/delete/${item.username}">Delete</button>
	<button formaction="/acc/list">Reset</button>

</form:form>