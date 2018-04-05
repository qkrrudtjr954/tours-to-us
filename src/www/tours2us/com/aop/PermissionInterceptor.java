package www.tours2us.com.aop;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import www.tours2us.com.model.CoTravelerDto;
import www.tours2us.com.model.TravelerDto;
import www.tours2us.com.service.TravelerService;

public class PermissionInterceptor extends HandlerInterceptorAdapter {
	
	@Autowired
	TravelerService travelerService;
	
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		boolean result = false;
		String webRoot = request.getContextPath();

		try {
			TravelerDto current_user = (TravelerDto) request.getSession().getAttribute("current_user");
			int seq = (request.getParameter("seq") == "") ? 0 : Integer.parseInt(request.getParameter("seq"));
			CoTravelerDto coTraveler = new CoTravelerDto(current_user.getSeq(), seq, current_user.getName());
			
			System.out.println(travelerService.checkCoTraveler(coTraveler));
			
			if (current_user == null || current_user.getEmail().equals("")) {
				if (isAjaxRequest(request)) {
					response.sendError(400);
					return false;
				} else {
					response.sendRedirect(webRoot + "/signin.do");
					result = false;
				}
			} else if(seq == 0) {
				if (isAjaxRequest(request)) {
					response.sendError(400);
					return false;
				} else {
					response.sendRedirect(webRoot + "/myplan.do");
					result = false;
				}
			} else if(!travelerService.checkCoTraveler(coTraveler)){
				if (isAjaxRequest(request)) {
					response.sendError(400);
					return false;
				} else {
					response.sendRedirect(webRoot + "/myplan.do");
					result = false;
				}
			} else {
				result = true;				
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
			return false;
		}
		return result;
	}

	private boolean isAjaxRequest(HttpServletRequest req) {
		String header = req.getHeader("AJAX");
		if ("true".equals(header)) {
			return true;
		} else {
			return false;
		}
	}
}
