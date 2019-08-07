<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html>
<html>
<head>
  <title>MY PROFILE</title>
       <meta charset="utf-8"/>
   <meta name="viewport" content="width=device-width,initial-state=1"/>
   <script src="https://code.jquery.com/jquery-2.2.4.js"></script>
   <link type="text/css" rel="stylesheet" href="css/bootstrap.css"/>
      <link type="text/css" rel="stylesheet" href="css/header.css"/>


    <script src="js/jquery.fancybox.min.js"></script>
    <link rel="stylesheet" type="text/css" href="js/jquery.fancybox.min.css">
   <script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
   <script type="text/javascript" src="js/bootstrap.js"></script>

    <link href="https://s3.ap-south-1.amazonaws.com/captureit.ac/images/logo.jpg" rel="favicon icon">
  <style>
  div.gallery {
    margin: 10px;
    border: 1px solid #ccc;
    float: left;
    width: 260px;
    border-radius:10px;
}

div.gallery:hover {
    border: 1px solid #777;
}

div.gallery img {
    width: 100%;
    height: 250px;
    border-radius:10px;
}

div.desc {
    padding: 15px;
    text-align: center;
    border-radius:10px;
}

main{
  width: 100%;
  margin:0px auto;
}


</style>
</head>
<body data-spy="scroll" data-target=".navbar" data-offset="50" style="background-color:whitesmoke;">
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
<li class="active"><a href="mygallery.jsp"><img style="float: left;" src="https://s3.ap-south-1.amazonaws.com/captureit.ac/images/logo.jpg" class="img-responsive img-circle" width="20"><%=uname1%></a></li>

<li ><a href="compprofile.jsp"><span  style="margin-right: 5px" class="glyphicon glyphicon-cog"></span>Settings</a></li>
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


<div id="myCarousel" class="carousel slide" data-ride="carousel">

 <div class="carousel-inner" role="listbox">
 <%
              try
              {
            	  
            	 
          	Class.forName("com.mysql.jdbc.Driver");
      		Connection con=DriverManager.getConnection("jdbc:mysql://captureitac.cxtvglcjxdhp.ap-south-1.rds.amazonaws.com:3306/captureit","akashroot","jaswant1971akash");
      	    Statement st=con.createStatement();
      	    ResultSet rs=st.executeQuery("select * from cpimages where uname = '"+uname1+"' ");
      	    if(rs.next() )
      	    { %>
      <div class="item active" align="center">
        <img src="https://s3.ap-south-1.amazonaws.com/captureit.ac/coverpicture/<%out.print(rs.getString(2)); %>" alt="" style="width:95%;height: 440px;border-radius:10px;">
        <% 
      	    }
      	    
      	    
              }
              catch(Exception e)
              {
            	  System.out.print(e);
              }
              %>  
        
      </div>
        
      </div>

<div class="carousel-caption" class="responsive">
<%
              try
              {
            	  
            	
          	Class.forName("com.mysql.jdbc.Driver");
      		Connection con=DriverManager.getConnection("jdbc:mysql://captureitac.cxtvglcjxdhp.ap-south-1.rds.amazonaws.com:3306/captureit","akashroot","jaswant1971akash");
      	    Statement st=con.createStatement();
      	    ResultSet rs=st.executeQuery("select * from pimages where uname = '"+uname1+"' ");
      	    if(rs.next() )
      	    { %>
              <img src="https://s3.ap-south-1.amazonaws.com/captureit.ac/profilepictures/<% out.print(rs.getString(2)); %>" class="gallery" class="img-responsive img-circle" style="width:150px;height:150px;margin-bottom: -100px;border-radius:50%;">
               <% 
      	    }
      	    
      	    
              }
              catch(Exception e)
              {
            	  System.out.print(e);
              }
              %>  
              
        </div>

</div>

</div>

<br><br><br>

<div class="container-fluid">
<div class="row">
<div class="col-sm-5">


</div>
<div class="col-sm-2"  align="center" style="font-size: 20px;">

<%=uname1 %>

</div>

<div class="col-sm-5">


</div>


</div>


