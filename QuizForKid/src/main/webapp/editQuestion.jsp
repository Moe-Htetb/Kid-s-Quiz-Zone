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
  margin-left: -10px;
  margin-top: -20px;
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

                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                   
                </div>
            </nav> 
            </div>
              
<%
int id=Integer.parseInt(request.getParameter("quizid"));
QuizDao quizDao=new QuizDao();
Quiz quiz=quizDao.getQuestionByQuizId(id);
%>

<form action="EditQuestionsServlet" method="post" onsubmit="return showSuccessMessage()">
<h1>Edit Question</h1>
    <input type="hidden" name="id" value="<%= quiz.getQuizid() %>">
    <div>
        <label>Question:</label>
        <input type="text" name="questions" value="<%= quiz.getQuestions() %>" required>
    </div>
    <div>
        <label>Option 1:</label>
        <input type="text" name="option1" value="<%= quiz.getOption1() %>" required>
    </div>
    <div>
        <label>Option 2:</label>
        <input type="text" name="option2" value="<%= quiz.getOption2() %>" required>
    </div>
    <div>
        <label>Option 3:</label>
        <input type="text" name="option3" value="<%= quiz.getOption3() %>" required>
    </div>
    <div>
        <label>Correct Answer:</label>
        <input type="text" name="correctAnswer" value="<%= quiz.getCorrectanswer() %>" required>
    </div>
    <div>
   <label>Level ID:</label>
<input type="number" 
       name="levelId" 
       placeholder="Level ID" 
       min="1" 
       max="3" 
       value="<%= quiz.getLevelid() %>" 
       required 
       oninput="validateLevelId(this)" 
       onkeypress="return isNumberKey(event)">

<script>
function validateLevelId(input) {
    const value = parseInt(input.value);
    if (value < 1 || value > 3) {
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
   
               
        
      
    </div>
    <button type="submit">Save Changes</button>
</form>
<script>
function showSuccessMessage() {
    alert("Edit Question is successful!");
    return true; // Allows form submission
}
</script>


<%@ include file="./assets/layout/footer.jsp"%>
<style>
body {
    font-family: Arial, sans-serif;
    background-color: #f0f8ff;
    margin: 20px;
    color: #333;
}

h1 {
margin-left: 44%;
    color: #005f99;
    font-size: 24px;
    margin-bottom: 20px;
    margin-top: 35px;
}

table {
    width: 100%;
    border-collapse: collapse;
    margin-bottom: 20px;
}

th, td {
    padding: 12px;
    border: 1px solid #d1e7ff;
    text-align: left;
    font-size: 16px;
}

th {
    background-color: #cce5ff;
    color: #004085;
}

td {
    background-color: #eaf4ff;
}

tr:nth-child(even) {
    background-color: #f0f8ff;
}

form {
	width: 50%;
	margin-left: 400px;
    background-color: #eaedee;
    padding: 20px;
    border-radius: 8px;
    box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
}

form div {
    margin-bottom: 15px;
}

form label {
    font-weight: bold;
    color: #005f99;
    display: block;
    margin-bottom: 5px;
}

form input[type="text"],
form input[type="number"] {
    width: 100%;
    padding: 8px;
    border: 1px solid #d1e7ff;
    border-radius: 4px;
    background-color: #f9fcff;
    color: #333;
    font-size: 16px;
}

button {
    background-color: #005f99;
    color: white;
    padding: 10px 15px;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    font-size: 16px;
    transition: background-color 0.3s ease;
}

button:hover {
    background-color: #004080;
}

input[type="text"]:focus,
input[type="number"]:focus {
    outline: none;
    border-color: #66b2ff;
    box-shadow: 0 0 5px rgba(0, 95, 153, 0.2);
}
</style>
</body>

</html>