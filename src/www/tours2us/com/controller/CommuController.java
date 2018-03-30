package www.tours2us.com.controller;

import java.util.ArrayList;
import java.util.Date;
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


import www.tours2us.com.model.CommuAfterBbsDto;
import www.tours2us.com.model.PlanerDto;
import www.tours2us.com.model.TravelerDto;
import www.tours2us.com.service.CommuService;
import www.tours2us.com.service.PlanerService;



@Controller
public class CommuController {
private static final Logger logger = LoggerFactory.getLogger(CommuController.class);

@Autowired
CommuService commuService;
@Autowired
PlanerService planerService;

@RequestMapping(value="afterBbs.do",
method= {RequestMethod.GET, RequestMethod.POST})
public String afterBbs(Model model) throws Exception{

	logger.info("CommuController >>>> afterbbslist");
	List<CommuAfterBbsDto> list = new ArrayList<CommuAfterBbsDto>();
	list = commuService.getAfterBbslist();
	model.addAttribute("afterBbslist", list);


	return "afterBbs.tiles";

}

@RequestMapping(value = "afterWrite.do", method = {RequestMethod.GET,	RequestMethod.POST})
public String afterbbswrite(Model model, int seq) {
	logger.info("CommuController >>>> afterWrite");
	System.out.println("ss:"+seq);
	
	PlanerDto planer = planerService.getPlaner(seq);

	model.addAttribute("planer", planer);
return "afterWrite.tiles";

}


@RequestMapping(value = "afterWriteAf.do",
method = RequestMethod.GET)
public String afterbbswriteAf(HttpServletRequest req, CommuAfterBbsDto bbs, Model model) throws Exception {
   if(bbs.getContent().equals("") || bbs.getTitle().equals("")){
      return "afterWrite.tiles";
   }
   logger.info("CommuController >>>> bbswriteAf");
   TravelerDto t_dto = (TravelerDto)req.getSession().getAttribute("current_user");
    System.out.println("s"+t_dto.toString());

    bbs.setTarget_user_seq(t_dto.getSeq());
    System.out.println("b"+bbs.getTarget_user_seq());
    System.out.println(bbs.toString());

   commuService.afterwriteBbs(bbs);
   return "redirect:/afterBbs.do";
}


@RequestMapping(value = "afterdetail.do", 
method = {RequestMethod.GET, RequestMethod.POST})
public String afterbbsdetail(int seq,Model model) throws Exception {
	 logger.info("CommuController >>>> commuafterdetail");
	 
	 CommuAfterBbsDto aftergetBbs=null;
	 aftergetBbs = commuService.getAfterBbs(seq);
	 model.addAttribute("aftergetBbs", aftergetBbs);
	 
	return "afterdetail.tiles";
}










}
