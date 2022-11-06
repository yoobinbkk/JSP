<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<%
	String result = String.valueOf(request.getAttribute("result"));
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>BoardSave</title>
</head>
<body>
	<% if(result.equals("1")) { 
		response.sendRedirect("BoardControl?cmd=list-page");
	} else { %>
	<font size="3" color="#bb44cc">글을 남기는데 실패했습니다. </font>
	<% } %>
</body>
</html>