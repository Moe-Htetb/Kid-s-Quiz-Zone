<%@page import="com.demo.model.User"%>
<nav class="navbar navbar-expand-lg sticky-top navbar-light border-bottom">
    <div class="container">
        <h1 class="m-0 text-warning">
            <span class="text-danger">Quiz</span>
            <span class="text-primary">Kid</span>
            <span class="text-success">Zone</span>
        </h1>
        <button
            class="navbar-toggler"
            type="button"
            data-bs-toggle="collapse"
            data-bs-target="#navbarNavDropdown"
            aria-controls="navbarNavDropdown"
            aria-expanded="false"
            aria-label="Toggle navigation"
        >
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNavDropdown">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="home.jsp">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="home.jsp#details">Details</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="home.jsp#services">Services</a>
                </li>
                <div class="nav-item dropdown">
                    <a href="#" class="nav-link dropdown-toggle mx-2" data-bs-toggle="dropdown">
                        <% 
                            User loggedInUser = (User) session.getAttribute("loginStudent");
                            boolean isAdmin = loggedInUser != null && "adminofquizforkid@gmail.com".equals(loggedInUser.getEmail());
                        %>
                        <% if (isAdmin) { %>
                            Views
                        <% } else { %>
                            Classes
                        <% } %>
                    </a>
                    <div class="dropdown-menu rounded-0 rounded-bottom border-0 shadow-sm m-0">
                        <% if (isAdmin) { %>
                            <a href="viewUsers.jsp" class="dropdown-item my-2">List of Users</a>
                            <a href="allQuestions.jsp" class="dropdown-item my-2">All Questions</a>
                        <% } else { %>
                            <a href="quiz.jsp?levelid=1" class="dropdown-item my-2">Basic</a>
                            <a href="quiz.jsp?levelid=2" class="dropdown-item my-2">Intermediate</a>
                            <a href="quiz.jsp?levelid=3" class="dropdown-item my-2">Advanced</a>
                        <% } %>
                    </div>
                </div>
                <li class="nav-item">
                    <a class="nav-link btn btn-outline-secondary px-4 mx-6" href="home.jsp#contact">Contact Us</a>
                </li>
                <li class="nav-item">
                    <div class="btn-group">
                        <button type="button" class="btn btn-danger dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
                            <i class="fas fa-user"></i>
                        </button>
                        <ul class="dropdown-menu mt-1">
                            <% if (loggedInUser != null) { %>
                                <li>
                                    <a class="dropdown-item" href="logout.jsp">Logout</a>
                                </li>
                            <% } else { %>
                                <li><a class="dropdown-item" href="login.jsp">Login</a></li>
                            <% } %>
                            <li><hr class="dropdown-divider" /></li>
                            <li><a class="dropdown-item" href="signup.jsp">Sign Up</a></li>
                        </ul>
                    </div>
                </li>
            </ul>
        </div>
    </div>
</nav>
