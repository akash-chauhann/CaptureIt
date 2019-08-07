<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
	 <meta charset="utf-8"/>
   <meta name="viewport" content="width=device-width,initial-state=1"/>
   <script src="https://code.jquery.com/jquery-2.2.4.js"></script>
   <link type="text/css" rel="stylesheet" href="css/bootstrap.css"/>
   <link type="text/css" rel="stylesheet" href="css/header.css">

    <script src="js/jquery.fancybox.min.js"></script>
    <link rel="stylesheet" type="text/css" href="js/jquery.fancybox.min.css">
   <script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
   <script type="text/javascript" src="js/bootstrap.js"></script>

    <link href="https://s3.ap-south-1.amazonaws.com/captureit.ac/images/logo.jpg" rel="favicon icon">
	<title>Entries</title>
	<style>
.coontainer-fluid{
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}	
.comp-name{
width:85%;
	font-size: 30px;font-weight:200;height: 200px;background: lightgrey;position: relative;
}

.comp-name span{
	 position: absolute;top:50%;left:50%;transform: translate(-50%,-50%);font-family:"Courier New", Courier, monospace;
}

  div.gallery {
  	background: white;
    margin: 10px;
    border: 1px solid #ccc;
    float: left;
    width: 23%;
     border-radius:10px;
     height: 350px;
}

div.gallery:hover {
    border: 1px solid #777;
}

div.gallery img {
    width: 100%;
    height: 250px;
     top-border-radius:10px;
}

div.desc {
    padding: 15px;
    text-align: center;
}

main{
  width: 90%;
 margin-left: 5%;

}

@media only screen and (max-width:767px){
	.comp-name {
	    width:100%;
		font-size: 22px;
		padding: 0 2%;	

      }

      main{
      	width: 100%;
      	margin-left: 0;
      }

      div.gallery{
      	  width: 46%;
      }
     
}
@media only screen and (max-width:468px){
	 main{
	 	width: 96%;
	 	margin-right: 2%;
	 }
	 div.gallery{
            width: 100%;
	 }
}

</style>
</head>

<body style="background-color:#232B2B;">
	<% String uname2=(String)session.getAttribute("uname");
            	  if(uname2==null||uname2=="")
            	  {
            	  	response.sendRedirect("frontpage.jsp");
            	  }%>
<% String n=request.getParameter("value"); 
System.out.println(n);
String compname="";
try
{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con1=DriverManager.getConnection("jdbc:mysql://captureitac.cxtvglcjxdhp.ap-south-1.rds.amazonaws.com:3306/captureit","akashroot","jaswant1971akash");
	Statement st1=con1.createStatement();
	ResultSet rs=st1.executeQuery("select * from contestpost where contestid='"+n+"'");
	if(rs.next())
	{
		compname=rs.getString(1);
		System.out.println(compname);
	}
	}
catch(Exception ee)
{
	
System.out.println(ee);}
	

%>
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
<li><a href="mygallery.jsp"><img style="float: left;" src="https://s3.ap-south-1.amazonaws.com/captureit.ac/images/logo.jpg" class="img-responsive img-circle" width="20"><%=uname2%></a></li>

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
 

<div class="container-fluid" style="margin-top:0;" align="center">
<p class="comp-name"><span style=""><b><%=compname %></b></span></p>

<br><br>

<main align="center"> 
<% 

ArrayList<String> image=new ArrayList();
ArrayList<String> uname1=new ArrayList();
ArrayList<String> desc=new ArrayList();
ArrayList<String> profile=new ArrayList();
try
{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con1=DriverManager.getConnection("jdbc:mysql://captureitac.cxtvglcjxdhp.ap-south-1.rds.amazonaws.com:3306/captureit","akashroot","jaswant1971akash");
	Statement st1=con1.createStatement();
	ResultSet rs=st1.executeQuery("select * from compentries_approve where compname='"+compname+"'");
	while(rs.next())
	{
		image.add(rs.getString(3));
		desc.add(rs.getString(4));
		String uname=rs.getString(1);
		uname1.add(uname);
		
}
	int j=0;
	while(j<uname1.size())
	{
		ResultSet rs1=st1.executeQuery("select * from pimages where uname='"+uname1.get(j)+"'");
			if(rs1.next())
			{
				profile.add(rs1.getString(2));
			}
			j++;
	}
}
catch(Exception ee)
{
	System.out.println(ee);
	}
	for (int k = image.size() - 1 ; k >= 0 ; k--) 
{
%>
      
<div class="gallery">	    
 <a href="https://s3.ap-south-1.amazonaws.com/captureit.ac/compentries/<%=image.get(k) %>" data-fancybox="images" data-caption="<%=desc.get(k) %>">
   <img src="https://s3.ap-south-1.amazonaws.com/captureit.ac/compentries/<%=image.get(k) %>" alt=""/>
</a>
<div align="center">
       <a href="mpgs.jsp?value=<%=uname1.get(k)%>"><img src="https://s3.ap-south-1.amazonaws.com/captureit.ac/profilepictures/<%=profile.get(k) %>" style="width: 80px;height: 80px;margin-top:-40px;border-radius: 50%;"></a>
       <br>
       <a href="mpgs.jsp?value=<%=uname1.get(k)%>" style="text-decoration: none;color: black;"><%=uname1.get(k) %></a>
</div>	
</div>
<%} %>


</main>

</div>

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