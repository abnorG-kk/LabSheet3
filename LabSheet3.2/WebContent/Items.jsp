<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ page import = "com.Item"%>
    
<%
	//Insert Item-------------------------------------------------
	if(request.getParameter("itemCode") != null)
	{
		Item itemObj = new Item();
		
		String stsMsg = itemObj.insertItem(request.getParameter("itemCode"),
				request.getParameter("itemName"),
				request.getParameter("itemPrice"),
				request.getParameter("itemDesc"));
		
		session.setAttribute("statusMsg", stsMsg);
	}

	//Delete Item-------------------------------------------------
	if(request.getParameter("itemID") != null)
	{
		Item itemObj = new Item();
		String stsMsg = itemObj.deleteItem(request.getParameter("itemID"));
		session.setAttribute("statusMsg", stsMsg);
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Items Management</title>
</head>
<body>
	
	<h1>Items Management</h1>
	<form method="post" action = "items.jsp">
		Item Code 			: <input name = "itemCode" type = "text"> <br>
		Item Name 			: <input name = "itemName" type = "text"> <br>
		Item Price 			: <input name = "itemPrice" type = "text"> <br>
		Item Description 	: <input name = "itemCode" type = "text"> <br>
		<input name = "btnSubmit" type = "submit" value = "Save">
	</form>
	
	<%
		out.print(session.getAttribute("statusMsg"));
	%>
	
	<br>
	<%
		Item itemObj = new Item();
		out.print(itemObj.readItems());
	%>
	
</body>
</html>