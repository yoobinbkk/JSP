<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="boardMvc.model.*" %>
<%@ page import="java.util.List" %>
    
<%  //웹브라우저가 게시글 목록을 캐싱할 경우 새로운 글이 추가되더라도 새글이 목록에 안 보일 수 있기 때문에 설정
	response.setHeader("Pragma","No-cache");		// HTTP 1.0 version
	response.setHeader("Cache-Control","no-cache");	// HTTP 1.1 version
	response.setHeader("Cache-Control","no-store"); // 일부 파이어폭스 버스 관련
	response.setDateHeader("Expires", 1L);			// 현재 시간 이전으로 만료일을 지정함으로써 응답결과가 캐쉬되지 않도록 설정


	// Control에서 param으로 넘어오는 정보를 mList에 저장
	List <BoardVO> mList = (List <BoardVO>) request.getAttribute("param");
	
	// 시작과 끝 페이지
	int startPage = Integer.parseInt(String.valueOf(request.getAttribute("startPage")));
	int endPage = Integer.parseInt(String.valueOf(request.getAttribute("endPage")));
	int totalPages = Integer.parseInt(String.valueOf(request.getAttribute("totalPages")));
	
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>BoardList</title>
</head>
<body>

<h3> 게시판 목록 </h3>
	
	<table border="1" bordercolor="darkblue">
	<tr>
		<td> 글번호 </td>
		<td> 제 목 </td>
		<td> 작성자 </td>
		<td> 작성일 </td>
		<td> 조회수 </td>
	</tr>
	
	<% if( mList.isEmpty() ) { %>
		<tr><td colspan="5"> 등록된 게시물이 없습니다. </td></tr>
	<% } else { %>
	<!--  여기에 목록 출력하기  -->
	<% for(BoardVO bvo : mList) { %>
		<tr>
			<td> <%= bvo.getSeq() %> </td>
			<td><a href="BoardControl?cmd=view-page&seq=<%= bvo.getSeq() %>"> <%= bvo.getTitle() %> </a></td>
			<td> <%= bvo.getWriter() %> </td>
			<td> <%= bvo.getRegdate() %> </td>
			<td> <%= bvo.getCnt() %> </td>
		</tr>
		<% } // end of for %>
	<% }  // end of else %>
		<tr>
			<td colspan="5">
				<a href="BoardControl?cmd=input-form">글쓰기</a>
			</td>
		</tr>
	</table>
	
	<hr/>
	
	<% if(startPage!=1) { %>
		<a href="BoardControl?cmd=list-page&currentPage=<%= startPage-1 %>">Prev</a>
	<% } // end of if %>
	
	<% for(int i=startPage ; i<=endPage ; i++) { %>
		<a href="BoardControl?cmd=list-page&currentPage=<%=i%>">[<%= i %>]</a>
	<% } // end of for %>
	
	<% if(endPage<totalPages) { %>
	<a href="BoardControl?cmd=list-page&currentPage=<%= endPage+1 %>">Next</a>
	<% } // end of if %>

</body>
</html>