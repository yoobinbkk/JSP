<%@ page contentType="text/html; charset=UTF-8" 
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title> 빈 기초 </title>
</head>
<body>
	<h2> 당신의 정보를 입력하세요 </h2><br/><br/>
	
	<form method="get" action="InfoSave.jsp" name="input">
	이       름 :  <input type=text name="name"><br/>
	주 민 번 호 :  <input  type=password name="id"><br/>
	<input type=submit value="저장" >
	<input type=reset value="취소">
	</form>
	
</body>
</html>