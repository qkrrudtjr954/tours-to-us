package www.tours2us.com.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class TravelerDaoImpl implements TravelerDao{
	@Autowired
	SqlSession sqlSession;
	
	private String ns = "Traveler.";
}
