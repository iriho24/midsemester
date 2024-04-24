<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="UTF-8">
<title>Online Quiz</title>
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
</style>
</head>
<body>
  
<div id="main_container">
    <div class="main_content">
        <div id="header">Online Quiz</div>
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
                    <li><a href="logout.jsp" class="nav">Logout</a></li>
                </ul>
            </div>  
            <div class="middle_box">
                <div class="middle_box_text_content">
                    <div class="middle_box_title"></div>
                    <p class="middle_text"></p>
                </div>
           
