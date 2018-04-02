package www.tours2us.com.dao;

import java.util.List;

import www.tours2us.com.model.CommuAfterBbsDto;
import www.tours2us.com.model.CommuAfterCommentDto;

public interface CommuDao {
	
	List<CommuAfterBbsDto> getAfterBbslist()throws Exception;
	
	boolean afterwriteBbs(CommuAfterBbsDto bbs)throws Exception;
	
	public CommuAfterBbsDto getAfterBbs(int seq) throws Exception;
	
	boolean AfterUpdate(CommuAfterBbsDto bbs) throws Exception;
	
	boolean Afterdelete(int seq) throws Exception;
	
	public List<CommuAfterCommentDto> getAllComments(int ref) throws Exception;
	
	public boolean addComment(CommuAfterCommentDto comment) throws Exception;
	
	
	
	

}
