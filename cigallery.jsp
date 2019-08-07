<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html>
<html>
<head>
  <title>CI Gallery</title>
       <meta charset="utf-8"/>
   <meta name="viewport" content="width=device-width,initial-state=1"/>
   <script src="https://code.jquery.com/jquery-2.2.4.js"></script>
   <link type="text/css" rel="stylesheet" href="css/bootstrap.css"/>
   <link type="text/css" rel="stylesheet" href="css/header.css">
   <link type="text/css" rel="stylesheet" href="css/ciconmygallery.css">

    <script src="js/jquery.fancybox.min.js"></script>
    <link rel="stylesheet" type="text/css" href="js/jquery.fancybox.min.css">
   <script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
   <script type="text/javascript" src="js/bootstrap.js"></script>

    <link href="images/logo.jpg" rel="favicon icon">
  <style type="text/css">
    *{
    margin: 0;
    padding: 0;
    box-sizing: border-box;
  }
  .text{ 
      font-weight: 300; 
    font-size:90%;
    word-spacing:2px;
    text-align:center;
    margin-bottom: 30px;
    letter-spacing: 1px;
    
}
    .text:after{
    display:block;
    height:2px;
    background-color: #e67e22;
    content:" ";
    width:130px;
    margin:0 auto;
    margin-top:10px;
}   
  div.gallery {
    background: white;
    border: 1px solid grey;
      width:22%;
      height: 380px;
      margin: auto 15px 10px 10px;
    float: left;
    overflow: hidden;
    border-radius:10px;
    border-radius: 10px;
     
}
div.gallery img{
    
    width: 100%;
    height: 280px;
    top-border-radius:10px;
}

div.desc {
    font-size: 18px;
    padding: 10px;
    text-align: center;
    border-radius:10px;

} 

main{
  width: 100%;
  margin:0;
}
.col-sm-4{
  margin-top: 0;
}
@media only screen and (max-width:1200px){
  

  div.gallery{

       width:30.66%;
  }
}
@media only screen and (max-width:892px){

div.gallery{
    width:46%;
}
}
@media only screen and (max-width:616px){

  main{
      width: 80%;
      margin-left: 10%;
  }
  div.gallery{
      width:92%;
  }
  .col-sm-4{
    margin-top: 10px; 
  }

}
@media only screen and (max-width:468px){
    main{
      width: 90%;
      margin-left: 5%;
    }
    div.gallery{
       width:90%;
    }
    .col-sm-4{
      margin-top: 10px;
    }
}
   
  </style>
</head>
<body data-spy="scroll" data-target=".navbar" data-offset="50" style="background-color:lightgrey;">

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
        <a href="#"><img src="images/logo.jpg"  class="complogo"></a>
      <p  class="ding-dong">CAPTURE IT<br><span class="ding-ding">#SPEAKWITHYOURPHOTOGRAPHS</span> </p>
        

      </div>
    <div class="collapse navbar-collapse" id="navbar">

<ul class="nav navbar-nav navbar-right" id="main-nav">

<li class="dropdown" class="active"><a href="#" class="dropdown-toggle" data-toggle="dropdown" ><img src="images/trophy.png" style="width:25px;"><span style="margin-left: 5px;" class="caret"></span></a>
<ul class="dropdown-menu">
<li><a href="halloffame.jsp">Hall of Fame</a></li>

<li><a href="tpwid.jsp">Leaderboard</a></li>
<li class="active"><a href="cigallery.jsp">CI Gallery</a></li>
</ul>
</li>

<li><a href="contests.jsp">Contests</a></li>
<li><a href="journal.jsp">Journal</a></li>
<li><a href="forum.jsp">Forum</a></li>

<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">My Account<span style="margin-left: 5px;" class="caret"></span></a>
<ul class="dropdown-menu">
<li><a href="mygallery.jsp"><img style="float: left;" src="images/logo.jpg" class="img-responsive img-circle" width="20"><s:property value="#session.uname"/></a></li>

<li><a href="compprofile.jsp"><span  style="margin-right: 5px" class="glyphicon glyphicon-cog"></span>Settings</a></li>
<li><a href="redeemcredit.jsp">Redeem Credits</a></li>
</ul>
</li>

<li><a href="#"><span class="glyphicon glyphicon-search"></span> Search</a></li>

<li><a href="logout.jsp"><span class="glyphicon glyphicon-log-out"></span> Log Out</a></li>


</ul>

</div>
      </div>
    </div>
   </nav> 
<br>
<div class="container-fluid" style="margin-top:-10px;">


 <div class="col-sm-8" class="carousel-inner" role="listbox">

      <div class="item active">
        <img src="images/cig.jpg" alt="" style="width:100%;height: 350px;border-radius:10px;">
        
      </div>
        
      </div>
