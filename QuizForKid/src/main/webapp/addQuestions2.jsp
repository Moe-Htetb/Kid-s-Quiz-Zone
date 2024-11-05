
<%@page import="com.demo.dao.QuizDao"%>
<%@page import="java.sql.SQLException"%>
<%@ include file="./assets/layout/header.jsp"%> <!-- Includes header as it is -->
<%@ include file="./assets/layout/nav.jsp"%> <!-- Includes nav as it is -->
<style>
    /* Your custom CSS for the form */
    input[type="text"],
    input[type="password"],
    input[type="email"],
    input[type="number"],
    textarea {
        width: 100%;
        padding: 12px;
        margin: 10px 0;
        border: 1px solid #a8d5ff;
        border-radius: 6px;
        background-color: #f0f8ff;
        font-size: 16px;
        color: #333;
        transition: border-color 0.3s, box-shadow 0.3s;
    }

    input[type="text"]:focus,
    input[type="password"]:focus,
    input[type="email"]:focus,
    input[type="number"]:focus,
    textarea:focus {
        border-color: #89c2ff;
        box-shadow: 0 0 8px rgba(137, 194, 255, 0.7);
        outline: none;
    }

    input[type="text"]::placeholder,
    input[type="password"]::placeholder,
    input[type="email"]::placeholder,
    input[type="number"]::placeholder,
    textarea::placeholder {
        color: #black;
    }

    button[type="submit"] {
        background-color: #89c2ff;
        color: white;
        padding: 12px 20px;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        font-size: 16px;
        transition: background-color 0.3s;
    }

    button[type="submit"]:hover {
        background-color: #74a9ff;
    }

    .container {
        
        margin: 0 auto;
        padding: 20px;
        background-color: #ffffff;
        box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.1);
        border-radius: 8px;
    }

    h2 {
        color: #333;
        text-align: center;
        margin-bottom: 20px;
    }
</style>

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
    <form action="addQuestion.jsp" method="post">
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

<%@ include file="./assets/layout/footer.jsp"%> <!-- Footer as it is -->
