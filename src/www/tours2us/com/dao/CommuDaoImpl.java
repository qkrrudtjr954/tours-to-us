package www.tours2us.com.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import www.tours2us.com.model.CommuAfterBbsDto;
import www.tours2us.com.model.CommuAfterCommentDto;

@Repository
public class CommuDaoImpl implements CommuDao {
Logger logger = LoggerFactory.getLogger(CommuDaoImpl.class);
	

@Autowired
SqlSessionTemplate sqlSession;

private String ns = "Commu.";

@Override
public List<CommuAfterBbsDto> getAfterBbslist() throws Exception {
	logger.info("CommuDaoImpl >>>> afterbbslist");
	// sqlSession 설정 타입 (BATCH, SIMPLE)
	System.out.println("타입:" + sqlSession.getConfiguration().getDefaultExecutorType());
	
	List<CommuAfterBbsDto> list = sqlSession.selectList(ns + "AfterBbslist");	
	
	return list;
}

@Override
public boolean afterwriteBbs(CommuAfterBbsDto bbs) throws Exception {
	logger.info("CommuDaoImpl >>>> afterwriteBbs");
	sqlSession.insert(ns+"AfterWrite", bbs);
	return true;
}

@Override
public CommuAfterBbsDto getAfterBbs(int seq) throws Exception {
	logger.info("CommuDaoImpl >>>> getAfterBbs");
	return sqlSession.selectOne(ns+ "AftergetBbs", seq);
}

@Override
public boolean AfterUpdate(CommuAfterBbsDto bbs) throws Exception {
	logger.info("CommuDaoImpl >>>> AfterUpdate");
	int n = sqlSession.update(ns+"AfterUpdateBbs", bbs);
	
	System.out.println("bbs = "  +bbs);
	return n>0?true:false;
}

@Override
public boolean Afterdelete(int seq) throws Exception {
	logger.info("CommuDaoImpl >>>> Afterdelete");
	int count = sqlSession.update(ns + "AfterdeleteBbs", seq);
	return count>0?true:false;
}






}
