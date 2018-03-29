package www.tours2us.com.service;

import java.util.List;

import www.tours2us.com.model.CommuAfterBbsDto;

public interface CommuService {
	
	List<CommuAfterBbsDto> getAfterBbslist()throws Exception;
	boolean afterwriteBbs(CommuAfterBbsDto bbs)throws Exception;

}
