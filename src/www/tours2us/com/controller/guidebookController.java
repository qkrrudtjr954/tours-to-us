package www.tours2us.com.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import www.tours2us.com.model.CommuAfterCommentDto;
import www.tours2us.com.model.LikeDto;
import www.tours2us.com.model.PagingVo;
import www.tours2us.com.model.ToditorBBS;
import www.tours2us.com.model.ToditorCategoryDto;
import www.tours2us.com.model.ToditorCommentDto;
import www.tours2us.com.model.TravelerDto;
import www.tours2us.com.service.LikeService;
import www.tours2us.com.service.ToditorService;

@Controller
public class guidebookController {
	private static final Logger logger = LoggerFactory.getLogger(guidebookController.class);
	
	@Autowired
	ToditorService toditorService;
	
	@Autowired
	LikeService likeService;
	
	/*@RequestMapping(value="editor_essay.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String essaylist(Model model) throws Exception{
		logger.info("guidebookController >>>> essaylist");
		
		List<ToditorBBS> list = new ArrayList<>();
		list = toditorService.ToditorgetList();
		model.addAttribute("list", list);

		return "editor_essay.tiles";
	}*/
	
	@RequestMapping(value="editor_essay.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String essaylist(PagingVo pv, Model model) throws Exception{
		logger.info("guidebookController >>>> essaylist");
		
		int sn = pv.getPageNumber();
		int start=(sn)*pv.getRecordCountPerPage()+1;
		int end = (sn+1)*pv.getRecordCountPerPage();
		
		pv.setStart(start);
		pv.setEnd(end);
		
		int totalRecordCount = toditorService.ToditorgetBbsCount(pv);
		List<ToditorBBS> list = toditorService.ToditorgetPagingList(pv);
		model.addAttribute("bbslist", list);
		
		List<ToditorBBS> b1list = toditorService.best123();	
		model.addAttribute("b1list", b1list);
	
		
		model.addAttribute("pageNumber", sn);
		model.addAttribute("pageCountPerScreen", 10);
		model.addAttribute("recordCountPerPage", pv.getRecordCountPerPage());
		model.addAttribute("totalRecordCount", totalRecordCount);
		
		model.addAttribute("s_category", pv.getS_category());
		model.addAttribute("s_keyword", pv.getS_keyword());
		

		return "editor_essay.tiles";
	}
	
	@RequestMapping(value="toditor_write.do", method={RequestMethod.GET, RequestMethod.POST})
	public String toditor_write(Model model) throws Exception{
		logger.info("guidebookController >>>> toditor_write");
		
		List<ToditorCategoryDto> list = new ArrayList<>();
		list = toditorService.getCategory();
		System.out.println(list);
		model.addAttribute("categorylist", list);
		return "toditor_write.tiles";
	}
	
	@RequestMapping(value="toditor_writeAf.do", method={RequestMethod.GET, RequestMethod.POST})
	public String toditor_writeAf(ToditorBBS bbs, Model model) throws Exception{
		logger.info("guidebookController >>>> toditor_writeAf");
		
		System.out.println(bbs.toString());
		toditorService.Toditorwrite(bbs);
		
		
		return "redirect:/editor_essay.do";
	}
	
	@RequestMapping(value="toditor_detail.do", method={RequestMethod.GET, RequestMethod.POST})
	public String toditor_detail(HttpServletRequest req, ToditorBBS bbs,  Model model) throws Exception{
		logger.info("guidebookController >>>> toditor_detail");
		
		bbs = toditorService.ToditorDetail(bbs.getSeq());
		toditorService.updateReadCount(bbs.getSeq());
		model.addAttribute("bbs", bbs);
		
		 List<ToditorCommentDto> commentlist = toditorService.getAllComments(bbs.getSeq());
		 model.addAttribute("commentlist", commentlist);
		int isLiked = 0;
		int like_count = 0;
		
		HttpSession session = req.getSession();
		TravelerDto userInfo = (TravelerDto) session.getAttribute("current_user");
		
		int target_user_seq = userInfo.getSeq();
		
		LikeDto dto = new LikeDto(3, target_user_seq, bbs.getSeq());
		
		isLiked = likeService.prevent_duplication(dto);
		like_count = likeService.getLikeCount(dto);
		
		model.addAttribute("like_count", like_count);
		model.addAttribute("isLiked", isLiked);
		
		return "toditor_detail.tiles";
	}
	
	@ResponseBody
	@RequestMapping(value="addcomment.do",method={RequestMethod.GET, RequestMethod.POST})
	public List<ToditorCommentDto> addcomment(Model model, ToditorCommentDto comment ,HttpServletRequest req) throws Exception{
		logger.info("CommuController >>>> AfterComentAf");
		
		System.out.println("coment" + comment.toString());
		TravelerDto t_dto = (TravelerDto)req.getSession().getAttribute("current_user");
		comment.setTarget_user_seq(t_dto.getSeq());
		
		List<ToditorCommentDto> commList = toditorService.addComment(comment);
		
		return commList;
	}
				
	@RequestMapping(value="toditor_update.do", method={RequestMethod.GET, RequestMethod.POST})
	public String toditor_update(ToditorBBS bbs, Model model) throws Exception{
		logger.info("guidebookController >>>> toditor_update");
		
		bbs = toditorService.ToditorDetail(bbs.getSeq());
		model.addAttribute("bbs", bbs);
		
		return "toditor_update.tiles";
	}
	
	@RequestMapping(value="toditor_updateAf.do", method={RequestMethod.GET, RequestMethod.POST})
	public String toditor_updateAf(ToditorBBS bbs, Model model) throws Exception{
		logger.info("guidebookController >>>> toditor_updateAf");
		
		System.out.println(bbs.toString());
		toditorService.ToditorUpdate(bbs);
		
		
		return "redirect:/editor_essay.do";
	}			
	
	@RequestMapping(value="toditor_delete.do", method={RequestMethod.GET, RequestMethod.POST})
	public String ToditorDelete(ToditorBBS bbs, Model model) throws Exception{
		logger.info("guidebookController >>>> ToditorDelete");
		
		
		toditorService.ToditorDelete(bbs.getSeq());
		
		
		return "redirect:/editor_essay.do";
	}	
}
