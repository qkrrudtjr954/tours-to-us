package www.tours2us.com.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import www.tours2us.com.dao.PlanerDao;
import www.tours2us.com.dao.TravelerDao;
import www.tours2us.com.model.CoTravelerDto;
import www.tours2us.com.model.PlanerDto;
import www.tours2us.com.model.TravelerDto;

@Service
public class PlanerServiceImpl implements PlanerService{

	Logger logger = LoggerFactory.getLogger(PlanerServiceImpl.class);

	@Autowired
	PlanerDao planerDao;

	@Autowired
	TravelerDao travelDao;


	@Override
	public PlanerDto addPlaner(PlanerDto planer) {
		//	저장한 후 , Dto 세팅
		int planer_seq = planerDao.addPlaner(planer);

		TravelerDto traveler = travelDao.getUserBySeq(planer.getTarget_user_seq());
		CoTravelerDto coTravelerDto = new CoTravelerDto(traveler.getSeq(), planer_seq, traveler.getName());
		travelDao.addCoTraveler(coTravelerDto);

		return planerDao.getPlaner(planer_seq);
	}


	@Override
	public PlanerDto getPlaner(int seq) {
		return planerDao.getPlaner(seq);
	}


	public List<PlanerDto> getplanList(int seq) {
		// TODO Auto-generated method stub
		return planerDao.getplanList(seq);
	}

}
