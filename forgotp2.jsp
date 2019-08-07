<%@page import ="java.util.*" %>
<%@ page import ="java.sql.*" %>
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
     
     position:fixed;
     left:0;
     bottom:0;
     width:100%;
}
@media only screen and (max-width:1200px){
   
   #footer{
      position:relative;
      margin-top:10px;
   }

}



</style>
</head>
<body style="font-family:'Arial';">

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
<% 
String usp=request.getParameter("usp");
String ques1=request.getParameter("ques1");
String ques2=request.getParameter("ques2");
System.out.println(ques1+"  "+ques2+"  "+usp);
int flag=0,flag1=0;
try{
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://captureitac.cxtvglcjxdhp.ap-south-1.rds.amazonaws.com:3306/captureit","akashroot","jaswant1971akash");
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select * from sign_up_details where uname='"+usp+"'");
if(rs.next())
{
	if(ques1.equals(rs.getString(9))&& ques2.equals(rs.getString(10)))
	{
		flag=1;
	}

}
System.out.println(flag);
}
catch(Exception ee)
{
System.out.println(ee);	
}
%>

<%if(flag==1){ %>
           <div class="container" style="margin-top:30px;">
           <div class="row">
           <div class="col-sm-2">
           </div>
           <div class="col-sm-8" style="background:lightgrey;padding:10px;">
          <h4>Change Your Password</h4>
        
                    <form class="form-horizontal" method="post" action="changepp.action" id="formCheckPassword">

    <div class="form-group">
      <label class="control-label" style="margin-left: 20px;" for="pwd">New Password:</label><br>
      <div class="col-sm-12">          
        <input type="password" class="form-control"  placeholder="Enter password" name="" id="txtPassword">
      </div>
      </div>
    <div class="form-group">
      <label class="control-label" style="margin-left: 20px;" for="pwd">Confirm New Password:</label><br>
      <div class="col-sm-12">          
        <input type="password" class="form-control"  placeholder="Enter password" name="pwd3" id="txtConfirmPassword">
      </div>
    </div>
     <input  type="hidden" name="usp" value='<%=usp%>'> 
    <div class="form-group">        
      <div style="margin-left: 16px;">
 <button type="submit" style="width: 95%" class="btn btn-success btn-lg" id="btnSubmit" value="Change Password" onclick="return Validate()">Change Password</button>
          </div>
    </div>
  </form>
  </div>
  <div class="col-sm-2">
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

<%}
else if(flag==0){
%>
<div class="container" style="background:lightgrey;margin-top:20px;">
<h4 style="color:red">Sorry The Answers You Entered Didn't match to the answers you gave at the time of sign up.</h4>
<h3>If You Still Want to change the password drop a mail at CAPTUREITFORGOTPASSWORD@GMAIL.COM with your details (UserName, Registered Email Id,  Registered Phone Number ) Our Team Will contact you.</h3>
</div>
<% }%>
<div class="container-fluid navbar-default" id="footer" >

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