<div class="col-sm-4" style="background:white;height:350px;border-radius:10px;" align="center">
<form method="post" action="cigallery.action" enctype="multipart/form-data">

<br><br>
<input type="hidden" name="uname" value="<%=uname1%>">
<textarea rows="4" cols="50" name="captionci" placeholder="Enter description" style="border-radius:5px;border: 2px solid #dedede;width: 260px;"></textarea>
<br><br><br>
        <label style="cursor: pointer;font-size: 15px;"><input type="file" class="form-control" name="cigimage" id="fileupload" style="display:none;" multiple><span class="glyphicon glyphicon-camera" style="cursor: pointer;"></span> Select The Picture</label>
       <br><br><br><input type="submit" value="submit" onclick="alert('Your Picture Was submitted')" class="btn btn-success btn-lg">
</form> 

</div>

</div>


</div>

<br><br>

<div class="container-fluid">
<div class="row">
<div class="col-sm-5">


</div>
<div class="col-sm-2"  align="center" style="font-size: 20px;">



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

   <nav class="nav navbar-default" style="background-color: lightgrey;">
   <div class="col-sm-6" style="text-align: center;">

   <ul class="nav navbar-nav" style="text-align: center;font-size: 20px;">
      <li class="active"><a href="cigallery.jsp">CAPTUREIT GALLERY</a></li>
      <li ><a href="mygallery.jsp"> MY GALLERY</a></li>
      
    </ul>


   </div>

   </nav>

   <div class="col-sm-2">
  </div>

  </div>

<br><br>
<div class="container-fluid">
<div class="row">
<div class="col-sm-12">

<main align="center" > 

       <%  
       String pic;
       ArrayList<String> ar=new ArrayList();
       ArrayList<String> caption=new ArrayList();
       ArrayList<String> uname=new ArrayList();
       ArrayList<String> profile=new ArrayList();
       try
       {   
       Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://captureitac.cxtvglcjxdhp.ap-south-1.rds.amazonaws.com:3306/captureit","akashroot","jaswant1971akash");
	    Statement st=con.createStatement();
	    ResultSet rs1=st.executeQuery("select * from cigallery");
	    while(rs1.next() )
	    {
	    	ar.add(rs1.getString(2));
	    caption.add(rs1.getString(3));
	    uname.add(rs1.getString(1));
	    }
	    int k=0;
		while(k<uname.size())
		{
			ResultSet rs2=st.executeQuery("select * from pimages where uname='"+uname.get(k)+"'");
				if(rs2.next())
				{
					profile.add(rs2.getString(2));
				}
				k++;
		}
	
	}
	catch(Exception e)
	{
		System.out.println(e);
	}

       for (int j = ar.size() - 1 ; j >= 0 ; j--)   
       {  
%> 
<div class="gallery">	    
 <a href="cig/<%=ar.get(j)%>" data-fancybox="images" data-caption="<%=caption.get(j) %>">
   <img src="cig/<%=ar.get(j)%>" alt="<%=ar.get(j)%>" class="cigallery-img"/>
</a>
<a href="mpgs.jsp?value=<%=uname.get(j)%>"><img src="userpp/<%=profile.get(j) %>" style="width:80px;height:80px;border-radius:50%;margin-top:-50px;"></a>
<div class="desc"><%=uname.get(j) %></div>
</div>

 <% } %>
</main>
</div>
</div>
</div>
<br><br><br>
<br>
  <div class="container-fluid navbar-default" style="background:grey;margin-top:15px;">

<div class="row" style="box-shadow: 1px 2px 4px rgba(0, 0, 0, .5);">
<div class="col-sm-3" align="center">





</div>
<div class="col-sm-2" align="center">

<ul class="list-inline" style="margin:25px;">

<li class="list-group-item" style="background-color: grey;border:0px;"><a href="https://www.facebook.com/captureit1/" style="text-decoration: none;"><img src="images/facebook.png" width="50"></a></li>



</ul>

</div>
<div class="col-sm-2" style="text-align: center;">
<ul class="list-inline" style="margin:16px;">


<li class="list-group-item" style="background-color: grey;border:0px;"><a href="https://www.youtube.com/channel/UCt2yRIhXnRY8ovUDIAdh0eA" style="text-decoration: none;"><img src="images/youtube.png" width="70"></a></li>



</ul>


</div>

<div class="col-sm-2" style="text-align:center;">
<ul class="list-inline" style="margin:25px;">

<li class="list-group-item" style="background-color: grey;border:0px;"><a href="https://www.instagram.com/captureit.officiall/?hl=en" style="text-decoration: none;"><img src="images/instagram.png" width="50"></a></li>


</ul>
</div>
</div>
<div class="row" style="background-color:grey;">
<div class="col-sm-12" style="text-align:center;">

<p style="font-size:20px;color:black;"><b>CaptureIt&copy;|2018</b></p>
</div>

</div>

</div>


</body>
</html>
