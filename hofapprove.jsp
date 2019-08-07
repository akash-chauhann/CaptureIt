<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

     <meta charset="utf-8"/>
   <meta name="viewport" content="width=device-width,initial-state=1"/>
      <link type="text/css" rel="stylesheet" href="css/bootstrap.css"/>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.8.2.js"></script>
   <link rel="stylesheet" type="text/css" href="jquery.fancybox.min.css">
   <script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
    
   <script type="text/javascript" src="js/bootstrap.js"></script>
     
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<title>Insert title here</title>
</head>
<body>
<br>

<nav class="navbar navbar-default" style="background-color: whitesmoke;border:0px;font-size: 18px;">
  <div class="container-fluid">
    <div class="navbar-header">
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>                        
      </button>
      
    </div>
    <div>
      <div class="collapse navbar-collapse" id="myNavbar">
        <ul class="nav navbar-nav">
           <li><a href="adminrecords.jsp">Admin Records</a></li>
          <li><a href="aprovecompetetion.jsp">Approve Competition</a></li>
          <li><a href="sliderimages.jsp">Slider Images</a></li>
          <li><a href="hofapprove.jsp">Hall of Fame</a></li>
          <li><a href="contactudetails.jsp">Contact Us</a></li>
          <li><a href="cigalleryapprove.jsp">Approve Pictures CI gallery</a></li>
          <li><a href="artimages.jsp">Approve Articles</a></li>
          <li><a href="createcomp.jsp">Create New Competition</a></li>
          <li><a href="creditinfo.jsp">Credit info</a></li>
          
        </ul>
      </div>
    </div>
  </div>
</nav>    

<br>
<div class="container" id="HOF">

  <h3><b>Hall Of Fame</b></h3>
  <br><br>

<form method="post" action="hof.action" enctype="multipart/form-data">

 <div class="form-group">
      <label for="compname">Comptition Name:</label>
      <input class="form-control" type="text" name="compname10" placeholder="username.." id="compname">
    </div>

 <div class="form-group">
      <label for="uname1">Username 1:</label>
      <input class="form-control" type="text" name="uname10" placeholder="username 1.." id="uname1">
    </div>

 <div class="form-group">
      <label for="uname2">Username 2:</label>
      <input class="form-control" type="text" name="uname20" placeholder="username 1.." id="uname2">
    </div>

 <div class="form-group">
      <label for="uname">Username 3:</label>
      <input class="form-control" type="text" name="uname30" placeholder="username 3.." id="uname">
    </div>


<input type="submit" value="submit" class="btn btn-success">

</form>
<br><br>
</div>

</body>
</html>