<%@page import="com.demo.dao.MyConnection"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quiz Results</title>
    <style>
        /* General Reset */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f4f7fa;
            color: #333;
            line-height: 1.6;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .container {
            background-color: #fff;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 600px;
            text-align: center;
            transition: transform 0.3s;
        }

        .container:hover {
            transform: scale(1.02);
        }

        h1 {
            font-size: 2.5rem;
            color: #4CAF50;
            margin-bottom: 20px;
            letter-spacing: 1px;
        }

        .results-container {
            max-height: 300px; /* Fixed height for scrolling */
            overflow-y: auto; /* Enable vertical scrolling */
            margin-bottom: 20px;
            display: none; /* Hide results initially */
            border: 1px solid #ccc; /* Optional: border for clarity */
            padding: 10px;
            border-radius: 5px;
            background-color: #f9f9f9;
        }

        .results {
            margin-bottom: 10px;
        }

        .results p {
            font-size: 1.2rem;
            margin-bottom: 5px;
        }

        .answer {
            font-size: 0.9rem; /* Smaller font size for answers */
            color: #555;
        }

        .incorrect {
            color: red; /* Color for incorrect answers */
        }

        .score {
            font-size: 1.5rem;
            font-weight: bold;
            color: #2196F3;
        }

        .total-questions {
            font-size: 1.5rem;
            font-weight: bold;
            color: #FF5722;
        }

        .btn {
            background-color: #4CAF50;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            font-size: 1rem;
            cursor: pointer;
            transition: background-color 0.3s ease, transform 0.2s;
            margin: 5px;
        }

        .btn:hover {
            background-color: #45a049;
            transform: translateY(-2px);
        }
    </style>
    <script>
        function toggleAnswers() {
            const resultsContainer = document.querySelector('.results-container');
            resultsContainer.style.display = resultsContainer.style.display === 'none' ? 'block' : 'none';
        }
    </script>
</head>
<body>
    <div class="container">
        <h1>Quiz Results</h1>

        <div class="results-container">
            <%
                Integer levelid = (Integer) session.getAttribute("levelid");

                MyConnection conobj = new MyConnection();
                Connection conn = conobj.getConnection();
                PreparedStatement pstmt = null;
                ResultSet rs = null;

                int score = 0;
                int totalQuestions = 15; // Adjust based on total available questions
                int attemptedQuestions = 0;

                try {
                    pstmt = conn.prepareStatement("SELECT quizid, questions, correctanswer FROM quiz WHERE levelid=?");
                    pstmt.setInt(1, levelid);
                    rs = pstmt.executeQuery();

                    int questionCounter = 1; // Counter for numbering questions

                    while (rs.next()) {
                        String questions = rs.getNString("questions");
                        int questionId = rs.getInt("quizid");
                        String correctAnswer = rs.getString("correctanswer");

                        // Get user's answer for the current question
                        String userAnswer = request.getParameter("question_" + questionId);

                        // Only process if the user has answered the question
                        if (userAnswer != null && !userAnswer.trim().isEmpty()) {
                            attemptedQuestions++;
                            if (userAnswer.trim().equalsIgnoreCase(correctAnswer.trim())) {
                                score++;
            %>

            <div class="results">
                <p style="color: darkblue;">
                    Question <%= questionCounter++ %>: <%= questions %><br>
                    <span style="color: black;">Your Answer: <%= userAnswer %></span><br>
                    <span class="answer">Correct Answer: <%= correctAnswer %></span>
                </p>
            </div>

            <%
                            } else {
            %>

            <div class="results">
                <p style="color: darkblue;">
                    Question <%= questionCounter++ %>: <%= questions %><br>
                    <span style="color: red;">Your Answer: <%= userAnswer %></span><br>
                    <span class="answer">Correct Answer: <%= correctAnswer %></span>
                </p>
            </div>

            <%
                            }
                        }
                    }
                    rs.close();
                    pstmt.close();
                    conn.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            %>
        </div>

        <div>
            <p class="total-questions">Total Questions: <%= totalQuestions %></p>
            <p class="total-questions">Attempted Questions: <%= attemptedQuestions %></p>
            <p class="score">Your Score: <%= score %> / <%= totalQuestions %></p>
        </div>

        <button class="btn" onclick="toggleAnswers()">Show Correct Answers</button>

        <% if (score >= 10) { 
            session.setAttribute("score", score);
            session.setAttribute("levelid", levelid);
        %> 
        <a href="./login.jsp"><button class="btn">To Get Certificate</button></a>
        <% } else { %>
        <a href="./quiz.jsp?levelid=<%= levelid %>"><button class="btn">Try Again...</button></a>
        <% } %>

        <a href="./home.jsp#classes"><button class="btn">Take Another Quiz</button></a>
    </div>
</body>
</html>
