<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>Forum</title>
       <meta charset="utf-8"/>
   <meta name="viewport" content="width=device-width,initial-state=1"/>
   <link type="text/css" rel="stylesheet" href="css/bootstrap.css"/>
      <link type="text/css" rel="stylesheet" href="css/header.css"/>

   <script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
   <script type="text/javascript" src="js/bootstrap.js"></script>

    <link href="https://s3.ap-south-1.amazonaws.com/captureit.ac/images/logo.jpg" rel="favicon icon">
    <style>   

.box {
    width:100%;
    border: 2px solid #dedede;
    background-color:white;
    border-radius: 5px;
    padding:0px 5px 5px 0px;
   box-shadow: 1px 2px 4px rgba(0, 0, 0, .5);
}
.box h3 {
    float: left;
    overflow:none;
    
   
}
.box usrnm {
 
   float:left;
   
}
</style>
    
</head>
<body style="background:whitesmoke;">
<% String uname1=(String)session.getAttribute("uname");
            	  if(uname1==null||uname1=="")
            	  {
            	  	response.sendRedirect("frontpage.jsp");
            	  }%>

<nav class="navbar navbar-inverse" id="header">
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

<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown"><img src="https://s3.ap-south-1.amazonaws.com/captureit.ac/images/trophy.png" style="width:25px;"><span style="margin-left: 5px;" class="caret"></span></a>
<ul class="dropdown-menu">
<li><a href="halloffame.jsp">Hall of Fame</a></li>

<li><a href="tpwid.jsp">Leaderboard</a></li>
<li><a href="cigallery.jsp">CI Gallery</a></li>
</ul>
</li>

<li ><a href="contests.jsp">Contests</a></li>
<li><a href="journal.jsp">Journal</a></li>
<li><a href="forum.jsp">Forum</a></li>

<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">My Account<span style="margin-left: 5px;" class="caret"></span></a>
<ul class="dropdown-menu">
<li><a href="mygallery.jsp"><img style="float: left;" src="https://s3.ap-south-1.amazonaws.com/captureit.ac/images/logo.jpg" class="img-responsive img-circle" width="20"><%=uname1%></a></li>

<li><a href="compprofile.jsp"><span  style="margin-right: 5px" class="glyphicon glyphicon-cog"></span>Settings</a></li>
<li><a href="redeemcredit.jsp">Redeem Credits</a></li>
</ul>
</li>

<li><a href="searchpage.jsp"><span class="glyphicon glyphicon-search"></span> Search</a></li>

<li><a href="logout.jsp"><span class="glyphicon glyphicon-log-out"></span> Log Out</a></li>


</ul>

</div>
      </div>
    </div>
   </nav> 
<br>
<div class="container-fluid">

<div id="myCarousel" class="carousel slide" data-ride="carousel">

 <div class="carousel-inner" role="listbox">

      <div class="item active" align="center">
        <img src="https://s3.ap-south-1.amazonaws.com/captureit.ac/images/forum12.jpg" alt="" style="width:95%;height: 440px;border-radius:10px;" >
        
      </div>
      <div class="carousel-caption" class="responsive">
              
        </div>
        
      </div>


</div>


</div>
<br>
<div class="container-fluid">

<div class="col-sm-2" align="center">
<div class="panel panel-primary" style="box-shadow: 1px 2px 4px rgba(0, 0, 0, .5);">
<div class="panel-heading">
<% String n=request.getParameter("value"); %>
<h4><%=n %></h4>
</div>
<br>
<span><b>--Asked By</b></span>
<div class="panel-body bg-danger" align="center" style="background:white">
<h1 style="width:100%;margin-top:-30px;">_______</h1>
<%
String picuname="";
String picname="";
try
{
Class.forName("com.mysql.jdbc.Driver");
Connection con3=DriverManager.getConnection("jdbc:mysql://captureitac.cxtvglcjxdhp.ap-south-1.rds.amazonaws.com:3306/captureit","akashroot","jaswant1971akash");
Statement st3=con3.createStatement();
ResultSet rs3=st3.executeQuery("select * from forum where question='"+n+"' ");
if(rs3.next())
{
	picuname=rs3.getString(1);
}
}
catch(Exception ee)
{
	System.out.println(ee);}%>
	<%
	try
	{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con3=DriverManager.getConnection("jdbc:mysql://captureitac.cxtvglcjxdhp.ap-south-1.rds.amazonaws.com:3306/captureit","akashroot","jaswant1971akash");
	Statement st3=con3.createStatement();
	ResultSet rs3=st3.executeQuery("select * from pimages where uname='"+picuname+"' ");
	if(rs3.next())
	{
		picname=rs3.getString(2);
	%>
<p><img src="https://s3.ap-south-1.amazonaws.com/captureit.ac/profilepictures/<%=rs3.getString(2) %>" class="img-responsive img-circle" style="border-radius:50%;width:120px;" /></p>
<%}
	}
	catch(Exception ee)
	{
		System.out.println(ee);
	}%>
