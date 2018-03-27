package www.tours2us.com.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import www.tours2us.com.model.TravelerDto;

@Repository
public class TravelerDaoImpl implements TravelerDao{
	@Autowired
	SqlSession sqlSession;
	
	private String ns = "Traveler.";

	@Override
	public TravelerDto signin(TravelerDto dto) throws Exception {
		
		return sqlSession.selectOne(ns+"signin", dto);
	}
}
