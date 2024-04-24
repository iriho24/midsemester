<%@ page language="java" import="java.sql.*" pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*" %>
<html>

<jsp:include page="header.jsp"></jsp:include>

<%
int totalUserMarks = (int) session.getAttribute("totalUserMarks");
String username = (String) session.getAttribute("username");

try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/quizz_application", "root", "london");

    // Insert the user's score into the database
    PreparedStatement ps = con.prepareStatement("INSERT INTO user_scores (username, score, subject, date) VALUES (?, ?, ?, NOW())");
    ps.setString(1, username);
    ps.setInt(2, totalUserMarks);
    ps.setString(3, (String) session.getAttribute("subject"));

    int rowsAffected = ps.executeUpdate();

    // Check if the insertion was successful
    if (rowsAffected < 1) {
        System.out.println("Error");
    }

    con.close();
} catch (Exception e) {
    e.printStackTrace();
}

session.setAttribute("totalUserMarks",0);
session.removeAttribute("option1");
session.removeAttribute("option2");
session.removeAttribute("option3");
session.removeAttribute("option4");
session.removeAttribute("question");
session.removeAttribute("answer");
session.setAttribute("totalMarks",0);
session.removeAttribute("subject");

String islogin=(String)session.getAttribute("islogin");
if(islogin==null){
    request.setAttribute("notlogin_msg","Sorry,Please do Login first");
%>
<jsp:forward page="index.jsp"></jsp:forward>
<%
}
%>

<div class="" style="display: flex; justify-content: center;">
    <div style="position: absolute; width: 60%; margin: 0 20%; height: 400px; background-color: white; padding: 20px; border-radius: 10px;">
        <% 
            if(request.getAttribute("notlogin_msg")!=null){
                out.print("<font size='2' color='red' m>");
                out.print(request.getAttribute("notlogin_msg"));
                out.print("</font>");
            }
        %>
        <% 
            if(request.getAttribute("Error")!=null){
                out.print("<font size='2' color='red' >");
                out.print(request.getAttribute("Error"));
                out.print("</font>");
            }
        %>
        <%
            if(request.getAttribute("finished")!=null){
                out.print("<font size='2' color='navy'>");
                out.print("<B>");
                out.print(request.getAttribute("finished"));
                out.print("<B>");
                out.print("</font>");
            }
        %>
        <div class="" style="position: absolute; width:60%; margin: 0 auto; height: 400px; background-color: white; padding: 20px; border-radius: 10px">
            <div class="">
                <form action="view.jsp" style="display:flex; justify-content:center">
                    <p style="margin-top: 80px; font-size: 40px;">
                        <font style="color: navy;"><B>Your total marks are <%= totalUserMarks %> .</B></font><br/>
                    </p>
                </form>
            </div>
        </div>
    </div>
</div>

<div id="footer">
</div>

</body>
</html>
