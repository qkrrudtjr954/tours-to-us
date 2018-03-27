package www.tours2us.com.dao;

import www.tours2us.com.model.PlanerDto;

public interface PlanerDao {

	int addPlaner(PlanerDto planer);

	PlanerDto getPlaner(int seq);

}
