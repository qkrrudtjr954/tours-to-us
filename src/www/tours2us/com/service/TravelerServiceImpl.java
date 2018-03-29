package www.tours2us.com.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import www.tours2us.com.dao.TravelerDao;
import www.tours2us.com.model.CoTravelerDto;
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

	@Override
	public List<TravelerDto> getTravelersByNamdOrEmail(String name) {
		// TODO Auto-generated method stub
		return travelerDao.getTravelersByNamdOrEmail(name);
	}

	@Override
	public boolean myInfoUpd(TravelerDto dto) {
		// TODO Auto-generated method stub
		return travelerDao.myInfoUpd(dto);
	}
	

	@Override
	public int addCoTraveler(CoTravelerDto coTravelerDto) {
		return travelerDao.addCoTraveler(coTravelerDto);
	}

	@Override
	public TravelerDto getUserBySeq(int seq) {
		return travelerDao.getUserBySeq(seq);
	}

	@Override
	public boolean checkCoTraveler(CoTravelerDto coTraveler) {
		CoTravelerDto temp = travelerDao.getCoTraveler(coTraveler);
		//	테이블에 없으면 false, 있으면 true
		return (temp==null)?false:true;
	}

	@Override
	public boolean deleteCoTraveler(CoTravelerDto coTraveler) {
		return travelerDao.deleteCoTraveler(coTraveler);
	}

	@Override
	public List<TravelerDto> getCoTravelers(int planer_seq) {
		return travelerDao.getCoTravelers(planer_seq);
	}


	
}
