<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>

    <meta charset="utf-8"/>
   <meta name="viewport" content="width=device-width,initial-state=1"/>
   <link type="text/css" rel="stylesheet" href="css/bootstrap.css"/>
   <script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
   <script type="text/javascript" src="js/bootstrap.js"></script>

    <link href="https://s3.ap-south-1.amazonaws.com/captureit.ac/images/logo.jpg" rel="favicon icon">
	<title>Capture It</title>
	<style type="text/css">
     *{
     	margin: 0;
     	padding: 0;
     	box-sizing: border-box;
     } 

     html,body{
     	overflow-x: hidden;
     }
     h2,h3{

      font-weight: 300;
    text-transform: uppercase;	
    font-size:180%;
    word-spacing:2px;
    text-align:center;
    margin-bottom: 30px;
    letter-spacing: 1px;
}
     h2:after,h3:after{
    display:block;
    height:2px;
    background-color: #e67e22;
    content:" ";
    width:200px;
    margin:0 auto;
    margin-top:30px;
}
     .container-fluid{
     	margin: 0 2px;
     	padding: 0;
     	box-sizing: 0;
     }

     #header{
     	width:100%;
     	border-radius: 0;
     }

	.logo {
  padding: 10px 10px 0 10px;
  float: left;
  
}

.complogo{
	        width: 100px;
	        height: 100px;
	        border-radius: 50%;
	        float: left;
	        margin-left: 10px;
}

.name {
  font-size: 14px;
  color: #333;
  padding-top: 15px;
}

.ding-dong{
	font-size:25px;
	float: left;
	margin-top:20px;
	margin-left: 10px;
	color: #fff;
	line-height: 100%;
}

.ding-ding{
            font-size: 15px;
}

#main-nav{
       
       margin-top: 18px;            
}
#slider-images{
	width:100%;
	height: 450px;
}
.plan-box{
    background-color: #fff;
    border-radius:5px;
    width:80%;
    margin-left: 10%;
    -webkit-box-shadow: 0 2px 2px #efefef;
    box-shadow: 0 2px 2px #efefef;
}
.plan-box div{
    padding:15px;
    border-bottom:1px solid #c5c5c5;
}
.plan-box div:last-child{
    text-align: center;
}
.plan-price img{
	width:70%;
	height: 200px;
	margin-left: 15%;
	border-bottom: 15px;
}
.btn:link,
.btn:visited,input[type=submit]{
    display: inline-block;
    padding: 10px 30px;
    font-weight: 300;
    text-decoration: none;
    border-radius:200px;
    color: #fff;
    -webkit-transition: background-color 0.8s,border 0.8s,color 0.8s;
    transition: background-color 0.8s,border 0.8s,color 0.8s;
    
}


.btn-full:link,.btn-full:visited,input[type=submit]{
    background-color: #e67e22;
    border:1px solid #e67e22;
    color: #fff;
    margin-right: 15px;
}

.btn:hover,.btn:active,input[type=submit]:hover,input[type=submit]:active{
    background-color: #cf6d17;
}
.btn-full:hover,.btn-full:active{
    border:1px solid #e67e22;
   
}

@media only screen and (max-width:767px){

       .complogo{
       	   width:50px;
       	   height: 50px;
       	   margin-left:15px;
       	   margin-top:5px;  
       	   
       }

       .ding-dong{
       	 font-size: 18px;
       	 line-height: 90%;
       	 color:#fff;
       	 margin-top: 15px;
       }
       .ding-ding{
       	  font-size:9px;

       }
       #slider-images{
	width:100%;
	height: 300px;
}
.plan-box{
    width:100%;
    margin-left:0;
    margin-bottom: 10px;
}
    h2,h3{

      font-weight: 300;
    text-transform: uppercase;	
    font-size:150%;
    word-spacing:2px;
    text-align:center;
    margin-bottom: 30px;
    letter-spacing: 1px;
    margin-left: 5px;
    margin-right: 5px;
}
.container-fluid{
	margin:0 auto;
}
}
</style>
</head>
<body style="font-family: verdana;">


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
<li><a href="#" data-toggle="modal" data-target="#myModal1"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
<li><a href="#" data-toggle="modal" data-target="#myModal"><span class="glyphicon glyphicon-log-in"></span> Log In</a></li>


</ul>

