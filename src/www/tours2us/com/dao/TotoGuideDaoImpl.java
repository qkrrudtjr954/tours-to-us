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
		List<TotoGuideDto> list = new ArrayList<>();
		list = sqlSession.selectList(ns+"getTotoList");	
		return list;
	}

	@Override
	public TotoGuideDto getTotoDetail(int seq) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(ns+"getTotoDetail", seq);
	}

	@Override
	public void totoUpload(TotoGuideDto totodto) {
		// TODO Auto-generated method stub
		sqlSession.insert(ns+"totoUpload", totodto);
	}

	@Override
	public boolean downCount(int seq) {
		int n = sqlSession.update(ns+"downCount", seq);
		return n>0?true:false;
	}

	@Override
	public void readCount(int seq) {
		// TODO Auto-generated method stub
		sqlSession.update(ns+"readCount", seq);
	}

	@Override
	public List<TotoGuideDto> totoSearch(String location) {
		List<TotoGuideDto> list =new ArrayList<>();
		list = sqlSession.selectList(ns+"totoSearch", location);
		return list;
	}

	@Override
	public String getTotalDownCount() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(ns+"getTotalDownCount");
	}
}
