<%@page import="jakarta.servlet.http.HttpSession"%>
<%
    HttpSession httpSession = request.getSession(false);
    if (session != null) {
        session.invalidate();
    }
    response.sendRedirect("home.jsp");
%>
