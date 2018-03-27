package www.tours2us.com.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import www.tours2us.com.dao.TravelerDao;

@Service
public class TravelerServiceImpl implements TravelerService {

	
	@Autowired
	TravelerDao travelerDao;
	
}
