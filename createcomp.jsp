<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>MY PROFILE</title>
       <meta charset="utf-8"/>
   <meta name="viewport" content="width=device-width,initial-state=1"/>
      <link type="text/css" rel="stylesheet" href="css/bootstrap.css"/>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.8.2.js"></script>
   <link rel="stylesheet" type="text/css" href="jquery.fancybox.min.css">
   <script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
    
   <script type="text/javascript" src="js/bootstrap.js"></script>
     
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
  <script type="text/javascript">
  
   $(function() {
    var imagesPreview = function(input, placeToInsertImagePreview) {

        if (input.files) {
            var filesAmount = input.files.length;

            for (i = 0; i < filesAmount; i++) {
                var reader = new FileReader();

                reader.onload = function(event) {
                    $($.parseHTML('<img style="width:250px;height:250px;float:left;margin-left:5px;margin-bottom:5px;" class="img-responsive">')).attr('src', event.target.result).appendTo(placeToInsertImagePreview);
                }

                reader.readAsDataURL(input.files[i]);
            }
        }

    };

    $('#gallery-photo-add').on('change', function() {
        imagesPreview(this, 'div.gallery');
    });
});




</script>
<script type="text/javascript">
  
   $(function() {
    var imagesPreview = function(input, placeToInsertImagePreview) {

        if (input.files) {
            var filesAmount = input.files.length;

            for (i = 0; i < filesAmount; i++) {
                var reader = new FileReader();

                reader.onload = function(event) {
                    $($.parseHTML('<img style="width:250px;height:250px;float:left;margin-left:5px;margin-bottom:5px;" class="img-responsive">')).attr('src', event.target.result).appendTo(placeToInsertImagePreview);
                }

                reader.readAsDataURL(input.files[i]);
            }
        }

    };

    $('#competition-photo-add').on('change', function() {
        imagesPreview(this, 'div.comp');
    });
});




</script>

</head>
<body>

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


<%
String uname1=(String)session.getAttribute("uname");
if(uname1==null||uname1=="")
{
	response.sendRedirect("frontpage.jsp");
}
%>
<br><br>
<div class="container" id="CNC">
   
<h3><b>Create New Competition</b></h3>
<br><br>
<form method="post" action="competetion.action" enctype="multipart/form-data">

 <div class="form-group">
      <label for="compname">Comptition Name:</label>
      <input class="form-control" type="text" name="compname" placeholder="comp name.." id="compname">
    </div>


 <div class="form-group">
      <label for="description">Description:</label>
      <textarea class="form-control" name="compdesc"rows="5" id="description"></textarea>
    </div>



 <label style="cursor: pointer;font-size: 15px;">
            <input type="file" multiple id="competition-photo-add" name="compimage" style="display: none;" /><span class="glyphicon glyphicon-film" style="cursor: pointer;"></span>  Add Comp Images</label>
            <br>
           <div class="container-fluid">

          <div class="comp" class="col-sm-12" ></div>
          </div>


<button type="submit"  class="btn btn-success" >Submit</button>
</form>

</div>











</body>
</html>