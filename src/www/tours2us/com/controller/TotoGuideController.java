package www.tours2us.com.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import www.tours2us.com.model.TotoGuideDto;
import www.tours2us.com.service.TotoGuideService;

@Controller
public class TotoGuideController {
	private static final Logger logger = LoggerFactory.getLogger(TotoGuideController.class);
	@Autowired
	TotoGuideService totoGuideService;
	
	@RequestMapping(value="toto_guide.do", method={RequestMethod.GET, RequestMethod.POST})
	public String toto_guide(Model model)throws Exception {
		logger.info("TotoGuideController >>>> toto_guide");
		
		List<TotoGuideDto> list = totoGuideService.getTotoList();
		model.addAttribute("totolist", list);
		System.out.println(list);
		
		return "toto_guide.tiles";
	}
	
	@RequestMapping(value="toto_detail.do", method={RequestMethod.GET, RequestMethod.POST})
	public String toto_detail(int seq, Model model)throws Exception{
		logger.info("TotoGuideController >>>> toto_detail");
		
		System.out.println(""+seq);
		TotoGuideDto toto = totoGuideService.getTotoDetail(seq);
		
		model.addAttribute("toto", toto);
				
		return "toto_guide_detail.tiles";
	}
	
	@RequestMapping(value="toto_download.do", method={RequestMethod.GET, RequestMethod.POST})
	public String toto_download(int seq, String filename, HttpServletRequest req, Model model)throws Exception{
		logger.info("TotoGuideController >>>> toto_download");
		
		System.out.println(""+seq);
		System.out.println(filename);
		
		
		return "downloadView";
	}
}
