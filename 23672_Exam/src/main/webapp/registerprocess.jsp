<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Registration Status</title>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script>
        function showMessage(message, success) {
            if (success) {
                swal("Success", message, "success").then(function() {
                    window.location.href = "index.jsp";
                });
            } else {
                swal("Error", message, "error").then(function() {
                    window.location.href = "index.jsp";
                });
            }
        }
    </script>
</head>
<body>
<%
String username = request.getParameter("username");
String userpass = request.getParameter("userpass");
String category = request.getParameter("category");
String email = request.getParameter("email");

Connection con = null;
PreparedStatement ps = null;

try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/quizz_application", "root", "london");
    ps = con.prepareStatement("INSERT INTO quizregister (username, userpass, category, email) VALUES (?, ?, ?, ?)");
    ps.setString(1, username);
    ps.setString(2, userpass);
    ps.setString(3, category);
    ps.setString(4, email);
    int rowsAffected = ps.executeUpdate();
    if (rowsAffected > 0) {
        out.println("<script>showMessage('Registration successful', true);</script>");
    } else {
        out.println("<script>showMessage('Registration failed', false);</script>");
    }
} catch (SQLException | ClassNotFoundException e) {
    out.println("<script>showMessage('An error occurred while processing your request', false);</script>");
    e.printStackTrace();
} finally {
    try {
        if (ps != null) {
            ps.close();
        }
        if (con != null) {
            con.close();
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
}
%>
</body>
</html>
