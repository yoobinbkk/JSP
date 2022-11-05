package boardMvc.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import boardMvc.model.BoardDao;
import boardMvc.model.BoardException;
import boardMvc.model.BoardVO;

public class CommandModify implements Command {

	private String next;

	public CommandModify( String _next ){
		next = _next;
	}

	public String execute(HttpServletRequest request, HttpServletResponse response) throws CommandException {
		try{
			
			int seq = Integer.parseInt(request.getParameter("seq"));

			BoardVO vo = new BoardVO();
			vo.setSeq( seq );
			vo.setTitle(request.getParameter("title"));
			vo.setContent( request.getParameter("content"));
			vo.setPass( request.getParameter("pass"));

			int result = BoardDao.getInstance().update(vo);
			request.setAttribute("result", result );
			request.setAttribute("seq", seq);
			
		}catch( BoardException ex ){
			throw new CommandException("CommandInput.java < 입력시 > " + ex.toString() ); 
		}
		return next;
	}
	
}
