package www.tours2us.com.dao;

import java.util.List;

import www.tours2us.com.model.CommuAfterCommentDto;

public interface CommuCommentDao {
	
public List<CommuAfterCommentDto> getAllComments(int seq) throws Exception;	
public boolean addComment(CommuAfterCommentDto comment) throws Exception;
//public List<CommuAfterCommentDto> getComment(int seq) throws Exception;


}
