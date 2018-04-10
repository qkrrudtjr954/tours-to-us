package www.tours2us.com.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import www.tours2us.com.model.CommuAfterCommentDto;
import www.tours2us.com.model.CommuFreeCommentDto;
@Repository
public class CommuCommentDaoImpl implements CommuCommentDao {
	Logger logger = LoggerFactory.getLogger(CommuCommentDaoImpl.class);

	@Autowired
	SqlSessionTemplate sqlSession;
	
	private String ns = "Commu.";
	
	
	@Override
	public List<CommuAfterCommentDto> getAllComments(int seq) throws Exception {
		logger.info("CommuCommentDaoImpl >>>> getAllComments");
		List<CommuAfterCommentDto> list = new ArrayList<CommuAfterCommentDto>();
		list = sqlSession.selectList(ns + "getAllComments", seq); 
		return list;
	}

	@Override
	public boolean addComment(CommuAfterCommentDto comment) throws Exception {
		logger.info("CommuCommentDaoImpl >>>> addComment");
		sqlSession.insert(ns+"AfterAddComent", comment);
		return true;
	}

	@Override
	public List<CommuFreeCommentDto> FreeGetAllComments(int seq) throws Exception {
		logger.info("CommuCommentDaoImpl >>>> FreeGetAllComments");
		List<CommuFreeCommentDto> list = new ArrayList<CommuFreeCommentDto>();
		list = sqlSession.selectList(ns + "FreeGetAllComments", seq);
		return list;
	}

	@Override
	public boolean FreeAddComent(CommuFreeCommentDto freecomment) throws Exception {
		logger.info("CommuCommentDaoImpl >>>> FreeAddComent");
		sqlSession.insert(ns + "FreeAddComent", freecomment);
		return true;
	}
	
	

	
	
	

}
