package www.tours2us.com.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import www.tours2us.com.dao.UserGuideDao;
import www.tours2us.com.model.PlanerDto;

@Service
public class UserGuideServiceImpl implements UserGuideService {

	@Autowired
	UserGuideDao userGuideDao;

	@Override
	public List<PlanerDto> getUserPlanList() {
		// TODO Auto-generated method stub
		return userGuideDao.getUserPlanList();
	}
}
