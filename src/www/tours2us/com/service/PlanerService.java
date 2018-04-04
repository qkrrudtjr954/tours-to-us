package www.tours2us.com.service;

import java.util.List;

import www.tours2us.com.model.CoTravelerDto;
import www.tours2us.com.model.DayPlanerDto;
import www.tours2us.com.model.Korea;
import www.tours2us.com.model.PlanerDto;
import www.tours2us.com.model.TimePlanerDto;
import www.tours2us.com.model.TravelerDto;

public interface PlanerService {

	PlanerDto addPlaner(PlanerDto planer);

	public List<PlanerDto> getplanList(int seq);

	public List<DayPlanerDto> getDayplanList(int seq);

	PlanerDto getPlaner(int seq);

	DayPlanerDto getDayPlanerByTargetPlanerSeqAndDayCount(DayPlanerDto dayPlaner);

	DayPlanerDto addDayPlaner(DayPlanerDto dayPlaner);

	TimePlanerDto addTimePlaner(TimePlanerDto timePlaner);

	List<TimePlanerDto> getAllTimePlanersByTargetDayPlanerSeq(int seq);

	public boolean changeTitle(PlanerDto planer);

	void updateCompletePlaner(PlanerDto planer);

	List<Korea> getKoreaList();
}
