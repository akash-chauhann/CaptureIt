<%@page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	 <meta charset="utf-8"/>
   <meta name="viewport" content="width=device-width,initial-state=1"/>
   <script src="https://code.jquery.com/jquery-2.2.4.js"></script>
   <link type="text/css" rel="stylesheet" href="css/bootstrap.css"/>
   <link type="text/css" rel="stylesheet" href="css/cssfilesofrestpages.css">
   <link rel="stylesheet" type="text/css" href="css/header.css">

    <script src="js/jquery.fancybox.min.js"></script>
    <link rel="stylesheet" type="text/css" href="js/jquery.fancybox.min.css">
   <script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
   <script type="text/javascript" src="js/bootstrap.js"></script>
	
	<title>Hall Of Fame</title>
  <link href="https://s3.ap-south-1.amazonaws.com/captureit.ac/images/logo.jpg" rel="favicon icon">  
	</head>
<body>


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
 <div class="container-fluid" style="background-color: #fff" id="hofpic">

<div id="myCarousel" class="carousel slide" data-ride="carousel">

 <div class="carousel-inner" role="listbox">

      <div class="item active">
        <img src="https://s3.ap-south-1.amazonaws.com/captureit.ac/images/hof.jpg" alt="" id="hofimg">
        
      </div>
      <div class="carousel-caption" class="responsive">
              
        </div>
        
      </div>


</div>


</div>
<br><br>
<%
ArrayList<String> compname=new ArrayList();
ArrayList<String> position=new ArrayList();
ArrayList<String> uname=new ArrayList();
ArrayList<String> pics=new ArrayList();
ArrayList<String> ppics=new ArrayList();
try
{
Class.forName("com.mysql.jdbc.Driver");
Connection con1=DriverManager.getConnection("jdbc:mysql://captureitac.cxtvglcjxdhp.ap-south-1.rds.amazonaws.com:3306/captureit","akashroot","jaswant1971akash");
Statement st1=con1.createStatement();
ResultSet rs=st1.executeQuery("select * from hof");
while(rs.next())
{
	compname.add(rs.getString(1));
	position.add(rs.getString(2));
	uname.add(rs.getString(3));
}

int j=0;
while(j<uname.size())
{
	ResultSet rs1=st1.executeQuery("select * from compentries_approve where uname='"+uname.get(j)+"' and compname='"+compname.get(j)+"'");
		while(rs1.next())
		{
			pics.add(rs1.getString(3));
		}
		j++;
}
int l=0;
while(l<uname.size())
{
	ResultSet rs1=st1.executeQuery("select * from pimages where uname='"+uname.get(l)+"'");
		if(rs1.next())
		{
			ppics.add(rs1.getString(2));
		}
		l++;
}


}
catch(Exception ee)
{
System.out.println(ee);	
}
%>

<%for (int k =0 ; k <ppics.size() ; k++) { %>
<div class="container-fluid" style="background-color: #f4f4f4;">

<h2><%=compname.get(k) %></h2>

<div class="row" id="hofwinners">

<div class="col-sm-4">


<main align="center" >
<div class="gallery">
    
 <a href="https://s3.ap-south-1.amazonaws.com/captureit.ac/compentries/<%=pics.get(k) %>" data-fancybox="images" data-caption="">
   <img src="https://s3.ap-south-1.amazonaws.com/captureit.ac/compentries/<%=pics.get(k) %>" alt=""/>
</a>
<div align="center">
       <a href="mpgs.jsp?value=<%=uname.get(k)%>"><img src="https://s3.ap-south-1.amazonaws.com/captureit.ac/profilepictures/<%=ppics.get(k) %>" style="width: 100px;height: 100px;margin-top:-50px;margin-bottom:10px;border-radius:50%;"></a>
       <br>
       <a href="mpgs.jsp?value=<%=uname.get(k)%>" style="text-decoration: none;color: black;"><%=uname.get(k)%></a>
</div>	
<div class="desc"><%=position.get(k)%><%k++; %></div>




</div>
</main>
</div>
<div class="col-sm-4" style="margin-bottom:30px;" >


<main align="center">

<div class="gallery">
    
  <a href="https://s3.ap-south-1.amazonaws.com/captureit.ac/compentries/<%=pics.get(k) %>" data-fancybox="images" data-caption="">
   <img src="https://s3.ap-south-1.amazonaws.com/captureit.ac/compentries/<%=pics.get(k) %>" alt=""/>
</a>
<div align="center">
 <a href="mpgs.jsp?value=<%=uname.get(k)%>"><img src="https://s3.ap-south-1.amazonaws.com/captureit.ac/profilepictures/<%=ppics.get(k) %>" style="width: 100px;height: 100px;margin-top:-50px;margin-bottom:10px;border-radius:50%;"></a>
       <br>
      <a href="mpgs.jsp?value=<%=uname.get(k)%>" style="text-decoration: none;color: black;"><%=uname.get(k)%></a>
</div>	
<div class="desc"><%=position.get(k)%><%k++; %></div>




</div>
</main>
</div>
<div class="col-sm-4" style="margin-bottom:30px;">


<main align="center">
<div class="gallery">
    
  <a href="https://s3.ap-south-1.amazonaws.com/captureit.ac/compentries/<%=pics.get(k) %>" data-fancybox="images" data-caption="">
   <img src="https://s3.ap-south-1.amazonaws.com/captureit.ac/compentries/<%=pics.get(k) %>" alt=""/>
</a>
<div align="center">
       <a href="mpgs.jsp?value=<%=uname.get(k)%>"><img src="https://s3.ap-south-1.amazonaws.com/captureit.ac/profilepictures/<%=ppics.get(k) %>" style="width: 100px;height: 100px;margin-top:-50px;margin-bottom:10px;border-radius:50%;"></a>
       <br>
       <a href="mpgs.jsp?value=<%=uname.get(k)%>" style="text-decoration: none;color: black;"><%=uname.get(k)%></a>
</div>	
<div class="desc"><%=position.get(k)%></div>




</div>
</main>
</div>




</div>



</div>
<%
}
%>
<div class="container-fluid navbar-default" style="background:lightgrey;margin-top:15px;">

<div class="row" style="box-shadow: 1px 2px 4px rgba(0, 0, 0, .5);">
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
<div class="row" style="background-color:lightgrey;">
<div class="col-sm-12" style="text-align:center;">

<p style="font-size:20px;color:black;"><b>CaptureIt&copy;|2018</b></p>
</div>

</div>

</div>


</body>
</html>