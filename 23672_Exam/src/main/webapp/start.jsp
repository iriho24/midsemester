<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<html>
<head>
<script>
var request;
function get1(){
window.location='get1.jsp';
}
function get(){
var v=document.getElementsByName('radio').value;
window.location="get.jsp?ans="+v;
}
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
<style>
.next-button {
    background-color: #1a237e; /* Dark Blue color */
    color: white;
    border: none;
    padding: 10px 20px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    margin: 4px 2px;
    cursor: pointer;
    border-radius: 5px;
}
</style>
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

<div class="">
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
    <div style="display: flex; justify-content: center;">
        <div style="position: absolute; width: 60%; margin: 0 20%; height: 400px; background-color: white; padding: 20px; border-radius: 10px;">
            <div>
                <h1 style="text-align: center; margin: 10px 0;">Quiz Application System</h1>
                <marquee direction="left" style="color: navy;" onmouseover="stop()" onmouseout="start()">
                    <B>Assess Yourself by taking quizzes on various subject</B>
                </marquee>
                <form method="post" action="get1.jsp" style="display: flex; justify-content: center;">
                    <table>
                        <tr>
                            <td style="padding:10px 0;">
                                <% 
                                    String question=(String)session.getAttribute("question");
                                    String option1= (String)session.getAttribute("option1");
                                    String option2= (String)session.getAttribute("option2");
                                    String option3= (String)session.getAttribute("option3");
                                    String option4= (String)session.getAttribute("option4");
                                    String answer= (String)session.getAttribute("answer");
                                    int i = (int) session.getAttribute("totalMarks");
                                    //out.print(question.split(",")[i]);
                                    out.print(i==0 ? question: question.split(",")[i]);
                                %>
                                <%
                                if((String)request.getParameter("radio")!=null){
                                    String ans=(String)request.getParameter("radio");
                                    //System.out.println("ans on set"+ans);
                                    session.setAttribute("ans",ans);
                                } %>
                            </td>
                        </tr>
                        <tr><td><input type="radio" name="radio" id="option1" value="<%=option1%>" required/><label for="option1"> <%=option1%></label></td></tr>
                        <tr><td><input type="radio" name="radio" id="option2" value="<%=option2%>" required/><label for="option2"> <%=option2%></label></td></tr>
                        <tr><td><input type="radio" name="radio" id="option3" value="<%=option3%>" required/><label for="option3"> <%=option3%></label></td></tr>
                        <tr><td><input type="radio" name="radio" id="option4" value="<%=option4%>" required/><label for="option4"> <%=option4%></label></td></tr>
                        <tr><td><input type="hidden" value="<%=answer%>" name="answer" id="answer" /></td></tr>
                        <tr><td></td><td><input type="submit" value="Next" class="next-button"/></td></tr>
                    </table>
                </form>
            </div>
        </div>
    </div>
</div>

<div id="footer">
</div>

</body>
</html>
