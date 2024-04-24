<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>

<%
String username = request.getParameter("username");
String userpass = request.getParameter("userpass");
String category = request.getParameter("category");

boolean status = false;
try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/quizz_application", "root", "london");
    PreparedStatement ps = con.prepareStatement("select * from quizregister where username=? and userpass=? ");
    ps.setString(1, username);
    ps.setString(2, userpass);
    ResultSet rs = ps.executeQuery();
    status = rs.next();
    
    if (status) {
        session.setAttribute("username", username);
        session.setAttribute("islogin", "plz sign in first");
        session.setAttribute("category", category);
        session.setAttribute("totalMarks", 0);
        session.setAttribute("totalUserMarks", 0);
%>
<jsp:forward page="home.jsp"></jsp:forward>
<%
    } else {
        request.setAttribute("Error", "Sorry! Username or Password Error. Please Enter Correct Details or Register");
        session.setAttribute("Loginmsg", "Please sign in first");
%>
<jsp:forward page="index.jsp"></jsp:forward>
<%
    }
    con.close();
} catch (Exception e) {
    e.printStackTrace();
}
%>
