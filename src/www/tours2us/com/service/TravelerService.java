package www.tours2us.com.service;

import www.tours2us.com.model.TravelerDto;

public interface TravelerService {

	public boolean signup(TravelerDto dto) throws Exception;
	public TravelerDto getUserByEmail(String email) throws Exception;
	
}
