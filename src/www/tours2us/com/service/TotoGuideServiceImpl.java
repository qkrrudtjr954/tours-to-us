package www.tours2us.com.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import www.tours2us.com.dao.TotoGuideDao;
import www.tours2us.com.model.TotoGuideDto;

@Service
public class TotoGuideServiceImpl implements TotoGuideService {

	@Autowired
	TotoGuideDao totoGuideDao;

	@Override
	public List<TotoGuideDto> getTotoList() {
		// TODO Auto-generated method stub
		return totoGuideDao.getTotoList();
	}

	@Override
	public TotoGuideDto getTotoDetail(int seq) {
		// TODO Auto-generated method stub
		return totoGuideDao.getTotoDetail(seq);
	}

	@Override
	public void totoUpload(TotoGuideDto totodto) {
		// TODO Auto-generated method stub
		totoGuideDao.totoUpload(totodto);
	}

	@Override
	public boolean downCount(int seq) {
		// TODO Auto-generated method stub
		return totoGuideDao.downCount(seq);
	}

	@Override
	public void readCount(int seq) {
		// TODO Auto-generated method stub
		totoGuideDao.readCount(seq);
	}

	@Override
	public List<TotoGuideDto> bestToToguide() {
		// TODO Auto-generated method stub
		return totoGuideDao.bestToToguide();
	}
}
