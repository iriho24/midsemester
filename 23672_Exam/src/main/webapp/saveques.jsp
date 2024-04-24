<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>

<%! static int counter = 0; %>
<%
counter++;
String qid = request.getParameter("quizId"); // Assuming quizId is passed from the client side
String subject = (String) session.getAttribute("subject"); // Retrieve subject from session

try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/quizz_application", "root", "london");
    String question = request.getParameter("question");
    String option1 = request.getParameter("option1");
    String option2 = request.getParameter("option2");
    String option3 = request.getParameter("option3");
    String option4 = request.getParameter("option4");
    String answer = request.getParameter("answer");
    String description = request.getParameter("description");

    PreparedStatement ps = con.prepareStatement("INSERT INTO quizques (question, option1, option2, option3, option4, answer, qid, description, subject) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)");
    ps.setString(1, question);
    ps.setString(2, option1);
    ps.setString(3, option2);
    ps.setString(4, option3);
    ps.setString(5, option4);
    ps.setString(6, answer);
    ps.setString(7, qid); // Use the quizId passed from the client side
    ps.setString(8, description);
    ps.setString(9, subject); // Insert the subject
    
    int rowsAffected = ps.executeUpdate();
    // Handle success or failure of insertion if needed
} catch(Exception e) {
    e.printStackTrace();
}
%>

<% 
request.setAttribute("counter", counter);
%>
<jsp:forward page="createquiz1.jsp"></jsp:forward>
