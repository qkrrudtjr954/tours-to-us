package www.tours2us.com.service;

import java.util.List;

import www.tours2us.com.model.EventDto;

public interface EventService {
	public List<EventDto> getEventList();
	public EventDto getEventDetail(int seq);
}
