package www.tours2us.com.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import www.tours2us.com.model.CommuAfterBbsDto;
import www.tours2us.com.model.PlanerDto;
import www.tours2us.com.model.ToditorBBS;
import www.tours2us.com.model.TotoGuideDto;
import www.tours2us.com.service.CommuService;
import www.tours2us.com.service.PlanerService;
import www.tours2us.com.service.ToditorService;
import www.tours2us.com.service.TotoGuideService;

@Controller
public class MainController {
	
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	@Autowired
	ToditorService toditorService;
	
	@Autowired
	CommuService commuService;
	
	@Autowired
	PlanerService planerService;
	
	@Autowired
	TotoGuideService totoGuideService;
	
	@RequestMapping(value="main.do", method=RequestMethod.GET)
	public String home(Model model) throws Exception {
		
		logger.info("access");
		
		List<ToditorBBS> b1list = toditorService.best123();	
		model.addAttribute("b1list", b1list);
		
		List<CommuAfterBbsDto> commulist = commuService.bestAfter();
		model.addAttribute("commulist", commulist);
		
		List<PlanerDto> planlist = planerService.getBestPlan();
		model.addAttribute("planlist", planlist);
		
		List<TotoGuideDto> totolist = totoGuideService.bestToToguide();
		model.addAttribute("totolist", totolist);
		
		String downcount = totoGuideService.getTotalDownCount();
		model.addAttribute("downcount", downcount);
		
		return "main.tiles";
	}

	
}
