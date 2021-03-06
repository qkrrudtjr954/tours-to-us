package www.tours2us.com.service;

import java.util.List;

import www.tours2us.com.model.TotoGuideDto;

public interface TotoGuideService {

	public List<TotoGuideDto> getTotoList();
	public TotoGuideDto getTotoDetail(int seq);
	public void totoUpload(TotoGuideDto totodto);
	public boolean downCount(int seq);
	public void readCount(int seq);
	public List<TotoGuideDto> bestToToguide();
	public List<TotoGuideDto> totoSearch(String location);
	public String getTotalDownCount();
}
