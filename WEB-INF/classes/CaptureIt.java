import java.io.File;
import java.time.LocalDate; 
import java.sql.*;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringEscapeUtils;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.SessionAware;

import com.amazonaws.auth.AWSStaticCredentialsProvider;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3ClientBuilder;
import com.amazonaws.services.s3.model.DeleteObjectRequest;
public class CaptureIt extends Aws  implements SessionAware  
{

	Map m;

	// set session starts //

	public void setSession(Map m)
	{
		this.m=m;
	}

	// sets session ends //

	// login user starts //
	private String uname,pwd;
	public String getUname() {
		return uname;
	}

	public void setUname(String uname) {
		this.uname = uname;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
		public String login()
	{
		String ret="";
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://captureitac.cxtvglcjxdhp.ap-south-1.rds.amazonaws.com:3306/captureit","akashroot","jaswant1971akash");
		    Statement st=con.createStatement();
		    if(uname.equals("captureitteam.admin"))
		    {
		    	ResultSet rs1=st.executeQuery("select * from sign_up_details where uname='"+uname+"' and password='"+pwd+"'");
		    	if(rs1.next())
		    	{
		    		ret="adone";
		    		}
		    	else 
		    		ret="ndone";
		    }
		    else
		    {
		    ResultSet rs=st.executeQuery("select * from sign_up_details where uname='"+uname+"' and password='"+pwd+"' ");
		    if(rs.next())
		    {
		    	ret="done";
		    }
		    else
		    {
		    	addFieldError("uname","Wrong Username Or Password");
				ret="ndone";
				
		    }
		    }
		    m.put("uname", uname);
		}
		catch(Exception ee)
		{
			System.out.println(ee);
		}
		 return ret;
	}



