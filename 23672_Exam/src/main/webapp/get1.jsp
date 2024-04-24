<%@ page language="java" import="java.sql.*" pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*" %>

<%! static int totalScore = 0; %>

<%
String userAnswerr = request.getParameter("radio");
String correctAnswerPage = request.getParameter("answer");
int totalMarks = (int) session.getAttribute("totalMarks");
int totalUserMarks = (int) session.getAttribute("totalUserMarks");

if (userAnswerr != null && userAnswerr.equals(correctAnswerPage)) {
    totalUserMarks++;
}
totalMarks++;
session.setAttribute("totalMarks", totalMarks);
session.setAttribute("totalUserMarks", totalUserMarks);


if (session.getAttribute("totalMarks") != null) {
   
    
    try {
        String tempQuestion = (String) session.getAttribute("question");
    	String[] tempQstnArr = tempQuestion.split(",");
    	List<String> excludedQuestions = new ArrayList<>();
    	for(String str : tempQstnArr){
    	  excludedQuestions.add(str);
    	}
    	String specificSubject =(String) session.getAttribute("subject");
    	StringBuilder sql = new StringBuilder("SELECT * FROM quizques WHERE question NOT IN (");
    	        String placeholders = String.join(", ", java.util.Collections.nCopies(excludedQuestions.size(), "?"));
    	        sql.append(placeholders);
    	        sql.append(") AND subject = ? LIMIT 1");
    	
    	
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/quizz_application", "root", "london");
        
        PreparedStatement ps = con.prepareStatement(sql.toString());
        System.out.println(sql.toString());
        
        int index = 1;
        for (String question : excludedQuestions) {
            ps.setString(index++, question);
        }
        ps.setString(index, specificSubject);
        
        ResultSet rs = ps.executeQuery();
        
        if (rs.next()) {
            String question = (String) session.getAttribute("question")+","+ rs.getString("question");
            String option1 = rs.getString("option1");
            String option2 = rs.getString("option2");
            String option3 = rs.getString("option3");
            String option4 = rs.getString("option4");
            String answer = rs.getString("answer");
            
            // Debug: Print out the retrieved question
            System.out.println("Retrieved question: " + question);
            
            // Set question and options in session
            session.setAttribute("question", question);
            session.setAttribute("option1", option1);
            session.setAttribute("option2", option2);
            session.setAttribute("option3", option3);
            session.setAttribute("option4", option4);
            session.setAttribute("answer", answer);
        } else {
            System.out.println("No question found for count: ");
        }
        PreparedStatement countStatement = con.prepareStatement("SELECT COUNT(*) FROM quizques WHERE subject=?");
        countStatement.setString(1, specificSubject);
      
        ResultSet countResultSet = countStatement.executeQuery();
      int count = 0;
      if(countResultSet.next()){
          count = (int) countResultSet.getInt(1);
      }
      if(count == totalMarks){
    	  %>
          <jsp:forward page="result.jsp"></jsp:forward>
          <%
        
      } else{
    	  %>
          <jsp:forward page="start.jsp"></jsp:forward>
          <%
        
      }
        
        con.close();
      
        
    }
    catch (Exception e) {
        e.printStackTrace();
    }
}
%>
<jsp:forward page="get.jsp"></jsp:forward>






















