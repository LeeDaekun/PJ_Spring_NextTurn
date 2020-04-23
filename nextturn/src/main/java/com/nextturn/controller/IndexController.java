package com.nextturn.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.nextturn.domain.BoardDTO;
import com.nextturn.service.board.Pager;
import com.nextturn.service.index.IndexService;

import lombok.extern.slf4j.Slf4j;

@Controller  //의존성 주입을 하려고, 스프링에게 제어권을준다 (IOC) IOC를 해야 DI패턴을 할 수 있다
@Slf4j  //Slf4j로그를 기록하는 프로그램인데, @붙여서 롬복이 쉽게 셋팅해줄수 있음
public class IndexController {
	
	// @Inject, @Autowired, @Resource중 1개라도 붙어있으면 의존성 주입

	// @Inject와 @Atuowired는 타입(변수타입)으로 의존성 주입
	// 타입으로 가져오기때문에 IndexService 이 부분이 중요하지 iService는 중요x
	// IndexService는 인터페이스... IndexService, IndexServiceImpl도 가능함 왜냐면 타입으로 의존해서
	// @Resource는 변수명으로 의존성 주입
		
	@Autowired
	IndexService iService;
	// iService에 indexServiceImpl Beans가 들어가있는것
	
	@RequestMapping("/")  //localhost:8081/ <컨텍스트 루트 라고 부르고, 하위에 /를 리퀘스트 맵핑이 처리하는것
	public String indexView(@RequestParam(defaultValue = "1") int curPage, // 게시판은 기본적으로 페이지1부터 시작한다
							@RequestParam(defaultValue = "new") String sort_option, // 게시판은 최신순 정렬을 기본으로 함 (쿼리스트링 ?sort_option=new
							@RequestParam(defaultValue = "all") String search_option, 
							@RequestParam(defaultValue = "") String keyword, String type, Model model,HttpSession session) {
							// DTO에서 자료를 가져와서 list 띄워라
							
		log.info("★★★★★★★★ INDEX PAGE 출력");
		
		// 개발 종료시 삭제할 것(강제 로그인)===================================================================
		// 이거 삭제할때  이 메서드의 HttpSession session 매개변수를 함께 지우세요
		// log.info("★★개발자 자동로그인중★★ HttpSession session 사용중"); 
		// session.removeAttribute("userid"); session.removeAttribute("name");
		// session.setAttribute("userid", "logintest"); session.setAttribute("name", "이대군");
		//============================================================================================
	
			
		//-------------------------------------------------------------------------------------------	
		log.info("■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■");
		type = "free";
		List<BoardDTO> listFree = iService.iboardList(sort_option, type); // 서비스작업 처리한 결과를 list
		log.info(" ■■■■■■ 자유게시판 글목록 listFree 에 수집완료 ■■■■■■");
		
		log.info("■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■");
		type = "noti";
		List<BoardDTO> listNoti = iService.iboardList(sort_option, type); // 서비스작업 처리한 결과를 list
		log.info(" ■■■■■■ 공지게시판 글목록 listNoti에 수집완료  ■■■■■■");

		log.info("■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■");
		type = "revi";
		List<BoardDTO> listRevi = iService.iboardList(sort_option, type); // 서비스작업 처리한 결과를 list
		log.info(" ■■■■■■ 리뷰게시판 글목록 listRevi에 수집완료  ■■■■■■");
		
		
		HashMap<String, Object> map = new HashMap<>(); // 보내야될 데이터가 많아서, 바로 보내지않고 해쉬맵을 쓴다
		map.put("listFree", listFree); // <BoardDTO> list를 ▶ 해쉬맵 "listFree"에 담는다
		map.put("listNoti", listNoti); // <BoardDTO> list를 ▶ 해쉬맵 "listNoti"에 담는다
		map.put("listRevi", listRevi); // <BoardDTO> list를 ▶ 해쉬맵 "listRevi"에 담는다

		map.put("sort_option", sort_option); // 스트링 sort_option을 ▶ 해쉬맵 "sort_option"에 담는다
		// 정렬 옵션 (정렬 옵션은 페이지가 넘어갈때마다 항상 따라다녀야한다. 안그러면 첫페이지만 정렬되고 말아버리니까)

		model.addAttribute("viewMap", map); // 해쉬맵 map을, 모델"viewMap"에 담는다 (모델은 화면단에 데이터를 전달하는 수단)
											// 화면단에서 출력할때

		log.info(" ■■■■■■■■■■■ViewMap.toString■■■■■■■■■■■" + map.toString());

		
		
		//----최근플레이게임 목록 출력--------------------------------------------------------------------------------------
		model.addAttribute("NewPdt", iService.newPdtList());  //모델은 컨트롤러에서 뷰단으로 전달 (newPdt에는 1~5순위 값이 담겨져서 돌아온다)
		// iService.newPdtList 를 호출하면
		// IndexService -> IndexServiceImpl -> ProductDAO -> ProductMapper SQL문 실행후 결과를 가지고 순서대로 빠꾸
		// 결과가 신상품 5건이 리스트에 담겨져서 옴
		//           NewPdt는 뷰단에서 쓸 이름 
		// 이제 끝났으니까 return Index 로 보냄 (뷰단)
		
		// DispatcherServlet
		// 1. Model(BestPdt)
		// 2. View(/WEB-INF/views/index.jsp)
		// >>> index.jsp 화면단으로 Model(BestPdt) 전송
		return "index";  //리턴타입이 위에보면 String 인데, 어떤화면을 띄울지 결정한다
	}
	
	


}//class
