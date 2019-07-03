<%@page import="com.jindal.auction.domain.xsd.ProductConfigDetails"%>
<%@page import="com.jindal.auction.domain.xsd.CustomerServiceStatus"%>
<%@page import="com.service.log.TestService"%>
<%@ taglib uri="http://www.extremecomponents.org" prefix="ec"%>
<%@page
	import="java.util.Arrays,java.util.ArrayList,java.util.Iterator,java.util.List,java.text.SimpleDateFormat,java.util.Date"%>


<html>

<head>
<title>Service Status</title>

<link rel="stylesheet" href="css/jquery-ui.css" type="text/css" />

<!--STYLESHEETS-->
<link href="css/table_css.css" rel="stylesheet" type="text/css" />

<script src="js/jquery-1.9.1.js"></script>
<script src="js/jquery-ui.js"></script>



<script type="text/javascript">
function configDomainName(cid)
{
	    popupHeight = 300;
	 	popupWidth = 800;
		var left = (screen.width / 2) - (popupWidth / 2);
		var top = (screen.height / 2) - (popupHeight / 2);
		
		
		
		window.open( "./configDomainName.jsp?customerId="+cid , 'view_comments', 'height='+popupHeight+'px, width='+popupWidth+'px, top='+top+',left='+left+' ,menubar=no, resizable=no, location=no, scrollbars=yes, status=false, toolbar=false');
		
}

</script>




<style type="text/css">
.eXtremeTable {
	margin: 0;
	padding: 0;
}

.eXtremeTable select {
	font-family: Verdana;
	font-size: 9px;
	border: solid 1px #EEE;
	width: 75px;
}

.eXtremeTable .tableRegion {
	border: 1px solid silver;
	padding: 2px;
	font-family: Verdana;
	font-size: 10px;
	margin-top: 7px;
}

.eXtremeTable .filter {
	background-color: #efefef;
}

.eXtremeTable .filter input {
	font-family: Verdana;
	font-size: 10px;
	width: 100%;
}

.eXtremeTable .filter select {
	font-family: Verdana;
	font-size: 9px;
	border: solid 1px #EEE;
	width: 100%;
}

.eXtremeTable .tableHeader {
	background-color: #308dbb;
	color: white;
	font-family: Verdana;
	font-size: 11px;
	font-weight: bold;
	text-align: left;
	padding-right: 3px;
	padding-left: 3px;
	padding-top: 4;
	padding-bottom: 4;
	margin: 0;
	border-right-style: solid;
	border-right-width: 1px;
	border-color: white;
}

.eXtremeTable .tableHeaderSort {
	background-color: #3a95c2;
	color: white;
	font-family: Verdana;
	font-size: 11px;
	font-weight: bold;
	text-align: left;
	padding-right: 3px;
	padding-left: 3px;
	padding-top: 4;
	padding-bottom: 4;
	border-right-style: solid;
	border-right-width: 1px;
	border-color: white;
}

.eXtremeTable .odd a,.even a {
	color: Black;
	font-size: 10px;
}

.eXtremeTable .odd td,.eXtremeTable .even td {
	padding-top: 2px;
	padding-right: 3px;
	padding-bottom: 2px;
	padding-left: 3px;
	vertical-align: middle;
	font-family: Verdana;
	font-size: 10px;
}

.eXtremeTable .odd {
	background-color: #FFFFFF;
}

.eXtremeTable .even {
	background-color: #dfe4e8;
}

.eXtremeTable .highlight td {
	color: black;
	font-size: 10px;
	padding-top: 2px;
	padding-right: 3px;
	padding-bottom: 2px;
	padding-left: 3px;
	vertical-align: middle;
	background-color: #fdecae;
}

.eXtremeTable .highlight a,.highlight a {
	color: black;
	font-size: 10px;
}

.eXtremeTable .toolbar {
	background-color: #F4F4F4;
	font-family: Verdana;
	font-size: 9px;
	margin-right: 1px;
	border-right: 1px solid silver;
	border-left: 1px solid silver;
	border-top: 1px solid silver;
	border-bottom: 1px solid silver;
}

.eXtremeTable .toolbar td {
	color: #444444;
	padding: 0px 3px 0px 3px;
	text-align: center;
}

.eXtremeTable .separator {
	width: 7px;
}

.eXtremeTable .statusBar {
	background-color: #F4F4F4;
	font-family: Verdana;
	font-size: 10px;
}

.eXtremeTable .filterButtons {
	background-color: #efefef;
	text-align: right;
}

.eXtremeTable .title {
	color: #444444;
	font-weight: bold;
	font-family: Verdana;
	font-size: 15px;
	vertical-align: middle;
}

.eXtremeTable .title span {
	margin-left: 7px;
}

.eXtremeTable .formButtons {
	display: block;
	margin-top: 10px;
	margin-left: 5px;
}

