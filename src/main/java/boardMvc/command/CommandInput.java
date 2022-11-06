package boardMvc.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import boardMvc.model.BoardDao;
import boardMvc.model.BoardException;
import boardMvc.model.BoardVO;



public class CommandInput implements Command {
	private String next;

	public CommandInput( String _next ){
		next = _next;
	}
	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response  ) throws CommandException {
		try{

			BoardVO vo = new BoardVO();
			vo.setWriter( request.getParameter("writer"));
			vo.setTitle(request.getParameter("title"));
			vo.setContent( request.getParameter("content"));
			vo.setPass( request.getParameter("pass"));
			
			int result = BoardDao.getInstance().insert(vo);
			
			request.setAttribute("result", result);
			
		}catch( BoardException ex ){
			throw new CommandException("CommandInput.java < 입력시 > " + ex.toString() ); 
		}
		return next;
	}

}