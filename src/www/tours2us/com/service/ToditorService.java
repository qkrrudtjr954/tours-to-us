package www.tours2us.com.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import www.tours2us.com.dao.ToditorDao;
import www.tours2us.com.model.PagingVo;
import www.tours2us.com.model.ToditorBBS;
import www.tours2us.com.model.ToditorCategoryDto;



@Service
public class ToditorService {

	@Autowired
	ToditorDao toditorDao;
	
	public List<ToditorCategoryDto> getCategory() throws Exception {
		return toditorDao.getCategory();
	}
	
	public void Toditorwrite(ToditorBBS bbs) throws Exception{
		toditorDao.Toditorwrite(bbs);
	}
	
	public List<ToditorBBS> ToditorgetList() throws Exception{
		return toditorDao.ToditorgetList();
	}
	
	public ToditorBBS ToditorDetail(int seq) throws Exception {
		return toditorDao.ToditorDetail(seq);
	}
	
	public List<ToditorBBS> ToditorgetPagingList(PagingVo pv) throws Exception{
		
 		return toditorDao.ToditorgetPagingList(pv);
	}
	public int ToditorgetBbsCount(PagingVo pv) throws Exception{
		
		return toditorDao.ToditorgetBbsCount(pv);
	}
}
