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

import www.tours2us.com.model.PlanerDto;
import www.tours2us.com.model.TravelerDto;
import www.tours2us.com.service.PlanerService;
import www.tours2us.com.service.UserGuideService;

@Controller
public class UserGuideController {
	private static final Logger logger = LoggerFactory.getLogger(guidebookController.class);
	
	@Autowired
	PlanerService planerService;
	
	@Autowired
	UserGuideService userGuideService;
	
	// 투둥이 가이드북
	@RequestMapping(value="user_guide.do", method={RequestMethod.GET, RequestMethod.POST})
	public String user_guide(HttpServletRequest req, Model model) {
		logger.info("UserGuideController >>>> user_guide");
		
		List<PlanerDto> planlist = userGuideService.getUserPlanList();
		System.out.println(planlist);
		model.addAttribute("planlist", planlist);
		
		return "user_guide.tiles";
	}
	
	@RequestMapping(value="guideSearch.do", method={RequestMethod.GET, RequestMethod.POST})
	public String guideSearch(Model model, String Searchtype, String SearchWord) {
		
		return null;
	}


}









