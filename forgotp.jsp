<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	 <meta charset="utf-8"/>
   <meta name="viewport" content="width=device-width,initial-state=1"/>
   <link type="text/css" rel="stylesheet" href="css/bootstrap.css"/>
      <link type="text/css" rel="stylesheet" href="css/header.css"/>
   
   <script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
   <script type="text/javascript" src="js/bootstrap.js"></script>
       <link href="https://s3.ap-south-1.amazonaws.com/captureit.ac/images/logo.jpg" rel="favicon icon">

<title>Forgot Password</title>
  <style>
   
   #footer{
             position:fixed;left:0;bottom:0;width:100%;
       
   }
  @media only screen and (max-width:768px){
    
    #footer{
                   position:relative;
    }
    
  }
  
  
  
  
  </style>

</head>
<body style="background-color:white;">



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
     <li><a href="frontpage.jsp">Home</a></li>
   
   </ul>
   </div>
      </div>
   </nav>
<br><br>
<div class="container">
<div class="col-sm-3">
</div>
<div class="col-sm-6">
<div class="panel panel-primary" style="box-shadow: 1px 2px 4px rgba(0, 0, 0, .5);">
<div class="panel-heading" style="text-align: center;">
<h3>FORGOT PASSWORD</h3>
</div>
<div class="panel-body bg-danger" style="text-align: center;">

<b style="float:left;font-size:20px;">Enter Your Username</b>
<br>

 <form class="form-horizontal" method="post" action="forgotp1.jsp">
    
     
    <div class="col-sm-12">
    <div class="form-group">
     <input type="text" class="form-control" id="email" placeholder="Enter Username" name="usp" style="border-radius:10px;height:50px;width:98%;margin:0px 5px; 0px 5px;">
      </div>
      </div>
     
 <div class="form-group" align="center">        
      <div style="margin-left: 16px;">
        <button type="submit" style="width: 90%;margin:10px 5px 0px 5px;" class="btn btn-success btn-lg">Submit</button>
      </div>
    </div>
  </form>

</div>
</div>
</div>
<div class="col-sm-3">
</div>
</div>
<br><br>
<div class="container-fluid navbar-default" id="footer">

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