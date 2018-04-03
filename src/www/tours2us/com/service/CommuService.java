package www.tours2us.com.service;

import java.util.List;

import www.tours2us.com.model.CommuAfterBbsDto;
import www.tours2us.com.model.CommuAfterCommentDto;

public interface CommuService {
	
	List<CommuAfterBbsDto> getAfterBbslist()throws Exception;
	
	boolean afterwriteBbs(CommuAfterBbsDto bbs)throws Exception;
	
	public CommuAfterBbsDto getAfterBbs(int seq) throws Exception;
	
	boolean AfterUpdate(CommuAfterBbsDto bbs) throws Exception;
	
	boolean Afterdelete(int seq) throws Exception;
	
	
	

}
