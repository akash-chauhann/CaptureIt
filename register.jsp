<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8"/>
   <meta name="viewport" content="width=device-width,initial-state=1"/>
   <link type="text/css" rel="stylesheet" href="css/bootstrap.css"/>
   <script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
   <script type="text/javascript" src="js/bootstrap.js"></script>

    <link href="https://s3.ap-south-1.amazonaws.com/captureit.ac/images/logo.jpg" rel="favicon icon">
	<title>Register for comptetion</title>
</head>
<body>
<% String n=request.getParameter("value"); %>
	<% String uname1=(String)session.getAttribute("uname");
            	  if(uname1==null||uname1=="")
            	  {
            	  	response.sendRedirect("frontpage.jsp");
            	  }%>
	<div class="container-fluid">

<nav class="nav navbar-inverse">

<div class="navbar-header" style="margin-left: 40px;">


<a href="#"><img src="https://s3.ap-south-1.amazonaws.com/captureit.ac/images/logo.jpg" class="img-responsive img-circle" width="100"></a>


</div>
<div class="navbar-header">

<a href="#" class="navbar-brand"><h3 style="margin-top: 5px;">CAPTURE IT</h3>
<small>#SPEAKWITHYOURPHOTOGRAPHS</small>
</a>
<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#joker" style="margin-top: 40px;margin-right: 0px;">
  <span class="icon-bar"></span>
    <span class="icon-bar"></span>
    <span class="icon-bar"></span>

</button>


</div>

<div class="collapse navbar-collapse" id="joker">

<ul class="nav navbar-nav navbar-right" style="margin-top: 25px;margin-right: 20px;">

<li style="margin-right: 20px" class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown"><img src="https://s3.ap-south-1.amazonaws.com/captureit.ac/images/trophy.png" style="width:25px;"><span style="margin-left: 5px;" class="caret"></span></a>
<ul class="dropdown-menu">
<li><a href="halloffame.jsp">Hall of Fame</a></li>

<li><a href="tpwid.jsp">Leaderboard</a></li>
<li><a href="cigallery.jsp">CI Gallery</a></li>
</ul>
</li>

<li class="active" style="margin-right: 20px"><a href="contests.jsp">Contests</a></li>
<li style="margin-right: 20px"><a href="journal.jsp">Journal</a></li>
<li style="margin-right: 20px"><a href="forum.jsp">Forum</a></li>



<li style="margin-right: 20px" class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">My Account<span style="margin-left: 5px;" class="caret"></span></a>
<ul class="dropdown-menu">
<li><a href="mygallery.jsp"><img style="float: left;" src="https://s3.ap-south-1.amazonaws.com/captureit.ac/images/logo.jpg" class="img-responsive img-circle" width="20"><%=uname1 %></a></li>

<li><a href="compprofile.jsp"><span  style="margin-right: 5px" class="glyphicon glyphicon-cog"></span>Settings</a></li>
<li><a href="redeemcredit.jsp">Redeem Credits</a></li>
</ul>
</li>

<li style="margin-right: 10px;"><a href="searchpage.jsp"><span class="glyphicon glyphicon-search"></span> Search</a></li>

<li><a href="logout.jsp"><span class="glyphicon glyphicon-log-out"></span> Log Out</a></li>


</ul>

</div>

</nav>

</div>

</div>
 <br>

<div class="container-fluid">

<div class="row">

<div class="col-sm-6" align="center">


<h1 style="color:blue">Credits</h1>


<img src="https://s3.ap-south-1.amazonaws.com/captureit.ac/images/credit.png" class="img-responsive" style="width:45%;height:250px;border-radius:50%;">

<br><p><b>You'll be charged with 200 credits if you participate in the competetion using credits.      </b></p>
<br><a href="creditupload.jsp?value=<%=n%> "class="btn btn-success btn-lg" style="margin: 10px 0px 10px 0px;"> Pay With Credits</a>














</div>

<div class="col-sm-6" align="center">
<h1 style="color:blue">PAYtm</h1>


<img src="https://s3.ap-south-1.amazonaws.com/captureit.ac/images/qr1.jpg" class="img-responsive" style="width:55%;height:250px;border-radius: 10px;">

<br>

<p style="font-size: 25px;"><b>Scan QR code and pay the registration fee to register</b></p>
<p><b>You Will have to pay 50 INR to CaptureIt's Paytm Number and upload the screenshot of transaction and your Entry in the form given in next page. Once our team will approve the transaction
your Entry will be uploaded and 20 CaptureIt credits will be added to your account which you can redeem later.   </b></p>
<br>
 <a href="paytmupload.jsp?value=<%out.print(n);%> " class="btn btn-success btn-lg" style="margin: 10px 0px 10px 0px;">Pay With Paytm</a>
</div>


</div>	
</div>

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