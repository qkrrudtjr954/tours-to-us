package www.tours2us.com.service;

import java.util.List;

import www.tours2us.com.model.TravelerDto;

public interface TravelerService {

	public boolean signup(TravelerDto dto) throws Exception;
	public TravelerDto getUserByEmail(String email) throws Exception;

	public TravelerDto signin(TravelerDto dto) throws Exception;
	public List<TravelerDto> getTravelersByNamdOrEmail(String name);

	public boolean myInfoUpd(TravelerDto dto);
	
}
