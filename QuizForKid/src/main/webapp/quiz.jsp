<%@page import="com.demo.model.Quiz"%>
<%@page import="com.demo.dao.QuizDao"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<title>Quiz Kid Zone</title>
<style>
/* Your existing styles */
body {
	background-image: url('./assets/images/quizbg.jpg');
	background-size: cover;
	background-attachment: fixed;
	height: 100vh;
	font-family: 'Arial', sans-serif;
	color: #333;
	margin: 0;
	padding: 0;
}

#questions {
	max-width: 900px;
	margin: 0 auto;
	padding: 20px;
	background-color: #ffffff;
	border-radius: 10px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

.question-container {
	display: none;
	padding: 20px;
	border: 1px solid #ccc;
	border-radius: 10px;
	margin-bottom: 20px;
	background-color: #f9f9f9;
	position: relative;
}

.question-container.active {
	display: block;
}

.question-container p {
	font-size: 20px;
	font-weight: bold;
	margin: 0 0 20px;
}

.option-container {
	display: flex;
	flex-direction: column;
	gap: 10px;
}

.option {
	background-color: #f0f0f0;
	border: 2px solid #004085;
	border-radius: 5px;
	padding: 15px;
	cursor: pointer;
	text-align: center;
	font-size: 18px;
	transition: background-color 0.3s, border-color 0.3s;
	cursor: pointer;
	user-select: none;
}

.option:hover {
	background-color: #e0e0e0;
}

.option.correct {
	border-color: #13d413;
	background-color: #d4f8d4;
	color: #007700;
}

.navigation-btns {
	display: flex;
	justify-content: space-around;
	margin-top: 20px;
}

.navigation-btns button, .navigation-btns input[type="submit"] {
	padding: 10px 20px;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	font-size: 16px;
	background-color: #004085;
	color: #ffffff;
	transition: background-color 0.3s;
}

.navigation-btns button:hover, .navigation-btns input[type="submit"]:hover {
	background-color: #003366;
}

h1, .level-description {
	text-align: center;
	color: #004085;
	font-size: 24px;
	margin-bottom: 20px;
}

.clock {
	position: relative;
	left: 80%;
	font-size: 22px;
	color: #ff0000;
	font-family: 'Poppins';
	
}
</style>


	<script>
    let currentQuestionIndex = 0;
    let questions = [];
    let timeLeft = 90; // 120 seconds countdown

    function loadQuestions() {
        const questionElements = document.querySelectorAll('.question-container');
        questions = Array.from(questionElements);
        showQuestion(currentQuestionIndex);

        // Start the timer
        startTimer();
    }

    function showQuestion(index) {
        questions.forEach((el, i) => {
            el.classList.toggle('active', i === index);
        });

        // Hide the "Next" button if it's the last question
        const nextButton = document.querySelector('.navigation-btns button.next');
        if (index === questions.length - 1) {
            nextButton.style.display = 'none';
        } else {
            nextButton.style.display = 'inline-block';
        }

        // Always show "Previous" button
        const prevButton = document.querySelector('.navigation-btns button.prev');
        prevButton.style.display = 'inline-block';
    }

    function nextQuestion() {
        if (currentQuestionIndex < questions.length - 1) {
            currentQuestionIndex++;
            showQuestion(currentQuestionIndex);
        }
    }

    function prevQuestion() {
        if (currentQuestionIndex > 0) {
            currentQuestionIndex--;
            showQuestion(currentQuestionIndex);
        }
    }

    function selectOption(selectedOption, questionId, optionValue) {
        let options = selectedOption.parentElement.querySelectorAll('.option');
        options.forEach((option) => option.classList.remove('correct'));
        selectedOption.classList.add('correct');

        // Set the selected value for the hidden input
        document.getElementById('answer_' + questionId).value = optionValue;
    }

    // Timer function
    function startTimer() {
        const timerElement = document.getElementById('timer');
        const countdown = setInterval(function() {
            if (timeLeft <= 0) {
                clearInterval(countdown);
                document.querySelector('form').submit(); // Automatically submit the form
            } else {
                timerElement.textContent = timeLeft + " seconds"; // Update the displayed time
                timeLeft--;
            }
        }, 1000); // Decrease timeLeft by 1 every 1000 milliseconds (1 second)
    }
</script>
	
</head>
<body onload="loadQuestions()">
	<%@ include file="./assets/layout/header.jsp"%>
	<%@ include file="./assets/layout/nav.jsp"%>

	<div style="text-align: center; margin-top: 4%; margin-bottom: 2%; font-size: 25px; font-weight: bolder">
		<%
			int levelid = Integer.parseInt(request.getParameter("levelid"));
			QuizDao dao = new QuizDao();
			List<Quiz> list = dao.getAllQuestionByLevelId(levelid);
			String levelDescription = (levelid == 1) ? "Basic: Start small, build strong foundations, and focus on learning the essentials."
					: (levelid == 2) ? "Intermediate: Challenge yourself with new concepts, apply your knowledge, and practice consistently."
							: "Advanced: Master complex skills, fine-tune your expertise, and strive for excellence in all you do.";
		%>
		<%= levelDescription %>
	</div>

	<form action="submitQuiz.jsp" method="post">
		<div id="questions">
			<div class="clock">
			<i class="fa-regular fa-clock"></i>
    <span id="timer" style="font-family:'Poppins'" >90 seconds</span> <!-- Timer will count down here -->
		</div>

			<% int count = 0; %>
			<% for (Quiz q : list) { %>
			<div class="question-container">
				<p><strong>Question <%= ++count %>:</strong> <%= q.getQuestions() %></p>
				<div class="option-container">
					<div class="option" onclick="selectOption(this, <%= q.getQuizid() %>, '<%= q.getOption1() %>')">
						<%= q.getOption1() %>
					</div>
					<div class="option" onclick="selectOption(this, <%= q.getQuizid() %>, '<%= q.getOption2() %>')">
						<%= q.getOption2() %>
					</div>
					<div class="option" onclick="selectOption(this, <%= q.getQuizid() %>, '<%= q.getOption3() %>')">
						<%= q.getOption3() %>
					</div>
				</div>

				<!-- Hidden input to store selected answer -->
				<input type="hidden" name="question_<%= q.getQuizid() %>" id="answer_<%= q.getQuizid() %>">
			</div>
			<% session.setAttribute("levelid", levelid); %>
			<% } %>
			<div class="navigation-btns">
				<button type="button" class="prev" onclick="prevQuestion()">Previous</button>
				<button type="button" class="next" onclick="nextQuestion()">Next</button>
				<input type="submit" value="Submit">
			</div>
		</div>
	</form>
</body>
</html>
