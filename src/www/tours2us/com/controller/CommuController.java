package www.tours2us.com.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;


import www.tours2us.com.model.CommuAfterBbsDto;
import www.tours2us.com.model.CommuAfterCommentDto;
import www.tours2us.com.model.CommuFreeBbsDto;
import www.tours2us.com.model.CommuFreeCategoryDto;
import www.tours2us.com.model.CommuFreeCommentDto;
import www.tours2us.com.model.LikeDto;
import www.tours2us.com.model.PlanerDto;
import www.tours2us.com.model.TravelerDto;
import www.tours2us.com.service.CommuCommentService;
import www.tours2us.com.service.CommuService;
import www.tours2us.com.service.LikeService;
import www.tours2us.com.service.PlanerService;
import www.tours2us.com.service.TravelerService;

@Controller
public class CommuController {

	private static final Logger logger = LoggerFactory.getLogger(CommuController.class);

	@Autowired
	CommuService commuService;
	@Autowired
	PlanerService planerService;
	@Autowired
	TravelerService travelerService;
	@Autowired
	CommuCommentService commucommentService;
	@Autowired
	LikeService likeService;

	@RequestMapping(value = "afterBbs.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String afterBbs(Model model, CommuAfterBbsDto afterparam) throws Exception {
		//logger.info("CommuController >>>> afterbbslist");
		int sn = afterparam.getPageNumber();
		int start = (sn) * afterparam.getRecordCountPerPage() + 1;
		int end = (sn + 1) * afterparam.getRecordCountPerPage();

		afterparam.setStart(start);
		afterparam.setEnd(end);
		int totalRecordCount = commuService.AfterGetBbsCount(afterparam);
		List<CommuAfterBbsDto> paging = commuService.AftergetBbsPagingList(afterparam);

		model.addAttribute("afterBbslist", paging);
		model.addAttribute("pageNumber", sn);
		model.addAttribute("pageCountPerScreen", 10);
		model.addAttribute("recordCountPerPage", afterparam.getRecordCountPerPage());
		model.addAttribute("totalRecordCount", totalRecordCount);
		model.addAttribute("s_category", afterparam.getS_category());
		model.addAttribute("s_keyword", afterparam.getS_keyword());

		return "afterBbs.tiles";
	}

	@RequestMapping(value = "afterWrite.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String afterbbswrite(Model model, int seq) {

		PlanerDto planer = planerService.getPlaner(seq);

		model.addAttribute("planer", planer);
		return "afterWrite.tiles";

	}

	@RequestMapping(value = "afterWriteAf.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String afterbbswriteAf(HttpServletRequest req, CommuAfterBbsDto bbs, Model model) throws Exception {
		if (bbs.getContent().equals("") || bbs.getTitle().equals("")) {
			return "afterWrite.tiles";
		}
		//logger.info("CommuController >>>> bbswriteAf");
		TravelerDto t_dto = (TravelerDto) req.getSession().getAttribute("current_user");
		//System.out.println("s" + t_dto.toString());

		bbs.setTarget_user_seq(t_dto.getSeq());
		//System.out.println("b" + bbs.getTarget_user_seq());
		System.out.println(bbs.toString());

		commuService.afterwriteBbs(bbs);
		return "redirect:/afterBbs.do";
	}

	@RequestMapping(value = "afterdetail.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String afterbbsdetail(HttpServletRequest req, int seq, Model model) throws Exception {
		logger.info("CommuController >>>> commuafterdetail");

		CommuAfterBbsDto aftergetBbs = null;
		aftergetBbs = commuService.getAfterBbs(seq);
		List<CommuAfterCommentDto> commentlist = commucommentService.getAllComments(seq);
		commucommentService.afterReadCount(seq);
		int isLiked = 0;
		int like_count = 0;
		HttpSession session = req.getSession();
		TravelerDto userInfo = (TravelerDto) session.getAttribute("current_user");

		int target_user_seq = userInfo.getSeq();

		LikeDto dto = new LikeDto(1, target_user_seq, seq);

		isLiked = likeService.prevent_duplication(dto);
		like_count = likeService.getLikeCount(dto);

		model.addAttribute("like_count", like_count);
		model.addAttribute("isLiked", isLiked);


		model.addAttribute("commentlist", commentlist);
		model.addAttribute("aftergetBbs", aftergetBbs);
		
		PlanerDto planer = planerService.getPlaner(aftergetBbs.getTarget_planer_seq());
		model.addAttribute("planer", planer);
		return "afterdetail.tiles";
	}

