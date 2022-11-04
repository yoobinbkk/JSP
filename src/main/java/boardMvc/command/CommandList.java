package boardMvc.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import boardMvc.model.BoardException;
import boardMvc.model.BoardDao;
import boardMvc.model.BoardVO;
import boardMvc.command.CommandException;

public class CommandList implements Command 
{
	private String next;

	public CommandList( String _next ){
		next = _next;
	}

	public String execute( HttpServletRequest request, HttpServletResponse response  ) throws CommandException {
		try{
			
		    List <BoardVO> mList = BoardDao.getInstance().selectList();	
		    request.setAttribute("param", mList );
		    
		}catch( BoardException ex ){
			throw new CommandException("CommandList.java < 목록보기시 > " + ex.toString() ); 
		}
		
		return next;
	}
}
