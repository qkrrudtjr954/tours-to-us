package www.tours2us.com.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.apache.tools.ant.taskdefs.condition.Http;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;


import www.tours2us.com.model.Korea;
import www.tours2us.com.model.LikeDto;
import www.tours2us.com.model.ToditorCommentDto;
import www.tours2us.com.model.TotoGuideDto;
import www.tours2us.com.model.TravelerDto;
import www.tours2us.com.service.LikeService;
import www.tours2us.com.service.PlanerService;
import www.tours2us.com.service.TotoGuideService;

@Controller
public class TotoGuideController {
	private static final Logger logger = LoggerFactory.getLogger(TotoGuideController.class);
	
	@Autowired
	TotoGuideService totoGuideService;
	
	@Autowired
	PlanerService planerService;
	
	@Autowired
	LikeService likeService;
	
	@RequestMapping(value="toto_guide.do", method={RequestMethod.GET, RequestMethod.POST})
	public String toto_guide(Model model, String fromMain)throws Exception {
		logger.info("TotoGuideController >>>> toto_guide");
		List<TotoGuideDto> list = null;
		
		if(fromMain==null || fromMain.equals("")) {
			list = totoGuideService.getTotoList();			
		} else {
			list = totoGuideService.totoSearch(fromMain);
		}
		model.addAttribute("totolist", list);
		
		return "toto_guide.tiles";
	}
	
	@RequestMapping(value="toto_detail.do", method={RequestMethod.GET, RequestMethod.POST})
	public String toto_detail(HttpServletRequest req, int seq, Model model)throws Exception{
		logger.info("TotoGuideController >>>> toto_detail");
		
		TotoGuideDto toto = totoGuideService.getTotoDetail(seq);
		totoGuideService.readCount(seq);
		model.addAttribute("toto", toto);
		
		
		int isLiked = 0;
		int like_count = 0;
		
		HttpSession session = req.getSession();
		TravelerDto userInfo = (TravelerDto) session.getAttribute("current_user");
		
		int target_user_seq = userInfo.getSeq();
		
		LikeDto dto = new LikeDto(5, target_user_seq, seq);
		
		isLiked = likeService.prevent_duplication(dto);
		like_count = likeService.getLikeCount(dto);
		
		model.addAttribute("like_count", like_count);
		model.addAttribute("isLiked", isLiked);
		
				
		return "toto_guide_detail.tiles";
	}
	
	@RequestMapping(value="toto_write.do", method={RequestMethod.GET, RequestMethod.POST})
	public String toto_write(Model model)throws Exception {
		logger.info("TotoGuideController >>>> toto_write");
		
		List<Korea> korea = planerService.getKoreaList();
		model.addAttribute("korea", korea);
		
		return "toto_write.tiles";
	}
	
	@RequestMapping(value="toto_upload.do", method=RequestMethod.POST)
	public String toto_upload(Model model, TotoGuideDto totodto, HttpServletRequest req, @RequestParam(value="fileload", required=false)MultipartFile fileload){
		logger.info("TotoGuideController >>>> toto_upload");
		
		// upload -MultipartResolver spring에 추가
		totodto.setFilename(fileload.getOriginalFilename());
		
		// 폴더저장
		String fupload = "c:\\test";
		
		String f = totodto.getFilename();
		// 이름변경
		//String newFile = FUpUtil.getNewFile(f);
		totodto.setFilename(f);
		
		try {
			File file = new File(fupload+"/"+f);
			FileUtils.writeByteArrayToFile(file, fileload.getBytes());
			
			// db insert
			totoGuideService.totoUpload(totodto);
		
		} catch (IOException e) {
			System.out.println("upload fail");
		}
		
		
		return "redirect:/toto_guide.do";
	}
	
	@ResponseBody
	@RequestMapping(value="downCount.do", method=RequestMethod.POST)
	public boolean toto_download(@RequestParam("seq") int seq) throws Exception{
		logger.info("TotoGuideController >>>> toto_download");
		return totoGuideService.downCount(seq);
	}
	
	@ResponseBody
	@RequestMapping(value="toto_search.do", method={RequestMethod.GET, RequestMethod.POST})
	public List<TotoGuideDto> toto_search(Model model, String location)throws Exception {
		logger.info("TotoGuideController >>>> toto_search");
		
		List<TotoGuideDto> totolist = totoGuideService.totoSearch(location);
		return totolist;
	}
}
