<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    // Invalidate session
    session.invalidate();
    // Redirect to login page (change "login.jsp" to your actual login page)
    response.sendRedirect("login.jsp");
%>
