package www.tours2us.com.controller;

import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import www.tours2us.com.model.LikeDto;
import www.tours2us.com.model.ToditorBBS;
import www.tours2us.com.service.LikeService;

@Controller
public class LikeController {
	
	private static final Logger logger = LoggerFactory.getLogger(LikeController.class);
	
	@Autowired
	LikeService likeService;
	
	@ResponseBody
	@RequestMapping(value="likebtn_click.do", method={RequestMethod.GET, RequestMethod.POST})
	public String toditor_detail(LikeDto dto, Model model) throws Exception{
		logger.info("LikeController >>>> likebtn_click");
		
		// 글의 seq (target_bbs_seq), 게시판 카테고리(bbs_category), 현재 유저(current_user)
		
		int like_count = 0;
		HashMap<String, Integer> status = new HashMap<>();
		
		int check=0;
		check = likeService.prevent_duplication(dto);
		if (check ==  1) {
			// 테이블에서 해당 행을 삭제( 추가) 한다.
			likeService.delete_like(dto);
			

			// status, like count 를 json으로 전송한다.
			status.put("status", 404);
		} else {
			// 테이블에서 해당 행을 삭제( 추가) 한다.
			likeService.insert_like(dto);

			// status, like count 를 json으로 전송한다.
			status.put("status", 200);
		}

		// 테이블을 게시글 seq 로 count(*)
		like_count = likeService.getLikeCount(dto);
		status.put("like_count", like_count);
		String json = new Gson().toJson(status);

		return json;
	}
}
