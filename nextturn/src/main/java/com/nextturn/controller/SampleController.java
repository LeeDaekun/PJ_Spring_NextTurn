package com.nextturn.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.nextturn.domain.SampleDTO;

import lombok.extern.slf4j.Slf4j;


//Spring이 동작시 DispatcherServlet 생성과정에서
//servlet-context.xml의 환경설정을 읽어들이는데
//servlet-context.xml 내의 component-scan이
//설정된 경로를 돌아다니며 @Controller가 붙어있는
//Class들을 전부 Spring Context에 Beans로 등록
//시키기 위해서 사용
//Spring Context에 Beans로 등록돼있어야
//DispatcherServlet이 Handler Mapping과
//Handler Adapter를 통해 요청처리를 시킬 수 있음

//Spring Context에 Beans로 등록되었다
//= Spring이 객체의 제어권을 개발자로부터 넘겨받음(IOC패턴)

//Spring Context에 Beans로 등록돼있는 객체들만
//의존성주입 가능(DI패턴)

///sample로 시작하는 요청만 들어옴

@RequestMapping("/sample")  //리퀘스트 맵핑은 화면단 파일경로가 적혀있음. nextturn/sample 이 되는것
@Controller
@Slf4j
public class SampleController {
		
		// GET 방식, POST 방식 둘다 허용 (메인페이지에 거의 사용)
		@RequestMapping("/")  //상위 리퀘스트맵핑에 /sample가 있으니까 이것까지 더해서, nextturn/sample/ 가되면 아래실행
		public String print() {
			return "sample";  //소문자 구분하니 주의, String 과 " " 이 만나면 화면단 구성 (sample.jsp 실행)
		}
	
		// @RequestMapping(value="/sample/view", method=RequestMethod.GET)
		@GetMapping("/view")  //sample.jsp a태그를 누르면 /view로 올수있도록 설정되어있음. 쿼리스트링도 같이 가져옴
		public String view(String user) {
			log.info("★★★★★★★★★★★★★★★ GET 방식 호출");
			log.info("★★★★★★★★★★★★★★★ user: " + user);
			return "result";  //반환타입이 Public String 이고, return에 " " 이 들어오면, 페이지.jsp 가 실행된다 (화면단이 결정되는것)
		}
		
		// Model2에서 쓰던 방식			
		// public String view(HttpServletRequest request) {
			// request.getParameter는 화면단에서 오는 데이터를 무조건 String으로 전달받아
			// 개발자가 받아서 형변환 하는 작업이 필수임
		
			// 추가로 값을 View단에서 넘겨주지 않으면 Null값이 들어가
			// 하단에 매개변수를 사용하는 부분에서 전부 Error발생
			// Null값 체크 해주는 코드가 필수임
		
			// String user = request.getParameter("user");
			// String pass = request.getParameter("pass");
		// }
		
		// @RequestMapping(value="/sample/view", method=RequestMethod.POST)
		@PostMapping("/view")
	public String view(SampleDTO sDto) { /* 5개 변수중에 2개 받아왔음 */	
			// = @RequestParam String user, @RequestParam String pass
			// defaultValue="" 값이 없을 경우 기본값 설정
			// (defaultValue 쓸 때는 @RequestParam 생략 x)
			
			// input 2개의 값을 전달(name 속성값으로)
			log.info("★★★★★★★★★★★★★★★ POST 방식 호출");
			// log.info(user + ", " + pass);
			log.info("★★★★★★★★★★★★★★★ " + sDto.toString());
			return "result";
		}
		
		
		
		
		
		
		// 동기방식
		@GetMapping("/sync")
		public String sync(String name, Model model) {
			log.info("★★★★★★★★★★★★★★★ 동기방식: " + name);
			model.addAttribute("name", name);
		return "sample"; /* 페이지 전환하면서 요청했던 sample페이지에 배뚱아를 심어줌 */
		}
		
		// 비동기방식(AJAX)
		// @ResponseBody : viewresolver가 읽지못하고 더이상 화면단으로 인식x
		@ResponseBody
		// produces="application/text;charset=utf-8" -> 한글이 깨지지않게 utf-8로 설정
		@PostMapping(value="/ajax", produces="application/text;charset=utf-8")
		public String async(String name) {
			log.info("비동기방식: " + name);
			return name;
		}
}





















