<%@page import="com.demo.model.User"%>
<%@page import="com.demo.dao.QuizDao"%>
<%@page import="java.util.List"%>
<%@page import="com.demo.model.Quiz"%>
<%@page import="com.demo.dao.UserDao"%>
<%@page import="java.sql.SQLException"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css"
	rel="stylesheet" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
<link rel="stylesheet" href="styles.css" />
<title>Admin Dashboard</title>
<style>
@import
	url(https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css)
	;

:root {
	--main-bg-color: #009d63;
	--main-text-color: #009d63;
	--second-text-color: #bbbec5;
	--second-bg-color: #c1efde;
}

.primary-text {
	color: var(--main-text-color);
}

.second-text {
	color: var(--second-text-color);
}

.primary-bg {
	background-color: var(--main-bg-color);
}

.secondary-bg {
	background-color: var(--second-bg-color);
}

.rounded-full {
	border-radius: 100%;
}

.navbar-collapse {
	margin-right: 50px;
}

#wrapper {
	overflow-x: hidden;
	background: rgba(104, 101, 101, 0.118);
}

#sidebar-wrapper {
	min-height: 100vh;
	margin-left: -15rem;
	-webkit-transition: margin 0.25s ease-out;
	-moz-transition: margin 0.25s ease-out;
	-o-transition: margin 0.25s ease-out;
	transition: margin 0.25s ease-out;
}

#sidebar-wrapper .sidebar-heading {
	padding: 0.875rem 1.25rem;
	font-size: 1.2rem;
}

#sidebar-wrapper .list-group {
	width: 15rem;
}
/* Table Container */
table {
	width: 95%;
	margin-left: 30px;
	border-collapse: collapse;
	background-color: #eaf6ff;
	border-radius: 8px;
	overflow: hidden;
	margin-bottom: 20px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

/* Table Headers */
table {
	width: 90%;
	border-collapse: collapse;
	background-color: #f9f9f9; /* Soft grey table background */
	border-radius: 8px;
	overflow: hidden;
	margin-left: 50px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* Subtle shadow for depth */
}

/* Table Headers */
th, td {
	padding: 10px;
	border: 1px solid #d1d1d1; /* Light grey borders */
	text-align: left;
}

th {
	background-color: #eaeaea; /* Soft grey header */
	color: #333; /* Dark grey text for headers */
	font-weight: bold;
}

/* Table Rows */
td {
	background-color: #f9f9f9; /* Very light grey for table rows */
	color: #333; /* Dark grey text color */
}

tr:nth-child(even) td {
	background-color: #f2f2f2; /* Light grey for alternating rows */
}

tr:hover td {
	background-color: #e0e0e0; /* Slightly darker grey hover effect */
}

/* Message Class */
.message {
	background-color: #e0e0e0; /* Soft grey background */
	color: #333; /* Darker grey text for contrast */
	padding: 10px;
	border-left: 4px solid #808080; /* Highlight with dark grey border */
	margin: 20px 0;
	border-radius: 4px;
	font-size: 14px;
}

/* Rounded icon style */
table tbody td a i {
	padding: 6px;
	border-radius: 50%;
	background-color: #006699;
	color: #fff;
}

table tbody td a i:hover {
	background-color: #004466;
}

#page-content-wrapper {
	min-width: 100vw;
}

#wrapper.toggled #sidebar-wrapper {
	margin-left: 0;
}

#menu-toggle {
	cursor: pointer;
}

.list-group-item {
	border: none;
	padding: 20px 30px;
}

.list-group-item.active {
	background-color: transparent;
	color: var(--main-text-color);
	font-weight: bold;
	border: none;
}

@media ( min-width : 768px) {
	#sidebar-wrapper {
		margin-left: 0;
	}
	#page-content-wrapper {
		min-width: 0;
		width: 100%;
	}
	#wrapper.toggled #sidebar-wrapper {
		margin-left: -15rem;
	}
}
</style>
</head>

<body>


	<%
	QuizDao dao = new QuizDao();
	int totalQuestions = dao.getTotalQuestions();
	%>

	<%
	int row = 0;
	UserDao userDao = new UserDao();
	int totalUsers = 0;
	try {
		totalUsers = userDao.getTotalUsers();
	} catch (ClassNotFoundException | SQLException e) {
		e.printStackTrace();
	}
	if (session.getAttribute("message") != null) {
		out.println("<script>alert('Delete Successful!')</script>");
	}
	%>

	<div class="d-flex" id="wrapper">
		<!-- Sidebar -->
		<jsp:include page="./assets/layout/sideBar.jsp"></jsp:include>
		<!-- /#sidebar-wrapper -->

		<!-- Page Content -->
	</div>
	<div id="page-content-wrapper">



		<div class="container-fluid px-4">
			<nav
				class="navbar navbar-expand-lg navbar-light bg-transparent py-4 px-4">
				<div class="d-flex align-items-center">
					<i class="fas fa-align-left  fs-4 me-3" id="menu-toggle"></i>
					<h2 class="fs-2 m-0">Dashboard</h2>
				</div>

				<button class="navbar-toggler" type="button"
					data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
					aria-controls="navbarSupportedContent" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>

				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<ul class="navbar-nav ms-auto mb-2 mb-lg-0">

					</ul>
				</div>
			</nav>
		</div>
		<h1>All Questions</h1>
		<table>
			<thead>
				<tr>
					<th>#</th>
					<th>Question</th>
					<th>Option 1</th>
					<th>Option 2</th>
					<th>Option 3</th>
					<th>Correct Answer</th>
					<th>Level ID</th>
					<th>Actions</th>
				</tr>
			</thead>
			<tbody>
				<%
				QuizDao quizDao = new QuizDao();
				List<Quiz> questions = dao.getAllQuestions();
				if (questions != null && questions.size() > 0) {
					for (Quiz q : questions) {
				%>
				<tr>
					<td><%=++row%></td>
					<td><%=q.getQuestions()%></td>
					<td><%=q.getOption1()%></td>
					<td><%=q.getOption2()%></td>
					<td><%=q.getOption3()%></td>
					<td><%=q.getCorrectanswer()%></td>
					<td><%=q.getLevelid()%></td>
					<td><a href="DeleteQuestionServlet1?id=<%=q.getQuizid()%>">
							<i class="fa-regular fa-trash-can"></i>
					</a> <a href="editQuestion.jsp?quizid=<%=q.getQuizid()%>"> <i
							class="fa-regular fa-pen-to-square"></i>
					</a></td>


					<%
					}
					} else {
					%>
				
				<tr>
					<td colspan="8">No questions available.</td>
				</tr>
				<%
				}
				%>


			</tbody>
		</table>
<%session.removeAttribute("message"); %>
		<!-- <script>
function confirmDelete(id) {
    if (confirm('Are you sure you want to delete this question?')) {
        window.location.href = 'DeleteQuestionServlet?id=' + id;
    }
}
</script> -->
</body>

</html>