</div>
<br><br>
<div class="container-fluid">
<div class="row">
<div class="col-sm-5">


</div>
<div class="col-sm-2"  align="center" style="font-size: 20px;overflow:none;">
<% 
try
{   
	   
Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://captureitac.cxtvglcjxdhp.ap-south-1.rds.amazonaws.com:3306/captureit","akashroot","jaswant1971akash");
 Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select * from photographer_details where uname='"+uname1+"'");
if(rs.next())
{
%>
<p><%=rs.getString(3) %></p>
<%
}}
catch(Exception ee)
{
System.out.println(ee);	

}

%>
</div>

<div class="col-sm-5">


</div>


</div>


</div>

<br><br>
  <div class="container-fluid" style="text-align: center;">
  <div class="row" style="text-align: center;">
   <div class="col-sm-4">

   </div>

   <nav class="nav navbar-default" style="background-color: whitesmoke;">
   <div class="col-sm-6" style="text-align: center;">

   <ul class="nav navbar-nav" style="text-align: center;font-size: 20px;">
      <li><a href="cigallery.jsp">CAPTUREIT GALLERY</a></li>
      <li class="active"><a href="mygallery.jsp"> MY GALLERY</a></li>
      
    </ul>


   </div>

   </nav>

   <div class="col-sm-2">
  </div>

  </div>

<br><br>
<div class="container-fluid">
<div class="row">
<div class="col-sm-4">


</div>
<div class="col-sm-4"  align="center" style="font-size: 15px;">
<a href="#" data-toggle="modal" data-target="#myModal" style="font-size:25px;color:black;text-decoration:none;"><span class="glyphicon glyphicon-film"></span>  Add to your Gallery</a>


<div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Add to your Gallery</h4>
        </div>
        <div class="modal-body">
        <p>First select image then click on Add button</p>
                   <form method="post" action="ggpic.action" enctype="multipart/form-data">
  <div class="form-group">
    
    <label style="cursor: pointer;font-size: 25px;">
    <input type="file" class="form-control" name="ggimage" id="fileupload" style="display:none;"><span class="glyphicon glyphicon-film" style="cursor: pointer;"></span> Click here to select an image</label>
    <br>
            <input type="submit" class="form-control" name="photoupload" id="fileupload" value="Add" style="width: 80%">


        

    </div>
</form>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
  </div>


</div>

<div class="col-sm-4">




</div>


</div>


</div>
<br><br>
<div class="container-fluid">
<main align="center"> 

       <%  
       String pic;
       ArrayList<String> ar=new ArrayList();
       try
       {   
       Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://captureitac.cxtvglcjxdhp.ap-south-1.rds.amazonaws.com:3306/captureit","akashroot","jaswant1971akash");
	    Statement st=con.createStatement();
	    ResultSet rs1=st.executeQuery("select * from usergg where uname = '"+uname1+"' ");
	    while(rs1.next() )
	    {
	    	ar.add(rs1.getString(2));
	    }
	    
	}
	catch(Exception e)
	{
		System.out.println(e);
	}

       for (int i = ar.size() - 1 ; i >= 0 ; i--) 
{
%> 
<div class="gallery">	    
 <a href="https://s3.ap-south-1.amazonaws.com/captureit.ac/gallerypictures/<% out.print(ar.get(i));%>" data-fancybox="images" data-caption="<%out.print(ar.get(i));%>">
   <img src="https://s3.ap-south-1.amazonaws.com/captureit.ac/gallerypictures/<% out.print(ar.get(i));%>" alt="<%out.print(ar.get(i));%>"/>
</a>
<!--  <input type="submit" value="Delete" class="btn btn-danger" style="margin:10px 0px 10px 0px;"> -->
<form method ="post" action="mygdelete.jsp">
    <input type="hidden" name="imgname" value='<%=ar.get(i)%>'>
   <input type="submit" value="Delete" class="btn btn-danger" style="margin:10px 0px 10px 0px;">
</form>
</div>
 <% } %>
</main>
</div>
<br><br><br>
<br>
<div class="container-fluid navbar-default">

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
