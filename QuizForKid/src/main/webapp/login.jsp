<%@ include file="./assets/layout/header.jsp"%>
<%@ include file="./assets/layout/nav.jsp"%>
<%if(session.getAttribute("loginStudent")!=null){
	response.sendRedirect("certifi.jsp");
}%>



<style>
  .xl-text {
    font-size: 75px;
  }

  .navbar-brand {
    font-family: "Luckiest Guy", cursive;
    font-weight: 400;
    font-style: normal;
  }

  .btn-outline-secondary:hover {
    color: #fff;
  }

  .icon:hover {
    transform: translateY(-8px);
    transition: 0.3s;
  }

  h1, span {
    font-family: "Luckiest Guy", cursive;
    font-weight: 400;
    font-style: normal;
  }

  .header .decoration-star {
    top: 80px;
    left: -200px;
    width: 500px;
    opacity: 0.7;
  }

  .header .decoration-star-2 {
    top: 80px;
    right: -200px;
    width: 500px;
    opacity: 0.7;
  }

  .navbar {
    transition: all 0.5s ease-in-out;
  }

  .navbar-sticky {
    background: #fff;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
  }

  .navbar .nav-item .dropdown-menu {
    display: block;
    top: calc(100% - 15px);
    margin-top: 0;
    opacity: 0;
    z-index: 50;
    visibility: hidden;
    transition: 0.5s;
  }

  .navbar .nav-item:hover .dropdown-menu {
    top: 100%;
    visibility: visible;
    background-color: rgba(42, 40, 40, 0.755);
    transition: 0.5s;
    opacity: 1;
  }

  .navbar .nav-item:hover .dropdown-menu .dropdown-item {
    color: white;
  }

  .navbar .nav-item:hover .dropdown-menu .dropdown-item:hover {
    color: black;
    overflow: hidden;
  }

  /* nav end */

  .form {
    border: 1px solid black;
    display: flex;
    flex-direction: column;
    gap: 10px;
    background-color: #ffffff;
    padding: 30px;
    width: 450px;
    border-radius: 20px;
    font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Oxygen, Ubuntu, Cantarell, "Open Sans", "Helvetica Neue", sans-serif;
  }

  ::placeholder {
    font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Oxygen, Ubuntu, Cantarell, "Open Sans", "Helvetica Neue", sans-serif;
  }

  .form button {
    align-self: flex-end;
  }

  .flex-column > label {
    color: #151717;
    font-weight: 600;
  }

  .inputForm {
    border: 1.5px solid #ecedec;
    border-radius: 10px;
    height: 50px;
    display: flex;
    align-items: center;
    padding-left: 10px;
    transition: 0.2s ease-in-out;
  }

  .input {
    margin-left: 10px;
    border-radius: 10px;
    border: none;
    width: 85%;
    height: 100%;
  }

  .input:focus {
    outline: none;
  }

  .inputForm:focus-within {
    border: 1.5px solid #2d79f3;
  }

  .flex-row {
    display: flex;
    flex-direction: row;
    align-items: center;
    gap: 10px;
    justify-content: space-between;
  }

  .flex-row > div > label {
    font-size: 14px;
    color: black;
    font-weight: 400;
  }

  .span {
    font-size: 14px;
    margin-left: 5px;
    color: #2d79f3;
    font-weight: 500;
    cursor: pointer;
  }

  .button-submit {
    margin: 20px 0 10px 0;
    background-color: #151717;
    border: none;
    color: white;
    font-size: 15px;
    font-weight: 500;
    border-radius: 10px;
    height: 50px;
    width: 100%;
    cursor: pointer;
  }

  .button-submit:hover {
    background-color: #252727;
  }

  .p {
    text-align: center;
    color: black;
    font-size: 14px;
    display: flex;
    justify-content: space-between;
  }

  .line {
    text-align: center;
  }

  .btnn {
    margin-top: 10px;
    width: 100%;
    height: 50px;
    border-radius: 10px;
    display: flex;
    justify-content: center;
    align-items: center;
    font-weight: 500;
    gap: 10px;
    border: 1px solid #ededef;
    background-color: white;
    cursor: pointer;
    transition: 0.2s ease-in-out;
  }

  .btnn:hover {
    border: 1px solid #2d79f3;
  }
</style>
<%
if(session.getAttribute("errorPassword")!=null)
	out.println("<script>alert('Password Error!')</script>");
%>
<div class="container mt-6">
  <div class="row">
    <div class="col-md-6">
<img src="./assets/images/login.avif" width="500" height="500" class="img-fluid" />
    </div>

    <div class="col-md-6">
      <form class="form" action="UserLoginServlet" method="post" >
        <div class="flex-column">
          <label>Email</label>
        </div>
        <div class="inputForm">
          <svg height="20" viewBox="0 0 32 32" width="20" xmlns="http://www.w3.org/2000/svg">
            <g id="Layer_3" data-name="Layer 3">
              <path d="m30.853 13.87a15 15 0 0 0 -29.729 4.082 15.1 15.1 0 0 0 12.876 12.918 15.6 15.6 0 0 0 2.016.13 14.85 14.85 0 0 0 7.715-2.145 1 1 0 1 0 -1.031-1.711 13.007 13.007 0 1 1 5.458-6.529 2.149 2.149 0 0 1 -4.158-.759v-10.856a1 1 0 0 0 -2 0v1.726a8 8 0 1 0 .2 10.325 4.135 4.135 0 0 0 7.83.274 15.2 15.2 0 0 0 .823-7.455zm-14.853 8.13a6 6 0 1 1 6-6 6.006 6.006 0 0 1 -6 6z"></path>
            </g>
          </svg>
          <input type="text" name="email" class="input" required placeholder="Enter Email"/>
        </div>

        <div class="flex-column">
          <label>Password</label>
        </div>
        <div class="inputForm">
          <svg height="20" viewBox="-64 0 512 512" width="20" xmlns="http://www.w3.org/2000/svg">
            <path d="m336 512h-288c-26.453125 0-48-21.523438-48-48v-224c0-26.476562 21.546875-48 48-48h288c26.453125 0 48 21.523438 48 48v224c0 26.476562-21.546875 48-48 48zm-288-288c-8.8125 0-16 7.167969-16 16v224c0 8.832031 7.1875 16 16 16h288c8.8125 0 16-7.167969 16-16v-224c0-8.832031-7.1875-16-16-16zm0 0"></path>
            <path d="m304 224c-8.832031 0-16-7.167969-16-16v-80c0-52.929688-43.070312-96-96-96s-96 43.070312-96 96v80c0 8.832031-7.167969 16-16 16s-16-7.167969-16-16v-80c0-70.59375 57.40625-128 128-128s128 57.40625 128 128v80c0 8.832031-7.167969 16-16 16zm-128-96c-35.347656 0-64 28.652344-64 64v64c0 35.347656 28.652344 64 64 64s64-28.652344 64-64v-64c0-35.347656-28.652344-64-64-64zm0 0"></path>
          </svg>
          <input type="password" name="password" class="input"  required placeholder="Enter Password"/>
        </div>

        <button type="submit" class="button-submit">Login</button>

        <div class="p">
          <p>Don't have an account? <a href="signup.jsp" class="span">Sign Up</a></p>
        </div>
      </form>
    </div>
  </div>
</div>

<%@ include file="./assets/layout/footer.jsp"%>
