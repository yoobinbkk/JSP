package boardMvc.control;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import boardMvc.command.*;

public class BoardControl extends HttpServlet {

	private HashMap commandMap;
	private String	jspDir = "/07_boardMvc/";
	private String  error = "error.jsp";
	
	
	public BoardControl() {
        super();       
		initCommand();
	}
	
	private void initCommand(){
		commandMap = new HashMap();

		commandMap.put("main-page",	new CommandNull("BoardMain.jsp"));					// 메인 페이지
		commandMap.put("list-page",	new CommandList("BoardList.jsp"));					// 게시판 페이지
		commandMap.put("input-form", new CommandNull("BoardInputForm.jsp"));			// 글쓰기 페이지
		commandMap.put("input-doo", new CommandInput("BoardSave.jsp"));					// 알림(글쓰기) 페이지
		commandMap.put("view-page", new CommandView("BoardView.jsp"));					// 게시글 페이지
		commandMap.put("modify-form", new CommandModifyView("BoardModifyForm.jsp"));	// 게시글 수정 페이지
		commandMap.put("modify-doo", new CommandModify("BoardModify.jsp"));				// 알림(게시글 수정) 페이지
		commandMap.put("delete-form", new CommandDeleteForm("BoardDeleteForm.jsp"));	// 게시글 삭제 전 페이지
		commandMap.put("delete-doo", new CommandDelete("BoardDelete.jsp"));				// 게시글 삭제 후 페이지
		
	}
	
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}
	
	
	private void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");

		String nextPage = "";
		String cmdKey	= request.getParameter("cmd");
		if( cmdKey == null ){
			cmdKey = "main-page";
		}

		
		Command cmd = null;

		try{
			
			if( commandMap.containsKey( cmdKey ) ){
				cmd = (Command)commandMap.get( cmdKey);
			}else{
				throw new CommandException("지정할 명령어가 존재하지 않음");
			}
			
			// 게시글의 번호를 전달해야 할 때 사용
			if (cmdKey.equals("view-page") || cmdKey.equals("modify-form") || cmdKey.equals("delete-form")) {
				request.setAttribute("seq", request.getParameter("seq"));
			}

			nextPage = cmd.execute(request, response);

		}catch( CommandException e ){
			request.setAttribute("javax.servlet.jsp.jspException", e );
			nextPage = error;
			System.out.println("오류 : " + e.getMessage() );
		}

		RequestDispatcher reqDp = getServletContext().getRequestDispatcher( jspDir + nextPage );
		reqDp.forward( request, response );
		
	}
	
}