import java.io.File;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringEscapeUtils;
import org.apache.struts2.ServletActionContext;

import com.amazonaws.auth.AWSStaticCredentialsProvider;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3ClientBuilder;
import com.amazonaws.services.s3.model.DeleteObjectRequest;
import com.opensymphony.xwork2.ActionSupport; 
public class Validation extends ActionSupport
{
		
	private String name,uname,email,pwd,date,sex,ref,ques1,ques2;
	
	
	public String getQues1() {
		return ques1;
	}

	public void setQues1(String ques1) {
		this.ques1 = ques1;
	}

	public String getQues2() {
		return ques2;
	}

	public void setQues2(String ques2) {
		this.ques2 = ques2;
	}

	public String getRef() {
		return ref;
	}

	public void setRef(String ref) {
		this.ref = ref;
	}

	public String getUname() {
		return uname;
	}

	public void setUname(String uname) {
		this.uname = uname;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	// user signup starts //

	public String signup()
	{   
		String bbio=" ";
		int credit=0,flag=0,c=50;
		String profile="profile1.jpg";
		String cover="backgroundp.jpg";
		String ret="";
	
		try
		{

			Class.forName("com.mysql.jdbc.Driver");
			Connection con1=DriverManager.getConnection("jdbc:mysql://captureitac.cxtvglcjxdhp.ap-south-1.rds.amazonaws.com:3306/captureit","akashroot","jaswant1971akash");	
			Statement st1=con1.createStatement();
			ResultSet rs=st1.executeQuery("select * from sign_up_details where uname='"+uname+"'");
			if(rs.next())
			{
				addFieldError("uname","Username Already Taken Try Another One");
				addFieldError("email","Email Already Registered");
				ret="nndone";
				flag=1;
			}
if(flag==0)
{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://captureitac.cxtvglcjxdhp.ap-south-1.rds.amazonaws.com:3306/captureit","akashroot","jaswant1971akash");	
	Statement st=con.createStatement();
	st.addBatch("insert into sign_up_details(name,uname,email,password,dob,gender,credits,ques1,ques2) values('"+name+"','"+uname+"','"+email+"','"+pwd+"','"+date+"','"+sex+"','"+credit+"','"+ques1+"','"+ques2+"')");
	st.addBatch("insert into pimages values('"+uname+"','"+profile+"','"+name+"')");	
	st.addBatch("insert into cpimages values('"+uname+"','"+cover+"')");
	st.addBatch("insert into photographer_details(uname,bio,gender) values('"+uname+"','"+bbio+"','"+sex+"')");
	int i[]=st.executeBatch();
	if(i[0]>0)
		{
			ret="done";
		}
		else 
		{
			ret="ndone";
		}
}


Class.forName("com.mysql.jdbc.Driver");
Connection con3=DriverManager.getConnection("jdbc:mysql://captureitac.cxtvglcjxdhp.ap-south-1.rds.amazonaws.com:3306/captureit","akashroot","jaswant1971akash");
Statement st3=con3.createStatement();
ResultSet rs3=st3.executeQuery("select * from sign_up_details where uname='"+ref+"'");
if(rs3.next())
	{
	c=rs3.getInt(7);
	c=c+10;
	}
Class.forName("com.mysql.jdbc.Driver");
Connection con2=DriverManager.getConnection("jdbc:mysql://captureitac.cxtvglcjxdhp.ap-south-1.rds.amazonaws.com:3306/captureit","akashroot","jaswant1971akash");
Statement st2=con2.createStatement();
st2.executeUpdate("update sign_up_details set credits='"+c+"' where uname='"+ref+"'" );


}
		catch(Exception ee)
		{
		System.out.println(ee);
		}
		
		return ret;
			}

	// user signup ends //

	
	//take user details//
	private String usr,optradio,interest,city,state,camera,lens,bio;
	
	public String getBio() {
		return bio;
	}

	public void setBio(String bio) {
		this.bio = bio;
	}

	public String getUsr() {
		return usr;
	}

	public void setUsr(String usr) {
		this.usr = usr;
	}

	public String getOptradio() {
		return optradio;
	}

	public void setOptradio(String optradio) {
		this.optradio = optradio;
	}

	public String getInterest() {
		return interest;
	}

	public void setInterest(String interest) {
		this.interest = interest;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getCamera() {
		return camera;
	}

	public void setCamera(String camera) {
		this.camera = camera;
	}

	public String getLens() {
		return lens;
	}

	public void setLens(String lens) {
		this.lens = lens;
	}

	public String userDetails()
	{
		String ret="";
		String bio1=StringEscapeUtils.escapeJavaScript(bio);
		String lens1= StringEscapeUtils.escapeJavaScript(lens);
		String camera1= StringEscapeUtils.escapeJavaScript(camera);
		String state1= StringEscapeUtils.escapeJavaScript(state);
		String city1= StringEscapeUtils.escapeJavaScript(city);
		HttpServletRequest request1=ServletActionContext.getRequest();  
		HttpSession session1=request1.getSession();  
		String s2=(String)session1.getAttribute("uname"); 
		try
		{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://captureitac.cxtvglcjxdhp.ap-south-1.rds.amazonaws.com:3306/captureit","akashroot","jaswant1971akash");
		Statement st=con.createStatement();
		st.executeUpdate("update photographer_details set bio='"+bio1+"',interest='"+interest+"',state='"+state1+"',city='"+city1+"',camera='"+camera1+"',lens='"+lens1+"' where uname='"+s2+"'");
			ret="done";
		}
		catch(Exception ee)
		{
			System.out.println(ee);
			ret="ndone";
		}
		return ret;
	}
	
	
	//end user details//
	//competetion entry by credits//
	private String us1name,compcaption,compentryContentType,compentryFileName,compname;
	
	public String getCompname() {
		return compname;
	}

	public void setCompname(String compname) {
		this.compname = compname;
	}

	private File compentry;
	public File getCompentry() {
		return compentry;
	}

	public void setCompentry(File compentry) {
		this.compentry = compentry;
	}

	public String getUs1name() {
		return us1name;
	}

	public void setUs1name(String us1name) {
		this.us1name = us1name;
	}

	public String getCompcaption() {
		return compcaption;
	}

	public void setCompcaption(String compcaption) {
		this.compcaption = compcaption;
	}

	
	public String getCompentryContentType() {
		return compentryContentType;
	}

	public void setCompentryContentType(String compentryContentType) {
		this.compentryContentType = compentryContentType;
	}

	public String getCompentryFileName() {
		return compentryFileName;
	}

	public void setCompentryFileName(String compentryFileName) {
		this.compentryFileName = compentryFileName;
	}

	public String creditEntry()
	{
		String ret="";
		HttpServletRequest request1=ServletActionContext.getRequest();  
		HttpSession session1=request1.getSession();  
		String s2=(String)session1.getAttribute("uname"); 
		String compcaption1= StringEscapeUtils.escapeJavaScript(compcaption);
		int credits=0;
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con1=DriverManager.getConnection("jdbc:mysql://captureitac.cxtvglcjxdhp.ap-south-1.rds.amazonaws.com:3306/captureit","akashroot","jaswant1971akash");
			Statement st1=con1.createStatement();
			ResultSet rs=st1.executeQuery("select * from sign_up_details where uname='"+s2+"'");
			if(rs.next())
			{
					credits=rs.getInt(7)-200;
					st1.executeUpdate("update sign_up_details set credits='"+credits+"' where uname='"+s2+"'");
			}

		}
		catch(Exception ee)
		{
		System.out.println(ee);	
		}

		try 
		{
			Random rand = new Random();
		    String kj= Integer.toString(rand.nextInt(10000));
			
			String aj=kj+s2+compentryFileName;
		String jk=Aws.compentry(compentry,aj);
		if(jk=="y")
		{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://captureitac.cxtvglcjxdhp.ap-south-1.rds.amazonaws.com:3306/captureit","akashroot","jaswant1971akash");
		Statement st=con.createStatement();
		int i=st.executeUpdate("insert into compentries_approve values('"+us1name+"','"+compname+"','"+aj+"','"+compcaption1+"')");
		if(i>0)
			ret="done";
		else if(i<0)
			ret="ndone";
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

	
	
	
	//end ofcompetetion entry by credits//
	//start of paytm entry//
	private String us2name,paytmno,compcaption2,compname2;
	private File compimage2[];
	private String compimage2FileName[];
	private String compimage2ContentType[];
	public String getCompname2() {
		return compname2;
	}

	public void setCompname2(String compname2) {
		this.compname2 = compname2;
	}

	public String getUs2name() {
		return us2name;
	}

	public void setUs2name(String us2name) {
		this.us2name = us2name;
	}

	public String getPaytmno() {
		return paytmno;
	}

	public void setPaytmno(String paytmno) {
		this.paytmno = paytmno;
	}

	public String getCompcaption2() {
		return compcaption2;
	}

	public void setCompcaption2(String compcaption2) {
		this.compcaption2 = compcaption2;
	}

	public File[] getCompimage2() {
		return compimage2;
	}

	public void setCompimage2(File[] compimage2) {
		this.compimage2 = compimage2;
	}

	public String[] getCompimage2FileName() {
		return compimage2FileName;
	}

	public void setCompimage2FileName(String[] compimage2FileName) {
		this.compimage2FileName = compimage2FileName;
	}

	public String[] getCompimage2ContentType() {
		return compimage2ContentType;
	}

	public void setCompimage2ContentType(String[] compimage2ContentType) {
		this.compimage2ContentType = compimage2ContentType;
	}

	public String paytmEntry()
	{
		String ret="";
		
		try {
        	HttpServletRequest request=ServletActionContext.getRequest();  
    		HttpSession session=request.getSession();  
    		String s2=(String)session.getAttribute("uname"); 
    		String compcaption3= StringEscapeUtils.escapeJavaScript(compcaption2);
    Class.forName("com.mysql.jdbc.Driver");
    Connection con=DriverManager.getConnection("jdbc:mysql://captureitac.cxtvglcjxdhp.ap-south-1.rds.amazonaws.com:3306/captureit","akashroot","jaswant1971akash");
    Statement st=con.createStatement();
            for(int i=0;i<compimage2.length;i++)
            {
            	Random rand = new Random();
                String kj= Integer.toString(rand.nextInt(10000));
            	String aj=kj+s2+compimage2FileName[i];
           Aws.paytm(compimage2[i],aj);
           st.executeUpdate("insert into compentries values('"+paytmno+"','"+us2name+"','"+compname2+"','"+aj+"','"+compcaption3+"')");
            }
            ret="done";
			}
	catch(Exception ee)
		{
		ret="ndone";
		System.out.println(ee);
		}
		return ret;
	}
	//start of paytm entry//
	//change password starts//
	private String pwd2;
	public String getPwd2() {
		return pwd2;
	}

	public void setPwd2(String pwd2) {
		this.pwd2 = pwd2;
	}

	public String changep()
	{
		String pwd4= StringEscapeUtils.escapeJavaScript(pwd2);
		String ret="";
		HttpServletRequest request1=ServletActionContext.getRequest();  
	HttpSession session1=request1.getSession();  
	String s2=(String)session1.getAttribute("uname"); 
	
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con1=DriverManager.getConnection("jdbc:mysql://captureitac.cxtvglcjxdhp.ap-south-1.rds.amazonaws.com:3306/captureit","akashroot","jaswant1971akash");
			Statement st1=con1.createStatement();
			int i=st1.executeUpdate("update sign_up_details set password='"+pwd4+"' where uname='"+s2+"'");
			if(i>0)
			{
					ret="done";
					
			}

		}
		catch(Exception ee)
		{
		System.out.println(ee);
		ret="ndone";
		}

		return ret;
		
	}
	//change password ends//

	//forget password starts//
	private String pwd3,usp;
	
	public String getUsp() {
		return usp;
	}

	public void setUsp(String usp) {
		this.usp = usp;
	}

	public String getPwd3() {
		return pwd3;
	}

	public void setPwd3(String pwd3) {
		this.pwd3 = pwd3;
	}

	public String changepp()
	{
		String ret="";
		String pwd5= StringEscapeUtils.escapeJavaScript(pwd3);
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con1=DriverManager.getConnection("jdbc:mysql://captureitac.cxtvglcjxdhp.ap-south-1.rds.amazonaws.com:3306/captureit","akashroot","jaswant1971akash");
			Statement st1=con1.createStatement();
			int i=st1.executeUpdate("update sign_up_details set password='"+pwd5+"' where uname='"+usp+"'");
			if(i>0)
			{
					ret="done";
					
			}

		}
		catch(Exception ee)
		{
		System.out.println(ee);
		ret="ndone";
		}

		return ret;
		
	}
	//forget password ends//
	//take data of contact us form//
	private String emailid1,subject1,msg1;
	
	public String getSubject1() {
		return subject1;
	}

	public void setSubject1(String subject1) {
		this.subject1 = subject1;
	}

	public String getEmailid1() {
		return emailid1;
	}

	public void setEmailid1(String emailid1) {
		this.emailid1 = emailid1;
	}

		public String getMsg1() {
		return msg1;
	}

	public void setMsg1(String msg1) {
		this.msg1 = msg1;
	}

	public String contactUs()
	{
		String ret="";
		HttpServletRequest request1=ServletActionContext.getRequest();  
		HttpSession session1=request1.getSession();  
		String s2=(String)session1.getAttribute("uname"); 
		String subject2= StringEscapeUtils.escapeJavaScript(subject1);
		String msg2= StringEscapeUtils.escapeJavaScript(msg1);
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con1=DriverManager.getConnection("jdbc:mysql://captureitac.cxtvglcjxdhp.ap-south-1.rds.amazonaws.com:3306/captureit","akashroot","jaswant1971akash");
			Statement st1=con1.createStatement();
			int i=st1.executeUpdate("insert into contact_us values('"+emailid1+"','"+subject2+"','"+msg2+"','"+s2+"')");
			if(i>0)
			{
					ret="done";
					
			}

		}
		catch(Exception ee)
		{
		System.out.println(ee);
		ret="ndone";
		}

		return ret;
		
		
	}
	
	//end of take data from contact us form//
	//redeem credits starts//
	private int redeem;
	

	public int getRedeem() {
		return redeem;
	}

	public void setRedeem(int redeem) {
		this.redeem = redeem;
	}

	public String redeem()
	{
		String ret="";
		HttpServletRequest request1=ServletActionContext.getRequest();  
		HttpSession session1=request1.getSession();  
		String s2=(String)session1.getAttribute("uname"); 
		
		int credits=0;
		try
		{
			if(redeem<5000)
			{
				
				addFieldError("redeem","Sorry The minimum Amount That Can Be Redeemed Is 5000");
				ret="ndone";
			}
		else{
			Class.forName("com.mysql.jdbc.Driver");
		
			Connection con1=DriverManager.getConnection("jdbc:mysql://captureitac.cxtvglcjxdhp.ap-south-1.rds.amazonaws.com:3306/captureit","akashroot","jaswant1971akash");
			Statement st1=con1.createStatement();
			ResultSet rs=st1.executeQuery("select * from sign_up_details where uname='"+s2+"'");
			if(rs.next())
			{       if(rs.getInt(7)>redeem)
					{
				credits=rs.getInt(7)-redeem;
					
					st1.addBatch("update sign_up_details set credits='"+credits+"' where uname='"+s2+"'");
					st1.addBatch("insert into redeemcredit values('"+s2+"','"+redeem+"')");
			ret="done";
					}
			else if(redeem!=10000||redeem!=12000||redeem!=14000||redeem!=16000||redeem!=18000||redeem!=20000)
			{
				addFieldError("redeem","Select number of credits as per the table");
				ret="ndone";
			}
			else
			{
				addFieldError("redeem","you don't have sufficient credits");
				ret="ndone";
			}
			}

		}}
		catch(Exception ee)
		{
		System.out.println(ee);	
		ret="ndone";
		}
return ret;
	}
	//redeem credits starts//
	
	
	//Slider Images Upload starts//
	private File slideimage[];
	private String slideimageFileName[];
	private String slideimageContentType[];
	
	public File[] getSlideimage() {
		return slideimage;
	}

	public void setSlideimage(File[] slideimage) {
		this.slideimage = slideimage;
	}

	public String[] getSlideimageFileName() {
		return slideimageFileName;
	}

	public void setSlideimageFileName(String[] slideimageFileName) {
		this.slideimageFileName = slideimageFileName;
	}

	public String[] getSlideimageContentType() {
		return slideimageContentType;
	}

	public void setSlideimageContentType(String[] slideimageContentType) {
		this.slideimageContentType = slideimageContentType;
	}

	public String slider()
	{
		String ret="";
		String temp="";
	        try {
	   
	    Class.forName("com.mysql.jdbc.Driver");
	    Connection con=DriverManager.getConnection("jdbc:mysql://captureitac.cxtvglcjxdhp.ap-south-1.rds.amazonaws.com:3306/captureit","akashroot","jaswant1971akash");
	    Statement st=con.createStatement();
	    st.executeUpdate("truncate table sliderimages");
	            for(int i=0;i<slideimage.length;i++)
	            {
	            	 Aws.slide(slideimage[i],slideimageFileName[i]);
	           temp=slideimageFileName[i];
	           st.executeUpdate("insert into sliderimages values('"+temp+"')");
	            }
	            ret="done";
	        } catch (Exception ex) {
	            ret="ndone";
	            System.out.println(ex);
	            System.out.println("i am here");
	        }
		
		
	
	
	return ret;
	}
	//Slider Images Upload Ends//
	
	//hof images styarts//
	
   private String compname10,uname10,uname20,uname30;
   
	public String getCompname10() {
	return compname10;
}

public void setCompname10(String compname10) {
	this.compname10 = compname10;
}

public String getUname10() {
	return uname10;
}

public void setUname10(String uname10) {
	this.uname10 = uname10;
}

public String getUname20() {
	return uname20;
}

public void setUname20(String uname20) {
	this.uname20 = uname20;
}

public String getUname30() {
	return uname30;
}

public void setUname30(String uname30) {
	this.uname30 = uname30;
}

	public String hof()
	{
		String ret="";
		HttpServletRequest request1=ServletActionContext.getRequest();  
		HttpSession session1=request1.getSession();  
		String s2=(String)session1.getAttribute("uname"); 
		
		try
		{
			
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://captureitac.cxtvglcjxdhp.ap-south-1.rds.amazonaws.com:3306/captureit","akashroot","jaswant1971akash");
	Statement st=con.createStatement();
	st.executeUpdate("delete from contestpost where contestname='"+compname10+"'");
	for(int i=0;i<3;i++)
	{
		if(i==0)
		st.executeUpdate("insert into hof values ('"+compname10+"','1','"+uname10+"')");
	
		if(i==1)
			st.executeUpdate("insert into hof values ('"+compname10+"','2','"+uname20+"')");
		
		if(i==2)
			st.executeUpdate("insert into hof values ('"+compname10+"','3','"+uname30+"')");
		
	}
	
int c=0;
Class.forName("com.mysql.jdbc.Driver");
Connection con3=DriverManager.getConnection("jdbc:mysql://captureitac.cxtvglcjxdhp.ap-south-1.rds.amazonaws.com:3306/captureit","akashroot","jaswant1971akash");
Statement st3=con3.createStatement();
for(int j=0;j<3;j++)
{
if(j==0)
	{
	ResultSet rs3=st3.executeQuery("select * from sign_up_details where uname='"+uname10+"'");
	if(rs3.next())
	{
	c=rs3.getInt(7);
	c=c+150;
	}
st3.executeUpdate("update sign_up_details set credits='"+c+"' where uname='"+uname10+"'" );

	}

if(j==1)
{
ResultSet rs3=st3.executeQuery("select * from sign_up_details where uname='"+uname20+"'");
if(rs3.next())
{
c=rs3.getInt(7);
c=c+100;
}
st3.executeUpdate("update sign_up_details set credits='"+c+"' where uname='"+uname20+"'" );

}

if(j==2)
{
ResultSet rs3=st3.executeQuery("select * from sign_up_details where uname='"+uname30+"'");
if(rs3.next())
{
c=rs3.getInt(7);
c=c+50;
}
st3.executeUpdate("update sign_up_details set credits='"+c+"' where uname='"+uname30+"'" );

}


}	
		ret="done";}
	catch(Exception e)
	{
		ret="ndone";
	System.out.print(e);	
	System.out.println("I am here");
	}
		
		
		
		
		return ret;
	}
	
	
	//hof images ends//


//approve paytm comp pics starts//
	private String uname21,compname21,paytm21,comment21,compimage21,decision;
	
	public String getDecision() {
		return decision;
	}

	public void setDecision(String decision) {
		this.decision = decision;
	}

	public String getUname21() {
		return uname21;
	}

	public void setUname21(String uname21) {
		this.uname21 = uname21;
	}

	public String getCompname21() {
		return compname21;
	}

	public void setCompname21(String compname21) {
		this.compname21 = compname21;
	}

	public String getPaytm21() {
		return paytm21;
	}

	public void setPaytm21(String paytm21) {
		this.paytm21 = paytm21;
	}

	public String getComment21() {
		return comment21;
	}

	public void setComment21(String comment21) {
		this.comment21 = comment21;
	}

	public String getCompimage21() {
		return compimage21;
	}

	public void setCompimage21(String compimage21) {
		this.compimage21 = compimage21;
	}

	public String approvecomp()
	{
		String ret="";
		int c=0;
		String comment3= StringEscapeUtils.escapeJavaScript(comment21);
		
		if(decision.equals("approve"))
		{
			try {
				Class.forName("com.mysql.jdbc.Driver");
				Connection con3=DriverManager.getConnection("jdbc:mysql://captureitac.cxtvglcjxdhp.ap-south-1.rds.amazonaws.com:3306/captureit","akashroot","jaswant1971akash");
				Statement st3=con3.createStatement();
				ResultSet rs3=st3.executeQuery("select * from sign_up_details where uname='"+uname21+"'");
				if(rs3.next())
					{
					c=rs3.getInt(7);
					c=c+20;
					}
				Class.forName("com.mysql.jdbc.Driver");
				Connection con2=DriverManager.getConnection("jdbc:mysql://captureitac.cxtvglcjxdhp.ap-south-1.rds.amazonaws.com:3306/captureit","akashroot","jaswant1971akash");
				Statement st2=con2.createStatement();
				st2.executeUpdate("update sign_up_details set credits='"+c+"' where uname='"+uname21+"'" );

			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://captureitac.cxtvglcjxdhp.ap-south-1.rds.amazonaws.com:3306/captureit","akashroot","jaswant1971akash");
			Statement st=con.createStatement();
			st.addBatch("insert into compentries_approve values('"+uname21+"','"+compname21+"','"+compimage21+"','"+comment3+"')");
		    st.addBatch("delete from compentries where compentry='"+compimage21+"'");
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
			
			
			
		}
		else if(decision.equals("delete"))
		{
			try
			{
				String fpath=ServletActionContext.getServletContext().getRealPath("/").concat("compentries");
				Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://captureitac.cxtvglcjxdhp.ap-south-1.rds.amazonaws.com:3306/captureit","akashroot","jaswant1971akash");
			Statement st=con.createStatement();
		    st.executeUpdate("delete from cig where imgsrc='"+compimage21+"'");
		    File file = new File(fpath+compimage21);
		    file.delete();
		    BasicAWSCredentials awsCreds = new BasicAWSCredentials("AKIAJG3CX3NELPMXADCQ", "GFgQRApgP5T/plu22K7WeQrI/WdZRkEXZCCsXtg/");
		  	AmazonS3 s3Client = AmazonS3ClientBuilder.standard()
		  							.withRegion("ap-south-1")
		  	                        .withCredentials(new AWSStaticCredentialsProvider(awsCreds))
		  	                        .build();
		  	String keyName="compentries"+"/"+compimage2;;
		  	 s3Client.deleteObject(new DeleteObjectRequest("captureit.ac", keyName));
		    ret="done";
		}
			catch(Exception ee)
			{
				ret="ndone";
			}
			
			}

		
		return ret;
	}	
	
//approve paytm comp pics ends//	

	
	//Delete User Starts //
	private String del1;
	
	public String getDel1() {
		return del1;
	}

	public void setDel1(String del1) {
		this.del1 = del1;
	}

	public String del1()
	{
		String ret="";
		try
		{

			Class.forName("com.mysql.jdbc.Driver");
			Connection con1=DriverManager.getConnection("jdbc:mysql://captureitac.cxtvglcjxdhp.ap-south-1.rds.amazonaws.com:3306/captureit","akashroot","jaswant1971akash");	
			Statement st=con1.createStatement();
	st.addBatch("delete from sign_up_details where uname='"+del1+"'");
	st.addBatch("delete from artimages where uname='"+del1+"'");
	st.addBatch("delete from artimagesdisplay where uname='"+del1+"'");
	st.addBatch("delete from cig where uname='"+del1+"'");
	st.addBatch("delete from cigallery where uname='"+del1+"'");
	st.addBatch("delete from compentries where uname='"+del1+"'");
	st.addBatch("delete from compentries_approve where uname='"+del1+"'");
	st.addBatch("delete from contact_us where uname='"+del1+"'");
	st.addBatch("delete from cpimages where uname='"+del1+"'");
	st.addBatch("delete from photographer_details where uname='"+del1+"'");
	st.addBatch("delete from usergg where uname='"+del1+"'");
	int i[]=st.executeBatch();
	if(i[0]>0)
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
	
	//Delete User ends //
	
	//Delete credit info starts//
	private String del2,del21;
	
	public String del2()
	{
		String ret="";
		try
		{

			Class.forName("com.mysql.jdbc.Driver");
			Connection con1=DriverManager.getConnection("jdbc:mysql://captureitac.cxtvglcjxdhp.ap-south-1.rds.amazonaws.com:3306/captureit","akashroot","jaswant1971akash");	
			Statement st=con1.createStatement();
	int i=st.executeUpdate("delete from redeemcredit where uname='"+del2+"' and credits='"+del21+"'");
		if(i>0)
			ret="done";
		else 
			ret="ndone";
		
		}
		catch(Exception ee)
		{
			System.out.println(ee);
		}	
		return ret;
		}
	
	//delete credit info ends//
}
