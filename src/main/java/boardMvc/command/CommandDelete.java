package boardMvc.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import boardMvc.model.BoardDao;
import boardMvc.model.BoardException;



public class CommandDelete implements Command {
	
	private String next;

	public CommandDelete( String _next ){
		next = _next;
	}
	
	public String execute(HttpServletRequest request, HttpServletResponse response  ) throws CommandException {

		try{
				
			int seq = Integer.parseInt(request.getParameter("seq"));
			String pass = request.getParameter("pass");
			
			int result = BoardDao.getInstance().delete(seq, pass);
			
			request.setAttribute("result", result);
			
		}catch( BoardException ex ){
			throw new CommandException("CommandDelete.java < 삭제시 > " + ex.toString() ); 
		}
		
		return next;			
	}
	
}
