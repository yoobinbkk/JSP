<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String result = String.valueOf(request.getAttribute("result"));
%>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BoardDelete</title>
</head>
<body>

	<% if( result.equals("1") ) { %>
		메세지를 삭제하였습니다.
	<% } else { %>
		삭제할 메세지가 존재하지 않거나 비밀번호가 올바르지 않습니다.
	<% } %>
	
	<br/><br/>
	<a href="BoardControl?cmd=list-page"> [ 목록보기 ] </a>

</body>
</html>