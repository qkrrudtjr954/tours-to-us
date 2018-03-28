package www.tours2us.com.controller;

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

import www.tours2us.com.model.CoTravelerDto;
import www.tours2us.com.model.PlanerDto;
import www.tours2us.com.model.TravelerDto;
import www.tours2us.com.service.PlanerService;

@Controller
public class PlanerController {
	
	Logger logger = LoggerFactory.getLogger(PlanerController.class);
	
	@Autowired
	PlanerService planerService;
	
	@RequestMapping(value="planer.do", method=RequestMethod.GET)
	public String planer(Model model, HttpServletRequest req) {
		
		//		테스트용 유저
		HttpSession session = req.getSession();
		TravelerDto current_user = new TravelerDto(1, "a@a.a", "a", "a", "2018-03-03", "2018-03-03", 0);
		session.setAttribute("current_user", current_user);
		
		//	테스트용 유
		
		logger.info("PlanerController >>>> planer");
		
		return "planer.tiles";
	}
	
	@ResponseBody
	@RequestMapping(value="addPlaner.do", method=RequestMethod.POST)
	public PlanerDto addPalenr(PlanerDto planer, HttpServletRequest req) {
		
		logger.info("param planerdto : {}", planer);
		
		
		
		HttpSession session = req.getSession();
		TravelerDto current_user = (TravelerDto)session.getAttribute("current_user");
		planer.setTarget_user_seq(current_user.getSeq());
		
		// add planer
		planer = planerService.addPlaner(planer);
		
		logger.info("return planerdto : {}", planer);
		
		return planer;
	}
	
	@RequestMapping(value="planer2.do", method=RequestMethod.POST)
	public String planer2(int seq, HttpServletRequest req) {
		
		logger.info("param planerdto : {}", seq);
		
		PlanerDto planer = planerService.getPlaner(seq);
		List<TravelerDto> coTraveler = planerService.getCoTraveler(seq);
		
		return "planer2.tiles";
	}
	
}
