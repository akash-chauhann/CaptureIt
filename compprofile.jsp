<%@ taglib uri="/struts-tags" prefix="s" %>  
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
  <title>COMPLETE YOUR PROFILE</title>
       <meta charset="utf-8"/>
   <meta name="viewport" content="width=device-width,initial-state=1"/>
   <link type="text/css" rel="stylesheet" href="css/bootstrap.css"/>
      <link type="text/css" rel="stylesheet" href="css/header.css"/>

   <script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
   <script type="text/javascript" src="js/bootstrap.js"></script>

    <link href="https://s3.ap-south-1.amazonaws.com/captureit.ac/images/logo.jpg" rel="favicon icon">
  <style>
  body {
      position: relative; 
  }
  
      .gallery{
         position: relative;
       }
        
  #basicinfo {padding-top:50px;height:750px;color: #fff;-moz-box-shadow: 1px 2px 4px rgba(0, 0, 0,0.5);
    -webkit-box-shadow: 1px 2px 4px rgba(0, 0, 0, .5);
    box-shadow: 1px 2px 4px rgba(0, 0, 0, .5);
    padding: 10px;}
  
  

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
<li><a href="mygallery.jsp"><img style="float: left;" src="https://s3.ap-south-1.amazonaws.com/captureit.ac/images/logo.jpg" class="img-responsive img-circle" width="20"><%=uname1%></a></li>

