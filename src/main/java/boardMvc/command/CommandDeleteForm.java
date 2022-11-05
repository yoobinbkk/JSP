package boardMvc.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CommandDeleteForm implements Command {
	
	private String next;

	public CommandDeleteForm( String _next ){
		next = _next;
	}

	public String execute( HttpServletRequest request, HttpServletResponse response  ) throws CommandException{
		request.setAttribute("seq", request.getAttribute("seq"));
		return next;
	}

}
