package www.tours2us.com.service;

import java.util.List;

import www.tours2us.com.model.PlanerDto;

public interface PlanerService {

	PlanerDto addPlaner(PlanerDto planer);
	
	public List<PlanerDto> getplanList(int seq);

}
