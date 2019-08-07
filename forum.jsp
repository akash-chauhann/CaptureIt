<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html>
<html>
<head>
	<title>Forum</title>
       <meta charset="utf-8"/>
   <meta name="viewport" content="width=device-width,initial-state=1"/>
   <link type="text/css" rel="stylesheet" href="css/bootstrap.css"/>
   <link type="text/css" rel="stylesheet" href="css/header.css">
   <script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
   <script type="text/javascript" src="js/bootstrap.js"></script>

    <link href="https://s3.ap-south-1.amazonaws.com/captureit.ac/images/logo.jpg" rel="favicon icon">
  <style type="text/css">
    .col-sm-8{
    margin: 0;
    padding: 10px;
    box-sizing: border-box;
  }
  .col-sm-4{
  margin-top: 0; 
  padding: 10px;
  box-sizing: border-box;

}
    .contact{
          font-weight: 300;
    text-transform: uppercase;
     font-size:180%;
    word-spacing:2px;
    text-align:center;
    margin-bottom: 30px;
    letter-spacing: 1px;
    color: #e67e22;
    }
    .contact:after{
    display:block;
    height:2px;
    background-color: #e67e22;
    content:" ";
    width:200px;
    margin:0 auto;
    margin-top:10px;
}
    .plan-box{
    background-color: #fff;
    padding: 10px;
    border-radius:5px;
    width:90%;
    margin-left: 5%;
    -webkit-box-shadow: 0 2px 2px #efefef;
    box-shadow: 0 2px 2px #efefef;
}

.plan-price{
    
    font-size:150%;
    margin-bottom: 10px;
    font-weight: 100;
    color:#e67e22;
}


  </style>

</head>
<body style="background-color: #f4f4f4;">
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
<li ><a href="journal.jsp">Journal</a></li>
<li class="active"><a href="forum.jsp">Forum</a></li>

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

  <div class="col-sm-8">

        <img src="https://s3.ap-south-1.amazonaws.com/captureit.ac/images/forum.jpg" alt=""  style="width:100%;height: 350px;">
      
        
      </div>
<div class="col-sm-4" align="center" style="background-color:lightgrey;height: 350px;margin-top:10px; ">
<form method ="post" action="forum.action">
 <h2> Your Question:</h2><br>
  <input type="text" name="ques" placeholder="Ques" style="width:100%;height:40px;border-radius:10px;">
  <br><br><br><br>
  <input type="submit" value="Submit" class="btn btn-success btn-lg">
</form>
</div>



</div>

<div class="container-fluid">
<div class="col-sm-8" style="background:lightgrey;margin-top:20px;">
<%   
       ArrayList<String> ar=new ArrayList();
       try
       {   
    	   
       Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://captureitac.cxtvglcjxdhp.ap-south-1.rds.amazonaws.com:3306/captureit","akashroot","jaswant1971akash");
	    Statement st=con.createStatement();
	    ResultSet rs1=st.executeQuery("select * from forum");
	    while(rs1.next() )
	    {
	    	ar.add(rs1.getString(2));
	    }
	    
	}
	catch(Exception e)
	{
		System.out.println(e);
	}
       for (int i = ar.size() - 1 ; i >= 0 ; i--) 
       { 
    	   String ques=ar.get(i);
%> 
<br>

<h3>
<a href="qforum.jsp?value=<%=ques%> " style="text-decoration: none;"><% out.print(ques); } %></a></h3>


</div>
<div class="col-sm-4" style="margin-top:20px;border-radius:10px;">
   
   <div class="plan-box js--wp-4">
                <div>
                <h3 class="contact">Contact US</h3>
                    <p class="plan-price"><b>Say A Hi....</b></p>
                    </div>
                    <div>
                        
                    <form class="form-horizontal" method="post" action="contactus.action">
    
    <div class="col-sm-12">
    <div class="form-group">
     <input type="email" class="form-control" id="email" placeholder="Enter email" name="emailid1" style="border-radius:10px;height:50px;">
      </div>
      </div>
      <div class="col-sm-12">
      <div class="form-group">
     <input type="text" class="form-control" id="subject" placeholder="Subject" name="subject1" style="border-radius:10px;height:50px;">
      </div>
      </div>
      <div class="col-sm-12">
      <div class="form-group">
     <textarea rows="4" cols="50" name="msg1" style="border-radius:10px;border: 2px solid #dedede;width:98%;padding-top:10px;padding-left:10px;" placeholder="Your Message.."></textarea>
      </div>
      </div>
    </div>
   
    <div class="form-group">        
      <div style="margin-left: 16px;">
        <button type="submit" style="width: 98%" class="btn btn-success">Contact Us</button>
      </div>
    </div>
  </form>

                </div>
                </div>
</div>
</div>
<br>
<div class="container-fluid">

<div class="row" style="box-shadow: 1px 2px 4px rgba(0, 0, 0, .5);background-color: lightgrey;">
<div class="col-sm-3" align="center">





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