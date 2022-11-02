<%@page contentType="text/xml; charset=utf-8" %>
<%@ page language="java" import="java.sql.*"%>

<%
String driver="oracle.jdbc.driver.OracleDriver";
String user="scott";
String pass="tiger";
String dbURL="jdbc:oracle:thin:@localhost:1521:xe";



String rtn_xml="";

	Class.forName(driver);
	Connection connection=DriverManager.getConnection(dbURL,user,pass);
	
	String sql = "select * from ajax_temp";
	
	PreparedStatement ps = connection.prepareStatement(sql);
	ResultSet rs = ps.executeQuery();	
	
	rtn_xml += "<customer>";

	while (rs.next()){		
		rtn_xml += "<person>";
		rtn_xml += "<name>" + rs.getString("name") + " </name>";
		rtn_xml += "<age>" + rs.getString("age") +  "</age>";
		rtn_xml += "<tel>" + rs.getString("tel") +  "</tel>";
		rtn_xml += "<addr>" + rs.getString("addr") +  "</addr>";
		rtn_xml += "</person>";		
	}	
	rtn_xml += "</customer>";
	rs.close();
	ps.close();
	connection.close();

	

	System.out.println(rtn_xml);
	
	out.write(rtn_xml);

%>