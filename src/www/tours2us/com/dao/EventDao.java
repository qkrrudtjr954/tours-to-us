package www.tours2us.com.dao;

import java.util.List;

import www.tours2us.com.model.EventDto;


public interface EventDao {
	List<EventDto> getEventList();
}
