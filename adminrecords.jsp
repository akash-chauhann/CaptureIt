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
   <script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
   <script type="text/javascript" src="js/bootstrap.js"></script>

    <link href="https://s3.ap-south-1.amazonaws.com/captureit.ac/images/logo.jpg" rel="favicon icon">

    
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


<br><br>
<div id="CU" class="container">

<table  class="table table-bordered">
<thread>
<tr>
<td>Name</td>
<td>Uname</td>
<td>Email</td>
<td>PassWord</td>
<td>DOB</td>
<td>Gender</td>
<td>Credits</td>
<td>Id</td>
<td>Ques1</td>
<td>Ques2</td>
</tr>
</thread>
<%
String uname1=(String)session.getAttribute("uname");
if(uname1==null||uname1=="")
{
	response.sendRedirect("frontpage.jsp");
}
try
{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://captureitac.cxtvglcjxdhp.ap-south-1.rds.amazonaws.com:3306/captureit","akashroot","jaswant1971akash");	
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select * from sign_up_details ");
while(rs.next())
{
%>
    <tr>
    <td><%=rs.getString(1)%></td>
    <td><%=rs.getString(2) %></td>
    <td><%=rs.getString(3) %></td>
    <td><%=rs.getString(4) %></td>
    <td><%=rs.getString(5) %></td>
    <td><%=rs.getString(6) %></td>
    <td><%=rs.getInt(7) %></td>
    <td><%=rs.getInt(8)  %></td>
     <td><%=rs.getString(9) %></td>
    <td><%=rs.getString(10) %></td>
    </tr>
    <% 
}
}
catch(Exception e)
{
    System.out.println(e);
    System.out.println("yaassssssssss");
    }
%>
    </table>
</div>



 <form class="form-horizontal" method="post" action="del1.action">
    
     
    <div class="col-sm-12">
    <div class="form-group">
     <input type="text" class="form-control" id="email" placeholder="Enter Username" name="del1" style="border-radius:10px;height:50px;width:98%;margin:0px 5px; 0px 5px;">
      </div>
      </div>
     
 <div class="form-group" align="center">        
      <div style="margin-left: 16px;">
        <button type="submit" style="width: 90%;margin:10px 5px 0px 5px;" class="btn btn-success btn-lg">Delete User</button>
      </div>
    </div>
  </form>

</body>
</html>