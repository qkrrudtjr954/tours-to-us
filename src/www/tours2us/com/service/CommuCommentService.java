package www.tours2us.com.service;

import java.util.List;

import www.tours2us.com.model.CommuAfterCommentDto;

public interface CommuCommentService {
		
public List<CommuAfterCommentDto> addComment(CommuAfterCommentDto comment) throws Exception;
public List<CommuAfterCommentDto> getAllComments(int seq) throws Exception;




}
