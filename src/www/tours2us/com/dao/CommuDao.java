package www.tours2us.com.dao;

import java.util.List;


import www.tours2us.com.model.CommuAfterBbsDto;
import www.tours2us.com.model.CommuAfterCommentDto;
import www.tours2us.com.model.CommuFreeBbsDto;
import www.tours2us.com.model.CommuFreeCategoryDto;

public interface CommuDao {
	
	List<CommuAfterBbsDto> getAfterBbslist()throws Exception;
	
	boolean afterwriteBbs(CommuAfterBbsDto bbs)throws Exception;
	
	public CommuAfterBbsDto getAfterBbs(int seq) throws Exception;
	
	boolean AfterUpdate(CommuAfterBbsDto bbs) throws Exception;
	
	boolean Afterdelete(int seq) throws Exception;
	
	public List<CommuAfterBbsDto> AftergetBbsPagingList(CommuAfterBbsDto afterparam) throws Exception;
	
	public int AfterGetBbsCount(CommuAfterBbsDto aftercontparam) throws Exception;
	
	public void AfterReadCount(int seq) throws Exception;
	
	
	//FreeBbs
	List<CommuFreeBbsDto> getFreeBbslist()throws Exception;
	
	boolean FreeBbsWrite(CommuFreeBbsDto freewrite)throws Exception;
	
	public CommuFreeBbsDto FreeBbsDetail(int seq) throws Exception;
	
	boolean FreeBbsUpdate(CommuFreeBbsDto freebbsupdate) throws Exception;
	
	boolean FreeDelete(int seq) throws Exception;
	
	public List<CommuFreeBbsDto> FreeBbsGetPagingList(CommuFreeBbsDto freeparam) throws Exception;
	
	public int FreeBbsGetCount(CommuFreeBbsDto freecontparam) throws Exception;
	
	public void FreeReadCount(int seq) throws Exception;
	
	public List<CommuAfterBbsDto> bestAfter() throws Exception;
	List<CommuFreeCategoryDto> GetFreeBbsCategory()throws Exception;
	

}
