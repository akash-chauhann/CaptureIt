
   
    <%@page import="java.sql.*" %>
     <%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.amazonaws.auth.AWSStaticCredentialsProvider" %>
<%@page import="com.amazonaws.auth.BasicAWSCredentials" %>
<%@page import="com.amazonaws.services.s3.AmazonS3" %>
<%@page import="com.amazonaws.services.s3.AmazonS3ClientBuilder" %>
<%@page import="com.amazonaws.services.s3.model.DeleteObjectRequest" %>
    
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
	
	String imgname=request.getParameter("imgname");       
       try
       {   
    	   
       Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://captureitac.cxtvglcjxdhp.ap-south-1.rds.amazonaws.com:3306/captureit","akashroot","jaswant1971akash");
	    Statement st=con.createStatement();
	    st.executeUpdate("delete from usergg where gimagesrc='"+imgname+"' and uname='"+s2+"'");	   
	    BasicAWSCredentials awsCreds = new BasicAWSCredentials("AKIAJG3CX3NELPMXADCQ", "GFgQRApgP5T/plu22K7WeQrI/WdZRkEXZCCsXtg/");
	  	AmazonS3 s3Client = AmazonS3ClientBuilder.standard()
	  							.withRegion("ap-south-1")
	  	                        .withCredentials(new AWSStaticCredentialsProvider(awsCreds))
	  	                        .build();
	  	String keyName="cig"+"/"+imgname;;
	  	 s3Client.deleteObject(new DeleteObjectRequest("captureit.ac", keyName));
	    //response.sendRedirect("qforum.jsp?value="+ques2);
	   %>
	   
	   <jsp:forward page="mygallery.jsp">
	   <jsp:param value="" name=""/>
	   
	   
	   </jsp:forward>
	   
	   
	   <%
	   
	   
	}
	catch(Exception e)
	{
		System.out.println(e);
	}
       
}
      
%> 
</body>
</html>