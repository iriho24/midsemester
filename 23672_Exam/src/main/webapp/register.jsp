<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Registration Form</title>
<link rel="stylesheet" type="text/css" href="styleindex.css">
<script src="script.js"></script>
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
        background-color: #fff; /* White middle box */
        padding: 40px 20px;
        text-align: center;
        border-radius: 10px;
        box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
    }

    .middle_box_title {
        font-size: 24px;
        margin-bottom: 20px;
    }

    /* Styles for form */
    form {
        text-align: left;
    }

    form table {
        margin: 0 auto;
    }

    form input[type="text"],
    form input[type="password"],
    form select {
        width: 100%;
        padding: 10px;
        margin-bottom: 10px;
        border: 1px solid #ccc;
        border-radius: 5px;
        box-sizing: border-box;
    }

    form input[type="submit"] {
        width: auto;
        background-color: #3498db; /* Blue button */
        color: #fff; /* White text */
        padding: 10px 20px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        transition: background-color 0.3s;
    }

    form input[type="submit"]:hover {
        background-color: #2980b9; /* Darker blue on hover */
    }
</style>
</head>
<body style="background-color: #f4f7f6;">
<div id="main_container">
    <div class="main_content">
        <div id="header"> Registration Form</div>
        <!-- Navigation Menu -->
        <div id="menu_tab">
            <ul class="menu">
                <li><a href="home.jsp" class="nav">Home</a></li>
                <li class="divider"></li>
                <li><a href="takequiz.jsp" class="nav">Take Quiz</a></li>
                <li class="divider"></li>
                <li><a href="makequiz.jsp" class="nav">Make quiz</a></li>
                <li class="divider"></li>
                <li><a href="register.jsp" class="nav">Registration</a></li>
            </ul>
        </div> 

        <!-- Registration Form -->
        <div class="middle_box">
            <div class="middle_box_text_content">
                <div class="middle_box_title">Registration Form</div>
                <form method="post" action="registerprocess.jsp" name="registrationForm">
                    <table>
                        <tr><td><b>User Name:</b></td><td><input type="text" name="username" onkeyup="sendInfo()"/></td></tr>
                        <tr><td><b>Password:</b></td><td><input type="password" name="userpass"/></td></tr>
                        <tr><td><b>Category:</b></td><td><select name="category">
                            <option value="">Select a Category</option>
                            <option value="Teacher">Teacher</option>
                            <option value="Student">Student</option>
                        </select></td></tr>
                        <tr><td><b>Email:</b></td><td><input type="text" name="email"/></td></tr>
                        <tr><td></td><td><input type="submit" value="Register"/></td></tr>
                    </table>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>
