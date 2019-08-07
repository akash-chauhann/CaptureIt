import java.io.File;

import com.amazonaws.auth.AWSStaticCredentialsProvider;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3ClientBuilder;
import com.amazonaws.services.s3.model.CannedAccessControlList;
import com.amazonaws.services.s3.model.PutObjectRequest;
import com.opensymphony.xwork2.ActionSupport;

public class Aws extends ActionSupport
{

    public static String dp (File pp,String ppname) 
    {
    	String ret="";
    String bucketName = "captureit.ac";
     String fileObjKeyName ="profilepictures"+"/"+ppname;
    
    	
		try {
    	BasicAWSCredentials awsCreds = new BasicAWSCredentials("AKIAJG3CX3NELPMXADCQ", "GFgQRApgP5T/plu22K7WeQrI/WdZRkEXZCCsXtg/");
    	AmazonS3 s3Client = AmazonS3ClientBuilder.standard()
    							.withRegion("ap-south-1")
    	                        .withCredentials(new AWSStaticCredentialsProvider(awsCreds))
    	                        .build();
		s3Client.putObject(new PutObjectRequest(bucketName, fileObjKeyName,pp)
				.withCannedAcl(CannedAccessControlList.PublicRead));
		ret="y";
		}
		catch(Exception ee)
		{
			ret="n";
		}
		
		
		return ret;
		}
		
    
    
    public static String gg (File gp,String gpname) 
    {
    	String ret="";
    String bucketName = "captureit.ac";
     String fileObjKeyName ="gallerypictures"+"/"+gpname;
    
    	
		try {
    	BasicAWSCredentials awsCreds = new BasicAWSCredentials("AKIAJG3CX3NELPMXADCQ", "GFgQRApgP5T/plu22K7WeQrI/WdZRkEXZCCsXtg/");
    	AmazonS3 s3Client = AmazonS3ClientBuilder.standard()
    							.withRegion("ap-south-1")
    	                        .withCredentials(new AWSStaticCredentialsProvider(awsCreds))
    	                        .build();
		s3Client.putObject(new PutObjectRequest(bucketName, fileObjKeyName,gp)
				.withCannedAcl(CannedAccessControlList.PublicRead));
		ret="y";
		}
		catch(Exception ee)
		{
			ret="n";
		}
		
		
		return ret;
		}
		
    public static String cg (File cp,String cpname) 
    {
    	String ret="";
    String bucketName = "captureit.ac";
     String fileObjKeyName ="coverpicture"+"/"+cpname;
    
    	
		try {
    	BasicAWSCredentials awsCreds = new BasicAWSCredentials("AKIAJG3CX3NELPMXADCQ", "GFgQRApgP5T/plu22K7WeQrI/WdZRkEXZCCsXtg/");
    	AmazonS3 s3Client = AmazonS3ClientBuilder.standard()
    							.withRegion("ap-south-1")
    	                        .withCredentials(new AWSStaticCredentialsProvider(awsCreds))
    	                        .build();
		s3Client.putObject(new PutObjectRequest(bucketName, fileObjKeyName,cp)
				.withCannedAcl(CannedAccessControlList.PublicRead));
		ret="y";
		}
		catch(Exception ee)
		{
			ret="n";
		}
		
		
		return ret;
		}
    
    
    public static String comp (File cop,String copname) 
    {
    	String ret="";
    String bucketName = "captureit.ac";
     String fileObjKeyName ="competetion"+"/"+copname;
    
    	
		try {
    	BasicAWSCredentials awsCreds = new BasicAWSCredentials("AKIAJG3CX3NELPMXADCQ", "GFgQRApgP5T/plu22K7WeQrI/WdZRkEXZCCsXtg/");
    	AmazonS3 s3Client = AmazonS3ClientBuilder.standard()
    							.withRegion("ap-south-1")
    	                        .withCredentials(new AWSStaticCredentialsProvider(awsCreds))
    	                        .build();
		s3Client.putObject(new PutObjectRequest(bucketName, fileObjKeyName,cop)
				.withCannedAcl(CannedAccessControlList.PublicRead));
		ret="y";
		}
		catch(Exception ee)
		{
			ret="n";
		}
		
		
		return ret;
		}
		
