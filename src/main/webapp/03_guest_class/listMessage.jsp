<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="guest.model.*,guest.service.*" %>   
<%@ page import="java.util.List" %>

<%
	// 현 페이지 정보 설정
	String pNum = request.getParameter("page");
	if(pNum == null) pNum = "1";
	
	// 첫 행 번호를 계산
	int currentPage = Integer.parseInt(pNum);
	// 전후 페이지로
	int prev = currentPage - 1;
	int next = currentPage + 1;

	// 전체 메세지 레코드 검색 
	ListMessageService service = ListMessageService.getInstance();
	List <Message> mList = service.getMessageList(pNum);
	
	int totalPageCount = service.getTotalPage();
%>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> 방명록 목록 </title>

<style type="text/css">

	a.n {text-decoration-line : none}

</style>

</head>
<body>

	<% if( mList.isEmpty() ) { %>
		남겨진 메세지가 하나도~~없습니다. <br>
	<% } else { %>
	<table border="1">
	
		<% for(Message m : mList) { %>
		<tr>	
			<td> <%= m.getMessageId() %> </td> 
			<td> <%= m.getGuestName() %> </td> 
			<td> <a href="deleteMessage.jsp?messageId=<%= m.getMessageId() %>">[삭제]</a> </td>			
		</tr>
		<tr>
			<td colspan='3'> 
			<textarea cols=35 rows=3 style="font-family: '돋움', '돋움체'; font-size: 10pt; font-style: normal; line-height: normal; color: #003399;background-color:#D4EBFF;border:1 solid #00009C;"><%= m.getMessage() %></textarea>
			<!-- textarea에는 공백이 존재하니 공백이 생기지 않도록 조심해야 한다. -->
			</td>
		</tr>
		<% } // end of for() %>
		
	</table>
	
	<% } // end if-else %>

	<a href="insertMessage.jsp">글쓰기</a>
	<hr/>
	
	<a class="n" href="listMessage.jsp?page=<%= prev %>">&lt;&lt;</a>
	<a class="n" href="listMessage.jsp?page=<%= prev %>">&lt;</a>
	
	<% for(int i=1 ; i<=totalPageCount ; i++) { %>
		<a href="listMessage.jsp?page=<%=i%>">[<%= i %>]</a>
	<% } // end of for %>
	
	<a class="n" href="listMessage.jsp?page=<%= next %>">&gt;</a>
	<a class="n" href="listMessage.jsp?page=<%= next %>">&gt;&gt;</a>
	
</body>
</html>