package board_ex.service;

import board_ex.model.*;

public class ModifyArticleService {
	
	private static ModifyArticleService instance;
	public static ModifyArticleService getInstance()  throws BoardException{
		if( instance == null )
		{
			instance = new ModifyArticleService();
		}
		return instance;
	}
	
	public int update( BoardVO rec ) throws BoardException{
		
		// DB에서 update
		int result = BoardDao.getInstance().update(rec);
	
		return result;
		
	}
}
