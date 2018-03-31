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

import www.tours2us.com.model.CoTravelerDto;
import www.tours2us.com.model.DayPlanerDto;
import www.tours2us.com.model.PlanerDto;
import www.tours2us.com.model.TimePlanerDto;
import www.tours2us.com.model.TravelerDto;
import www.tours2us.com.service.PlanerService;
import www.tours2us.com.service.TravelerService;

@Controller
public class PlanerController {

	Logger logger = LoggerFactory.getLogger(PlanerController.class);

	@Autowired
	PlanerService planerService;
	
	@Autowired
	TravelerService travelerService;

	@RequestMapping(value = "planer.do", method = RequestMethod.GET)
	public String planer(Model model, HttpServletRequest req) {

		logger.info("PlanerController >>>> planer");

		return "planer.tiles";
	}

	@ResponseBody
	@RequestMapping(value = "addPlaner.do", method = RequestMethod.POST)
	public PlanerDto addPalenr(PlanerDto planer, HttpServletRequest req) {

		logger.info("param planerdto : {}", planer);

		HttpSession session = req.getSession();
		TravelerDto current_user = (TravelerDto) session.getAttribute("current_user");
		planer.setTarget_user_seq(current_user.getSeq());

		// add planer
		planer = planerService.addPlaner(planer);

		logger.info("return planerdto : {}", planer);

		return planer;
	}

	@RequestMapping(value = "addFriends.do", method = RequestMethod.GET)
	public String addFriends(Model model, int seq, HttpServletRequest req) {

		logger.info("param planerdto : {}", seq);

		PlanerDto planer = planerService.getPlaner(seq);
		List<TravelerDto> coTraveler = travelerService.getCoTravelers(seq);

		model.addAttribute("planer", planer);
		model.addAttribute("coTraveler", coTraveler);

		return "addFriends.tiles";
	}
	
	@RequestMapping(value="dayPlaner.do", method=RequestMethod.GET)
	public String dayPlaner(Model model, int seq) {
		
		//	planer 를 가져온다.
		PlanerDto planer = planerService.getPlaner(seq);
		
		//	coTraveler 를 가져온다.
		List<TravelerDto> coTraveler = travelerService.getCoTravelers(seq);
		
		model.addAttribute("planer", planer);
		model.addAttribute("coTraveler", coTraveler);
		
		return "dayPlaner.tiles";
	}
	
	@ResponseBody
	@RequestMapping(value="getDayPlaner.do", method=RequestMethod.GET)
	public DayPlanerDto getDayPlaner(Model model, DayPlanerDto dayPlaner) {
		//	dayplaner를 가져온다.
		logger.info("PlanerContoller >>>>> getDayPlaner : {}", dayPlaner);
		
		PlanerDto planer = planerService.getPlaner(dayPlaner.getTarget_planer_seq());
		
		
		logger.info("{}  <  {}", planer.getRange(), dayPlaner.getDay_count());
		
		if(planer.getRange() < dayPlaner.getDay_count()) {
			dayPlaner.setDay_count(planer.getRange());
		} else if(dayPlaner.getDay_count() < 1) {
			dayPlaner.setDay_count(1);
		}
		
		DayPlanerDto returnDayPlaner = new DayPlanerDto();
		
		//	target_planer_seq, day_count를 이용해 dayPlaner를 가져온다.
		returnDayPlaner = planerService.getDayPlanerByTargetPlanerSeqAndDayCount(dayPlaner);
		logger.info("PlanerContoller >>>>> after getDayPlanerByTargetPlanerSeqAndDayCount : {}", returnDayPlaner);
		
		if(returnDayPlaner == null) {
			returnDayPlaner = planerService.addDayPlaner(dayPlaner);
			logger.info("PlanerContoller >>>>> after addDayPlaner : {}", returnDayPlaner);
		}			
		
		return returnDayPlaner;
	}
	

	@RequestMapping(value = "myplan.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String myplan(HttpServletRequest req, PlanerDto planer, Model model) throws Exception {
		logger.info("PlanerContoller >>>> myplan");
		TravelerDto t_dto = (TravelerDto) req.getSession().getAttribute("current_user");
		// System.out.println(t_dto.getSeq());
		int seq = t_dto.getSeq();

		// 플랜 select
		List<PlanerDto> planlist = planerService.getplanList(seq);
		model.addAttribute("planlist", planlist);
		return "myplan.tiles";
	}
	
	@ResponseBody
	@RequestMapping(value="getTimePlaners.do", method=RequestMethod.GET)
	public List<TimePlanerDto> getTimePlaners(DayPlanerDto dayPlaner) {
		
		logger.info("PlanerContoller >>>>>> getTimePlaners : {}", dayPlaner);
		List<TimePlanerDto> timePlaners = planerService.getAllTimePlanersByTargetDayPlanerSeq(dayPlaner.getSeq()); 
		return timePlaners;
		
		
	}
	@ResponseBody
	@RequestMapping(value="addTimePlaner.do", method=RequestMethod.POST)
	public TimePlanerDto addTimePlaner(TimePlanerDto timePlaner) {
		
		logger.info("PlanerContoller >>>>>> addTimePlaner : {}", timePlaner);
		
		//	add time planer
		TimePlanerDto addedTimePlaner = planerService.addTimePlaner(timePlaner);

		return addedTimePlaner;
	}
	
	@RequestMapping(value = "planDetail.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String planDetail(HttpServletRequest req, int seq, Model model) throws Exception {
		logger.info("PlanerContoller >>>> planDetail");
		//System.out.println("pseq:"+seq);
		
		PlanerDto planer = planerService.getPlaner(seq);
		List<DayPlanerDto> dayPlanlist = planerService.getDayplanList(seq);
		
		int d_seq = 0;
		List<TimePlanerDto> timeplanlist = new ArrayList<TimePlanerDto>();
		for (int j = 0; j < dayPlanlist.size(); j++) {
			d_seq = dayPlanlist.get(j).getTarget_planer_seq();
			timeplanlist = planerService.getAllTimePlanersByTargetDayPlanerSeq(d_seq);
			System.out.println("["+j+"]="+timeplanlist);
		}		
		model.addAttribute("planer",planer);
		model.addAttribute("dayPlanlist", dayPlanlist);
		model.addAttribute("timePlanlist", timeplanlist);
		
		return "planDetail.tiles";
	}
	

	@RequestMapping(value = "changeTitle.do", method = { RequestMethod.GET, RequestMethod.POST })
	public PlanerDto changeTitle(Model model, PlanerDto planer)throws Exception {
		logger.info("PlanerController >>>> changeTitle");
		System.out.println(planer.toString());
		PlanerDto dto = null;
		int seq = planer.getSeq();
		System.out.println(""+seq);
		boolean isS = planerService.changeTitle(planer);
		System.out.println(isS);
		if(isS) {
			dto = planerService.getPlaner(seq);
			return dto;
		}else {
			return dto;
		}
	}

}
