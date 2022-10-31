

public class JdbcUtil
{
	
	public static void close( ResultSet rs){
		if( rs != null){
			try{
			rs.close();
			}catch(SQLException ex){}
		}
	}
	
	public static void close( Statement stmt){
		if( stmt != null){
			try{
				stmt.close();
			}catch(SQLException ex){}
		}
	}
	
	public static void close( PreparedStatement ps){
		if( ps != null){
			try{
				ps.close();
			}catch(SQLException ex){}
		}
	}
	
	public static void close( Connection con){
		if( con != null){
			try{
				con.close();
			}catch(SQLException ex){}
		}
	}
	
	public static void rollback( Connection con){
		if( con != null){
			try{
				con.rollback();
			}catch(SQLException ex){}
		}
	}
}