package www.tours2us.com.dao;


import java.util.List;

import www.tours2us.com.model.TravelerDto;

public interface TravelerDao {

	TravelerDto signin(TravelerDto dto)throws Exception; 
boolean signup(TravelerDto dto) throws Exception;
	TravelerDto getUserByEmail(String email);
	List<TravelerDto> getTravelersByNamdOrEmail(String name);

}
