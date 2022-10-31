<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%!
	Connection conn= null;
	Statement ps =null;
	ResultSet rs =null;

public void DBLoading(){
	try {
		Class.forName("oracle.jdbc.driver.OracleDriver");
	} catch (ClassNotFoundException e ) {}
  

	try{
		conn = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:xe","scott","tiger");
	
		ps = conn.createStatement();
		rs = ps.executeQuery("select * from emp");
	} catch (java.sql.SQLException e) {
	    System.out.println(e);
	}
}
%>


<%-- MIME 타입 변경하기 --%>
<%
	/*
		요청(request) : 클라이언트 -> 서버
		응답(response) : 서버 -> 클라이언트
	*/
	//1. request의 객체를 통해 type 이름의 값을 넘겨받는다
	String type = request.getParameter("type");
	
	//2. null 이라면 html파일 형식이지만 기본값이기에 null이 아닌 경우
	if (type!=null) {
		
		//(1). excel이라면 excel파일 형식으로 기술
		if(type.equals("excel")) {
			response.setContentType("application/vnd.ms-excel");			// 해당 화면이 열리지 않았음
		} else if (type.equals("word")) {									// 오직 'Internet Explorer'에서만 문서가 열린다.
			response.setContentType("application/msword");
		}
		
		//(2). word   라면 word파일 형식으로 기술
		
	}
			
			
	
%>

<!DOCTYPE html>
<html><head><title>MIME TYPE </title>
<link href='css/emp.css' type='text/css' rel='stylesheet'>

</head>
<body>

<div align=center>
<table border='0' cellSpacing='3'>
  <tbody>
  <tr class="title">
    <td>사번</td>
    <td>사원명</td>
    <td>업무</td>
    <td>관리자사번</td>
    <td>입사일</td></tr>

<% DBLoading(); %>
<% while(rs.next()) { %>
	  <tr>
		<td class="oddRow"><%= rs.getString(1) %></td>
		<td class="oddRow"><%= rs.getString(2) %></td>
		<td class="oddRow"><%= rs.getString(3) %></td>
		<td class="oddRow"><%= rs.getString(4) %></td>
		<td class="oddRow"><%= rs.getString(5) %></td></tr>
		  

		<% if (rs.next()){ %>

		  <tr>
			<td class="evenRow"><%= rs.getString(1) %></td>
			<td class="evenRow"><%= rs.getString(2) %></td>
			<td class="evenRow"><%= rs.getString(3) %></td>
			<td class="evenRow"><%= rs.getString(4) %></td>
			<td class="evenRow"><%= rs.getString(5) %></td></tr>
<% 
			}	// if-end
  } // while-end
%>

</tbody>
</table>
</div>
</body>
</html>