    public static void art (File arti,String artiname) 
    {
    	
    String bucketName = "captureit.ac";
     String fileObjKeyName ="artimages"+"/"+artiname;
    
    	
		try {
    	BasicAWSCredentials awsCreds = new BasicAWSCredentials("AKIAJG3CX3NELPMXADCQ", "GFgQRApgP5T/plu22K7WeQrI/WdZRkEXZCCsXtg/");
    	AmazonS3 s3Client = AmazonS3ClientBuilder.standard()
    							.withRegion("ap-south-1")
    	                        .withCredentials(new AWSStaticCredentialsProvider(awsCreds))
    	                        .build();
		s3Client.putObject(new PutObjectRequest(bucketName, fileObjKeyName,arti)
				.withCannedAcl(CannedAccessControlList.PublicRead));

		}
		catch(Exception ee)
		{
			
		}
		}
    
    public static String cigal(File cigg,String ciggname) 
    {
    	String ret="";
    String bucketName = "captureit.ac";
     String fileObjKeyName ="cig"+"/"+ciggname;
    
    	
		try {
    	BasicAWSCredentials awsCreds = new BasicAWSCredentials("AKIAJG3CX3NELPMXADCQ", "GFgQRApgP5T/plu22K7WeQrI/WdZRkEXZCCsXtg/");
    	AmazonS3 s3Client = AmazonS3ClientBuilder.standard()
    							.withRegion("ap-south-1")
    	                        .withCredentials(new AWSStaticCredentialsProvider(awsCreds))
    	                        .build();
		s3Client.putObject(new PutObjectRequest(bucketName, fileObjKeyName,cigg)
				.withCannedAcl(CannedAccessControlList.PublicRead));
		ret="y";
		}
		catch(Exception ee)
		{
			ret="n";
		}
		
		
		return ret;
		}
	
    public static String compentry(File comp,String compname) 
    {
    	String ret="";
    String bucketName = "captureit.ac";
     String fileObjKeyName ="compentries"+"/"+compname;
    
    	
		try {
    	BasicAWSCredentials awsCreds = new BasicAWSCredentials("AKIAJG3CX3NELPMXADCQ", "GFgQRApgP5T/plu22K7WeQrI/WdZRkEXZCCsXtg/");
    	AmazonS3 s3Client = AmazonS3ClientBuilder.standard()
    							.withRegion("ap-south-1")
    	                        .withCredentials(new AWSStaticCredentialsProvider(awsCreds))
    	                        .build();
		s3Client.putObject(new PutObjectRequest(bucketName, fileObjKeyName,comp)
				.withCannedAcl(CannedAccessControlList.PublicRead));
		ret="y";
		}
		catch(Exception ee)
		{
			ret="n";
		}
		
		
		return ret;
		}
    
    public static void paytm (File payt,String paytname) 
    {
    	
    String bucketName = "captureit.ac";
     String fileObjKeyName ="compentries"+"/"+paytname;
    
    	
		try {
    	BasicAWSCredentials awsCreds = new BasicAWSCredentials("AKIAJG3CX3NELPMXADCQ", "GFgQRApgP5T/plu22K7WeQrI/WdZRkEXZCCsXtg/");
    	AmazonS3 s3Client = AmazonS3ClientBuilder.standard()
    							.withRegion("ap-south-1")
    	                        .withCredentials(new AWSStaticCredentialsProvider(awsCreds))
    	                        .build();
		s3Client.putObject(new PutObjectRequest(bucketName, fileObjKeyName,payt)
				.withCannedAcl(CannedAccessControlList.PublicRead));

		}
		catch(Exception ee)
		{
			
		}
		}
    public static void slide(File slider,String slidername) 
    {
    	
    String bucketName = "captureit.ac";
     String fileObjKeyName ="sliderimages"+"/"+slidername;
    
    	
		try {
    	BasicAWSCredentials awsCreds = new BasicAWSCredentials("AKIAJG3CX3NELPMXADCQ", "GFgQRApgP5T/plu22K7WeQrI/WdZRkEXZCCsXtg/");
    	AmazonS3 s3Client = AmazonS3ClientBuilder.standard()
    							.withRegion("ap-south-1")
    	                        .withCredentials(new AWSStaticCredentialsProvider(awsCreds))
    	                        .build();
		s3Client.putObject(new PutObjectRequest(bucketName, fileObjKeyName,slider)
				.withCannedAcl(CannedAccessControlList.PublicRead));

		}
		catch(Exception ee)
		{
			
		}
		}
    
    
    
    }