</div>
      </div>
    </div>
    <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">LOG IN</h4>
        </div>
        <div class="modal-body">
                    <form class="form-horizontal" method="post" action="login.action">
    <div class="form-group">
      <label class="control-label" style="margin-left: 20px;" for="uname">UserName:</label><br>

      <div class="col-sm-12">
       <s:textfield name="uname" cssClass ="form-control"  placeholder="Enter UserName" ></s:textfield>
      </div>
    </div>
    <div class="form-group">
      <label class="control-label" style="margin-left: 20px;" for="pwd">Password:</label><br>
      <div class="col-sm-12">    
      <s:password name="pwd" placeholder="Password" cssClass ="form-control"></s:password>       
      </div>
      <br>
    <a href="forgotp.jsp" style="margin-left: 20px;">Forgot Password ?</a>
    <br>
    </div>
    <div class="form-group">        
      <div style="margin-left: 20px;">
        <div class="checkbox">
          <label><input type="checkbox" name="remember"> Remember me</label>
        </div>
      </div>
    </div>
    <div class="form-group">        
      <div style="margin-left: 16px;">
        <button type="submit" style="width: 98%" class="btn btn-success btn-lg">Submit</button>
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
<div class="modal fade" id="myModal1" role="dialog">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">SIGN UP HERE..</h4>
        </div>
        <div class="modal-body">

        <form class="form-horizontal" method="post" action="signup.action">
   <div class="form-group">
      <label class="control-label" style="margin-left: 20px;" for="name">Full Name:</label><br>

      <div class="col-sm-12">
        <input type="text" class="form-control" id="name" placeholder="Enter Your Name" name="name" required > 
      </div>
    </div>
    <div class="form-group">
      <label class="control-label" style="margin-left: 20px;" for="uname">UserName:</label><br>
      <div class="col-sm-12">
   <s:textfield name="uname" cssClass ="form-control"  placeholder="Enter an appropriate Username"> </s:textfield>  
      </div>
    </div>

    <div class="form-group">
      <label class="control-label" style="margin-left: 20px;" for="email"required>Email:</label><br>

      <div class="col-sm-12">
      <s:textfield name="email" cssClass ="form-control"  placeholder="Enter email" ></s:textfield>
      </div>
    </div>
    <div class="form-group">
      <label class="control-label" style="margin-left: 20px;" for="pwd">Password:</label><br>
      <div class="col-sm-12">          
        <input type="password" class="form-control" id="pwd" placeholder="Enter password" name="pwd" required>
      </div>
    </div>
<div class="form-group">
      <label class="control-label" style="margin-left: 20px;" for="pwd">Referral:</label><br>
      <div class="col-sm-12">          
        <input type="text" class="form-control" id="pwd" placeholder="Optional" name="ref" >
      </div>
    </div>
    <div class="form-group">
      <label class="control-label" style="margin-left: 20px;" for="date">Birthday:</label><br>

      <div class="col-sm-12">
        <input style="width: 20%;height: 40px;" type="date" class="form-control" id="date" name="date" required>
      </div>
    </div>

    <div class="form-group"> 
     <label style="margin-left: 20px;" class="control-label" for="sex">Gender:</label><br>
        <input style="margin-left: 20px;" type="radio" id="sex" name="sex" value="male"required>Male
        <input type="radio" id="sex" name="sex" value="female"required>Female

     </div>   
      <div class="form-group"> 
     <label style="margin:10px 0px 10px 20px;" class="control-label" for="securityques">Security Question:</label><br>
       <label style="margin:10px 0px 10px 20px;" class="control-label" for="1stques">Q:What is your first pet's name? (Answer In One Word)</label><br>
       <div class="col-sm-12">
       <input type="text" class="form-control" id="1stques" name="ques1" id="1stques" placeholder="answer only in one word.." required>
        </div>
     </div> 
     <div class="form-group"> 
       <label style="margin:10px 0px 10px 20px;" class="control-label" for="2ndques">Q:Which is your favourite camera ?(Answer In One Word)</label><br>
       <div class="col-sm-12">
       <input type="text" class="form-control" id="1stques" name="ques2" id="1stques" placeholder="answer only in one word.." required>
        </div>
     </div>  
    
    
    <div class="form-group">        
      <div style="margin-left: 20px;">
        <div class="checkbox">
          <label><input type="checkbox" name="remember"> Remember me</label>
        </div>
      </div>
            <br><p style="margin-left: 20px;">By creating an account you agree to our <a href="privacypolicy.jsp">Terms & Privacy</a>.</p>

    </div>
    <div class="form-group">        
      <div style="margin-left: 16px;">
        <button type="submit" style="width: 98%" class="btn btn-success btn-lg" onclick="alert('Thank You For Joining CaptureIt')">Submit</button>
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


  </nav>


