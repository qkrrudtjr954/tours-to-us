package www.tours2us.com.controller;

import java.util.Comparator;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import www.tours2us.com.model.DayPlanerDto;
import www.tours2us.com.model.Korea;
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
		List<Korea> korea = planerService.getKoreaList();
		model.addAttribute("korea", korea);
		
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

	@RequestMapping(value="completePlaner.do", method=RequestMethod.POST)
	public String completePlaner(Model model, PlanerDto planer) {
		//	status 0 is ing, 1 is complete, 2 is complete secret, 3 and 4 is delete 
		logger.info("PlanerContoller >>>>> completePlaner : {}", planer);
		planerService.updateCompletePlaner(planer);
		
		return "redirect:myplan.do";
	}
	

	@RequestMapping(value = "myplan.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String myplan(HttpServletRequest req, Model model) throws Exception {
		logger.info("PlanerContoller >>>> myplan");
		
		TravelerDto t_dto = (TravelerDto) req.getSession().getAttribute("current_user");
		int seq = t_dto.getSeq();

		// 플랜 select
		List<PlanerDto> planlist = planerService.getplanList(seq);
		System.out.println(planlist);
		
		model.addAttribute("seq", seq);
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
	public TimePlanerDto addTimePlaner(String s_target_dayplaner_seq, String start_time, String end_time, String location, String s_expected_cost, String transportation, String types, String content) {
		TimePlanerDto paramTimePlaner = new TimePlanerDto();
		
		if(s_target_dayplaner_seq==null || start_time==null || end_time==null || location==null || transportation==null || types==null || content==null) {
			//	incorrect value
			paramTimePlaner.setSeq(-10);
			return paramTimePlaner;
		}else {
			if(s_target_dayplaner_seq.equals("") || start_time.equals("") || end_time.equals("") || location.equals("") || transportation.equals("") || types.equals("") || content.equals("")) {
				paramTimePlaner.setSeq(-10);
				return paramTimePlaner;
			} else {
				int expected_cost = (s_expected_cost.trim().equals("")) ? 0 : Integer.parseInt(s_expected_cost);

				paramTimePlaner.setContent(content);
				paramTimePlaner.setEnd_time(end_time);
				paramTimePlaner.setExpected_cost(expected_cost);
				paramTimePlaner.setLocation(location);
				paramTimePlaner.setStart_time(start_time);
				paramTimePlaner.setTarget_dayplaner_seq(Integer.parseInt(s_target_dayplaner_seq));
				paramTimePlaner.setTransportation(transportation);
				paramTimePlaner.setTypes(types);
				
				//	add time planer
				TimePlanerDto addedTimePlaner = planerService.addTimePlaner(paramTimePlaner);
				logger.info("PlanerContoller >>>>>> addedTimePlaner : {}", addedTimePlaner);

				return addedTimePlaner;
			}
		}
	}

	@ResponseBody
	@RequestMapping(value = "deleteTimePlaner.do", method = RequestMethod.POST)
	public boolean deleteTimePlaner(@RequestParam("seq") int seq, @RequestParam("target_dayplaner_seq") int target_dayplaner_seq) throws Exception {
		logger.info("PlanerController >>>> deleteTimePlaner");
		return planerService.deleteTimePlaner(seq, target_dayplaner_seq);
	}
	
	@RequestMapping(value = "planDetail.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String planDetail(HttpServletRequest req, int seq, Model model) throws Exception {
		logger.info("PlanerContoller >>>> planDetail");
		System.out.println("planerseq:"+seq);
		
		PlanerDto planer = planerService.getPlaner(seq);
		
		List<DayPlanerDto> dayPlanlist = planerService.getDayplanList(seq);
		Map<DayPlanerDto, List<TimePlanerDto>> planMap = new TreeMap<>(new Comparator<DayPlanerDto>() {
			@Override
			public int compare(DayPlanerDto o1, DayPlanerDto o2) {
				// TODO Auto-generated method stub
				return (o1.getDay_count() - o2.getDay_count());
			}
		});
		
		for(DayPlanerDto dayPlan : dayPlanlist) {
			planMap.put(dayPlan, planerService.getAllTimePlanersByTargetDayPlanerSeq(dayPlan.getSeq()));
		}
	
		model.addAttribute("planer",planer);
		model.addAttribute("planerMap", planMap);
		
		return "planDetail.tiles";
	}
	
	@RequestMapping(value = "planDetailAll.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String planDetailAll(HttpServletRequest req, int seq, Model model) throws Exception {
		logger.info("PlanerContoller >>>> planDetailAll");
		System.out.println("planerseq:"+seq);
		
		PlanerDto planer = planerService.getPlaner(seq);
		
		List<DayPlanerDto> dayPlanlist = planerService.getDayplanList(seq);
		Map<DayPlanerDto, List<TimePlanerDto>> planMap = new TreeMap<>(new Comparator<DayPlanerDto>() {
			@Override
			public int compare(DayPlanerDto o1, DayPlanerDto o2) {
				// TODO Auto-generated method stub
				return (o1.getDay_count() - o2.getDay_count());
			}
		});
		
		for(DayPlanerDto dayPlan : dayPlanlist) {
			planMap.put(dayPlan, planerService.getAllTimePlanersByTargetDayPlanerSeq(dayPlan.getSeq()));
			System.out.println(planerService.getAllTimePlanersByTargetDayPlanerSeq(dayPlan.getSeq()));
		}
	
		model.addAttribute("planer",planer);
		model.addAttribute("planerMap", planMap);
		
		return "planDetailAll.tiles";
	}
	
	@ResponseBody
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


	
	@RequestMapping(value = "planDelete.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String planDelete(int seq, Model model)throws Exception{
		logger.info("PlanerController >>>> changeTitle");
		
		boolean isS = planerService.planDelete(seq);
		
		if(isS) {
			return "redirect:/myplan.do";			
		}else {
			return "redirect:/myplan.do";
		}
		
	}
}
