package boardMvc.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import boardMvc.model.BoardException;
import boardMvc.model.BoardDao;
import boardMvc.model.BoardVO;

public class CommandList implements Command 
{
	private String next;

	public CommandList( String _next ){
		next = _next;
	}

	public String execute( HttpServletRequest request, HttpServletResponse response  ) throws CommandException {
		try{
			
			int pagesPerPage = 10;			// 목록에 드러나 있는 페이지 갯수
			int rowsPerPage = 10;			// 페이지의 게시글 수
			
			int currentPage = 1;									// 현재 페이지
			if(request.getAttribute("currentPage")!=null) {
				currentPage = Integer.parseInt(String.valueOf(request.getAttribute("currentPage")));	// 만약 처음으로 게시판을 여는 것이 아니라면
			}
			
			int totalRows = BoardDao.getInstance().getTotalRows();			// 전체 게시글의 수
			int totalPages = totalRows / rowsPerPage;						// 전체 페이지의 수
			if(totalRows % rowsPerPage!=0) totalPages++;
			
			int startPage = (currentPage/(pagesPerPage+1))*pagesPerPage+1;				// 시작 페이지
			int endPage = (currentPage/(pagesPerPage+1))*pagesPerPage+pagesPerPage;		// 끝 페이지
			if(endPage>totalPages) endPage = totalPages;
			
			int startRow = currentPage*rowsPerPage-rowsPerPage+1;				// 해당 페이지의 시작 레코드
			int endRow = currentPage*rowsPerPage;								// 해당 페이지의 끝 레코드
			if(endRow>totalRows) endRow = totalRows;
			
		    List <BoardVO> mList = BoardDao.getInstance().selectList(startRow, endRow);	
		    request.setAttribute("param", mList );							// 게시글 정보 넘기기
		    
		    request.setAttribute("startPage", startPage );		// 시작 페이지 넘기기
		    request.setAttribute("endPage", endPage );			// 끝 페이지 넘기기
		    request.setAttribute("totalPages", totalPages);		// 총 페이지 수
		    
		}catch( BoardException ex ){
			throw new CommandException("CommandList.java < 목록보기시 > " + ex.toString() ); 
		}
		
		return next;
	}
}
