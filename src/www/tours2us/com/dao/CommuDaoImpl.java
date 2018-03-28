package www.tours2us.com.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CommuDaoImpl implements CommuDao {
Logger logger = LoggerFactory.getLogger(PlanerDaoImpl.class);
	
private String namespace = "Comment.";

@Autowired
SqlSessionTemplate sqlSession;



	
	

}
