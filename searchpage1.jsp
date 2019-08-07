<%@ page import="java.util.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8"/>
   <meta name="viewport" content="width=device-width,initial-state=1"/>
   <link type="text/css" rel="stylesheet" href="css/bootstrap.css"/>
   <link type="text/css" rel="stylesheet" href="css/header.css" >

   <script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
   <script type="text/javascript" src="js/bootstrap.js"></script>

    <link href="https://s3.ap-south-1.amazonaws.com/captureit.ac/images/logo.jpg" rel="favicon icon">
  <title>Search</title>
  <style>
  div.gallery {
    background: white;
      width:23%;
      height: 340px;
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
    height: 280px;
    top-border-radius:10px;
}
.desc a:before{
    display:block;
    height:2px;
    background-color: #e67e22;
    content:" ";
    width:130px;
    margin:0 auto;
    margin-top:10px;
    margin-bottom:10px;}

main{
  	
  width: 100%;
  margin-left:0;
}
.sidebar{
    display:block;
	width:90%;
	background-color:grey;margin-top: 20px;border-radius: 5px;
	text-align: center;
	margin-right:10px;
	margin-bottom: 10px;
}

.sidebar h4{
  padding-top: 10px;
}
.sidebar img{
         width:80%;
         margin-left: 10%;
}
@media only screen and (max-width:767px){
     .sidebar{
         display:none;
     }
     
     div.gallery{
          width:40%;
          margin-left:5%;
     }
}
@media only screen and (max-width:468px){

        div.gallery{
             width:90%;
             margin-left:5%;
        }
}
</style>
	
</head>
<body style=" background:lightgrey;">
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
      <ul class="nav navbar-nav navbar-right" style="margin-top: 20px;">
        <li><a href="mygallery.jsp"><span class="glyphicon glyphicon-user"></span> My Account</a></li>
      </ul>
      
      <form class="navbar-form navbar-right" action="searchpage1.jsp" style="margin-top: 25px;">
        <div class="form-group input-group">
          <input type="text" class="form-control" name="search" placeholder="Search By Username">
          <span class="input-group-btn">
            <input class="btn btn-default" type="submit" value="search">
              <span class="glyphicon glyphicon-search"></span>
          </span>        
        </div>
      </form>
      
    </div>
</div>
 
   </nav> 

 
<div class="container-fluid" style="background-color: ;margin-top: -18px;">
<div class="col-sm-10">
<main align="center">
<%   String uname1=(String)session.getAttribute("uname");
LinkedHashSet<String> lhs=new LinkedHashSet();
ArrayList<String> ar=new ArrayList();
ArrayList<String> pp=new ArrayList();
if(uname1==null||uname1=="")
{
	response.sendRedirect("frontpage.jsp");
}
else
{
	String search=request.getParameter("search");
       char x=search.charAt(0);
       try
       {   
    	
    	   Class.forName("com.mysql.jdbc.Driver");
   		Connection con1=DriverManager.getConnection("jdbc:mysql://captureitac.cxtvglcjxdhp.ap-south-1.rds.amazonaws.com:3306/captureit","akashroot","jaswant1971akash");
   	    Statement st=con1.createStatement();
   	    ResultSet rs1=st.executeQuery("select * from pimages where uname='"+search+"' or name='"+search+"'");
    	   if(rs1.next())
    	   {
    		   if(lhs.add(rs1.getString(2)))
    		   {
    			   ar.add(rs1.getString(1));
    		   }
    	   }
    	   
       Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://captureitac.cxtvglcjxdhp.ap-south-1.rds.amazonaws.com:3306/captureit","akashroot","jaswant1971akash");
	    PreparedStatement p= con.prepareStatement("select * from pimages where uname like ? or name like? ");
	    p.setString(1, "" + x + "%");
	    p.setString(2, "" + x + "%");
	    ResultSet rs= p.executeQuery();
	   while(rs.next())
	   {
	   if(lhs.add(rs.getString(2)))
	   {
		   ar.add(rs.getString(1));
	   }
	   }
	   Iterator<String> itr=lhs.iterator();  
	   while(itr.hasNext()){  
	     pp.add(itr.next());
	   }  
	   for (int i =0 ; i <ar.size()  ; i++)
	   { %>

<div class="gallery" align="center">	    
    
    
   <img src="https://s3.ap-south-1.amazonaws.com/captureit.ac/profilepictures/<%=pp.get(i)%>"alt="Image Not Available"/>
   
     <div class="desc"><a href="mpgs.jsp?value=<%=ar.get(i)%> " style="text-decoration:none;color:black;font-size:18px;"><%=ar.get(i)%><b></b></a></div>
</div>
<% 
	   }  
	   }
     catch(Exception ee)
       {
    	System.out.println(ee);
       }
       }%>

</main> 

</div>


  
  <div class="col-sm-2" >
<div class="sidebar">

<h4>EVENTS</h4>
<img src="https://s3.ap-south-1.amazonaws.com/captureit.ac/images/cont.png" class="img-responsive">
<a href="contests.jsp" style="margin-top: 20px;margin-bottom: 10px;" class="btn btn-success">Read More</a>


</div>


<div class="sidebar">

<h4> BLOG</h4>
<img src="https://s3.ap-south-1.amazonaws.com/captureit.ac/images/bl.png" class="img-responsive">
<a href="journal.jsp" style="margin-top: 20px;margin-bottom: 10px;" class="btn btn-success">Read More</a>


</div>

<div class="sidebar">
   

<h4>CI Gallery</h4>

<img src="https://s3.ap-south-1.amazonaws.com/captureit.ac/images/logo.jpg" class="img-responsive">
<a href="cigallery.jsp" style="margin-top: 20px;margin-bottom: 10px;" class="btn btn-success">Read More</a>


</div>


</div>
</div>

<div class="container-fluid navbar-default">

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