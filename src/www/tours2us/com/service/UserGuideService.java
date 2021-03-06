package www.tours2us.com.service;

import java.util.List;

import www.tours2us.com.model.PlanerDto;

public interface UserGuideService {

	public List<PlanerDto> getUserPlanList();
	
	public List<PlanerDto> guideSearch(PlanerDto plan);
	
	public int guideCount(PlanerDto plan);
	
	public List<PlanerDto> userSearch(String location);
}
