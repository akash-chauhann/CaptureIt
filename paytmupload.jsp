<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC"-//W3C//DTD xHTML 1.0 Transitional//EN" "http://www.w3org/TR/xhtml1/DTD/xhtml-transitional dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link href="https://s3.ap-south-1.amazonaws.com/captureit.ac/images/logo.jpg" rel="favicon icon">
<title>Register for comptetion</title>
     <meta charset="utf-8"/>
   <meta name="viewport" content="width=device-width,initial-state=1"/>
   <link type="text/css" rel="stylesheet" href="css/header.css">
      <link type="text/css" rel="stylesheet" href="css/bootstrap.css"/>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.8.2.js"></script>
   <link rel="stylesheet" type="text/css" href="jquery.fancybox.min.css">
   <script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
    
   <script type="text/javascript" src="js/bootstrap.js"></script>
     
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
	<script type="text/javascript">
	
   $(function() {
    var imagesPreview = function(input, placeToInsertImagePreview) {

        if (input.files) {
            var filesAmount = input.files.length;

            for (i = 0; i < filesAmount; i++) {
                var reader = new FileReader();

                reader.onload = function(event) {
                    $($.parseHTML('<img style="width:250px;height:250px;float:left;margin-left:5px;margin-bottom:5px;" class="img-responsive">')).attr('src', event.target.result).appendTo(placeToInsertImagePreview);
                }

                reader.readAsDataURL(input.files[i]);
            }
        }

    };

    $('#gallery-photo-add').on('change', function() {
        imagesPreview(this, 'div.gallery');
    });
});




</script>
</head>
<body>
<%
int flag=0;
String uname1=(String)session.getAttribute("uname");
            	  if(uname1==null||uname1=="")
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
	
	ResultSet rs1=st1.executeQuery("select * from compentries_approve where compname='"+compname+"' and uname='"+uname1+"'");
	if(rs1.next())
	{
	    flag=1;
	}
	}
	}
catch(Exception ee)
{
	
System.out.println(ee);}
	

%>


    <div class="container-fluid">

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

</div>

</div>
 
<br>
<%if (flag==1) {
%>
<center><h4><b>You Cannot Register Twice For a Competetion</b></h4></center>
<%} %>
<%if (flag==0){ %>
<div class="container" style="background:lightgrey;padding:40px 20px 40px 20px;border-radius:10px;">

<form method="post" action="comppaytm.action" enctype="multipart/form-data">
<div class="form-group">

<input type="text" class="form-control" name="us2name" placeholder="Enter your username..">


</div>


<div class="form-group">

<input type="text" class="form-control" name="paytmno" placeholder="Enter your paytm no">


</div>
<div class="form-group">
<input type="text" class="form-control" name="compname2" value='<%=compname%>' readonly>
</div>

<div class="form-group">
      <label for="comment">Caption:</label>
      <textarea class="form-control" name="compcaption2"rows="5" id="comment"></textarea>
    </div>
<br><br>    
            <label style="cursor: pointer;font-size: 15px;">
            <input type="file" name="compimage2"multiple id="gallery-photo-add" style="display: none;" /><span class="glyphicon glyphicon-film" style="cursor: pointer;"></span> Click Here To Add Your Masterpiece</label>
            <br>
            <p>You have to add only two photos. One is your entry for the competition and other is your payment screenshot.</p>
           <div class="container-fluid">

          <div class="gallery" class="col-sm-12" ></div>
          </div>
          <button type="submit" class="btn btn-success">POST</button>






</form>
  
 
</div>
<%} %>
<br><br>
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

<p style="font-size:20px;"><b>CaptureIt©|2018</b></p>
</div>

</div>

</div>




</body>
</html>