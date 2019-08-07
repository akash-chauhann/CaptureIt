<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	 <meta charset="utf-8"/>
   <meta name="viewport" content="width=device-width,initial-state=1"/>
   <link type="text/css" rel="stylesheet" href="css/bootstrap.css"/>
   <link type="text/css" rel="stylesheet" href="css/header.css">
   <script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
   <script type="text/javascript" src="js/bootstrap.js"></script>
       <link href="https://s3.ap-south-1.amazonaws.com/captureit.ac/images/logo.jpg" rel="favicon icon"> 
       <title>Blog</title>
       <style type="text/css">
         
       #blog-post{
            background-color: lightgrey;
            width:80%;
            margin-left:10%;
       }

       #blog-post .text{
        padding: 0 8px;
       }

       #i-frame{
        display: block;
       margin-left:10%;
       }
       .item img{
             width: 100%;
             height: 400px;
       }

        @media only screen and (max-width:767px){
               
               #blog-post{
                  width:100%;
                  margin-left: 0;

               }
               #i-frame{
                 display: none;
               }
            .item img{
                height: 300px;
            }   
}
       </style>
      
       
</head>
<body style="background:#f4f4f4;">
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
<li class="active"><a href="journal.jsp">Journal</a></li>
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

<% String n=request.getParameter("value"); 
%>
</ul>

</div>
      </div>
   
   </nav>             	

<% 
try{
	String un="";
	String para="";
	 String uname2=(String)session.getAttribute("uname");
	  if(uname2==null||uname2=="")
	  {
	  	response.sendRedirect("frontpage.jsp");
	  }
	ArrayList<String> a0=new ArrayList<String>(); 
	Class.forName("com.mysql.jdbc.Driver");
      		Connection con=DriverManager.getConnection("jdbc:mysql://captureitac.cxtvglcjxdhp.ap-south-1.rds.amazonaws.com:3306/captureit","akashroot","jaswant1971akash");
      	    Statement st=con.createStatement();
      	    ResultSet rs=st.executeQuery("select * from artimagesdisplay where picid='"+n+"' ");
      	  aa: while(rs.next())
      	  {
      		  a0.add(rs.getString(2));
      	  }
      	    int i=0;

%><div class="container-fluid" id="blog-post">
    <div class="row">
    <div class="col-sm-8">
     <div id="myCarousel" class="carousel slide" data-ride="carousel">

    <div class="carousel-inner" role="listbox">
<% while(i<a0.size()){ 
if(i==0){
%>
      <div class="item active">
        <img src="https://s3.ap-south-1.amazonaws.com/captureit.ac/artimages/<% out.print(a0.get(i));  i++; %>" alt="">
        <div class="carousel-caption">
          <h3 style="margin-bottom: 10px;"></h3>
          </div>
      </div>
<%}  else{%>
      <div class="item">
        <img src="https://s3.ap-south-1.amazonaws.com/captureit.ac/artimages/<% out.print(a0.get(i));  i++; %>" alt=""  >
        <div class="carousel-caption">
          <h3 style="margin-bottom: 10px;"></h3>
         

        </div>
      </div>

     
  <%} }%>
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
 
<%
Class.forName("com.mysql.jdbc.Driver");
      		Connection con1=DriverManager.getConnection("jdbc:mysql://captureitac.cxtvglcjxdhp.ap-south-1.rds.amazonaws.com:3306/captureit","akashroot","jaswant1971akash");
      	    Statement st1=con.createStatement();
      	    ResultSet rs1=st.executeQuery("select * from artimagesdisplay where picid='"+n+"' ");
      	    if(rs1.next()){
      	     un=rs1.getString(1);
      	  para=rs1.getString(5);
      	    %>
      	    
      	   
<br>
<p class="text"><%=rs1.getString(7) %></p>
     
   
     
     <h4 class="text"><b><%=rs1.getString(4) %></b></h4>

     <p class="text" style="color:grey"><%=rs1.getString(3) %>
     </p>
     <br>
    <% Class.forName("com.mysql.jdbc.Driver");
      		Connection con2=DriverManager.getConnection("jdbc:mysql://captureitac.cxtvglcjxdhp.ap-south-1.rds.amazonaws.com:3306/captureit","akashroot","jaswant1971akash");
      	    Statement st2=con.createStatement();
      	    ResultSet rs2=st.executeQuery("select * from pimages where uname='"+un+"' ");
      	    if(rs2.next()){
     %><p>
     
     <img src="https://s3.ap-south-1.amazonaws.com/captureit.ac/profilepictures/<%=rs2.getString(2) %><%} %>" class="img-responsive" style="width:80px;border-radius: 50%;float: left"><p style="margin-left:10px;margin-top: 25px;">Written By <a href="mpgs.jsp?value=<%=un%> " style="text-decoration: none;color:red"><%=un%></a></p>
    
     </p>	
     <br><br>

     <p class="text"> 
      
    <%=para %>
     </p>
     <%}}
catch(Exception ee)
{
System.out.println(ee);	
}%>
     <br><br>


     </div>	
     <br>
     <div class="col-sm-4" >
        

<iframe id="i-frame" src="http://www.facebook.com/plugins/likebox.php?href=http%3A%2F%2Fwww.facebook.com%2Fcaptureit1&width=300&colorscheme=light&show_faces=true&border_color&stream=true&header=true&height=700" scrolling="yes" style="border:none; overflow:hidden; width:80%; height:700px; background: white; float:left;margin:20px 0px 0px 0px; " allowtransparency="true" frameborder="0"></iframe>

</div>

  </div>
  </div>   
     
    
  <div class="container-fluid navbar-default" style="margin-top:10px; ">

<div class="row" style="box-shadow: 1px 2px 4px rgba(0, 0, 0, .5);background-color: grey;">
<div class="col-sm-3" align="center">
<h2></h2>




</div>
<div class="col-sm-2" align="center">

<ul class="list-inline" style="margin:25px;">

<li class="list-group-item" style="background-color: grey;border:0px;"><a href="https://www.facebook.com/captureit1/" style="text-decoration: none;"><img src="https://s3.ap-south-1.amazonaws.com/captureit.ac/images/facebook.png" width="50"></a></li>



</ul>

</div>
<div class="col-sm-2" style="text-align: center;">
<ul class="list-inline" style="margin:16px;">


<li class="list-group-item" style="background-color:grey;border:0px;"><a href="https://www.youtube.com/channel/UCt2yRIhXnRY8ovUDIAdh0eA" style="text-decoration: none;"><img src="https://s3.ap-south-1.amazonaws.com/captureit.ac/images/youtube.png" width="70"></a></li>



</ul>


</div>

<div class="col-sm-2" style="text-align:center;">
<ul class="list-inline" style="margin:25px;">

<li class="list-group-item" style="background-color:grey;border:0px;"><a href="https://www.instagram.com/captureitteam/" style="text-decoration: none;"><img src="https://s3.ap-south-1.amazonaws.com/captureit.ac/images/instagram.png" width="50"></a></li>


</ul>
</div>
</div>
<div class="row" style="background-color:grey;">
<div class="col-sm-12" style="text-align:center;">

<p style="font-size:20px;"><b>CaptureIt&copy;|2018</b></p>
</div>

</div>

</div>
    
    
    
    
</body>
</html>