package www.tours2us.com.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import www.tours2us.com.dao.TravelerDao;
import www.tours2us.com.model.TravelerDto;

@Service
public class TravelerServiceImpl implements TravelerService {

	
	@Autowired
	TravelerDao travelerDao;

	@Override
	public boolean signup(TravelerDto dto) throws Exception {
		// TODO Auto-generated method stub
		return travelerDao.signup(dto);
	}

	@Override
	public TravelerDto getUserByEmail(String email) throws Exception {
		// TODO Auto-generated method stub
		return travelerDao.getUserByEmail(email);
	}
	public TravelerDto signin(TravelerDto dto) throws Exception {
		// TODO Auto-generated method stub
		return travelerDao.signin(dto);
	}
	
}
