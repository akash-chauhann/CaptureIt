<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 <meta charset="utf-8"/>
   <meta name="viewport" content="width=device-width,initial-state=1"/>
      <link type="text/css" rel="stylesheet" href="css/bootstrap.css"/>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.8.2.js"></script>
   <link rel="stylesheet" type="text/css" href="jquery.fancybox.min.css">
   <script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
    
   <script type="text/javascript" src="js/bootstrap.js"></script>
     
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
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
          <li><a href="aprovecompetetion.jsp">Approve Competition</a></li>
          <li><a href="sliderimages.jsp">Slider Images</a></li>
          <li><a href="hofapprove.jsp">Hall of Fame</a></li>
          <li><a href="contactudetails.jsp">Contact Us</a></li>
          <li><a href="cigalleryapprove.jsp">Approve Pictures CI gallery</a></li>
          <li><a href="artimages.jsp">Approve Articles</a></li>
          <li><a href="createcomp.jsp">Create New Competition</a></li>
          
        </ul>
      </div>
    </div>
  </div>
</nav>    
   

<%try{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://captureitac.cxtvglcjxdhp.ap-south-1.rds.amazonaws.com:3306/captureit","akashroot","jaswant1971akash");	
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select * from compentries ");
while(rs.next())
{
%>
<div id="AC" class="container">

  <h3><b>Approve Competition</b></h3>
  <br><br>

<img src="" class="img-responsive" style="width:250px;height: 250px;"><br><br>


<form method="post" action="approvecomp.action" enctype="multipart/form-data">

 <div class="form-group">
      <label for="uname">Username:</label>
      <input class="form-control" type="text" value="<%= rs.getString(2)%>"name="uname21" placeholder="username.." id="uname">
    </div>

<div class="form-group">
      <label for="uname">Compname</label>
      <input class="form-control" type="text" value="<%= rs.getString(3)%>"name="compname21" placeholder="compname.." id="uname">
    </div>

<div class="form-group">
      <label for="uname">Paytm No.</label>
      <input class="form-control" type="text" value="<%= rs.getString(1)%>"name="paytm21" placeholder="paytmno.." id="uname">
    </div>

 <div class="form-group">
      <label for="comment">Caption:</label>
      <textarea class="form-control" rows="5" name="comment21"><%= rs.getString(5)%></textarea>
    </div>

 <div class="form-group">
      <label for="imgname">Image Name:</label>
      <input type="text" class="form-control" rows="5" value="<%= rs.getString(4)%>"name="compimage21" placeholder="img name..">

    </div>

 <div class="form-group">
     <label class="radio-inline">
      <input type="radio" name="decision" value="approve">Approve
    </label>
    <label class="radio-inline">
      <input type="radio" name="decision"value="delete">Delete
    </label>
    </div>

<button type="submit"  class="btn btn-success" >Submit</button>



</form>
<br><br>
</div>

<%	
}
}
catch(Exception ee)
{
	System.out.println(ee);
}
%>
</body>
</html>