package www.tours2us.com.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import www.tours2us.com.dao.ToditorDao;
import www.tours2us.com.model.CommuAfterCommentDto;
import www.tours2us.com.model.PagingVo;
import www.tours2us.com.model.ToditorBBS;
import www.tours2us.com.model.ToditorCategoryDto;
import www.tours2us.com.model.ToditorCommentDto;



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
	
	public List<ToditorBBS> best123(){
		
		return toditorDao.best123();
	}
	
	public List<ToditorCommentDto> getAllComments(int seq) throws Exception {
		
		return toditorDao.getAllComments(seq);
	}

	public  List<ToditorCommentDto>  addComment(ToditorCommentDto comment) throws Exception {
		boolean result = toditorDao.addComment(comment);
		System.out.println("addComment = " + result);
		List<ToditorCommentDto> list = new ArrayList<ToditorCommentDto>();
		System.out.println("comment = " +  comment);
		int seq = comment.getTarget_editor_seq();
		System.out.println("seq = " + seq);
		if(result) {
			
			list = toditorDao.getAllComments(seq);
			
		}
		
		return list;
	}
	
	public boolean CommentDelete(int seq) throws Exception {
		return toditorDao.CommentDelete(seq);
	}
	
	public boolean CommentDeleteCheck(int seq, int current_user_seq) throws Exception {
		int target_user_seq = toditorDao.CommentGgtUserSeq(seq);
		System.out.println("dkdkdkdk = " + target_user_seq);
		return(target_user_seq==current_user_seq)?true:false;
	}
	
	
	
	
	public boolean ToditorUpdate(ToditorBBS bbs) throws Exception {		
		return toditorDao.ToditorUpdate(bbs);
	}
	
	public void updateReadCount(int seq) throws Exception{
		
		toditorDao.updateReadCount(seq);
	}
	
	public void ToditorDelete(int seq) throws Exception{
		toditorDao.ToditorDelete(seq);
	}
}
