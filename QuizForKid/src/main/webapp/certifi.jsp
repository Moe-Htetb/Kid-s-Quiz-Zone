<%@page import="java.util.Date"%>
<%@page import="com.demo.dao.LevelDao"%>
<%@page import="com.demo.model.User"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ include file="./assets/layout/header.jsp"%>
<nav class="navbar navbar-expand-lg sticky-top navbar-light border-bottom">
    <div class="container">
        <h1 class="m-0 text-warning">
        <i class="fa fa-book-reader me-3 text-danger" style="font-size: 2.5rem;"></i>
            <span class="text-danger">Kids'</span>
            <span class="text-primary">Quiz</span>
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
                    <a class="nav-link" href="./home.jsp#details">Details</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="./home.jsp#services">Services</a>
                </li>
                <div class="nav-item dropdown">
                    <a href="#" class="nav-link dropdown-toggle mx-2" data-bs-toggle="dropdown">
                         Classes
                    </a>
                    <div class="dropdown-menu rounded-0 rounded-bottom border-0 shadow-sm m-0">
                       
                            <a href="quiz.jsp?levelid=1" class="dropdown-item my-2">Basic</a>
                            <a href="quiz.jsp?levelid=2" class="dropdown-item my-2">Intermediate</a>
                            <a href="quiz.jsp?levelid=3" class="dropdown-item my-2">Advanced</a>
                        
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
                            
                                <li>
                                    <a class="dropdown-item" href="logout.jsp">Logout</a>
                                </li>
                              
                        </ul>
                    </div>
                </li>
            </ul>
        </div>
    </div>
</nav>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quiz Kid Zone - Certificate</title>
    <style>
     
      
        

      .certiimg{
        width: 800px;
        margin-top: 50px;
        margin-left: 370px;
        box-shadow: 1px 1px 10px rgb(75, 73, 73);
      }

      .text{
        position: absolute;
        top: 55%;
        left: 44%;
        font-family:'U4 Brothers. 00074', 'Arial Narrow', Arial, sans-serif;
        letter-spacing: 5px;
        font-size: 35px;
        color: blue;
      }

      .level{
        position: absolute;
        top: 65%;
        left: 56%;
       
        
      }

      .score{
        position: absolute;
        top: 69%;
        left: 67.5%;
        font-weight: bolder;
        font-family: 'Poppins';
        
    
      }

      .date{
        position: absolute;
        top: 75%;
        left: 36%;
        font-weight: bolder;
      }

 
    </style>



    <% 
    Integer levelid = (Integer) session.getAttribute("levelid"); 
    Integer score = (Integer) session.getAttribute("score");
    User user = (User) session.getAttribute("loginStudent");
    LevelDao dao = new LevelDao();
    String levelname = dao.getlevelname(levelid);
%>
    <div class="img">
        <img src="./assets/images/cert(1).png" class="certiimg">
        
    </div>
    <div class="text">
        <h2 style="color: #273261; font-size: 40px;"> <%= user.getName() %></h2>
    </div>
    <div class="level">
        <h4><span style="color: green;"><%= levelname.toUpperCase() %></span> Level</h4>
    </div>

    <div class="score">
        
        <p class="p2"><span style="color: green;"><%= score %> .</span>
    </div>

    <div class="date">
        <p class="date"> <%= new SimpleDateFormat("dd/MM/yyyy").format(new Date()) %></p>
    </div>

  
<%   session.removeAttribute("score"); %>
<%@ include file="./assets/layout/footer.jsp"%>