<%@page import="com.demo.dao.QuizDao"%>
<%@page import="com.demo.model.Quiz"%>
<%@ include file="./assets/layout/header.jsp"%>
<%@ include file="./assets/layout/nav.jsp"%>

<%
int id=Integer.parseInt(request.getParameter("quizid"));
QuizDao dao=new QuizDao();
Quiz quiz=dao.getQuestionByQuizId(id);
%>

<h1>Edit Question</h1>
<form action="admin/editQuestion" method="post">
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
    background-color: #e0f3ff;
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
