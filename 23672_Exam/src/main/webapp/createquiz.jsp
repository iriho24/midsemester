<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>

<%
String subject = request.getParameter("subject");
session.setAttribute("subject", subject); // Save subject in session
%>

<jsp:forward page="createquiz1.jsp"></jsp:forward>
