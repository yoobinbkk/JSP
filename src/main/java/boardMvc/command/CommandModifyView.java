package boardMvc.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import boardMvc.model.BoardDao;
import boardMvc.model.BoardException;
import boardMvc.model.BoardVO;

public class CommandModifyView implements Command {

private String next;
	
	public CommandModifyView( String _next) {
		next = _next;
	}

	public String execute(HttpServletRequest request, HttpServletResponse response) throws CommandException {
		try {
			
			// 게시판 번호를 변수에 받음 (객체를 int로 형변환하려면 먼저 String으로 바꾸고 그 다음에 int로 바꿔야 함)
			int seq = Integer.parseInt(String.valueOf(request.getAttribute("seq")));
			BoardVO vo = BoardDao.getInstance().selectBySeq(seq);						// seq로 게시글 정보 가져오기
			request.setAttribute("param", vo );
			
		} catch( BoardException ex ) {
			throw new CommandException("CommandList.java < 목록보기시 > " + ex.toString()); 
		}
		
		return next;
	}
	
}
