package member.beans;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class MemberDao {

	
	// DB 연결시  관한 변수 

	private static final String 	dbDriver	=	"oracle.jdbc.driver.OracleDriver";
	private static final String		dbUrl		=	"jdbc:oracle:thin:@192.168.0.57:1521:xe";
	private static final String		dbUser		=	"scott";
	private static final String		dbPass		=	"tiger";

		
	private static MemberDao memberDao;
	
	public static MemberDao getInstance() throws MemberException
	{
		if( memberDao == null )
		{
			memberDao =  new MemberDao();
		}
		return memberDao;
	}
	

	private MemberDao() throws MemberException
	{
			
		try{
				
			// 1. 드라이버 로딩
			Class.forName(dbDriver);
			System.out.println("driver success");
		
		}catch( Exception ex ){
			throw new MemberException("DB 연결시 오류  : " + ex.toString() );	
		}
	}
	
	/*******************************************
	 * * 회원관리테이블 MEMBERTEST 에  회원정보를 입력하는 함수
	 * @param rec
	 * @throws MemberException
	 * @throws SQLException 
	 */
	public void insertMember( Member m ) throws MemberException, SQLException
	{
		
		Connection con = null;
		PreparedStatement ps = null;
		
		try {
			 // 0. 연결 객체 얻어오기	
			con = DriverManager.getConnection(dbUrl, dbUser, dbPass);
			System.out.println("db connect success");
			
			 // 1. sql 문장 만들기 ( insert문 )
			String sql = "insert into memberTest (id, password, name, tel, addr) values (?, ?, ?, ?, ?)";
			
			// 2. sql 전송 객체 만들기
			ps = con.prepareStatement(sql);
			
			ps.setString(1, m.getId());
			ps.setString(2, m.getPassword());
			ps.setString(3, m.getName());
			ps.setString(4, m.getTel());
			ps.setString(5, m.getAddr());
			
			 // 3. sql 전송
			ps.executeUpdate();
			
		} catch ( Exception ex ){
			throw new MemberException("멤버 입력시 오류  : " + ex.toString() );			
		} finally {
			// 4. 객체 닫기
			ps.close();
			con.close();
		}
	}
	
	/**********************************************************
	 * * 회원관리테이블 MEMBERTEST에서 기존의 id값과 중복되는지 확인하는 함수
	 * @throws SQLException 
	 */
	public boolean isDuplicatedId( String id ) throws MemberException, SQLException
	{
		boolean flag = false;
		
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try{
				
			// 0. 연결 객체 얻어오기	
			con = DriverManager.getConnection(dbUrl, dbUser, dbPass);
			System.out.println("db connect success");
				
			// 1. sql 문장
			String sql = "select * from membertest where id=?";
				
			// 2. sql 전송 객체 만들기
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			
			 // 3. sql 전송
			rs = ps.executeQuery();
			
			if (rs.next())
				flag = true;
			
		}catch( Exception ex ){
			throw new MemberException("중복아이디 검사시 오류  : " + ex.toString() );			
		} finally {
			// 4. 객체 닫기
			rs.close();
			ps.close();
			con.close();
		}
		
		return flag;
	}
	
	public boolean checkLogin(String id, String pass) throws Exception {
		
		boolean result = false;
		
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try{
				
			// 0. 연결 객체 얻어오기	
			con = DriverManager.getConnection(dbUrl, dbUser, dbPass);
			System.out.println("db connect success");
				
			// 1. sql 문장
			String sql = "select * from membertest where id=? and password=?";
				
			// 2. sql 전송 객체 만들기
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			ps.setString(2, pass);
			
			 // 3. sql 전송
			rs = ps.executeQuery();
			
			if (rs.next())
				result = true;
			
		}catch( Exception ex ){
			throw new MemberException("중복아이디 검사시 오류  : " + ex.toString() );			
		} finally {
			// 4. 객체 닫기
			rs.close();
			ps.close();
			con.close();
		}
		
		return result;
		
	}
	
	
	
}
