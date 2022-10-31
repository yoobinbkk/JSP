package temp;

import java.sql.*;

public class EmpDAO {
	
	private EmpDAO() throws Exception {
		
		// 1. 드라이버 로딩
		Class.forName("oracle.jdbc.driver.OracleDriver");
		System.out.println("driver success");
		
	}
	
	static EmpDAO empDAO = null;
	public static EmpDAO getInstance() throws Exception {
		if ( empDAO == null) empDAO = new EmpDAO();
		return empDAO;
	}
	
	public int insert(EmpVO vo) throws Exception {
		
		Connection con = null;
		PreparedStatement ps = null;
		int r = 0;
		
		try {
		// 2. 연결 객체 얻어오기
		String url = "jdbc:oracle:thin:@192.168.0.57:1521:xe";
		String user = "scott";
		String pass = "tiger";
		
		con = DriverManager.getConnection(url, user, pass);
		System.out.println("db connect success");
		
		// 3. sql 작성 (emp 테이블에 insert)
		String sql = "insert into emp (empno, ename, deptno, job, sal) values (?, ?, ?, ?, ?)";
		
		// 4. 전송객체 얻어오기 ( + ?에 값 지정)
		ps = con.prepareStatement(sql);
		
		ps.setInt(1, vo.empno);
		ps.setString(2, vo.ename);
		ps.setInt(3, vo.deptno);
		ps.setString(4, vo.job);
		ps.setInt(5, vo.sal);
		
		// 5. 전송
		r = ps.executeUpdate();
		
		} finally {
		// 6. 닫기
		con.close();
		ps.close();
		}
		
		return r;
	}
	
	
}
