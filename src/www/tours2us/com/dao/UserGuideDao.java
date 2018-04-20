package www.tours2us.com.dao;

import java.util.List;

import www.tours2us.com.model.PlanerDto;

public interface UserGuideDao {

	List<PlanerDto> getUserPlanList(); 
	
	List<PlanerDto> guideSearch(PlanerDto plan);

	int guideCount(PlanerDto plan);
	
	List<PlanerDto> userSearch(String location);
}
