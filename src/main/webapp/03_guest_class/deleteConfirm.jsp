<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="guest.service.DeleteMessageService" %>    
<%
	int delCnt = 0;
	// 1. 앞의 화면에서 삭제할 번호와 패스워드를 넘겨받는다.
	String messageId = request.getParameter("messageId");
	String password = request.getParameter("password");
	// 2. 서비스의 delete() 메소드로 1번의 값을 넘겨주고 삭제된 행 수를 리턴받아 delCnt 변수에 지정
	delCnt = DeleteMessageService.getInstance().delete(messageId, password);
%>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> 메세지 삭제 확인 </title>
</head>
<body>
	<% if( delCnt == 0 ) { %>
		삭제할 메세지가 존재하지 않거나 비밀번호가 올바르지 않습니다.
	<% } else { %>
		메세지를 삭제하였습니다.
	<% } %>
	
	<br/><br/>
	<a href="listMessage.jsp"> [ 목록보기 ] </a>
</body>
</html>