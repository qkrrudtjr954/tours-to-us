package www.tours2us.com.dao;

import java.util.List;

import www.tours2us.com.model.TotoGuideDto;

public interface TotoGuideDao {

	List<TotoGuideDto> getTotoList();
	TotoGuideDto getTotoDetail(int seq);
	void totoUpload(TotoGuideDto totodto);
	boolean downCount(int seq);
	void readCount(int seq);
	List<TotoGuideDto> bestToToguide();
	List<TotoGuideDto> totoSearch(String location);
	String getTotalDownCount();
}
