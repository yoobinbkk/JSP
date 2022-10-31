<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<title> 폼과 서블릿 </title></head>

<body>
	<form method="get" action="02_check.jsp">
		<h4>  입력 후 전송 버튼을 누릅니다 </h4>

		이름	: <input type="text" name="name"><br/>

		성별    : <input type="radio" name="gender" value="male" checked="checked"> 남
 			   <input type="radio" name="gender" value="female"> 여 <br/>


		직업	: <select name="occupation">
						<option> programmer </option>
						<option> web designer</option>
						<option> white hand</option>
						<option> people</option>
			</select><br/>

		취미    :	 <input type="checkbox" name="hobby" value="쓰타크래프트"> 쓰타크래프트
					 <input type="checkbox" name="hobby" value="한솥밥먹기"> 한솥밥먹기
					 <input type="checkbox" name="hobby" value="멍때리기"> 멍때리기
					 <input type="checkbox" name="hobby" value="그냥있기"> 그냥있기 <br/> <br/>

		
		<input type="submit" value='전송'>
		<input type="reset" value='취소'>
	</form>
</body>
</html>
