package www.tours2us.com.controller;

import java.util.Comparator;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import www.tours2us.com.model.DayPlanerDto;
import www.tours2us.com.model.PlanerDto;
import www.tours2us.com.model.TimePlanerDto;
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
		logger.info("UserGuideController >>>> guideSearch");
		
		return null;
	}

	@RequestMapping(value="guideDetail.do", method={RequestMethod.GET, RequestMethod.POST})
	public String guideDetail(int seq, Model model) {
		logger.info("UserGuideController >>>> guideDetail");
		
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
		
		return "user_guide_detail.tiles";
	}
	
	@RequestMapping(value = "guideDetailAll.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String guideDetailAll(HttpServletRequest req, int seq, Model model) throws Exception {
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
		
		return "user_guide_detailAll.tiles";
	}

}









