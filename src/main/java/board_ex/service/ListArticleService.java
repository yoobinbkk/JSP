package board_ex.service;

import java.util.List;

import board_ex.model.*;
import guest.model.MessageDao;
import guest.model.MessageException;

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
	
	public List <BoardVO> getArticleList(String pNum) throws BoardException
	{
		int pageNum = 1;
		if(pNum != null) pageNum = Integer.parseInt(pNum);
		
		int startRow = countPerPage * pageNum - 2;
		int endRow = pageNum * countPerPage;
		
		List <BoardVO> mList = BoardDao.getInstance().selectList();			
		return mList;
	}
	
	public int getTotalPage() throws BoardException
	{
		// 전체 레코드 수
		totalRecCount = BoardDao.getInstance().getTotalCount();
		pageTotalCount = totalRecCount / countPerPage;
		
		if(totalRecCount%countPerPage > 0)
			pageTotalCount++;
		
		return pageTotalCount;	// 페이지 수 리턴
	}
	
}