	@RequestMapping(value = "afterUpdate.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String afterupdate(Model model, int seq) throws Exception {
		//logger.info("CommuController >>>> afterupdate");
		PlanerDto planer = planerService.getPlaner(seq);
		CommuAfterBbsDto afterbbs = commuService.getAfterBbs(seq);
		model.addAttribute("afterbbs", afterbbs);
		model.addAttribute("planer", planer);

		return "afterUpdate.tiles";
	}

	@RequestMapping(value = "afterUpdateAf.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String updateAf(Model model, CommuAfterBbsDto bbs) throws Exception {
		//logger.info("CommuController >>>> updateAf");
		boolean isS = commuService.AfterUpdate(bbs);
		//logger.info("isS" + isS);
		if (isS) {
			return "redirect:/afterdetail.do?seq=" + bbs.getSeq();
		} else {
			return "redirect:/afterUpdate.do?seq=" + bbs.getSeq();
		}

	}


	// 지우기
	@RequestMapping(value = "afterDelete.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String delete(Model model, int seq) {
		//logger.info("CommuController >>>> updateAf");
		try {
			commuService.Afterdelete(seq);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "redirect:/afterBbs.do";
	}

	@ResponseBody
	@RequestMapping(value="AfterComentAf.do",method={RequestMethod.GET, RequestMethod.POST})
	public List<CommuAfterCommentDto> ComentAf(Model model, CommuAfterCommentDto comment ,HttpServletRequest req) throws Exception{
		//logger.info("CommuController >>>> AfterComentAf");

		TravelerDto t_dto = (TravelerDto)req.getSession().getAttribute("current_user");
		comment.setTarget_user_seq(t_dto.getSeq());

		List<CommuAfterCommentDto> commList = commucommentService.addComment(comment);

		return commList;
	}

	@ResponseBody
	@RequestMapping(value = "AfterComentDelete.do", method = { RequestMethod.GET, RequestMethod.POST })
	public boolean AfterComentDelete(int seq ,HttpServletRequest req , CommuAfterCommentDto comment)throws Exception {
		//logger.info("CommuController >>>> AfterComentDelete");
		TravelerDto t_dto = (TravelerDto) req.getSession().getAttribute("current_user");
		comment.setTarget_user_seq(t_dto.getSeq());

		boolean check = commucommentService.AfterCommentDeleteCheck(seq, t_dto.getSeq());
		//System.out.println("check = " + check);

		//System.out.println("check = " + check);


		if (check) {
			return  commucommentService.AfterCommentDelete(seq);
		}else {
			return false;
		}
	}



	/*-----------------------------------------------------------------------------------------------------------------*/
	//자유게시판
	@RequestMapping(value="freeBbsList.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String freeBbsList(Model model , CommuFreeBbsDto freeparam ) throws Exception{

		int sn = freeparam.getPageNumber();
		int start = (sn) * freeparam.getRecordCountPerPage() + 1;
		int end = (sn + 1) * freeparam.getRecordCountPerPage();
		//System.out.println("start: " + start);
		//System.out.println("end: " + end);
		freeparam.setStart(start);
		freeparam.setEnd(end);
		int totalRecordCount = commuService.FreeBbsGetCount(freeparam);
		List<CommuFreeBbsDto> freelist = commuService.FreeBbsGetPagingList(freeparam);

		//List<CommuFreeBbsDto> freelist = new ArrayList<CommuFreeBbsDto>();
		//freelist = commuService.getFreeBbslist();
		//System.out.println("freelist = " + freelist);
		model.addAttribute("freelist", freelist);
		model.addAttribute("pageNumber", sn);
		model.addAttribute("pageCountPerScreen", 10);
		model.addAttribute("recordCountPerPage", freeparam.getRecordCountPerPage());
		model.addAttribute("totalRecordCount", totalRecordCount);
		model.addAttribute("s_category", freeparam.getS_category());
		model.addAttribute("s_keyword", freeparam.getS_keyword());


		return "freeBbsList.tiles";
	}

	@RequestMapping(value = "freeBbsWrite.do", method = {RequestMethod.GET,	RequestMethod.POST})
	public String freeBbsWrite(Model model)throws Exception {
		//logger.info("CommuController >>>> freeBbsWrite");

		List<CommuFreeCategoryDto> category = commuService.GetFreeBbsCategory();
		model.addAttribute("category", category);

		return "freeBbsWrite.tiles";

	}

	@RequestMapping(value="freeBbsWriteAf.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String freeBbsWriteAf(Model model,CommuFreeBbsDto freewrite ,HttpServletRequest req)throws Exception{
		//logger.info("CommuController >>>> freeBbsWriteAf");

		//System.out.println("dddddd" + freewrite.toString());
		TravelerDto t_dto = (TravelerDto)req.getSession().getAttribute("current_user");
		//System.out.println("s"+t_dto.toString());

		freewrite.setTarget_user_seq(t_dto.getSeq());

		boolean isS = commuService.FreeBbsWrite(freewrite);

		return "redirect:/freeBbsList.do";


	}


	@RequestMapping(value = "freeBbsDetail.do",method = {RequestMethod.GET, RequestMethod.POST})
	public String freeBbsDetail(HttpServletRequest req, int seq,Model model) throws Exception {
		CommuFreeBbsDto commufredetail = commuService.FreeBbsDetail(seq);
		List<CommuFreeCommentDto> commentlist = commucommentService.FreeGetAllComments(seq);
		commucommentService.readCount(seq);
		model.addAttribute("commentlist", commentlist);
		model.addAttribute("commufredetail", commufredetail);

		int isLiked = 0;
		int like_count = 0;
		HttpSession session = req.getSession();
		TravelerDto userInfo = (TravelerDto) session.getAttribute("current_user");

		int target_user_seq = userInfo.getSeq();

		LikeDto dto = new LikeDto(4, target_user_seq, seq);

		isLiked = likeService.prevent_duplication(dto);
		like_count = likeService.getLikeCount(dto);

		model.addAttribute("like_count", like_count);
		model.addAttribute("isLiked", isLiked);



		return"freeBbsDetail.tiles";
	}

	@RequestMapping(value="freeBbsUpdate.do", method={RequestMethod.GET, RequestMethod.POST})
	public String freeBbsUpdate(Model model, int seq) throws Exception {
		//logger.info("CommuController >>>> freeBbsUpdate");
		CommuFreeBbsDto freebbs = commuService.FreeBbsDetail(seq);
		model.addAttribute("freebbs", freebbs);
		return "freeBbsUpdate.tiles";
	}

	@RequestMapping(value="freeBbsUpdateAf.do", method={RequestMethod.GET, RequestMethod.POST})
	public String freeBbsUpdateAf(Model model, CommuFreeBbsDto freebbsupdate) throws Exception{
		//logger.info("CommuController >>>> freeBbsUpdateAf");
		boolean isS = commuService.FreeBbsUpdate(freebbsupdate);
		//logger.info("isS" + isS);
		if(isS) {

			return "redirect:/freeBbsDetail.do?seq=" + freebbsupdate.getSeq();
		}else{

			return "redirect:/freeBbsDetail.do?seq=" + freebbsupdate.getSeq();
		}

	}

	@RequestMapping(value="freeBbsDelete.do", method={RequestMethod.GET, RequestMethod.POST})
	public String freeBbsDelete(Model model, int seq) {
		//logger.info("CommuController >>>> freeBbsDelete");
		try {
			commuService.FreeDelete(seq);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "redirect:/freeBbsList.do";
	}



	@ResponseBody
	@RequestMapping(value="freeBbsComentAf.do",method={RequestMethod.GET, RequestMethod.POST})
	public List<CommuFreeCommentDto> freeBbsComentAf(Model model, CommuFreeCommentDto comment ,HttpServletRequest req) throws Exception{
		//logger.info("CommuController >>>> freeBbsComentAf");

		//System.out.println("coment" + comment.toString());
		TravelerDto t_dto = (TravelerDto)req.getSession().getAttribute("current_user");
		comment.setTarget_user_seq(t_dto.getSeq());

		List<CommuFreeCommentDto> commList = commucommentService.FreeAddComent(comment);

		return commList;
	}

	@ResponseBody
	@RequestMapping(value = "FreeComentDelete.do", method = { RequestMethod.GET, RequestMethod.POST })
	public boolean FreeComentDelete(int seq ,HttpServletRequest req , CommuFreeCommentDto freecomment)throws Exception {
		//logger.info("CommuController >>>> FreeComentDelete");
		//System.out.println("seq" + seq);
		TravelerDto t_dto = (TravelerDto) req.getSession().getAttribute("current_user");
		freecomment.setTarget_user_seq(t_dto.getSeq());

		boolean check = commucommentService.FreeCommentDeleteCheck(seq, t_dto.getSeq());
		//System.out.println("check = " + check);

		//System.out.println("check = " + check);


		if (check) {
			return  commucommentService.FreeCommentDelete(seq);
		}else {
			return false;
		}
	}



}
