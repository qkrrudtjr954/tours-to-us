package www.tours2us.com.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import www.tours2us.com.model.EventDto;

@Repository
public class EventDaoImpl implements EventDao {

Logger logger = LoggerFactory.getLogger(PlanerDaoImpl.class);	
	
	private String ns = "Event.";
	
	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public List<EventDto> getEventList() {
		List<EventDto> list = new ArrayList<EventDto>();
		return list = sqlSession.selectList(ns+"getEventList");
	}

	@Override
	public EventDto getEventDetail(int seq) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(ns+"getEventDetail", seq);
	}
}
