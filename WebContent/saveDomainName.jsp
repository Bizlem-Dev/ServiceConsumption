<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
  <%@ page import="com.jindal.auction.configDomain.*" %>  
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%

String domainName=request.getParameter("domainName");


String customerId=request.getParameter("customerId");

//out.println("domain name="+domainName);

//out.println("customer Id ="+customerId);


ConfigDomain configDomain=new ConfigDomain();

String result=configDomain.saveConfigDomain(customerId, domainName);

if(result.equals("saved"))
{
	out.println("Config Domain Details Saved Succesfully");
}
else
{
	out.println("Config Domain Details Not Saved. Please try again... ");
}

%>


<input type="button" onclick="javascript:self.close()" value="Close">


</body>
</html>