package www.tours2us.com.dao;

import java.util.List;

import www.tours2us.com.model.CommuAfterCommentDto;
import www.tours2us.com.model.CommuFreeCommentDto;

public interface CommuCommentDao {
	
public List<CommuAfterCommentDto> getAllComments(int seq) throws Exception;	
public boolean addComment(CommuAfterCommentDto comment) throws Exception;
public boolean AfterCommentDelete(int seq)throws Exception;
public int AfterCommentGgtUserSeq(int seq)throws Exception;
public void afterReadCount(int seq);

//자유게시판
public List<CommuFreeCommentDto> FreeGetAllComments(int seq) throws Exception;
public boolean FreeAddComent(CommuFreeCommentDto freecomment) throws Exception;
public boolean FreeCommentDelete(int seq)throws Exception;
public int FreeCommentGgtUserSeq(int seq)throws Exception;
public void readCount(int seq);



}
