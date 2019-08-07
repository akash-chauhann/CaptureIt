<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="/struts-tags" prefix="s"%>
    <%@ page import="java.sql.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>LeaderBoard</title>
	 <meta charset="utf-8"/>
   <meta name="viewport" content="width=device-width,initial-state=1"/>
   <link type="text/css" rel="stylesheet" href="css/bootstrap.css"/>
  <link type="text/css" rel="stylesheet" href="css/header.css"/>
  <link type="text/css" rel="stylesheet" href="css/profile-card.css">
   <script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
   <script type="text/javascript" src="js/bootstrap.js"></script>
       <link href="https://s3.ap-south-1.amazonaws.com/captureit.ac/images/logo.jpg" rel="favicon icon">       
</head>
<body style="background-color: grey;">
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

<li><a href="contests.jsp">Contests</a></li>
<li><a href="journal.jsp">Journal</a></li>
<li><a href="forum.jsp">Forum</a></li>

<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">My Account<span style="margin-left: 5px;" class="caret"></span></a>
<ul class="dropdown-menu">
<li><a href="mygallery.jsp"><img style="float: left;" src="https://s3.ap-south-1.amazonaws.com/captureit.ac/images/logo.jpg" class="img-responsive img-circle" width="20"><%=uname1 %></a></li>

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

<div class="container-fluid">

<div class="row" style="margin-left: 0px;margin-top: 10px;">

<div class="col-sm-2">
<div  class="profile-card">

<h3><%=uname1%></h3>
  <%
              try
              {
            	  String credits="";
            	  String uname=(String)session.getAttribute("uname");
            	  if(uname==null||uname=="")
            	  {
            	  	response.sendRedirect("frontpage.jsp");
            	  }
            	  else
            	  {
          	Class.forName("com.mysql.jdbc.Driver");
      		Connection con=DriverManager.getConnection("jdbc:mysql://captureitac.cxtvglcjxdhp.ap-south-1.rds.amazonaws.com:3306/captureit","akashroot","jaswant1971akash");
      	    Statement st=con.createStatement();
      	ResultSet rs1=st.executeQuery("select * from sign_up_details where uname='"+uname+"'");
      	if(rs1.next())
      	{
      		credits=rs1.getString(7);
      	}
      	  ResultSet rs=st.executeQuery("select * from pimages where uname = '"+uname+"' ");
      	    if(rs.next() )
      	    { %>
<img src="https://s3.ap-south-1.amazonaws.com/captureit.ac/profilepictures/<%=rs.getString(2) %>" class="img-responsive img-circle">
<br>
<p> Your Credits : <b><%=credits %></b></p>
  <% 
      	    }
      	    
      	    }
      	    
              }
              catch(Exception e)
              {
            	  System.out.print(e);
              }
              %>
<hr>

<ul class="nav">

</ul>
</div>

<div class="left-links">
<div class="panel-group" id="accordion">
  <div class="panel panel-default" style="border-radius: 0px;">
    <div class="panel-heading">
      <h4 class="panel-title">
        <a  href="contests.jsp">
        EVENTS</a>
      </h4>
    </div>
    
  </div>

  <div class="panel panel-default" style="border-radius: 0px;">
    <div class="panel-heading">
      <h4 class="panel-title">
        <a  href="journal.jsp">
        BLOG</a>
      </h4>
    </div>
    
    </div>
    <div class="panel panel-default" style="border-radius: 0px;">
    <div class="panel-heading">
      <h4 class="panel-title">
        <a  href="mygallery.jsp">
        MY GALLERY</a>
      </h4>
    </div>
    
  </div>
  </div>



    </div>
</div>

<div class="col-sm-8">
<br><br>
<table class="table table-bordered" id="leaderboard_table">
    <thead>
      <tr>
        <th>Rank</th>
        <th>Username</th>
        <th>Credits</th>
      </tr>
    </thead>
   <%      try
              {
            	  
          	Class.forName("com.mysql.jdbc.Driver");
      		Connection con=DriverManager.getConnection("jdbc:mysql://captureitac.cxtvglcjxdhp.ap-south-1.rds.amazonaws.com:3306/captureit","akashroot","jaswant1971akash");
      	    Statement st=con.createStatement();
      	    ResultSet rs=st.executeQuery("select * from sign_up_details order by credits desc limit 10 ");
      	  int i=1;
      	    while(rs.next())
      	   {
      	   %>
    <tbody style="overflow:none;">
    
      <tr>
        <td><%out.print(i); i++; %></td>
        <td><%=rs.getString(2) %></td>
        <td><%=rs.getString(7) %></td>
      </tr>
    </tbody>
    <%}}
    catch(Exception ee)
    {
    	
    }%>
  </table>



</div>

<div class="col-sm-2">

<div class="sidebar">

<h4>EVENTS</h4>
<img src="https://s3.ap-south-1.amazonaws.com/captureit.ac/images/cont.png" class="img-responsive">
<a href="contests.jsp" style="margin-top: 20px;margin-bottom: 10px;" class="btn btn-success">Read More</a>


</div>


<div class="sidebar">

<h4> BLOG</h4>
<img src="https://s3.ap-south-1.amazonaws.com/captureit.ac/images/bl.png" class="img-responsive">
<a href="journal.jsp" style="margin-top: 20px;margin-bottom: 10px;" class="btn btn-success">Read More</a>


</div>

<div class="sidebar">
   

<h4>CI Gallery</h4>

<img src="https://s3.ap-south-1.amazonaws.com/captureit.ac/images/logo.jpg" class="img-responsive">
<a href="cigallery.jsp" style="margin-top: 20px;margin-bottom: 10px;" class="btn btn-success">Read More</a>


</div>

</div>


</div>




</div>
<div class="container-fluid navbar-default">

<div class="row" style="box-shadow: 1px 2px 4px rgba(0, 0, 0, .5);background-color: lightgrey;">
<div class="col-sm-3" align="center">





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