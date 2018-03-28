package www.tours2us.com.service;

import java.util.List;

import www.tours2us.com.model.CoTravelerDto;
import www.tours2us.com.model.TravelerDto;

public interface TravelerService {

	public boolean signup(TravelerDto dto) throws Exception;
	public TravelerDto getUserByEmail(String email) throws Exception;

	public TravelerDto signin(TravelerDto dto) throws Exception;
	public List<TravelerDto> getTravelersByNamdOrEmail(String name);

	TravelerDto getUserBySeq(int seq);
	int addCoTraveler(CoTravelerDto coTravelerDto);
	public boolean checkCoTraveler(CoTravelerDto coTraveler);
	public boolean deleteCoTraveler(CoTravelerDto coTraveler);
	
}
