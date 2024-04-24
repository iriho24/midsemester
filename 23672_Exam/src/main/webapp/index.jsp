<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Login Form</title>
<link rel="stylesheet" type="text/css" href="styleindex.css"/>
<style>
    /* Styles for header */
    #header {
        background-color: #2c3e50; /* Dark blue header */
        color: #ffffff; /* White text */
        padding: 20px;
        text-align: center;
        font-size: 24px;
    }

    /* Styles for menu */
    .menu {
        list-style-type: none;
        margin: 0;
        padding: 0;
        overflow: hidden;
        background-color: #34495e; /* Darker blue menu */
    }

    .menu li {
        float: left;
    }

    .menu li a {
        display: block;
        color: #ffffff; /* White text */
        text-align: center;
        padding: 14px 16px;
        text-decoration: none;
    }

    .menu li a:hover {
        background-color: #3e5770; /* Slightly lighter blue on hover */
    }

    /* Styles for middle box */
    .middle_box {
        background-color: #3498db; /* Blue middle box */
        padding: 40px 20px;
        text-align: center;
        color: #ffffff; /* White text */
        font-size: 20px;
    }

    /* Styles for left content */
    .left_content {
        float: left;
        width: 30%; /* Adjusted width */
        background-color: #ffffff; /* White background */
        padding: 20px;
        margin-top: 20px;
        border-radius: 10px;
        box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
    }

    /* Styles for login form */
    .calendar_box {
        background-color: #f1f1f1; /* Light gray background */
        padding: 20px;
        border-radius: 10px;
        box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
    }

    /* Styles for footer */
    #footer {
        clear: both;
        background-color: #2c3e50; /* Dark blue footer */
        color: #ffffff; /* White text */
        padding: 20px;
        text-align: center;
        font-size: 16px;
    }

    /* Styles for cookie policy modal */
    .modal {
        display: none;
        position: fixed;
        z-index: 1;
        left: 0;
        bottom: 50px; /* Adjusted from 0 to 50px */
        width: 100%;
        background-color: rgba(0,0,0,0.4);
        padding-top: 60px;
    }

    .modal-content {
        background-color: #fefefe;
        margin: 0 auto;
        padding: 20px;
        border: 1px solid #888;
        width: 80%;
        box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19);
    }                 

    .modal-content p {
        margin-bottom: 20px;
    }

    .modal-content button {
        padding: 10px 20px;
        margin-right: 10px;
        cursor: pointer;
        background-color: #3498db; /* Blue background */
        color: white;
        border: none;
        border-radius: 5px;
    }

    .modal-content button:hover {
        background-color: #2980b9; /* Darker blue on hover */
    }
</style>
</head>
<body>

<div id="main_container">
    <div class="main_content">
        <div id="header">ONLINE QUIZ APPLICATION SYSTEM</div>
        <div class="top_center_box"></div>
        <div class="center_box">

            <div id="menu_tab">                                     
                <ul class="menu">                                                                               
                    <li><a href="home.jsp" class="nav">Home</a></li>
                    <li class="divider"></li>
                    <li><a href="takequiz.jsp" class="nav">Take Quiz</a></li>
                    <li class="divider"></li>
                    <li><a href="makequiz.jsp" class="nav">Make quiz</a></li>
                    <li class="divider"></li>
                    <li><a href="register.jsp" class="nav">Register</a></li> 	
                </ul>
            </div> 
            
            <div class="middle_box">
                <div class="middle_box_text_content">
                    <div class="middle_box_title">Welcome to Our Quiz Application System </div>
                    <p class="middle_text">Explore the Future of Authentication</p>
                </div>
            </div>
            
            <div class="left_content">
                <% 
                if(request.getAttribute("notlogin_msg")!=null){
                    out.print("<font size='2' color='red' m>");
                    out.print(request.getAttribute("notlogin_msg"));
                    out.print("</font>");
                }
                %>
                <% 
                if(request.getAttribute("Error")!=null){
                    out.print("<font size='2' color='red' m>");
                    out.print(request.getAttribute("Error"));
                    out.print("</font>");
                }
                %>
                <div class="calendar_box">
                    <div class="calendar_box_content">
                        <h4>Login Form</h4><br />
                        <form method="post" action="loginprocess.jsp">
                            <table>
                                <tr><td style="color:navy;"><b>Category:</b></td><td><select name="category">
                                    <option>Select a Category</option>
                                    <option>Teacher</option>
                                    <option>Student</option>
                                </select>
                                </td></tr>
                                <tr><td><b>User Name:</b></td><td><input type="text" name="username" /></td></tr>
                                <tr><td><b>Password:</b></td><td><input type="password" name="userpass"/></td></tr>    
                                <tr><td></td><td><input type="submit" value="Sign in"/> <a href="register.jsp">Register</a></td></tr>
                            </table>
                        </form>
                    </div>
                </div>
            </div>
            
            <!--end of left content-->

            <div id="footer">&copy; 2024 Online Quizzes Solutions. All rights reserved.</div>

            <!-- Cookie policy modal -->
            <div id="cookieModal" class="modal">
                <div class="modal-content">
                    <p>This website uses cookies to ensure you get the best experience on our website.</p>
                    <button id="acceptCookiesBtn">Accept</button>
                    <button id="rejectCookiesBtn">Reject</button>
                </div>
            </div>

        </div> <!--end of center box-->
    </div> <!--end of main content-->
</div> <!--end of main container-->

<script>
    // JavaScript to handle cookie policy modal
    document.addEventListener("DOMContentLoaded", function() {
        var modal = document.getElementById('cookieModal');
        var acceptBtn = document.getElementById('acceptCookiesBtn');
        var rejectBtn = document.getElementById('rejectCookiesBtn');

        // Show the cookie policy modal
        modal.style.display = "block";

        // Handle Accept button click
        acceptBtn.onclick = function() {
            modal.style.display = "none";
            // Set cookie to indicate user accepted cookies
            document.cookie = "cookiesAccepted=true; expires=Fri, 31 Dec 9999 23:59:59 GMT; path=/";
        };

        // Handle Reject button click
        rejectBtn.onclick = function() {
            modal.style.display = "none";
            // Handle rejection, e.g., disable certain features or provide alternative functionality
        };
    });
</script>

</body>
</html>