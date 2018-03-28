package www.tours2us.com.dao;


import java.util.List;

import www.tours2us.com.model.CoTravelerDto;
import www.tours2us.com.model.TravelerDto;

public interface TravelerDao {

	TravelerDto signin(TravelerDto dto)throws Exception; 
boolean signup(TravelerDto dto) throws Exception;
	TravelerDto getUserByEmail(String email);
	List<TravelerDto> getTravelersByNamdOrEmail(String name);
	List<TravelerDto> getCoTraveler(int planer_seq);
	TravelerDto getUserBySeq(int seq);
	int addCoTraveler(CoTravelerDto coTravelerDto);
	CoTravelerDto getCoTraveler(CoTravelerDto coTraveler);
	boolean deleteCoTraveler(CoTravelerDto coTraveler);

}
