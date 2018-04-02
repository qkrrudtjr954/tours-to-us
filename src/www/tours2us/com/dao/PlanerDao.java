package www.tours2us.com.dao;

import java.util.List;

import www.tours2us.com.model.DayPlanerDto;
import www.tours2us.com.model.PlanerDto;
import www.tours2us.com.model.TimePlanerDto;

public interface PlanerDao {

	int addPlaner(PlanerDto planer);

	PlanerDto getPlaner(int seq);

	List<PlanerDto> getplanList(int seq);

	List<DayPlanerDto> getDayplanList(int seq);

	DayPlanerDto getDayPlanerByTargetPlanerSeqAndDayCount(DayPlanerDto dayPlaner);

	int addDayPlaner(DayPlanerDto dayPlaner);

	DayPlanerDto getDayPlanerBySeq(int seq);

	int addTimePlaner(TimePlanerDto timePlaner);

	TimePlanerDto getTimePlanerBySeq(int seq);

	List<TimePlanerDto> getAllTimePlanersByTargetDayPlanerSeq(int seq);

	boolean changeTitle(PlanerDto planer);

	void updateCompletePlaner(PlanerDto planer);
}
