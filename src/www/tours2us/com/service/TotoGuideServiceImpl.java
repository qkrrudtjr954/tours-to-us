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
}