.eXtremeTable .formButton {
	cursor: pointer;
	font-family: Verdana;
	font-size: 10px;
	font-weight: bold;
	background-color: #308dbb;
	color: white;
	margin-top: 5px;
	border: outset 1px #333;
	vertical-align: middle;
}

.eXtremeTable .tableTotal {
	background-color: #FFFFFF;
	border-top: solid 1px Silver;
}

.eXtremeTable .tableTotalEmpty {
	background-color: #FFFFFF;
}
</style>


</head>


<body style="margin: 25px;">



	<%
		String customerId = "", productId = "", fromDate = "", toDate = "", status = "";
		if (request.getParameter("cid") != null)
			customerId = request.getParameter("cid");
		if (request.getParameter("pid") != null)
			productId = request.getParameter("pid");
		if (request.getParameter("frmdate") != null)
			fromDate = request.getParameter("frmdate");
		if (request.getParameter("todate") != null)
			toDate = request.getParameter("todate");
		if (request.getParameter("status") != null)
			status = request.getParameter("status");

		TestService ts = new TestService();
		List<CustomerServiceStatus> list = ts.getCustomerServiceStatus(
				customerId, productId, fromDate, toDate, status);
		request.setAttribute("pres", list);
		int i = 0;
	%>
	<ec:table items="pres" var="check"
		action="${pageContext.request.contextPath}/viewUserServiceConsumption.jsp"
		imagePath="${pageContext.request.contextPath}/images/table/*.gif"
		title="Service Consumption" width="250%" rowsDisplayed="20"
		showExports="false"
		>
		<!-- <ec:exportXls fileName="ServiceConsumption.xls" tooltip="Export Excel" />
		<ec:exportPdf fileName="ServiceConsumption.pdf" tooltip="Export PDF" 
			headerColor="white" headerBackgroundColor="gray"
			headerTitle="Service Consumption" />
		<ec:exportCsv fileName="ServiceConsumption.txt" tooltip="Export CSV"
			delimiter="|" />-->
		<ec:row>
			<ec:column property="customerId" sortable="false" />
			<ec:column property="customerName" sortable="false" />
			<ec:column property="productCode" sortable="false" />
			<ec:column property="productDescription" sortable="false" />
			<ec:column property="quantity" sortable="false" />
			<ec:column property="uom" sortable="false" />
			<ec:column property="consumptionQuantity" sortable="false" />
			<ec:column property="lastConsumptionDate" sortable="false" cell="date" format="dd/MM/yyyy"/>
			<ec:column property="serviceEndDate" sortable="false" cell="date" format="dd/MM/yyyy" />
			<ec:column property="serviceStartDate" sortable="false" cell="date" format="dd/MM/yyyy"/>
			<ec:column property="orderId" sortable="false" />
			<ec:column property="shipmentId" sortable="false" />
			<ec:column property="status" sortable="false" />
			<ec:column property="productConfigList" sortable="false" filterable="false"
				alias="Profuct config details">
				<table>

					

					<%
					
					if(list.get(i).getProductCode().equals("e-commerce"))
					{
						out.print("<td> <a href='#' onclick=configDomainName('"+list.get(i).getCustomerId()+"')>Configure Domain Name</a></td>");
					}
					
						try {
										ProductConfigDetails[] ps = list.get(i)
												.getProductConfigList();
										//out.print("kamal" + ps);
										if (ps != null) {

											//out.print("enter"+ps[0]);
											//	List<ProductConfigDetails> pp = new ArrayList<ProductConfigDetails>(
											//			Arrays.asList(ps));
											//out.print(pp);
											//if(pp.size() >0){
											int j = 1;
											for (ProductConfigDetails c : ps) {

												out.println("<tr>");
												if (c != null) {
													if (j == 1)
														out.print("<tr style='font-weight:bold;'><td>Detail</td><td>Product Name</td><td>Quantity</td><td>UOM</td></tr>");

													if (c.getCategoryName() != null)
														out.print("<td>"
																+ c.getCategoryName()
																+ "</td>");
													else
														out.print("<td>-</td>");

													if (c.getProductName() != null)
														out.print("<td>"
																+ c.getProductName()
																+ "</td>");
													else
														out.print("<td>-</td>");

													if (c.getQuantity() != null)
														out.print("<td>" + c.getQuantity()
																+ "</td>");
													else
														out.print("<td>-</td>");

													if (c.getUomName() != null)
														out.print("<td>" + c.getUomName()
																+ "</td>");
													else
														out.print("<td>-</td>");

												} else
													out.print("<td>-</td>");

												out.println("</tr>");
												j++;
											}
											//	}

										}
									} catch (Exception e) {
										out.print(e);
										//	e.printStackTrace();
										//out.print(e.getMessage());
									}

									i++;
					%>
					
					
					
				</table>

			</ec:column>

		</ec:row>
	</ec:table>


</body>
</html>