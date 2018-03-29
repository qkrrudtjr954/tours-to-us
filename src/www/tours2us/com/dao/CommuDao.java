package www.tours2us.com.dao;

import java.util.List;

import www.tours2us.com.model.CommuAfterBbsDto;

public interface CommuDao {
	
	List<CommuAfterBbsDto> getAfterBbslist()throws Exception;
	
	boolean afterwriteBbs(CommuAfterBbsDto bbs)throws Exception;
	
	
	
	

}
