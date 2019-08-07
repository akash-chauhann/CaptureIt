<%@page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 <meta charset="utf-8"/>
   <meta name="viewport" content="width=device-width,initial-state=1"/>
   <link type="text/css" rel="stylesheet" href="css/bootstrap.css"/>
      <link type="text/css" rel="stylesheet" href="css/header.css"/>
   
   <script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
   <script type="text/javascript" src="js/bootstrap.js"></script>
  <link href="https://s3.ap-south-1.amazonaws.com/captureit.ac/images/logo.jpg" rel="favicon icon">
<title>Forgot Password</title>
  
     <style>
  div.gallery {
  	background: white;
   margin:10px 0px 0px 10px;
    border: 1px solid #ccc;
    width: 100%;
    box-shadow: 1px 2px 4px rgba(0, 0, 0, .5);
    
}

div.gallery:hover {
    border: 1px solid #777;
}

div.gallery img {
    width: 100%;
    height: 200px;
   
}

div.desc {
	font-size: 18px;
    padding: 15px;
    text-align: center;
    
}

main{
  	
  width: 80%;
  margin-left:8%;
}
.col-sm-4{

margin:0;
padding:0;
box-sizing:border-box;

}
.col-sm-8{

margin:0;
padding:20px;
box-sizing:border-box;

}
#footer{

margin-top:20px;
}
</style>
</head>
<body>

<nav class="navbar navbar-inverse" style="margin-bottom:0;" id="header">
    <div class="container-fluid">
      <div class="navbar-header">
        <button type="button" class="navbar-toggle collapsed" class="navbar-btn" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
          <span class="sr-only">Toggle navigation</span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
        </button>
        <a href="#"><img src="https://s3.ap-south-1.amazonaws.com/captureit.ac/images/logo.jpg"  class="complogo"></a>
      <p  class="ding-dong">CAPTURE IT<br><span class="ding-ding">#SPEAKWITHYOURPHOTOGRAPHS</span> </p>
        

      </div>
   <div class="collapse navbar-collapse" id="navbar">
   <ul class="nav navbar-nav navbar-right" id="main-nav">
     <li><a href="frontpage.jsp">Home</a></li>
   
   </ul>
   </div>
      </div>
   </nav>
<% String usp=request.getParameter("usp");
String pp="";
String cp="";
try{
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://captureitac.cxtvglcjxdhp.ap-south-1.rds.amazonaws.com:3306/captureit","akashroot","jaswant1971akash");
Statement st=con.createStatement();
ResultSet rs1=st.executeQuery("select * from pimages where uname='"+usp+"'");
if(rs1.next())
	pp=rs1.getString(2);
ResultSet rs2=st.executeQuery("select * from cpimages where uname='"+usp+"'");
if(rs2.next())
	cp=rs2.getString(2);
ResultSet rs=st.executeQuery("select * from sign_up_details where uname='"+usp+"'");
if(rs.next())
{
	
%>
  <div class="container-fluid" style="margin-top:30px;">
  <div class="row">
  <div class="col-sm-4">
       <main align="center">
<div class="gallery" align="center">	    
     
     
   <img src="https://s3.ap-south-1.amazonaws.com/captureit.ac/coverpicture/<%=cp%>"/><br>
  <img src="https://s3.ap-south-1.amazonaws.com/captureit.ac/profilepictures/<%=pp%>" style="width:80px;height:80px;margin-top:-50px;border-radius:50%;"><br>
  <div class="desc"><b><%=usp %></b></div>
   <a href="forgotp.jsp"  class="btn btn-success" style="margin: 10px 0px 10px 0px;">Not You ?</a>
   
</div>
    </main>
  </div>
  
  <div class="col-sm-6" style="background:lightgrey;">
<H4>Answer The Following Questions Correctly To Reset Your Password</H4>
 <form class="form-horizontal" method="post" action="forgotp2.jsp"> 
      <div class="form-group"> 
     <label style="margin:10px 0px 10px 20px;" class="control-label" for="securityques">Security Question:</label><br>
       <label style="margin:10px 0px 10px 20px;" class="control-label" for="1stques">Q:What is your first pet's name? (Answer In One Word)</label><br>
       <div class="col-sm-12">
       <input type="text" class="form-control" id="1stques" name="ques1" id="1stques" placeholder="answer only in one word.." required>
        </div>
     </div> 
     <div class="form-group"> 
       <label style="margin:10px 0px 10px 20px;" class="control-label" for="2ndques">Q:Which is your favourite camera ?(Answer In One Word)</label><br>
       <div class="col-sm-12">
       <input type="text" class="form-control" id="1stques" name="ques2" id="1stques" placeholder="answer only in one word.." required>
        </div>
     </div>
     <input  type="hidden" name="usp" value='<%=usp%>'> 
 <div class="form-group" align="center">        
      <div style="margin-left: 16px;">
        <button type="submit" style="width: 90%;margin:10px 5px 0px 5px;" class="btn btn-success btn-lg">Submit</button>
      </div>
    </div>
  </form>
  </div>
  <div class="col-sm-2">
  </div>
</div>
</div>
<%}
else {
	%>
	<div class="container" style="margin-top:30px;">
	<div class="row">
	<div class="col-sm-2">
	</div>
	<div class="col-sm-8" style="background:lightgrey;" align="center">
	    
	<h3 style="color:red">Sorry The USername You Entered Does not exist.</h3>
	<a href="forgotp.jsp" class="btn btn-danger" style="margin:20px 0px 20px 0px;">Enter Username Again</a>
	</div>
	<div class="col-sm-2">
	</div>
	</div>
	</div>
<%}}
catch(Exception ee)
{
System.out.println(ee);	
}%>
<div class="container-fluid navbar-default" id="footer">

<div class="row" style="box-shadow: 1px 2px 4px rgba(0, 0, 0, .5);background-color: lightgrey;">
<div class="col-sm-3" align="center">
<h2></h2>




</div>


<div class="col-sm-2" align="center">

<ul class="list-inline" style="margin:25px;">

<li class="list-group-item" style="background-color: lightgrey;border:0px;"><a href="https://www.facebook.com/captureit1/" style="text-decoration: none;"><img src="https://s3.ap-south-1.amazonaws.com/captureit.ac/images/facebook.png" width="50"></a></li>



</ul>

</div>
<div class="col-sm-2" style="text-align: center;">
<ul class="list-inline" style="margin:16px;">


<li class="list-group-item" style="background-color: lightgrey;border:0px;"><a href="https://www.youtube.com/channel/UCt2yRIhXnRY8ovUDIAdh0eA" style="text-decoration: none;"><img src="https://s3.ap-south-1.amazonaws.com/captureit.ac/images/youtube.png" width="70"></a></li>



</ul>


</div>

<div class="col-sm-2" style="text-align:center;">
<ul class="list-inline" style="margin:25px;">

<li class="list-group-item" style="background-color: lightgrey;border:0px;"><a href="https://www.instagram.com/captureitteam/" style="text-decoration: none;"><img src="https://s3.ap-south-1.amazonaws.com/captureit.ac/images/instagram.png" width="50"></a></li>


</ul>
</div>
</div>
<div class="row" style="background-color: lightgrey;">
<div class="col-sm-12" style="text-align:center;">

<p style="font-size:20px;"><b>CaptureIt©|2018</b></p>
</div>

</div>

</div>

</body>
</html>