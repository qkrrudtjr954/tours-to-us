package www.tours2us.com.dao;

import java.util.List;

import www.tours2us.com.model.PlanerDto;

public interface PlanerDao {

	int addPlaner(PlanerDto planer);

	PlanerDto getPlaner(int seq);
	
	List<PlanerDto> getplanList(int seq);

}