<h1 style="width:100%;margin-top:-30px;">_______</h1>

<h3><a href="mpgs.jsp?value=<%out.print(picuname);%>"><%=picuname %></a></h3>
</div>
</div>
</div>
<div class="vl"></div>

<div class="col-sm-6" style="overflow:none;">
<%
String ques3= request.getParameter("value");  
String uname5=(String)session.getAttribute("uname");
ArrayList<String> image=new ArrayList();
ArrayList<String> cuname=new ArrayList();
ArrayList<String> comment=new ArrayList();
if(uname5==null||uname5=="")
{
	response.sendRedirect("frontpage.jsp");
}
       try
       {   
       Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://captureitac.cxtvglcjxdhp.ap-south-1.rds.amazonaws.com:3306/captureit","akashroot","jaswant1971akash");
	    Statement st=con.createStatement();
	    ResultSet rs1=st.executeQuery("select * from qforum where question='"+ques3+"' ");
	    while(rs1.next() )
	    {
	    	cuname.add(rs1.getString(3));
	    	comment.add(rs1.getString(2));
	    }
	    int i=0;
	    while(i<cuname.size())
	    {
	    	ResultSet rs4=st.executeQuery("select * from pimages where uname='"+cuname.get(i)+"' ");
	    	if(rs4.next())
	    	{
	    	image.add(rs4.getString(2));
	    	}
	    	i++;
	    	}
	    int j=0;
	    ResultSet rs2=st.executeQuery("select * from qforum where question='"+ques3+"' ");
	    while(rs2.next())
	    {
	    %>
	<div class="box" style="overflow:hidden;">
	<div class="col-sm-2" align="center">
	<a href="#"><img src="https://s3.ap-south-1.amazonaws.com/captureit.ac/profilepictures/<%=image.get(j) %>" class="img-responsive img-circle" style="width:30px;height:30px;margin-top:10px;margin-left:5px;"></a>
	<p class="usrnm" style="color:#E3AE57;font-family:courier;margin-top:10px;"><b><a style="color:#E3AE57"href="mpgs.jsp?value=<%=cuname.get(j)%>"><%=cuname.get(j) %></a></b></p>
	</div>
	<div class="col-sm-10">
	<h3 style="color:#F1684E;font-family:garamond;text-overflow:clip;margin-left:15px;">    <%=rs2.getString(2)%></h3>
	</div>
	<br><br><br>
	
	</div>
	<hr style="color:black;height:5px;margin:5px 0px 0px 5px;">
	
	    <%
	    j++;}
	    
	}
	catch(Exception e)
	{
		System.out.println(e);
	}
%> 
<form method ="post" action="qforum1.jsp">
  <h3>Your Comment</h3><br>
  <input type="text" name="comment" placeholder="Comment here" style="height:40px;border-radius:10px;width:100%;">
  <br><br>
  <input type="hidden" name="ques2" value='<%=ques3%>'>
   <input type="submit" value="Submit" class="btn btn-success btn-lg" style="width:120px;height:40px;border-radius:10px;">
</form>
</div>

<div class="col-sm-4">

<div class="panel panel-primary" style="box-shadow: 1px 2px 4px rgba(0, 0, 0, .5);">
<div class="panel-heading" style="text-align: center;">
<h3>Contact US</h3>
</div>
<div class="panel-body bg-danger" style="text-align: center;">

<b style="float:left;font-size:20px;">Say A Hi....</b>
<br>

 <form class="form-horizontal" method="post" action="contactus.action">
    
    <div class="col-sm-12">
    <div class="form-group">
     <input type="email" class="form-control" id="email" placeholder="Enter email" name="emailid1" style="border-radius:10px;height:50px;">
      </div>
      </div>
      <div class="col-sm-12">
      <div class="form-group">
     <input type="text" class="form-control" id="subject" placeholder="Subject" name="subject1" style="border-radius:10px;height:50px;">
      </div>
      </div>
      <div class="col-sm-12">
      <div class="form-group">
     <textarea rows="4" cols="50" name="msg1" style="border-radius:10px;border: 2px solid #dedede;width:98%;padding-top:10px;padding-left:10px;" placeholder="Your Message.."></textarea>
      </div>
      </div>
    </div>
   
    <div class="form-group">        
      <div style="margin-left: 16px;">
        <button type="submit" style="width: 98%" class="btn btn-success btn-lg">Contact Us</button>
      </div>
    </div>
  </form>

</div>
</div>
</div>
<div class="container-fluid navbar-default" style="margin:20px;">

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

<p style="font-size:20px;"><b>CaptureIt&copy;|2018</b></p>
</div>

</div>

</div>


</body>
</html>