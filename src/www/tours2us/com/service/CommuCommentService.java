package www.tours2us.com.service;

import java.util.List;

import www.tours2us.com.model.CommuAfterCommentDto;
import www.tours2us.com.model.CommuFreeCommentDto;

public interface CommuCommentService {
		
public List<CommuAfterCommentDto> addComment(CommuAfterCommentDto comment) throws Exception;
public List<CommuAfterCommentDto> getAllComments(int seq) throws Exception;
public boolean  AfterCommentDelete(int seq)throws Exception;
public int AftereDeleteCheck(int seq ) throws Exception;

//자유게시판
public List<CommuFreeCommentDto> FreeGetAllComments(int seq) throws Exception;
public List<CommuFreeCommentDto> FreeAddComent(CommuFreeCommentDto freecomment) throws Exception;




}