<div class="container-fluid" style="margin-top: -10px;">
  <div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
      <li data-target="#myCarousel" data-slide-to="3"></li>
    </ol>

    <!-- Wrapper for slides --> 
         <%  
       String pic;
       String uname1=(String)session.getAttribute("uname");
       ArrayList<String> ar=new ArrayList();
       try
       {   
       Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://captureitac.cxtvglcjxdhp.ap-south-1.rds.amazonaws.com:3306/captureit","akashroot","jaswant1971akash");
	    Statement st=con.createStatement();
	    ResultSet rs1=st.executeQuery("select * from sliderimages");
	    while(rs1.next() )
	    {
	    	ar.add(rs1.getString(1));
	    }
	    
	}
	catch(Exception e)
	{
		System.out.println(e);
	}
       for (int i = ar.size() - 1 ; i >= 0 ; i--) 
       {
	%>
	
    <div class="carousel-inner" role="listbox">

      <div class="item active">
        <img src="https://s3.ap-south-1.amazonaws.com/captureit.ac/sliderimages/<%out.print(ar.get(i)); i--;%>" alt="" id="slider-images">
        <div class="carousel-caption">
          <a style="margin-bottom: 20px;" class="btn btn-success btn-lg" href="#" data-toggle="modal" data-target="#myModal1">Join Now</a>

        </div>
      </div>

      <div class="item">
        <img src="https://s3.ap-south-1.amazonaws.com/captureit.ac/sliderimages/<%out.print(ar.get(i)); i--;%>" alt="" id="slider-images">
        <div class="carousel-caption">
                    <a style="margin-bottom: 20px;" class="btn btn-success btn-lg" href="#" data-toggle="modal" data-target="#myModal1">Join Now</a>

        </div>
      </div>
    
      <div class="item">
        <img src="https://s3.ap-south-1.amazonaws.com/captureit.ac/sliderimages/<%out.print(ar.get(i)); i--;%>" alt="" id="slider-images" >
        <div class="carousel-caption">
          <a style="margin-bottom: 20px;" class="btn btn-success btn-lg" href="#" data-toggle="modal" data-target="#myModal1">Join Now</a>

        </div>
      </div>

      <div class="item">
        <img src="https://s3.ap-south-1.amazonaws.com/captureit.ac/sliderimages/<%out.print(ar.get(i)); i--;%>" alt="" id="slider-images">
        <div class="carousel-caption">
          <a style="margin-bottom: 20px;" class="btn btn-success btn-lg" href="#" data-toggle="modal" data-target="#myModal1">Join Now</a>

        </div>
      </div>
  
    </div>
<%} %>
    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
  </div>
  <div class="container-fluid" style="background-color:#f4f4f4;">

  	<div class="row" style="margin:0 auto;">
                <h2>Start Your Journey With Us</h2>
            </div>
<div class="row" style="margin-top: 20px;">

<div class="col-sm-4">

<div class="plan-box js--wp-4">
                <div>
                <h3>CONTESTS</h3>
                    <p class="plan-price"><img src="https://s3.ap-south-1.amazonaws.com/captureit.ac/images/cont.png"></p>
                
                    </div>
            
                    <div><a href="#" class="btn btn-full" href="#" data-toggle="modal" data-target="#myModal1">Join Now</a></div>
                </div>
</div>

<div class="col-sm-4">
<div class="plan-box js--wp-4">
                <div>
                <h3>BLOG</h3>
                    <p class="plan-price"><img src="https://s3.ap-south-1.amazonaws.com/captureit.ac/images/bl.png"></p>
                
                    </div>
            
                    <div><a href="#" class="btn btn-full" href="#" data-toggle="modal" data-target="#myModal1">Join Now</a></div>
                </div>
</div>
<div class="col-sm-4">
<div class="plan-box js--wp-4">
                <div>
                <h3>FORUM</h3>
                    <p class="plan-price"><img src="https://s3.ap-south-1.amazonaws.com/captureit.ac/images/for.png"></p>
                
                    </div>
            
                    <div><a href="#" class="btn btn-full" href="#" data-toggle="modal" data-target="#myModal1">Join Now</a></div>
                </div>

</div>
</div>
<div class="container-fluid navbar-default" style="margin-top: 5px;">

<div class="row" style="box-shadow: 1px 2px 4px rgba(0, 0, 0, .5);background-color:grey;">
<div class="col-sm-4" align="center">





</div>
<div class="col-sm-4" align="center">

<ul class="list-inline" style="margin-top:10px">

<li class="list-group-item" style="background-color: grey;border:0px;"><a href="https://www.facebook.com/captureit1/" style="text-decoration: none;"><img src="https://s3.ap-south-1.amazonaws.com/captureit.ac/images/facebook.png" width="50"></a></li>

<li class="list-group-item" style="background-color: grey;border:0px;margin-left: 20px;"><a href="https://www.youtube.com/channel/UCt2yRIhXnRY8ovUDIAdh0eA" style="text-decoration: none;"><img src="https://s3.ap-south-1.amazonaws.com/captureit.ac/images/youtube.png" width="70"></a></li>




<li class="list-group-item" style="background-color: grey;border:0px;margin-left: 20px;"><a href="https://www.instagram.com/captureitteam/" style="text-decoration: none;"><img src="https://s3.ap-south-1.amazonaws.com/captureit.ac/images/instagram.png" width="50"></a></li>


</ul>
</div>
<div class="col-sm-4">

</div>	
</div>
<div class="row" style="background-color:grey;">
<div class="col-sm-12" style="text-align:center;">

<p style="font-size:20px;color:white;"><b>CaptureIt&copy;|2018</b></p>
<ul class="list-inline">
<li><a href="privacypolicy.jsp" style="font-size:15px;color:#fff;">Privacy Policy</a></li>
<li><a href="toc.jsp" style="font-size:15px;color:#fff;" >Terms & Conditions</a></li>


</ul>
</div>

</div>

</div>




</body>
</html>