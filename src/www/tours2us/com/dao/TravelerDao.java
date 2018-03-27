package www.tours2us.com.dao;


import www.tours2us.com.model.TravelerDto;

public interface TravelerDao {
	
	boolean signup(TravelerDto dto) throws Exception;
	TravelerDto getUserByEmail(String email);
}
