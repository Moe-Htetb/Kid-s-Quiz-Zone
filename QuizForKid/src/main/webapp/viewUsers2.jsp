<%@page import="com.demo.dao.UserDao"%>
<%@ page import="java.util.List"%>
<%@ page import="com.demo.model.User"%>
<%@ include file="./assets/layout/header.jsp"%>
<%@ include file="./assets/layout/nav.jsp"%>

<style>
body {
	font-family: Arial, sans-serif;
	margin: 20px;
}

table {
	width: 100%;
	border-collapse: collapse;
}

th, td {
	padding: 10px;
	border: 1px solid #ddd;
	text-align: left;
}

th {
	background-color: #f2f2f2;
}

.message {
	color: green;
}
</style>

	<h1>User List</h1>

	<%
	UserDao dao = new UserDao();
	// Retrieve the list of users from the request
	List<User> users = dao.getAllUsers();
	//  String message = (String) request.getAttribute("message");

	// Display any message passed from the servlet
	if (users.size() <= 0) {
	%>
	<p class="message">There is no user</p>
	<%
	} else {
	%>

	<table>
		<tr>
			<th>ID</th>
			<th>Name</th>
			<th>Email</th>
		</tr>
		<%
		// Check if users list is not null and has elements

		for (User user : users) {
		%>
		<tr>
			<td><%=user.getUserid()%></td>
			<td><%=user.getName()%></td>
			<td><%=user.getEmail()%></td>
		</tr>
		<%
		}
		%>


	</table>
	<%
	}
	%>
	<br>
	<a href="admin.jsp">Go Back to Dash Board</a>
<%@ include file="./assets/layout/footer.jsp"%>
