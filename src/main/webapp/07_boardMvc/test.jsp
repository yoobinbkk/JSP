<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% // 스크립트 립 : 자바의 영역, DB와 연동가능
String cmd = request.getParameter("cmd");
int seq = Integer.parseInt(request.getParameter("seq"));
out.println("cmd : " + cmd + "<br>");
out.println("seq : " + seq +  "<br>");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>test</title>
</head>
<body>



</body>
</html>