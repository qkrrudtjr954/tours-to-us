package www.tours2us.com.controller;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import www.tours2us.com.model.PagingVo;
import www.tours2us.com.model.ToditorBBS;
import www.tours2us.com.model.ToditorCategoryDto;
import www.tours2us.com.service.ToditorService;

@Controller
public class guidebookController {
	private static final Logger logger = LoggerFactory.getLogger(guidebookController.class);
	
	@Autowired
	ToditorService toditorService;
	
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
	public String toditor_detail(ToditorBBS bbs, Model model) throws Exception{
		logger.info("guidebookController >>>> toditor_detail");
		
		bbs = toditorService.ToditorDetail(bbs.getSeq());
		model.addAttribute("bbs", bbs);
		
		return "toditor_detail.tiles";
	}
	
	
}