	// login user ends //







private File ppimage;
private String ppimageContentType;
private String ppimageFileName;
public File getPpimage() {
return ppimage;
}
public void setPpimage(File ppimage) {
this.ppimage = ppimage;
}
public String getPpimageContentType() {
return ppimageContentType;
}
public void setPpimageContentType(String ppimageContentType) {
this.ppimageContentType = ppimageContentType;
}
public String getPpimageFileName() {
return ppimageFileName;
}
public void setPpimageFileName(String ppimageFileName) {
this.ppimageFileName = ppimageFileName;
}

//profile picture upload starts //

public String profilePicture()
{
	String ret="";
try
{
	HttpServletRequest request=ServletActionContext.getRequest();  
	HttpSession session=request.getSession();  
	String s=(String)session.getAttribute("uname"); 
	Random rand = new Random();
    String kj= Integer.toString(rand.nextInt(10000));
	
	String aj=kj+s+ppimageFileName;
	String jk=Aws.dp(ppimage,aj);
	if(jk=="y")
	{
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://captureitac.cxtvglcjxdhp.ap-south-1.rds.amazonaws.com:3306/captureit","akashroot","jaswant1971akash");
Statement st=con.createStatement();
int i=st.executeUpdate("update pimages set imagesrc='"+aj+"' where uname='"+s+"'" );
if(i>0)
	ret="success";
else if(i<0)
	ret="nope";
	}
	else if(jk=="n")
		ret="nope";
 
}
catch(Exception e)
{
System.out.print(e);	
System.out.println("yahan hi hun");
}
return ret;
}

// profile picture upload ends //
private File ggimage;
private String ggimageContentType;
private String ggimageFileName;
private File cpimage;
private String cpimageContentType;
private String cpimageFileName;

// gallery pic upload starts //


public File getGgimage() {
	return ggimage;
}

public File getCpimage() {
	return cpimage;
}

public void setCpimage(File cpimage) {
	this.cpimage = cpimage;
}

public String getCpimageContentType() {
	return cpimageContentType;
}

public void setCpimageContentType(String cpimageContentType) {
	this.cpimageContentType = cpimageContentType;
}

public String getCpimageFileName() {
	return cpimageFileName;
}

public void setCpimageFileName(String cpimageFileName) {
	this.cpimageFileName = cpimageFileName;
}

public void setGgimage(File ggimage) {
	this.ggimage = ggimage;
}

public String getGgimageContentType() {
	return ggimageContentType;
}

public void setGgimageContentType(String ggimageContentType) {
	this.ggimageContentType = ggimageContentType;
}

public String getGgimageFileName() {
	return ggimageFileName;
}

public void setGgimageFileName(String ggimageFileName) {
	this.ggimageFileName = ggimageFileName;
}


public String ggPicture()
{
	String ret="";
	HttpServletRequest request1=ServletActionContext.getRequest();  
	HttpSession session1=request1.getSession();  
	String s2=(String)session1.getAttribute("uname"); 
	try
	{Random rand = new Random();
    String kj= Integer.toString(rand.nextInt(10000));
	
	String aj=kj+s2+ggimageFileName;
		String jk=Aws.gg(ggimage,aj);
		if(jk=="y")
		{
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://captureitac.cxtvglcjxdhp.ap-south-1.rds.amazonaws.com:3306/captureit","akashroot","jaswant1971akash");
Statement st=con.createStatement();
int i=st.executeUpdate("insert into usergg values ('"+s2+"','"+aj+"')");
if(i>0)
{
	ret="success";


}
	else if(i<0)
	ret="nope";
		}
		else if(jk=="n")
			ret="nope";
}
catch(Exception e)
{
System.out.print(e);	
System.out.println("I am here");
}
return ret;
}

// gallery pic upload ends //

//Cover Pic upload starts//
public String coverPicture()
{
	String ret="";
try
{
	HttpServletRequest request=ServletActionContext.getRequest();  
	HttpSession session=request.getSession();  
	String s1=(String)session.getAttribute("uname"); 
	Random rand = new Random();
    String kj= Integer.toString(rand.nextInt(10000));
	
	String aj=kj+s1+cpimageFileName;
	String jk=Aws.cg(cpimage,aj);
	if(jk=="y")
	{
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://captureitac.cxtvglcjxdhp.ap-south-1.rds.amazonaws.com:3306/captureit","akashroot","jaswant1971akash");
Statement st=con.createStatement();
int i=st.executeUpdate("update cpimages set imagesrc='"+aj+"' where uname='"+s1+"'" );
if(i>0)
	ret="success";
else if(i<0)
	ret="nope";
}
	else if(jk=="n")
		ret="nope";
	}
catch(Exception e)
{
System.out.print(e);	
}
return ret;
}
//Cover pic upload ends//

//Forum Starts
private String Ques;
public String getQues() {
	return Ques;
}

public void setQues(String ques) {
	Ques = ques;
}


public String forum()
{
	String ret="";
	try
	{
		String ques2= StringEscapeUtils.escapeJavaScript(Ques);
		HttpServletRequest request=ServletActionContext.getRequest();  
		HttpSession session=request.getSession();  
		String s2=(String)session.getAttribute("uname"); 
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://captureitac.cxtvglcjxdhp.ap-south-1.rds.amazonaws.com:3306/captureit","akashroot","jaswant1971akash");
Statement st=con.createStatement();
int i=st.executeUpdate("insert into forum values('"+s2+"','"+ques2+"')");
if(i>0)
	{
		ret="done";
	}
	else 
	{
		ret="ndone";
	}
	}
	catch(Exception ee)
	{
	System.out.println(ee);
	}
	return ret;
}



//Forum Ends



//create Competetion starts 
private String compname;
private String compdesc;
public String getCompdesc() {
	return compdesc;
}

public void setCompdesc(String compdesc) {
	this.compdesc = compdesc;
}

private File compimage;
private String compimageContentType;
private String compimageFileName;
public File getCompimage() {
	return compimage;
}

public void setCompimage(File compimage) {
	this.compimage = compimage;
}

public String getCompimageContentType() {
	return compimageContentType;
}

public void setCompimageContentType(String compimageContentType) {
	this.compimageContentType = compimageContentType;
}

public String getCompname() {
	return compname;
}

public void setCompname(String compname) {
	this.compname = compname;
}

public String getCompimageFileName() {
	return compimageFileName;
}

public void setCompimageFileName(String compimageFileName) {
	this.compimageFileName = compimageFileName;
}


public String compicture()
{
String ret="";
String compname1= StringEscapeUtils.escapeJavaScript(compname);
String compdesc1= StringEscapeUtils.escapeJavaScript(compdesc);
try 
{
	
	String jk=Aws.comp(compimage,compimageFileName);
	if(jk=="y")
	{
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://captureitac.cxtvglcjxdhp.ap-south-1.rds.amazonaws.com:3306/captureit","akashroot","jaswant1971akash");
Statement st=con.createStatement();
int i=st.executeUpdate("insert into contestpost (contestname,compimagesrc,caption)values('"+compname1+"','"+compimageFileName+"','"+compdesc1+"')");
if(i>0)
	ret="success";
else if(i<0)
	ret="nope";
}
	else if(jk=="n")
		ret="nope";
}
catch(Exception e)
{
System.out.print(e);

}

return ret;
}
//create Competetion ends


//Article Submission Starts
private File article[];
private String articleFileName[];
private String articleContentType[];
private String caption;
private String title;
private String richTextField;

public String getRichTextField() {
	return richTextField;
}

public void setRichTextField(String richTextField) {
	this.richTextField = richTextField;
}


public String getTitle() {
	return title;
}

public void setTitle(String title) {
	this.title = title;
}

public File[] getArticle() {
	return article;
}

public void setArticle(File[] article) {
	this.article = article;
}

public String[] getArticleFileName() {
	return articleFileName;
}

public void setArticleFileName(String[] articleFileName) {
	this.articleFileName = articleFileName;
}

public String[] getArticleContentType() {
	return articleContentType;
}

public void setArticleContentType(String[] articleContentType) {
	this.articleContentType = articleContentType;
}

public String getCaption() {
	return caption;
}

public void setCaption(String caption) {
	this.caption = caption;
}


public String artpicture()
{
	String ret="";
	String temp="";
	String title2= StringEscapeUtils.escapeJavaScript(title);
	String caption1= StringEscapeUtils.escapeJavaScript(caption);
	  String resultss = StringEscapeUtils.escapeJavaScript(richTextField);
        try {
        	HttpServletRequest request=ServletActionContext.getRequest();  
    		HttpSession session=request.getSession();  
    		String s2=(String)session.getAttribute("uname"); 
    Class.forName("com.mysql.jdbc.Driver");
    Connection con=DriverManager.getConnection("jdbc:mysql://captureitac.cxtvglcjxdhp.ap-south-1.rds.amazonaws.com:3306/captureit","akashroot","jaswant1971akash");
    Statement st=con.createStatement();
            for(int i=0;i<article.length;i++)
            {
            	Random rand = new Random();
                String kj= Integer.toString(rand.nextInt(10000));
            	
            	String aj=kj+s2+articleFileName[i];
           Aws.art(article[i],aj);
           
           st.executeUpdate("insert into artimages values('"+s2+"','"+aj+"','"+caption1+"','"+title2+"','"+resultss+"')");
            }
            ret="success";
        } catch (Exception ex) {
            ret="nope";
            System.out.println(ex);
            System.out.println("++++");
        }
    
return ret;
}
//Article Submission Ends\



//article approval starts

private String artpicname;
private String ussname;
private String artdesc;
private String title1;
private String para;
private String picid;
private String decision1;


public String getArtpicname() {
	return artpicname;
}

public String getTitle1() {
	return title1;
}

public void setTitle1(String title1) {
	this.title1 = title1;
}

public String getPara() {
	return para;
}

public void setPara(String para) {
	this.para = para;
}

public void setArtpicname(String artpicname) {
	this.artpicname = artpicname;
}

public String getUssname() {
	return ussname;
}

public void setUssname(String ussname) {
	this.ussname = ussname;
}

public String getArtdesc() {
	return artdesc;
}

public void setArtdesc(String artdesc) {
	this.artdesc = artdesc;
}

public String getPicid() {
	return picid;
}

public void setPicid(String picid) {
	this.picid = picid;
}

public String getDecision1() {
	return decision1;
}

public void setDecision1(String decision1) {
	this.decision1 = decision1;
}

public String artapprove()
{
	String ret="";
	int j=0;
	int c=0;
	LocalDate date = LocalDate.now(); 
	 String resultss = StringEscapeUtils.escapeJavaScript(para);
if(decision1.equals("approve"))
{
	try {
		Class.forName("com.mysql.jdbc.Driver");
		Connection con0=DriverManager.getConnection("jdbc:mysql://captureitac.cxtvglcjxdhp.ap-south-1.rds.amazonaws.com:3306/captureit","akashroot","jaswant1971akash");
		Statement st0=con0.createStatement();
		ResultSet rs0=st0.executeQuery("select * from artimagesdisplay where picid='"+picid+"'");
		if(rs0.next())
		{
			j=1;
		}
	}
	catch(Exception ee)

	{
		System.out.println(ee);
	}
	
	
	
	try {
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://captureitac.cxtvglcjxdhp.ap-south-1.rds.amazonaws.com:3306/captureit","akashroot","jaswant1971akash");
	Statement st=con.createStatement();
	st.addBatch("insert into artimagesdisplay() values('"+ussname+"','"+artpicname+"','"+artdesc+"','"+title1+"','"+resultss+"','"+picid+"','"+date+"')");
    st.addBatch("delete from artimages where artimagesrc='"+artpicname+"'");
    int i[]=st.executeBatch();
    if(i[0]>0)
    {
    	ret="done";
    }
	}
catch(Exception ee)
	{
	System.out.println(ee);
	
	ret="ndone";}
	if(j==0)
	{
	try 
	{
		 Class.forName("com.mysql.jdbc.Driver");
			Connection con1=DriverManager.getConnection("jdbc:mysql://captureitac.cxtvglcjxdhp.ap-south-1.rds.amazonaws.com:3306/captureit","akashroot","jaswant1971akash");
			Statement st1=con1.createStatement();
			ResultSet rs=st1.executeQuery("select * from sign_up_details where uname='"+ussname+"'");
			if(rs.next())
				{
				c=rs.getInt(7);
				c=c+50;
				}
	}
	catch(Exception ee)
	{
		System.out.println(ee);
	}
	
	try 
	{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con2=DriverManager.getConnection("jdbc:mysql://captureitac.cxtvglcjxdhp.ap-south-1.rds.amazonaws.com:3306/captureit","akashroot","jaswant1971akash");
		Statement st2=con2.createStatement();
	st2.executeUpdate("update sign_up_details set credits='"+c+"' where uname='"+ussname+"'" );
		
	}
	catch(Exception ee)
	{
		System.out.println(ee);
	}
}
}
else if(decision1.equals("delete"))
{
	try
	{
		Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://captureitac.cxtvglcjxdhp.ap-south-1.rds.amazonaws.com:3306/captureit","akashroot","jaswant1971akash");
	Statement st=con.createStatement();
    st.executeUpdate("delete from artimages where artimagesrc='"+artpicname+"'");
    
    BasicAWSCredentials awsCreds = new BasicAWSCredentials("AKIAJG3CX3NELPMXADCQ", "GFgQRApgP5T/plu22K7WeQrI/WdZRkEXZCCsXtg/");
	AmazonS3 s3Client = AmazonS3ClientBuilder.standard()
							.withRegion("ap-south-1")
	                        .withCredentials(new AWSStaticCredentialsProvider(awsCreds))
	                        .build();
	String keyName="artimages"+"/"+picname;;
	 s3Client.deleteObject(new DeleteObjectRequest("captureit.ac", keyName));
    
    ret="done";
}
	catch(Exception ee)
	{
		System.out.println(ee);
		ret="ndone";
	}
	
	}
	return ret;
}
//article approval ends
//cigallery starts //
private String captionci;
private File cigimage;
private String cigimageContentType;
private String cigimageFileName;
public String getCaptionci() {
	return captionci;
}

public void setCaptionci(String captionci) {
	this.captionci = captionci;
}

public File getCigimage() {
	return cigimage;
}

public void setCigimage(File cigimage) {
	this.cigimage = cigimage;
}

public String getCigimageContentType() {
	return cigimageContentType;
}

public void setCigimageContentType(String cigimageContentType) {
	this.cigimageContentType = cigimageContentType;
}

public String getCigimageFileName() {
	return cigimageFileName;
}

public void setCigimageFileName(String cigimageFileName) {
	this.cigimageFileName = cigimageFileName;
}

public String cigallery()
{
	String ret="";
	String captionci1= StringEscapeUtils.escapeJavaScript(captionci);
	try 
	{
		HttpServletRequest request=ServletActionContext.getRequest();  
		HttpSession session=request.getSession();  
		String s2=(String)session.getAttribute("uname");
		
		Random rand = new Random();
	    String kj= Integer.toString(rand.nextInt(10000));
		
		String aj=kj+s2+cigimageFileName;
		String jk=Aws.cigal(cigimage,aj);
		if(jk=="y")
		{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://captureitac.cxtvglcjxdhp.ap-south-1.rds.amazonaws.com:3306/captureit","akashroot","jaswant1971akash");
	Statement st=con.createStatement();
	int i=st.executeUpdate("insert into cig values('"+s2+"','"+aj+"','"+captionci1+"')");
	if(i>0)
		ret="success";
	else if(i<0)
		ret="nope";
	}
		else if(jk=="n")
			ret="nope";
	}
	catch(Exception e)
	{
	System.out.print(e);	
	}

	return ret;	
}
//cigallery ends//


//admin decision for cigallery starts//
public String picname;
public String usname;
public String desc;
public String decision;

public String getPicname() {
	return picname;
}

public void setPicname(String picname) {
	this.picname = picname;
}

public String getusname() {
	return usname;
}

public void setusname(String usname) {
	this.usname = usname;
}

public String getDesc() {
	return desc;
}

public void setDesc(String desc) {
	this.desc = desc;
}

public String getDecision() {
	return decision;
}

public void setDecision(String decision) {
	this.decision = decision;
}

public String decision1()
{
	String ret="";
	int c=0;
if(decision.equals("approve"))
{
	try {
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://captureitac.cxtvglcjxdhp.ap-south-1.rds.amazonaws.com:3306/captureit","akashroot","jaswant1971akash");
	Statement st=con.createStatement();
	st.addBatch("insert into cigallery values('"+usname+"','"+picname+"','"+desc+"')");
    st.addBatch("delete from cig where imgsrc='"+picname+"'");
    int i[]=st.executeBatch();
    if(i[0]>0)
    {
    	ret="done";
    }
	}
catch(Exception ee)
	{
	System.out.println(ee);
	System.out.println("1");
	ret="ndone";}
	try 
	{
		 Class.forName("com.mysql.jdbc.Driver");
			Connection con1=DriverManager.getConnection("jdbc:mysql://captureitac.cxtvglcjxdhp.ap-south-1.rds.amazonaws.com:3306/captureit","akashroot","jaswant1971akash");
			Statement st1=con1.createStatement();
			ResultSet rs=st1.executeQuery("select * from sign_up_details where uname='"+usname+"'");
			if(rs.next())
				{
				c=rs.getInt(7);
				c=c+50;
				}
	}
	catch(Exception ee)
	{
		System.out.println(ee);
		System.out.println("2");
	}
	
	try 
	{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con2=DriverManager.getConnection("jdbc:mysql://captureitac.cxtvglcjxdhp.ap-south-1.rds.amazonaws.com:3306/captureit","akashroot","jaswant1971akash");
		Statement st2=con2.createStatement();
	st2.executeUpdate("update sign_up_details set credits='"+c+"' where uname='"+usname+"'" );
		
	}
	catch(Exception ee)
	{
		System.out.println(ee);
		System.out.println("3");
	}
}
else if(decision.equals("delete"))
{
	try
	{
		Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://captureitac.cxtvglcjxdhp.ap-south-1.rds.amazonaws.com:3306/captureit","akashroot","jaswant1971akash");
	Statement st=con.createStatement();
    st.executeUpdate("delete from cig where imgsrc='"+picname+"'");
    BasicAWSCredentials awsCreds = new BasicAWSCredentials("AKIAJG3CX3NELPMXADCQ", "GFgQRApgP5T/plu22K7WeQrI/WdZRkEXZCCsXtg/");
  	AmazonS3 s3Client = AmazonS3ClientBuilder.standard()
  							.withRegion("ap-south-1")
  	                        .withCredentials(new AWSStaticCredentialsProvider(awsCreds))
  	                        .build();
  	String keyName="cig"+"/"+picname;;
  	 s3Client.deleteObject(new DeleteObjectRequest("captureit.ac", keyName));
    ret="done";
}
	catch(Exception ee)
	{
		System.out.println(ee);
		ret="ndone";
		System.out.println("4");
	}
	
	}
	return ret;
}
//admin decision for cigallery ends//


}

