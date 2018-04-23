package www.tours2us.com.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
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
import www.tours2us.com.model.TotoGuideDto;
import www.tours2us.com.service.PlanerService;
import www.tours2us.com.service.TotoGuideService;

@Controller
public class TotoGuideController {
	private static final Logger logger = LoggerFactory.getLogger(TotoGuideController.class);
	
	@Autowired
	TotoGuideService totoGuideService;
	
	@Autowired
	PlanerService planerService;
	
	@RequestMapping(value="toto_guide.do", method={RequestMethod.GET, RequestMethod.POST})
	public String toto_guide(Model model)throws Exception {
		logger.info("TotoGuideController >>>> toto_guide");
		
		List<TotoGuideDto> list = totoGuideService.getTotoList();
		//String totalDowncount = totoGuideService.getTotalDownCount();
		model.addAttribute("totolist", list);
		//model.addAttribute("totalDowncount", totalDowncount);
		System.out.println(list);
		
		return "toto_guide.tiles";
	}
	
	@RequestMapping(value="toto_detail.do", method={RequestMethod.GET, RequestMethod.POST})
	public String toto_detail(int seq, Model model)throws Exception{
		logger.info("TotoGuideController >>>> toto_detail");
		
		System.out.println(""+seq);
		TotoGuideDto toto = totoGuideService.getTotoDetail(seq);
		totoGuideService.readCount(seq);
		model.addAttribute("toto", toto);
				
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
		System.out.println(totodto.toString());		
		System.out.println(fileload);
		
		// upload -MultipartResolver spring에 추가
		totodto.setFilename(fileload.getOriginalFilename());
		
		// 서버저장
		//String fupload = req.getServletContext().getRealPath("/upload");
		//System.out.println("fup"+fupload);
		
		// 폴더저장
		String fupload = "c:\\test";
		
		String f = totodto.getFilename();
		// 이름변경
		//String newFile = FUpUtil.getNewFile(f);
		totodto.setFilename(f);
		System.out.println(fupload+"\\"+f);
		
		try {
			File file = new File(fupload+"/"+f);
			FileUtils.writeByteArrayToFile(file, fileload.getBytes());
			
			// db insert
			totoGuideService.totoUpload(totodto);
		
			System.out.println("upload success");
		} catch (IOException e) {
			System.out.println("upload fail");
		}
		
		
		return "redirect:/toto_guide.do";
	}
	
	@RequestMapping(value="toto_download.do", method={RequestMethod.GET, RequestMethod.POST})
	public String toto_download(int seq, String filename, HttpServletRequest req, Model model)throws Exception{
		logger.info("TotoGuideController >>>> toto_download");
		
		System.out.println("s:"+seq+"f:"+filename);
		
		// 서버저장
		//String fupload = req.getServletContext().getRealPath("/upload");
		
		// 폴더저장
		String fupload = "c:\\test";
		File downloadFile = new File(fupload+"/"+filename);
		model.addAttribute("downloadFile", downloadFile);
		model.addAttribute("seq", seq);
		boolean isS = totoGuideService.downCount(seq);
		
		if(isS) {
			System.out.println("downloadview"+seq);
		}else {
			System.out.println("error"+seq);
		}
		
		System.out.println(downloadFile);
		
		return "downloadView";
	}
	
	@ResponseBody
	@RequestMapping(value="toto_search.do", method={RequestMethod.GET, RequestMethod.POST})
	public List<TotoGuideDto> toto_search(Model model, String location)throws Exception {
		logger.info("TotoGuideController >>>> toto_search");
		
		System.out.println("l:"+location);
		List<TotoGuideDto> totolist = totoGuideService.totoSearch(location);
		System.out.println(totolist);
		return totolist;
	}
}
