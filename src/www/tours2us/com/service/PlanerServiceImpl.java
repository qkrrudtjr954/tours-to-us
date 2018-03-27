package www.tours2us.com.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import www.tours2us.com.dao.PlanerDao;
import www.tours2us.com.model.PlanerDto;

@Service
public class PlanerServiceImpl implements PlanerService{

	Logger logger = LoggerFactory.getLogger(PlanerServiceImpl.class);
	
	@Autowired
	PlanerDao planerDao;
	
	
	@Override
	public PlanerDto addPlaner(PlanerDto planer) {
		//	저장한 후 , Dto 세팅 
		int seq = planerDao.addPlaner(planer);
		return planerDao.getPlaner(seq); 
	}

}
