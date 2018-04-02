package www.tours2us.com.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import www.tours2us.com.model.DayPlanerDto;
import www.tours2us.com.model.PlanerDto;
import www.tours2us.com.model.TimePlanerDto;

@Repository
public class PlanerDaoImpl implements PlanerDao{

	Logger logger = LoggerFactory.getLogger(PlanerDaoImpl.class);


	private String namespace = "Planer.";

	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public int addPlaner(PlanerDto planer) {
		sqlSession.insert(namespace + "addPlaner", planer);
		logger.info("PlanerDaoImpl after insert : {}", planer);
		return planer.getSeq();
	}

	@Override
	public PlanerDto getPlaner(int seq) {
		return sqlSession.selectOne(namespace + "getPlaner", seq);
	}

	@Override
	public List<DayPlanerDto> getDayplanList(int seq) {
		List<DayPlanerDto> list = new ArrayList<DayPlanerDto>();
		return list = sqlSession.selectList(namespace+"getDayplanList", seq);
	}

	@Override
	public List<PlanerDto> getplanList(int seq) {
		List<PlanerDto> list = new ArrayList<PlanerDto>();
		return list = sqlSession.selectList(namespace+"getplanList", seq);
	}

	@Override
	public DayPlanerDto getDayPlanerByTargetPlanerSeqAndDayCount(DayPlanerDto dayPlaner) {
		return sqlSession.selectOne(namespace+"getDayPlanerByTargetPlanerSeqAndDayCount", dayPlaner);
	}

	@Override
	public int addDayPlaner(DayPlanerDto dayPlaner) {
		sqlSession.insert(namespace+"addDayPlaner", dayPlaner);
		return dayPlaner.getSeq();
	}

	@Override
	public DayPlanerDto getDayPlanerBySeq(int seq) {
		return sqlSession.selectOne(namespace + "getDayPlanerBySeq", seq);
	}

	@Override
	public int addTimePlaner(TimePlanerDto timePlaner) {
		sqlSession.insert(namespace+"addTimePlaner", timePlaner);
		return timePlaner.getSeq();
	}

	@Override
	public TimePlanerDto getTimePlanerBySeq(int seq) {
		return sqlSession.selectOne(namespace+"getTimePlaner", seq);
	}

	@Override
	public List<TimePlanerDto> getAllTimePlanersByTargetDayPlanerSeq(int seq) {
		return sqlSession.selectList(namespace+ "getAllTimePlanersByTargetDayPlanerSeq", seq);
	}

	@Override
	public boolean changeTitle(PlanerDto planer) {
		int c = sqlSession.update(namespace+"changeTitle", planer);
		return c>0?true:false;
	}

	public void updateCompletePlaner(PlanerDto planer) {
		sqlSession.update(namespace+ "updateCompletePlaner", planer);
	}


}
