<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	
	request.setCharacterEncoding("utf-8");
	String name = request.getParameter("name");
	String[] pet = request.getParameterValues("pet");
	
	// 되도록이면 java를 따로 처리 --> html에서 깔끔하게 적용
	String choosePet = "";
	for (int i=0 ; pet!=null && i<pet.length ; i++) {
		choosePet += pet[i];
	}
	
%>    
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>03_result.jsp</title>
</head>
<body>

<!-- 이전 화면에서 사용자 입력값을 얻어와서 
		- request.getParameter("")
		- request.getParameterValues("")
	화면 출력 -->
	
이름 : <%= name %> <br/>
동물 : <%= choosePet %> <br/>

</body>
</html>