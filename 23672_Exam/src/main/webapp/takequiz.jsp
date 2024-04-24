<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<html>
<head>
<script>
var request;
function sendInfo()
{
var v=document.myform.subject.value;
var url="findname2.jsp?val="+v;
if(window.XMLHttpRequest){
request=new XMLHttpRequest();
}
else if(window.ActiveXObject){
request=new ActiveXObject("Microsoft.XMLHTTP");
}
try
{
request.onreadystatechange=getInfo;
request.open("GET",url,true);
request.send();
}
catch(e){alert("Unable to connect to server");}
}

function getInfo(){
if(request.readyState==4){
var val=request.responseText;
document.getElementById('location').innerHTML=val;
}
}
function viewAll(name)
{
var v=name;
var url="findname3.jsp?val="+v;

if(window.XMLHttpRequest){
request=new XMLHttpRequest();
}
else if(window.ActiveXObject){
request=new ActiveXObject("Microsoft.XMLHTTP");
}
try
{
request.onreadystatechange=viewInfo;
request.open("GET",url,true);
request.send();
}
catch(e){alert("Unable to connect to server");}
}

function viewInfo(){
if(request.readyState==4){
var val=request.responseText;
document.getElementById('location').innerHTML=val;
}
}
</script>
</head>

<jsp:include page="header.jsp"></jsp:include>

<%
String islogin=(String)session.getAttribute("islogin");
if(islogin==null){
request.setAttribute("notlogin_msg","Sorry,Please do Login first");
%>
<jsp:forward page="index.jsp"></jsp:forward>
<%
}
%>

<div style="display: flex; justify-content: center;">
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
</div>

<div style="width: 60%; margin-top: 20px; background-color: white; padding: 20px; border-radius: 10px; text-align: center;">
    <h1>Quiz Application System</h1>
    <marquee direction="left" style="color: navy;" onmouseover="stop()" onmouseout="start()">
        <B>Assess Yourself by taking quizzes on various subjects</B>
    </marquee>
    <form method="post" name="myform" action="get.jsp">
        Enter the subject<br><input type="text" name="subject" onkeyup="sendInfo()" style="width:50%; padding:10px; margin:15px 0"/>
        <div id="location"></div>
    </form>
</div>

<div id="footer">
</div>

</body>
</html>
