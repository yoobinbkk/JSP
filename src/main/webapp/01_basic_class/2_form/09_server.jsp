<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="temp.*" %>
<%

// 1. 이전 폼의 사용자 입력값을 얻어오기
int empno = Integer.parseInt(request.getParameter("empno"));
String ename = request.getParameter("ename");
int deptno = Integer.parseInt(request.getParameter("deptno"));
String job = request.getParameter("job");
int sal = Integer.parseInt(request.getParameter("sal"));

// 2. EmpVo 멤버변수에 지정
EmpVO vo = new EmpVO();
vo.setEmpno(empno);
vo.setEname(ename);
vo.setDeptno(deptno);
vo.setJob(job);
vo.setSal(sal);

// 3. DB에 입력
EmpDAO dao = EmpDAO.getInstance();
int r = dao.insert(vo);


%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> 사원등록 </title>
</head>
<body>
	 성공적으로 입력되었는지 DB에서 확인합니다...
	 <%= r %> 개의 행이 삽입되었습니다.
	 <hr/>
	 <!-- 1-2 입력값을 출력하기 -->
	 사번 : <%= empno %> <br/>
	 시원명 : <%= ename %> <br/>
	 부서번호 : <%= deptno %> <br/>
	 업무 : <%= job %> <br/>
	 월급 : <%= sal %> <br/>
	 
</body>
</html>