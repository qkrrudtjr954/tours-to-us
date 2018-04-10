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
import www.tours2us.com.model.CommuFreeBbsDto;

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

@Override
public List<CommuAfterBbsDto> AftergetBbsPagingList(CommuAfterBbsDto afterparam) throws Exception {
	List<CommuAfterBbsDto> list = new ArrayList<CommuAfterBbsDto>();
	list = sqlSession.selectList(ns+"AftergetBbsPagingList", afterparam);
	return list;
}

@Override
public int AfterGetBbsCount(CommuAfterBbsDto aftercontparam) throws Exception {
		int num=0;
		num= sqlSession.selectOne(ns+"AfterGetBbsCount", aftercontparam);
	return num;
}


// 자유 게시판
@Override
public List<CommuFreeBbsDto> getFreeBbslist() throws Exception {
	logger.info("CommuDaoImpl >>>> getFreeBbslist");
	List<CommuFreeBbsDto> list = sqlSession.selectList(ns+"FreeBbsList");
	return list;
}

@Override
public boolean FreeBbsWrite(CommuFreeBbsDto freewrite) throws Exception {
	logger.info("CommuDaoImpl >>>> FreeBbsWrite");
	sqlSession.insert(ns+"FreeBbsWrite", freewrite);
	return true;
}

@Override
public CommuFreeBbsDto FreeBbsDetail(int seq) throws Exception {
	logger.info("CommuDaoImpl >>>> FreeBbsDetail");
	return sqlSession.selectOne(ns + "FreeBbsDetail", seq);
}

@Override
public boolean FreeBbsUpdate(CommuFreeBbsDto freebbsupdate) throws Exception {
	logger.info("CommuDaoImpl >>>> FreeBbsUpdate");
	int n = sqlSession.update(ns+"FreeBbsUpdate", freebbsupdate);
	System.out.println("freebbsupdate = "  +freebbsupdate);
	return n>0?true:false;
}

@Override
public boolean FreeDelete(int seq) throws Exception {
	logger.info("CommuDaoImpl >>>> FreeDelete");
	int count = sqlSession.update(ns + "FreeDeleteBbs", seq);
	return count>0?true:false;
}

@Override
public List<CommuFreeBbsDto> FreeBbsGetPagingList(CommuFreeBbsDto freeparam) throws Exception {
	List<CommuFreeBbsDto> list = new ArrayList<CommuFreeBbsDto>();
	list = sqlSession.selectList(ns+"FreeGetBbsPagingList", freeparam);
	return list;
}

@Override
public int FreeBbsGetCount(CommuFreeBbsDto freecontparam) throws Exception {
	int num=0;
	num= sqlSession.selectOne(ns+"FreeGetBbsCount", freecontparam);
return num;
}




}
