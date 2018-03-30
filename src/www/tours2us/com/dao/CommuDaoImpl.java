package www.tours2us.com.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import www.tours2us.com.model.CommuAfterBbsDto;

@Repository
public class CommuDaoImpl implements CommuDao {
Logger logger = LoggerFactory.getLogger(CommuDaoImpl.class);
	

@Autowired
SqlSessionTemplate sqlSession;

private String ns = "Commu.";

@Override
public List<CommuAfterBbsDto> getAfterBbslist() throws Exception {
	
	// sqlSession 설정 타입 (BATCH, SIMPLE)
	System.out.println("타입:" + sqlSession.getConfiguration().getDefaultExecutorType());
	
	List<CommuAfterBbsDto> list = new ArrayList<CommuAfterBbsDto>();
	list = sqlSession.selectList(ns + "AfterBbslist");	
	
	return list;
}

@Override
public boolean afterwriteBbs(CommuAfterBbsDto bbs) throws Exception {
	sqlSession.insert(ns+"AfterWrite", bbs);
	return true;
}

@Override
public CommuAfterBbsDto getAfterBbs(int seq) throws Exception {
	// TODO Auto-generated method stub
	return sqlSession.selectOne(ns+ "AftergetBbs", seq);
}











	
	

}
