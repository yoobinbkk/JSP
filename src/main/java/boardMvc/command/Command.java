package boardMvc.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import boardMvc.command.CommandException;

public interface Command {
	public String execute( HttpServletRequest request, HttpServletResponse response  ) throws CommandException;
}

