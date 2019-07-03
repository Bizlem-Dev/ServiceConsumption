<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>


<form action="saveDomainName.jsp" >

<table>
<tr>
<td>Enter Domain Name:</td>
<td><input type="text" name="domainName"></td>

<td><input type="hidden" name="customerId" value="<%=request.getParameter("customerId") %>"></td>

<td><input type="submit" value="Save"></td>
</tr>
</table>


</form>





</body>
</html>