package www.tours2us.com.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import www.tours2us.com.dao.EventDao;
import www.tours2us.com.model.EventDto;

@Service
public class EventServiceImpl implements EventService {

	@Autowired
	EventDao eventDao;

	@Override
	public List<EventDto> getEventList() {
		// TODO Auto-generated method stub
		return eventDao.getEventList();
	}
}
