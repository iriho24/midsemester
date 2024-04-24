<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>


<%
String n=request.getParameter("val");
session.setAttribute("subject",n);
if(n.length()>0){
out.print("<font style='color:navy'><B>Each question is of 1 mark</B><br></font>");
out.print("<input type='submit' value='Start Quiz' />");

}
//end of if
%>