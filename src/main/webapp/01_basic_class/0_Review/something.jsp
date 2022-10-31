<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="member.dao.*" %>
    
<%

// 0. 한글 처리
request.setCharacterEncoding("utf-8");

// 1. 이전 폼의 입력값 얻어오기
String realname = request.getParameter("realname");
String nickname = request.getParameter("nickname");
String myemail = request.getParameter("myemail");
int myage = Integer.parseInt(request.getParameter("myage"));

// 2. VO 객체에 저장하기
MemberVO vo = new MemberVO();
vo.setRealname(realname);
vo.setNickname(nickname);
vo.setMyemail(myemail);
vo.setMyage(myage);

// 3. DB에 입력하기
MemberDAO dao = MemberDAO.getInstance();
int r = dao.insert(vo);

// 4. 출력은 알아서

%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%= r %> 개의 행이 삽입되었습니다.

<br/><br/>

본명 : <%= realname %> <br/>
별명 : <%= nickname %> <br/>
이메일 : <%= myemail %> <br/>
나이 : <%= myage %> <br/>

</body>
</html>