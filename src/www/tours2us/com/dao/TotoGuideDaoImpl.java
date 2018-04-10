package www.tours2us.com.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import www.tours2us.com.model.TotoGuideDto;

@Repository
public class TotoGuideDaoImpl implements TotoGuideDao {

	@Autowired
	SqlSessionTemplate sqlSession;

	private String ns = "TotoGuide.";

	@Override
	public List<TotoGuideDto> getTotoList() {
		List<TotoGuideDto> list = new ArrayList<TotoGuideDto>();
		list = sqlSession.selectList(ns+"getTotoList");
		return list;
	}
}
