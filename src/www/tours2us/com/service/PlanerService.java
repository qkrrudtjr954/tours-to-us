package www.tours2us.com.service;

import java.util.List;

import www.tours2us.com.model.CoTravelerDto;
import www.tours2us.com.model.PlanerDto;
import www.tours2us.com.model.TravelerDto;

public interface PlanerService {

	PlanerDto addPlaner(PlanerDto planer);

	PlanerDto getPlaner(int seq);

	List<TravelerDto> getCoTraveler(int planer_seq);

}
