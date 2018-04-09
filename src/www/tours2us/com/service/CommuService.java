package www.tours2us.com.service;

import java.util.List;

import www.tours2us.com.model.CommuAfterBbsDto;
import www.tours2us.com.model.CommuAfterCommentDto;
import www.tours2us.com.model.CommuFreeBbsDto;

public interface CommuService {
	
	List<CommuAfterBbsDto> getAfterBbslist()throws Exception;
	
	boolean afterwriteBbs(CommuAfterBbsDto bbs)throws Exception;
	
	public CommuAfterBbsDto getAfterBbs(int seq) throws Exception;
	
	boolean AfterUpdate(CommuAfterBbsDto bbs) throws Exception;
	
	boolean Afterdelete(int seq) throws Exception;
	
	public List<CommuAfterBbsDto> AftergetBbsPagingList(CommuAfterBbsDto afterparam) throws Exception;
	
	public int AfterGetBbsCount(CommuAfterBbsDto aftercontparam) throws Exception;
	
	//FreeBbs
	List<CommuFreeBbsDto> getFreeBbslist()throws Exception;
	
	boolean FreeBbsWrite(CommuFreeBbsDto freewrite)throws Exception;
	
	public CommuFreeBbsDto FreeBbsDetail(int seq) throws Exception;
	
	boolean FreeBbsUpdate(CommuFreeBbsDto freebbsupdate) throws Exception;
	
	boolean FreeDelete(int seq) throws Exception;
	

}