<li class="active"><a href="compprofile.jsp"><span  style="margin-right: 5px" class="glyphicon glyphicon-cog"></span>Settings</a></li>
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
              <%
              try
              {
                
                String uname=(String)session.getAttribute("uname");
                if(uname==null||uname=="")
                {
                  response.sendRedirect("frontpage.jsp");
                }
                else
                {
            Class.forName("com.mysql.jdbc.Driver");
          Connection con=DriverManager.getConnection("jdbc:mysql://captureitac.cxtvglcjxdhp.ap-south-1.rds.amazonaws.com:3306/captureit","akashroot","jaswant1971akash");
            Statement st=con.createStatement();
            ResultSet rs=st.executeQuery("select * from pimages where uname = '"+uname+"' ");
            if(rs.next() )
            { %>
            <div class="carousel-caption" class="responsive">
              <img src="https://s3.ap-south-1.amazonaws.com/captureit.ac/profilepictures/<%out.print(rs.getString(2)); %>" class="gallery" class="img-responsive img-circle"  style="width:150px;height:150px;margin-bottom: -100px;border-radius:50%;"/>
              <% 
            }
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

<br><br>
<br>
<div class="container-fluid">
<div class="row">
<div class="col-sm-5">


</div>
<div class="col-sm-2"  style="font-size: 15px;" align="center">

 <form method="post" action="upload.action" enctype="multipart/form-data">
  <div class="form-group" align="center" style="background:#ECEAE0;padding:8px 8px;border-radius:10px;">
    
    <label style="cursor: pointer;font-size: 15px;"><input type="file" class="form-control" name="ppimage" id="fileupload" style="display:none;"><span class="glyphicon glyphicon-camera" style="cursor: pointer;"></span> Click here to Select Profile Picture</label>
      <input type="submit" class="btn btn-primary btn-lg" style="width:90%;height:38px;padding:5px 5px;" value="Upload"/>
      </div>
</form>
 <form method="post" action="upload1.action" enctype="multipart/form-data" style="background:#ECEAE0;padding:8px 8px;border-radius:10px;">
  <div class="form-group" align="center" >
        <label style="cursor: pointer;font-size: 15px;"><input type="file" class="form-control" name="cpimage" id="fileupload" style="display:none;"><span class="glyphicon glyphicon-camera" style="cursor: pointer;"></span>Click here to Select Cover Picture</label>
       <input type="submit" class="btn btn-primary btn-lg" style="width:90%;height:38px;padding:5px 5px;" value="Upload"/>  
  </div>
</form>  
<br>
<a href="#" data-toggle="modal" data-target="#myModal" style="color: black;text-decoration: none;margin-left: 17px;background:#ECEAE0;padding:8px 8px;margin-left:8px;border-radius:10px;"><span class="glyphicon glyphicon-eye-open" style="color: black;"></span> <b style="font-size: 15px;">Change Your Password</b></a>
<div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Change Your Password</h4>
        </div>
        <div class="modal-body">
                    <form class="form-horizontal" method="post" action="changep.action" id="formCheckPassword">
    <div class="form-group"> 
      <label class="control-label" style="margin-left: 20px;" for="email">Old Password:</label><br>
                

      <div class="col-sm-12">
         <input type="password" class="form-control" id="pwd"  placeholder="Enter password" name="">

        
      </div>
    </div>
    <div class="form-group">
      <label class="control-label" style="margin-left: 20px;" for="pwd">New Password:</label><br>
      <div class="col-sm-12">          
        <input type="password" class="form-control"  placeholder="Enter password" name="" id="txtPassword">
      </div>
      </div>
    <div class="form-group">
      <label class="control-label" style="margin-left: 20px;" for="pwd">Confirm New Password:</label><br>
      <div class="col-sm-12">          
        <input type="password" class="form-control"  placeholder="Enter password" name="pwd2" id="txtConfirmPassword">
      </div>
    </div>
    <div class="form-group">        
      <div style="margin-left: 20px;">
        <div>
          <a href="#">Forgot Password ?</a>
        </div>
      </div>
    </div>
    <div class="form-group">        
      <div style="margin-left: 16px;">
     <button type="submit" style="width: 98%" class="btn btn-success btn-lg" id="btnSubmit" value="Change Password" onclick="return Validate()">Change Password</button>
      </div>
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
  
<script type="text/javascript">
    function Validate() {
        var password = document.getElementById("txtPassword").value;
        var confirmPassword = document.getElementById("txtConfirmPassword").value;
        if (password != confirmPassword) {
            alert("Passwords do not match.");
            return false;
        }
        return true;
    }
</script>




<div class="col-sm-5">





</ul>


</div>


</div>


</div>

<br><br>

<nav class="navbar navbar-default" style="background-color:whitesmoke;border:0px;margin-left:27%;font-size: 18px;border-radius:10px;">
  <div class="container-fluid">
    <div class="col-sm-2">
  
</div>
    <div class="col-sm-6" style="border-radius:10px;">
     
    </div>
    <div class="col-sm-4">
    </div>
  </div>
</nav>    
<%
try
    {
   String uname=(String)session.getAttribute("uname");
    if(uname==null||uname=="")
    {
      response.sendRedirect("frontpage.jsp");
    }
    else{
    Class.forName("com.mysql.jdbc.Driver");
    Connection con=DriverManager.getConnection("jdbc:mysql://captureitac.cxtvglcjxdhp.ap-south-1.rds.amazonaws.com:3306/captureit","akashroot","jaswant1971akash");
    Statement st=con.createStatement();
    ResultSet rs=st.executeQuery("select * from photographer_details where uname='"+uname+"'");
    if(rs.next())
    {
    %>
<div id="basicinfo" class="container" style="color: black;background-color: white;">
  <h1 style="text-align: center;"><u>OVERVIEW</u></h1>
  <br><br>
  <form method="post" action="details.action">

   <div class="form-group">
  <label for="usr">User Name:</label>
  <input type="readonly" class="form-control" name="usr" id="usr" value="<%=rs.getString(2) %>">
</div>
 <div class="form-group">
  <label for="usr">Bio:</label>
  <input type="text" class="form-control" name="bio" id="usr"value="<%=rs.getString(3)%>">
</div>
  <label>Gender:</label>
  <br>
   <div class="radio" style="margin-top: -5px;">

   
  <label>  <input type="radio" value="Male" name="optradio">Male</label>
  <label>  <input type="radio" value="Female" name="optradio" >Female</label>

</div>
<br>
  <label>Interests:</label>
<label class="checkbox-inline" style="margin-left: 4px;">
      <input type="radio" name="interest" value="Photographer">Photographer
    </label>
    <label class="checkbox-inline">
      <input type="radio" name="interest" value="Model">Model
    </label>
    
<br><br>
    
     <div class="form-group">
      <label for="sel1">State:</label>
       <input type="text" name="state" class="form-control" value="<%=rs.getString(6)%>" id="sel1">
     </div>

     <br>
     <div class="form-group">
      <label for="sel1">City:</label>
      <input type="text" name="city" class="form-control" value="<%=rs.getString(7)%>" id="sel1">
     </div>
<div class="form-group">
  <label for="cam">Camera:</label>
  <input type="text" name="camera" value="<%=rs.getString(8)%>" class="form-control" id="cam">
</div>

<div class="form-group">
  <label for="lens">Lens:</label>
  <input type="text" name="lens" class="form-control" value="<%=rs.getString(9)%>" id="lens">
</div>
<button type="submit" onclick="alert('Profile Edited')" value="submit" class="btn btn-success" style="margin:10px 0px 0px 0px;">Submit</button>


  </form>

<%}
    else{%>   
    <div id="basicinfo" class="container" style="color: black;background-color: white;">
  <h1 style="text-align: center;"><u>OVERVIEW</u></h1>
  <br><br>
  <form method="post" action="details.action">

   <div class="form-group">
  <label for="usr">User Name:</label>
  <input type="text" class="form-control" name="usr" id="usr" value="<%=uname %>"  readonly>
</div>
 <div class="form-group">
  <label for="usr">Bio:</label>
  <input type="text" class="form-control" name="bio" id="usr"value=""required>
</div>
  <label>Gender:</label>
  <br>
   <div class="radio" style="margin-top: -5px;">

   
  <label>  <input type="radio" value="Male" name="optradio"required>Male</label>
  <label>  <input type="radio" value="Female" name="optradio" required>Female</label>

</div>
<br>
  <label>Interests:</label>
<label class="checkbox-inline" style="margin-left: 4px;">
      <input type="radio" name="interest"value="Photographer"required>Photographer
    </label>
    <label class="checkbox-inline">
      <input type="radio" name="interest"value="Model"required>Model
    </label>
    
<br><br>
    
     <div class="form-group">
      <label for="sel1">State:</label>
       <input type="text" name="state" class="form-control" value="" id="sel1"required>
     </div>

     <br>
     <div class="form-group">
      <label for="sel1">City:</label>
      <input type="text" name="city" class="form-control" value="" id="sel"required>
     </div>
<div class="form-group">
  <label for="cam">Camera:</label>
  <input type="text" name="camera" value="" class="form-control" id="cam"required>
</div>

<div class="form-group">
  <label for="lens">Lens:</label>
  <input type="text" name="lens" class="form-control" value="" id="lens"required>
</div>
<button type="submit" onclick="alert('Profile Edited')" value="submit" class="btn btn-success" style="margin:10px 0px 0px 0px;">Submit</button>


  </form>
    
    
    <%}}}
catch(Exception ee)
{
  System.out.println(ee);}%>
  
</div>
<br>

<form class="form-horizontal" method="post" action="del1.action">
    
     
    <div class="col-sm-12">
    <div class="form-group">
     <input type="hidden" value="<%=uname1 %>" class="form-control" id="email" placeholder="Enter Username" name="del1" style="border-radius:10px;height:50px;width:98%;margin:0px 5px; 0px 5px;">
      </div>
      </div>
     
 <div class="form-group" align="center">        
      <div style="margin-left: 16px;">
        <button type="submit" style="width: 90%;margin:10px 5px 0px 5px;" class="btn btn-success btn-lg">Delete Account</button>
      </div>
    </div>
  </form>


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

<p style="font-size:20px;"><b>CaptureIt&copy;|2018</b></p>
</div>

</div>

</div>


  </body>
</html>
