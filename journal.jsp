<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<title>Journal</title>
       <meta charset="utf-8"/>
   <meta name="viewport" content="width=device-width,initial-state=1"/>
   <link type="text/css" rel="stylesheet" href="css/bootstrap.css"/>
      <link type="text/css" rel="stylesheet" href="css/header.css"/>

   <script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
   <script type="text/javascript" src="js/bootstrap.js"></script>
   <script src="wysiwyg/wysiwyg.js"></script>
   
    <link href="https://s3.ap-south-1.amazonaws.com/captureit.ac/images/logo.jpg" rel="favicon icon">
    <style>
 *{
    margin: 0;
    padding: 0;
    box-sizing: border-box;
  }
  .container-fluid{
  	 margin: 0;
  	 padding: 0;
  	 box-sizing: border-box;
  }

  .col-sm-8{
  	margin: 0;
  	box-sizing: border-box;
  	text-align: center;
  }
  
  div.gallery {
    background: white;
      width:23%;
      height: 400px;
      margin: 20px 10px 10px 10px;
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
    
    width: 100%;
    height: 250px;
    top-border-radius:10px;
}

div.desc {
    font-size: 15px;
     padding: 5px;
    height: 100px;

} 

div.desc:after{
    display:block;
    height:2px;
    background-color: #e67e22;
    content:" ";
    width:130px;
    margin:0 auto;
    margin-top:5px;
}   

main{
  width: 90%;
  margin-left:5%;
}
.col-sm-4{
  margin-top: 0; 
  background:white;height:350px;
}
.col-sm-4 h2{
	margin-top: 30%;
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
    height: 250px;
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
      height: 250px;
    }
}

</style>
	

    
</head>
<body style="background-color: lightgrey;" onLoad="iFrameOn();">
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
<li class="active"><a href="journal.jsp">Journal</a></li>
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
 <div class="col-sm-8" class="carousel-inner" role="listbox" align="center">
      <div class="item active" style="margin: 0;" align="center">
        <img src="https://s3.ap-south-1.amazonaws.com/captureit.ac/images/blog1.jpg" alt="" style="width:100%;height: 350px;">
        
      </div>
        
      </div>
<div class="col-sm-4" align="center">
 <h2>
     Want to write an article? 
 
 
 </h2>
 <br><br>
 
 <a href="#" data-toggle="modal" data-target="#myModal1" class="btn btn-success btn-lg"><span class="glyphicon glyphicon-pencil"></span> Write your article</a>
</div>
<div class="modal fade" id="myModal1" role="dialog">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Write Your Article</h4>
        </div>
        <div class="modal-body">
         <form class="form-horizontal" method="post" action="article.action" enctype="multipart/form-data">
        
    <div class="form-group">

      <div class="col-sm-12">
        <input type="text" class="form-control" id="title" placeholder="Enter Title of your blog.." name="title" value="">
      </div>
    </div>
    <div class="form-group">
      <div class="col-sm-12">          
        <input type="text" class="form-control" id="description" placeholder="description of your article" name="caption" value="">
      </div>
    </div>
    <div class="form-group">        
     <div class="col-sm-12">
        <textarea class="form-control" rows="10" id="comment" name="richTextField" value=""></textarea>
      </div>
      </div>
      
    </div>
    <div class="form-group">        
      <div style="margin-left: 20px;">
       <label style="cursor: pointer;font-size: 15px;"><input type="file" class="form-control" name="article" id="fileupload" style="display:none;" multiple><span class="glyphicon glyphicon-camera" style="cursor: pointer;"></span>Click Here To Select Pictures For Your Article</label>
      </div>
      
    </div>
    <div class="form-group">        
      <div style="margin-left: 16px;">
        <input type="submit" value="submit" style="width: 98%" onclick="alert('Your Picture Was submitted')" class="btn btn-success btn-lg">
      </div>
    </div>
  </form>
        </div>
      </div>
    </div>
  </div>

</div>
<div class="container-fluid">
<main align="center">
  <%   try
              {
    	 ArrayList<String> a=new ArrayList();
		  ArrayList<String> a1=new ArrayList();
		  ArrayList<Integer> a0=new ArrayList<Integer>(); 
            	  String uname2=(String)session.getAttribute("uname");
            	  if(uname2==null||uname2=="")
            	  {
            	  	response.sendRedirect("frontpage.jsp");
            	  }
            	  else
            	  {
            		 
            		  
          	Class.forName("com.mysql.jdbc.Driver");
      		Connection con=DriverManager.getConnection("jdbc:mysql://captureitac.cxtvglcjxdhp.ap-south-1.rds.amazonaws.com:3306/captureit","akashroot","jaswant1971akash");
      	    Statement st=con.createStatement();
      	    ResultSet rs=st.executeQuery("select * from artimagesdisplay ");
      	   aa: while(rs.next())
      	    { 
      	    	int c=rs.getInt(6);
      	    	Iterator<Integer> itr=a0.iterator();  
      	    	while(itr.hasNext()){  
      	      	   if(c==itr.next())
      	      	   {
      	      		   continue aa;
      	      	   }
      	      	  }  
      	     a0.add(rs.getInt(6));
      	   a.add(rs.getString(2));
      	 a1.add(rs.getString(4));
      	 
      	  }
     }
 %>    <%for (int i = a.size() - 1 ; i >= 0 ; i--)
	 {
	 %>

<div class="gallery" align="center">	    
   
   <img src="https://s3.ap-south-1.amazonaws.com/captureit.ac/artimages/<%=a.get(i) %>"/>
   <div class="desc"><b><%=a1.get(i)%></b></div>

      	
   <a href="blog.jsp?value=<%=a0.get(i)%> " class="btn btn-success" style="margin-top:10px;">Read Article</a>
 </div>
<%    
	 }        }
              catch(Exception e)
              {
            	  System.out.println(e);
              }
              %>  

</main>
</div>

<div class="container-fluid navbar-default">

<div class="row" style="box-shadow: 1px 2px 4px rgba(0, 0, 0, .5);background-color: grey;">
<div class="col-sm-3" align="center">
<h2></h2>




</div>
<div class="col-sm-2" align="center">

<ul class="list-inline" style="margin:25px;">

<li class="list-group-item" style="background-color: grey;border:0px;"><a href="https://www.facebook.com/captureit1/" style="text-decoration: none;"><img src="https://s3.ap-south-1.amazonaws.com/captureit.ac/images/facebook.png" width="50"></a></li>



</ul>

</div>
<div class="col-sm-2" style="text-align: center;">
<ul class="list-inline" style="margin:16px;">


<li class="list-group-item" style="background-color: grey;border:0px;"><a href="https://www.youtube.com/channel/UCt2yRIhXnRY8ovUDIAdh0eA" style="text-decoration: none;"><img src="https://s3.ap-south-1.amazonaws.com/captureit.ac/images/youtube.png" width="70"></a></li>



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

<p style="font-size:20px;color: #fff"><b>CaptureIt&copy;|2018</b></p>
</div>

</div>

</div>

</body>
</html>