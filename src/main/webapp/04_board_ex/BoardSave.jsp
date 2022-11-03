<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="board_ex.model.*,board_ex.service.*" %>

<%
	request.setCharacterEncoding("utf-8");			// post든 get이든 상관없이 한글 깨지지 않게 이걸 적어라
%>

<jsp:useBean id="rec" class="board_ex.model.BoardVO">
	<jsp:setProperty name="rec" property="*"/>
</jsp:useBean>

<%
	int confirm = WriteArticleService.getInstance().write(rec); 
	//BoardSave.jsp에서 새로고침을 하게 되면 중복 입력되기에
	// 추후에 입력 후 BoardView.jsp?id=글번호 로 넘겨서 처리하고자 한다.
	
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>게시판글저장</title>
</head>
<body>
입력되었는지 확인해보시구염...<br/>
만일 안되어도..환장하지 맙시다 !!! ^^

<br/><br/>

<%= confirm %> 행이 삽입되었습니다.

<br/><br/>

만약 다시 글을 입력하시려면 여길 클릭하세요 --> 
<a href="BoardInputForm.jsp">글쓰기</a> <--

<br/><br/>

게시판은 여기에 -->
<a href="BoardList.jsp">게시판</a> <--

</body>
</html>