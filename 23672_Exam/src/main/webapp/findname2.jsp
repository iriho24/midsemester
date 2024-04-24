<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>

<%
String n = request.getParameter("val");
if (n != null && !n.isEmpty()) {
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/quizz_application", "root", "london");

        PreparedStatement ps = con.prepareStatement("SELECT DISTINCT subject FROM quizques WHERE subject LIKE ?");
        ps.setString(1, n + "%"); // Use parameterized query to prevent SQL injection
        ResultSet rs = ps.executeQuery();

        // Start table markup
        out.print("<br>");
        out.print("<table border='1' cellspacing='0' cellpadding='5' id='myTable' style='width:50%'>");
        out.print("<tr><td style='padding:5px'><strong>Quizzes</strong></td></tr>");

        // Generate table rows with links
        while (rs.next()) {
            String subject = rs.getString("subject");
            out.print("<tr><td style='padding:5px'><a href='#' name='" + subject + "' onclick='javascript:viewAll(\"" + subject + "\")'>" + subject + "</a></td></tr>");
        }

        // End table markup
        out.print("</table>");
        con.close();
    } catch (Exception e) {
        e.printStackTrace();
        // Handle exceptions gracefully
        out.print("An error occurred while processing your request.");
    }
}
%>
