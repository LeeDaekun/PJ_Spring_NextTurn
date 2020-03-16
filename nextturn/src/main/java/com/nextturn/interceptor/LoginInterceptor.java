/*
 * Login 이 필요한 기능 수행시
 * Session 체크를 하는 Interceptor
 * 
 * 
 * 
 * */

package com.nextturn.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.FlashMap;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.servlet.support.RequestContextUtils;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class LoginInterceptor extends HandlerInterceptorAdapter{
	
	// URL 전을 처리하는 프리 핸들러
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		System.out.println("log.info 고장나서, 인터페이스 sysout 로 접속됨");
		log.info("sysout 인터페이스");
		
	// Session 객체 생성
		HttpSession session = request.getSession();

		String referer = request.getHeader("referer");
		log.info("인터셉터★★★★ 이전 url : " + referer);
		
		
	// Login NO==============================================================
		if(session.getAttribute("userid") == null) { 
			log.info("인터셉터>>>>> NOLOGIN:(");
			System.out.println("노 로그인!!!   log.info 고장나서, 인터페이스 sysout 로 접속됨");
			
			FlashMap fMap = RequestContextUtils.getOutputFlashMap(request);  //FlashMap 은 1회성으로 보내는것
			fMap.put("message", "nologin");
			
			
			// URL로 바로 접근한 경우(referer이 없는 경우) 인덱스로
			if(referer == null) {
				referer = "http://localhost:8081/nextturn/";
			}
			
			RequestContextUtils.saveOutputFlashMap(referer, request, response);
			response.sendRedirect(referer);
			
			
			
			//URL만 신경쓰고, GET or POST 는 중요하지 않음
			//회원수정페이지를 보낸다고 하면:  GET:/member/update
			//회원수정DB을 한다고 하면       : POST:/member/update
			
			//보낼때 request(GET,POST)  >  받을때 response(forward,sendRedirect)
			
			return false; // 이동X
			
	// Login OK ==============================================================
		} else { 
			log.info("인터셉터>>>>> LOGIN:)");
			return true; //이동 O  원래 처리하던것을 처리할 수 있음. 인터셉터 동작안함?
		}

	}//메서드

	/*
	 * @Override public void postHandle(HttpServletRequest request,
	 * HttpServletResponse response, Object handler, ModelAndView modelAndView)
	 * throws Exception { // TODO Auto-generated method stub
	 * super.postHandle(request, response, handler, modelAndView); }
	 */

}//class
