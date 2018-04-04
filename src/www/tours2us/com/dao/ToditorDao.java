package www.tours2us.com.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import www.tours2us.com.model.DayPlanerDto;
import www.tours2us.com.model.ToditorBBS;
import www.tours2us.com.model.ToditorCategoryDto;


@Repository
public class ToditorDao {
	
	Logger logger = LoggerFactory.getLogger(ToditorDao.class);


	private String ns = "Toditor.";

	@Autowired
	SqlSessionTemplate sqlSession;
	
	public List<ToditorCategoryDto> getCategory() {
		List<ToditorCategoryDto> list = new ArrayList<ToditorCategoryDto>();
		return list = sqlSession.selectList(ns+"getCategory");
	}
	
	public void Toditorwrite(ToditorBBS bbs) {
		sqlSession.insert(ns+"Toditorwrite", bbs);
	}
	
	public List<ToditorBBS> ToditorgetList(){
		List<ToditorBBS> list = new ArrayList<>();
		return list = sqlSession.selectList(ns+"ToditorgetList");
	}
}