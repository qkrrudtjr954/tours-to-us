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
	
	@RequestMapping(value="myplan.do", method= {RequestMethod.GET, RequestMethod.POST})
    public String myplan(HttpServletRequest req, PlanerDto planer, Model model)throws Exception{        
        logger.info("TravelerController >>>> myplan");  
        TravelerDto t_dto = (TravelerDto)req.getSession().getAttribute("current_user");
        //System.out.println(t_dto.getSeq());
        int seq = t_dto.getSeq();
       
        // 플랜 select
        List<PlanerDto> planlist = planerService.getplanList(seq);
        model.addAttribute("planlist", planlist);
        return "myplan.tiles";           
    }

}
