package www.tours2us.com.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import www.tours2us.com.model.PlanerDto;

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

}
