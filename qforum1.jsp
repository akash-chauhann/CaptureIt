<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%   String uname1=(String)session.getAttribute("uname");
if(uname1==null||uname1=="")
{
	response.sendRedirect("frontpage.jsp");
}
else
{
	
	String s2=(String)session.getAttribute("uname"); 
	
	String ques2=request.getParameter("ques2");
	String comment=request.getParameter("comment");
       
       try
       {   
    	   
       Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://captureitac.cxtvglcjxdhp.ap-south-1.rds.amazonaws.com:3306/captureit","akashroot","jaswant1971akash");
	    Statement st=con.createStatement();
	   st.executeUpdate("insert into qforum values('"+ques2+"','"+comment+"','"+s2+"')");
	   response.sendRedirect("qforum.jsp?value="+ques2);
	   
	   
	}
	catch(Exception e)
	{
		System.out.println(e);
	}
       
}
      
%> 

</body>
</html>