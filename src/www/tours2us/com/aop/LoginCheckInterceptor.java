package www.tours2us.com.aop;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import www.tours2us.com.model.TravelerDto;

public class LoginCheckInterceptor extends HandlerInterceptorAdapter {
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		boolean result = false;
		String webRoot = request.getContextPath();

		try {
			TravelerDto current_user = (TravelerDto) request.getSession().getAttribute("current_user");
			if (current_user == null || current_user.getEmail().equals("")) {
				if (isAjaxRequest(request)) {
					
					response.sendError(400);
					return false;
					
				} else {
					
					response.sendRedirect(webRoot + "/signin.do");
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
