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
		log.info("인터셉터 실행중");
		System.out.println("log.info 고장나서, 인터페이스 sysout 로 접속됨");
		log.info("sysout 인터페이스");
		log.info("인터셉터 실행중");
		
	// Session 객체 생성
		HttpSession session = request.getSession(); //공용저장소를 겟세션으로 생성해준다. 공용세션의 이름은 session 이다.
		String referer = request.getHeader("referer"); //★이동하기 전★에 있었던, 이전페이지 URL 을 가져오려면 request.getHeader("referer") 이 명령어가 필요
		log.info("인터셉터★★★★ 이전 url : " + referer); //
		
		String qString = request.getQueryString(); //리퀘스트 명령어 getQueryString 은, ★★진행하려고하는 url의 쿼리스트링!!★★ 만 받아오는 명령어
		log.info(">>>>> queryString: " + qString); //
	
		// 구별하기
		// referer = [http://localhost:8081/nextturn/board/list]
		
		//url uri 의 차이는, url은 풀주소이고 		//uri 는 컨텍스트 루트 다음부터를 말함 (8081 다음부터)
		String uri = request.getRequestURI(); 	       // uri = [/nextturn/board/write]   //URI 는 내가 가려고하는 페이지, 다음페이지 URL (
		String ctx = request.getContextPath(); 		   // ctx = [/metop]   (ctx는 Context-root 를 의미함, ctx= /nextturn)
		String nextUrl = uri.substring(ctx.length());  //nextUrl = [/board/write]  (uri에서  ctx 길이만큼, 앞주소를 자름) 
		String prevUrl = "";    //아래에서 쓸력 이전 주소를 초기화시킨다
		String finalUrl = "http://localhost:8081/nextturn/";  //비정상 접근일 경우 index 페이지로 보내려고 이 변수를 만듬
		
	//비정상적인 URL 로 접근 했을 경우 (URL을 저장해놨다가 접속한경우)
		if(referer == null) {	//url을 바로치고 들어왔다면, 리퍼럴은 항상 널이다. (네이버에서 url로 게시글 등록을 시도하는 그런 경우)
			log.info("WARNING>> 비정상적인 접근 :(");
			response.sendRedirect(finalUrl);  //비정상적인 접근했을때 위에 적어둔 주소로 강제로 보냄
			return false;
			
		} else {							       //리퍼럴값이 있을경우 else를 타고.http://localhost:8081/nextturn/board/list 
			int indexQuery = referer.indexOf("?"); //여기서 물음표를 찾아서 indexQuery 에 넣는다 (없으면-1)
			if(indexQuery == -1) {
				prevUrl = referer.substring(finalUrl.length()-1);
			} else {
				prevUrl = referer.substring(finalUrl.length()-1, indexQuery);
			}
			log.info("PREV URL >>>>> " + prevUrl);
			log.info("NEXT URL >>>>> " + nextUrl);
			
			if(nextUrl.equals("/board/update") || nextUrl.equals("/board/delete")) {
				// board/delete는 삭제DB Action밖에 없다
				// board/update는 수정페이지 출력과 수정DB Action이 있다
				if(request.getParameter("title") == null) { // 보내는 내용에 title 이 없는 경우에만 실행해라, (수정 완료 버튼을 누르면 title이 있다)
				log.info("alasdfasdf: " + prevUrl.indexOf("board/view"));
				if(prevUrl.indexOf("board/view") == -1) {  //보드뷰에서 온것이 아니면 실행. (레퍼럴에 board/view가 없으면 비정상 접근) 
					log.info("WARNING >> 비정상적인 접근 :(");
					response.sendRedirect(finalUrl); //센드리다이랙트 방식으로, 인덱스 페이지로 강제로 보내버림
					return false;
				}
				}
			}
		}
		
		
		// 정상적인 접근일 경우 실행!
		if(session.getAttribute("userid") == null) { // Login NO
			if(prevUrl.equals(nextUrl)) {
				log.info("WARNING >> prevUrl == nextUrl :/");
				response.sendRedirect(finalUrl);
				return false;
			}
			
			// 전송하는 방식 FlashMap
			// jstl el태그로 모델 꺼내는것처럼 꺼내면된다
			FlashMap fMap = RequestContextUtils.getOutputFlashMap(request);
			fMap.put("message", "nologin");
			
			if(qString != null) {   //쿼리스트링이 널이 아니면 (값이 있으면)
				uri = uri + "?" + qString;  //uri에 쿼리스트링을 더함 (uri는 예) /board/list
				//url : http://localhost:8081/nextturn/board/answer
				//uri :                      /nextturn/board/answer
				//ctx :						 /nextturn
				
			}
						
			fMap.put("uri", uri);
			RequestContextUtils.saveOutputFlashMap(referer, request, response);
			response.sendRedirect(referer);
			
			// URL만 신경, GET or POST 중요하지 않음..
			// 회원수정페이지: GET:/member/update
			// 회원수정DB: POST:/member/update
			// request(GET, POST) > response(forward, sendRedirect) Ajax제외 request가 오면 response를 해주어야한다
			
			return false; // 이동 X
		} else { // Login OK
			log.info(">>>>> LOGIN:)");
			return true; // 이동 O
		}
		
	}//메서드
}//클래스
	
