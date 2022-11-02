<%@ page language="java" import="java.sql.*"%>
<%
String driver="oracle.jdbc.driver.OracleDriver";
String user="scott";
String pass="tiger";
String dbURL="jdbc:oracle:thin:@localhost:1521:xe";

request.setCharacterEncoding("utf-8");
String name  = request.getParameter("name");
String age = request.getParameter("age");
String tel = request.getParameter("tel");
String addr= request.getParameter("addr");


	Class.forName(driver);
	Connection connection=DriverManager.getConnection(dbURL,user,pass);		
	
	String sql = "insert into ajax_temp(name, age, tel, addr) values(?,?,?,?)";
	
	PreparedStatement ps = connection.prepareStatement(sql);
	ps.setString(1, name);
	ps.setString(2,age);
	ps.setString(3,tel);
	ps.setString(4,addr);
	int result = ps.executeUpdate();		

	ps.close();
	connection.close();
	
	out.write(String.valueOf(result));
%>