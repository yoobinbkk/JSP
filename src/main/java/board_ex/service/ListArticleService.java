package board_ex.service;

import java.util.List;

import board_ex.model.*;

public class ListArticleService {
	
	private int totalRecCount;		// 전체 레코드 수	
	private int pageTotalCount;		// 전체 페이지 수
	private int countPerPage = 3;	// 한페이지당 레코드 수
	
	private static ListArticleService instance;
	public static ListArticleService getInstance()  throws BoardException{
		if( instance == null )
		{
			instance = new ListArticleService();
		}
		return instance;
	}
	
	public List <BoardVO> getArticleList() throws BoardException
	{
		int pageNum = 1;
		
		
		List <BoardVO> mList = BoardDao.getInstance().selectList();			
		return mList;
	}
		
}
