package www.tours2us.com.controller;

import java.util.List;

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
		
		return "toto-guide .tiles";
	}
	
}
