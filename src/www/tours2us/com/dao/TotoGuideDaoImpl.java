package www.tours2us.com.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class TotoGuideDaoImpl implements TotoGuideDao {

	@Autowired
	SqlSessionTemplate sqlSession;

	private String ns = "TotoGuide.";
}
