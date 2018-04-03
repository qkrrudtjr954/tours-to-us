package www.tours2us.com.service;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import www.tours2us.com.dao.CommuCommentDao;
import www.tours2us.com.model.CommuAfterCommentDto;
@Service
public class CommuCommentServiceImpl implements CommuCommentService {
	Logger logger = LoggerFactory.getLogger(CommuCommentServiceImpl.class);
	@Autowired
	CommuCommentDao commuCommentDao;
	
	@Override
	public List<CommuAfterCommentDto> addComment(CommuAfterCommentDto comment) throws Exception {	
		boolean result = commuCommentDao.addComment(comment);
		System.out.println("addComment = " + result);
		List<CommuAfterCommentDto> list = new ArrayList<CommuAfterCommentDto>();
		System.out.println("comment = " +  comment);
		int seq = comment.getTarget_bbs_seq();
		System.out.println("seq = " + seq);
		if(result) {
			
			list = commuCommentDao.getAllComments(seq);
			
		}
		
		return list;
	}

	@Override
	public List<CommuAfterCommentDto> getAllComments(int seq) throws Exception {
		// TODO Auto-generated method stub
		return commuCommentDao.getAllComments(seq);
	}

	
	
	
	
	
	

}
