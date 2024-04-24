<%@ page language="java" import="java.sql.*" pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*" %>

<%! static int count = 0; %>
<%! static int count1 = 0; %>

<%
try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/quizz_application", "root", "london");
    
    // Retrieve subject from session
    String subject = (String) session.getAttribute("subject");
    
    if (count == 0) {
        PreparedStatement ps1 = con.prepareStatement("SELECT MIN(qid) FROM quizques WHERE subject = ?");
        PreparedStatement ps2 = con.prepareStatement("SELECT MAX(qid) FROM quizques WHERE subject = ?");
        ps1.setString(1, subject);
        ps2.setString(1, subject);
        ResultSet rs1 = ps1.executeQuery();
        ResultSet rs2 = ps2.executeQuery();
        
        if (rs2.next()) {
            count1 = rs2.getInt(1);
            session.setAttribute("max", count1);
        }
        if (rs1.next()) {
            count = rs1.getInt(1);
            session.setAttribute("min", count);
        }
    }
    
    if (count > 0) {
        PreparedStatement ps = con.prepareStatement("SELECT question, option1, option2, option3, option4, answer FROM quizques WHERE qid=? AND subject=?");
        ps.setInt(1, count);
        ps.setString(2, subject);
        ResultSet rs = ps.executeQuery();
        
        // Check if there is a question for the current count
        if (rs.next()) {
            String question = rs.getString("question");
            String option1 = rs.getString("option1");
            String option2 = rs.getString("option2");
            String option3 = rs.getString("option3");
            String option4 = rs.getString("option4");
            String answer = rs.getString("answer");
            
            // Debug: Print out the retrieved question
            System.out.println("Retrieved question: " + question);
            
            // Set question and options in session
            session.setAttribute("question", question);
            session.setAttribute("option1", option1);
            session.setAttribute("option2", option2);
            session.setAttribute("option3", option3);
            session.setAttribute("option4", option4);
            session.setAttribute("answer", answer);
        } else {
            System.out.println("No question found for count: " + count);
        }
    }
    
    count++;
    // Reset count if it exceeds the maximum value
    if (count > (Integer) session.getAttribute("max")) {
        count = 0;
        session.setAttribute("ans", null);
    }
    
    con.close();
} catch (Exception e) {
    e.printStackTrace();
}
%>
<jsp:forward page="start.jsp"></jsp:forward>
