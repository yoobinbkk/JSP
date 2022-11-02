package guest.service;

import guest.model.Message;
import guest.model.MessageDao;
import guest.model.MessageException;

public class WriteMessageService {

	private static WriteMessageService instance;
	
	public static WriteMessageService	getInstance() throws MessageException
	{
		if( instance == null )
		{
			instance = new WriteMessageService();
		}
		return instance;
	}
	
	private WriteMessageService()
	{
		
	}
	
	// 완충지 지대?
	public void write( Message rec ) throws MessageException
	{
		MessageDao mDao = MessageDao.getInstance();
		mDao.insert(rec);
	
	}
}
