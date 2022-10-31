package member.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import temp.EmpDAO;
import temp.EmpVO;

public class MemberDAO {
	
	private MemberDAO() throws Exception {
		
		// 1. 드라이버 로딩
		Class.forName("oracle.jdbc.driver.OracleDriver");
		System.out.println("driver success");
		
	}
	
	static MemberDAO memberDAO = null;
	public static MemberDAO getInstance() throws Exception {
		if ( memberDAO == null) memberDAO = new MemberDAO();
		return memberDAO;
	}
	
	public int insert(MemberVO vo) throws Exception {
		
		Connection con = null;
		PreparedStatement ps = null;
		int r = 0;
		
		try {
		// 2. 연결 객체 얻어오기
		String url = "jdbc:oracle:thin:@192.168.0.50:1521:xe";
		String user = "scott";
		String pass = "tiger";
		
		con = DriverManager.getConnection(url, user, pass);
		System.out.println("db connect success");
		
		// 3. sql 작성 (form 테이블에 insert)
		String sql = "insert into form (realname, nickname, myemail, myage) values (?, ?, ?, ?)";
		
		// 4. 전송객체 얻어오기 ( + ?에 값 지정)
		ps = con.prepareStatement(sql);
		
		ps.setString(1, vo.realname);
		ps.setString(2, vo.nickname);
		ps.setString(3, vo.myemail);
		ps.setInt(4, vo.myage);
		
		// 5. 전송
		r = ps.executeUpdate();
		
		} finally {
		// 6. 닫기
		ps.close();
		con.close();
		}
		
		return r;
	}

}
