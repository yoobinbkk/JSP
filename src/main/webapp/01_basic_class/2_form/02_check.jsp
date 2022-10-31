<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	// 1) 이전 화면에서 사용자 입력값들을 얻어오기
	// 		- request.getParameter('');
	//		- request.getParameterValues('');
	
	String name = request.getParameter("name");
	String gender = request.getParameter("gender");
	String job = request.getParameter("occupation");
	String[] hobby = request.getParameterValues("hobby");
	String hobbyTxt = "";
	/*
		for (int i=0 ; hobby != null && i<hobby.length ; i++)
			hobbyTxt += hobby[i] + " ";
	*/
	
	if (hobby != null) {
		for (String k : hobby)
			hobbyTxt += k + " ";
	}
	
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<!-- 2) 얻어온 입력값들을 화면에 출력하기 -->
<h2>폼의 입력값 넘겨받아 처리</h2>
입력한 이름 : <%= name %> <br/>
입력한 성별 : <%= gender %> <br/>
입력한 직업 : <%= job %> <br/>
입력한 취미 : <%= hobbyTxt %> <br/>

</body>
</html>