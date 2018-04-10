package www.tours2us.com.dao;

import java.util.List;

import www.tours2us.com.model.TotoGuideDto;

public interface TotoGuideDao {

	List<TotoGuideDto> getTotoList();
	TotoGuideDto getTotoDetail(int seq);
}
