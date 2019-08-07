<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ taglib uri="/struts-tags" prefix="s" %>
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
	<title>CONTESTS</title>
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
      width:23%;
      height: 450px;
      margin: auto 10px 10px auto;
    float: left;
    overflow: hidden;
    border-radius:10px;
    transform: : scale(1.13);
    transition: transform 0.3s;
    border-radius: 10px;
     box-shadow: 0 2px 2px #efefef;
     
}

div.gallery:hover {
    transform:scale(1.03);
}

div.gallery img{
    
    width: 95%;
    margin-top: -10px;
    height: 280px;
    border-radius:10px;
}

div.desc {
    font-size: 18px;
    padding: 10px;
    height:120px;
    text-align: center;
    border-radius:10px;

} 

main{
  width: 90%;
  margin-left:5%;
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
<body style="background-color:lightgrey;">
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

<li class="active"><a href="contests.jsp">Contests</a></li>
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
 <div class="container-fluid">

<div id="myCarousel" class="carousel slide" data-ride="carousel">

 <div class="carousel-inner" role="listbox">

      <div class="item active">
        <img src="https://s3.ap-south-1.amazonaws.com/captureit.ac/images/comp1.jpg" alt="" style="width:100%;height: 350px;border-radius: 10px;">
        
      </div>
      <div class="carousel-caption" class="responsive">
              
        </div>
        
      </div>


</div>


</div>
<br><br>
<div class="container-fluid">
<main align="center">

<%  
       
       
       try
       {   int flag=0;
       Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://captureitac.cxtvglcjxdhp.ap-south-1.rds.amazonaws.com:3306/captureit","akashroot","jaswant1971akash");
	    Statement st=con.createStatement();
	    ResultSet rs1=st.executeQuery("select * from contestpost ");
	    while(rs1.next() )
	    {
	    	flag=1;
	  

       %>
<div class="gallery" align="center">	    
     
     <div class="desc"><span class="text"><b><%=rs1.getString(1)%> </b></span></div>
   <img src="https://s3.ap-south-1.amazonaws.com/captureit.ac/competetion/<%=rs1.getString(2)%>"/>
   <a href="#" data-toggle="modal" data-target="#<%=rs1.getString(4)%>" class="btn btn-success" style="margin:10px 0px 10px 0px;">Read More</a>
   
</div>

<div class="modal fade" id="<%=rs1.getString(4)%>" role="dialog">

    <div class="modal-dialog modal-lg">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        
          <h4 class="modal-title"><%=rs1.getString(1)%></h4>
        </div>
        <div class="modal-body" align="center">
          
           <img src="https://s3.ap-south-1.amazonaws.com/captureit.ac/competetion/<%=rs1.getString(2)%>" class="img-responsive" style="height: 300px;width: 100%;border-radius: 10px;">
          <br><br>
       <%=rs1.getString(3)%>
              
         <br><br>
                <a href="register.jsp?value=<%=rs1.getInt(4)%> "" class="btn btn-success btn-lg" style="margin: 10px 0px 10px 0px;"> Register Now</a>
                <a href="entries.jsp?value=<%=rs1.getString(4) %>" class="btn btn-success btn-lg" style="margin: 10px 0px 10px 0px;"> Check All Entries</a>



        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
  </div>




<%   }
	   if(flag==0)
	   {
		   %>
		   
	 <center><h3>More Competetions Coming Soon.</h3></center> 	   
		   <%
		   
	   }
	}
	catch(Exception e)
	{
		System.out.println(e);
	}
       %>

</main>

</div>
<br>	
<div class="container-fluid navbar-default">

<div class="row" style="box-shadow: 1px 2px 4px rgba(0, 0, 0, .5);background-color:grey;">
<div class="col-sm-3" align="center">
<h2></h2>




</div>
<div class="col-sm-2" align="center">

<ul class="list-inline" style="margin:25px;">

<li class="list-group-item" style="background-color:grey;border:0px;"><a href="https://www.facebook.com/captureit1/" style="text-decoration: none;"><img src="https://s3.ap-south-1.amazonaws.com/captureit.ac/images/facebook.png" width="50"></a></li>



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