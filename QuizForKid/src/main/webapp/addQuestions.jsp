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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
    <link rel="stylesheet" href="styles.css" />
    <title>Admin Dashboard</title>
    <style>
    @import url(https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css);
    
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
    width: 100%;
    border-collapse: collapse;
    background-color: #eaf6ff;
    border-radius: 8px;
    overflow: hidden;
    margin-bottom: 20px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

/* Table Headers */
table thead {
    background-color: #cce6ff;
    color: #003366;
}

table thead th {
    padding: 12px;
    text-align: left;
    font-weight: bold;
    border-bottom: 2px solid #bbd9f7;
    font-size: 16px;
}

/* Table Rows */
table tbody tr {
    background-color: #f7fbff;
}

table tbody tr:nth-child(even) {
    background-color: #f0f8ff;
}

table tbody tr:hover {
    background-color: #cce6ff;
}

/* Table Cells */
table tbody td {
    padding: 12px;
    color: #005580;
    border-bottom: 1px solid #bbd9f7;
    font-size: 15px;
}

/* Actions Column Icons */
table tbody td a {
    color: #005580; /* Original link color */
    font-size: 1.2em;
    margin-right: 10px;
}

table tbody td a:hover {
    color: #004466; /* Darker link color on hover */
}

/* Rounded icon style */
table tbody td a i {
    padding: 6px;
    border-radius: 50%;
    background-color: #006699; /* Icon background color */
    color: #fff; /* White text color */
}

table tbody td a i:hover {
    background-color: #004466; /* Darker icon background on hover */
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

@media (min-width: 768px) {
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

/* Input styles */
input[type="text"],
input[type="password"],
input[type="email"],
input[type="number"],
textarea {
    width: 100%;
    padding: 12px;
    margin: 10px 0;
    border: 1px solid #02101d; /* Light blue border */
    border-radius: 6px;
   background-color: #eceef0; /* Light background for inputs */
    font-size: 16px;
    color: black; /* Dark grey text color */
    transition: border-color 0.3s, box-shadow 0.3s;
}

input[type="text"]:focus,
input[type="password"]:focus,
input[type="email"]:focus,
input[type="number"]:focus,
textarea:focus {
    border-color: black; /* Focus border color */
    box-shadow: 0 0 8px rgba(137, 194, 255, 0.7);
    outline: none;
}

input[type="text"]::placeholder,
input[type="password"]::placeholder,
input[type="email"]::placeholder,
input[type="number"]::placeholder,
textarea::placeholder {
    color: black; /* Light grey placeholder color */
}

button[type="submit"] {
    background-color: #333; /* Light blue button */
    color: white; /* White text color */
    padding: 12px 20px;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    font-size: 16px;
    transition: background-color 0.3s;
}

button[type="submit"]:hover {
    background-color: #798793; /* Darker blue on hover */
}

.container {
    width: 500px;
    margin: 0 auto;
    padding: 20px;
    background-color: #ffffff; /* White background for container */
    box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.1); /* Light shadow */
    border-radius: 8px; /* Rounded corners */
}

h2 {
    color: #333; /* Dark grey text for heading */
    text-align: center;
    margin-bottom: 20px;
}

    
    </style>
</head>

<body>


<%
    QuizDao dao = new QuizDao();
    int totalQuestions = dao.getTotalQuestions();
%>

<%
    UserDao userDao = new UserDao();
    int totalUsers = 0;
    try {
        totalUsers = userDao.getTotalUsers();
    } catch (ClassNotFoundException | SQLException e) {
        e.printStackTrace();
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
             <nav class="navbar navbar-expand-lg navbar-light bg-transparent py-4 px-4">
                <div class="d-flex align-items-center">
                    <i class="fas fa-align-left  fs-4 me-3" id="menu-toggle"></i>
                    <h2 class="fs-2 m-0">Dashboard</h2>
                </div>

                <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                    data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                    aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                
            </nav> 
            </div>
      <%
if ("POST".equalsIgnoreCase(request.getMethod())) {
    String question = request.getParameter("questions");
    String option1 = request.getParameter("option1");
    String option2 = request.getParameter("option2");
    String option3 = request.getParameter("option3");
    String correctAnswer = request.getParameter("correctAnswer");
    int levelId = Integer.parseInt(request.getParameter("levelId"));

    QuizDao quizDao = new QuizDao();
    boolean isAdded = false;

    try {
        isAdded = quizDao.addQuestion(question, option1, option2, option3, correctAnswer, levelId);
    } catch (ClassNotFoundException | SQLException e) {
        e.printStackTrace();
    }

    if (isAdded) {
        out.println("<script>alert('Question added successfully!'); window.location.href='allQuestions.jsp';</script>");
    } else {
        out.println("<script>alert('Failed to add the question. Please try again.');</script>");
    }
}
%>

<div class="container">
    <h2>Add New Question</h2>
    <form action="AddQuestionServlet" method="post">
        <input type="text" name="questions" placeholder="Question" required>
        <input type="text" name="option1" placeholder="Option 1" required>
        <input type="text" name="option2" placeholder="Option 2" required>
        <input type="text" name="option3" placeholder="Option 3" required>
        <input type="text" name="correctAnswer" placeholder="Correct Answer" required>
       
<input type="number" 
       name="levelId" 
       placeholder="Level ID" 
       min="1" 
       max="3" 
       required 
       oninput="validateLevelId(this)" 
       onkeypress="return isNumberKey(event)">

<script>
function validateLevelId(input) {
    const value = parseInt(input.value);
    if (input.value !== "" && (value < 1 || value > 3)) {
        alert("Please enter a number between 1 to 3.");
        input.value = ""; // Clear the input if invalid
    }
}

function isNumberKey(evt) {
    const charCode = (evt.which) ? evt.which : evt.keyCode;
    // Allow only numbers 1, 2, 3, or backspace
    if (charCode < 49 || charCode > 51) {
        if (charCode !== 8) { // Backspace
            evt.preventDefault();
        }
    }
}
</script>
       
       
        <button type="submit">Add Question</button>
    </form>
</div>
</body>

</html>