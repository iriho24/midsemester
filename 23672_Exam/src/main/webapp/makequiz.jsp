<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<jsp:include page="header.jsp"></jsp:include>

<%
String islogin = (String) session.getAttribute("islogin");
if (islogin == null) {
    request.setAttribute("notlogin_msg", "Sorry, Please do Login first");
%>
<jsp:forward page="index.jsp"></jsp:forward>
<%
} else {
    if (request.getAttribute("notlogin_msg") != null) {
        out.print("<font size='2' color='red' m>");
        out.print(request.getAttribute("notlogin_msg"));
        out.print("</font>");
    }
    if (request.getAttribute("Error") != null) {
        out.print("<font size='2' color='red' m>");
        out.print(request.getAttribute("Error"));
        out.print("</font>");
    }
    if (session.getAttribute("category") != null) {
        String category = (String) session.getAttribute("category");
        if (category.equals("Student")) {
%>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script>
    swal("Access Denied", "Only admin user (teacher) can make a quiz.", "error").then(function() {
        window.location.href = "home.jsp"; // Redirect to home page after user dismisses the alert
    });
</script>
<%
        }
    }
}
%>

            	  <div class="" style="width: 50%; margin: 0 auto; height: 540px; background-color: white; padding: 10px; border-radius: 10px;">
            	
                	<div class="">
               
                	  <h1 style="text-align:center; margin: 10px 0; ">Quiz Application System</h1>
                	 		   
                		<form method="post" action="createquiz.jsp" style="margin-top: 30px; display: flex; justify-content: center;">

					<table>
					<tr><td>Subject<br></td><td><input type="text" name="subject" style="width:50%; padding:10px; margin:15px 0" /></td></tr>
				
                    <tr><td></td><td><input type="submit" value="Create"></td>
                     	</table>
                     </form>


                    
                	</div>
                </div>
            
            
           
            <!--end of left content-->




	<div id="footer">
    
    </div>


	
</body></html>

<jsp:include page="footer.html"></jsp:include>