package com.nextturn.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.nextturn.domain.BoardDTO;
import com.nextturn.domain.NoteDTO;
import com.nextturn.service.board.BoardService;
import com.nextturn.service.board.Pager;
import com.nextturn.service.note.NoteService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/note")
public class NoteController {
	
	@Autowired
	private NoteService nService;
	
	@Autowired 
	BoardService bService;
	
	//■■■■■현재 로그인한 사용자에게 온 쪽지 확인하기■■■■■
	@GetMapping("/note_list")
	public String note_list(Model model,HttpSession session,
			@RequestParam(defaultValue = "1") int curPage, // 게시판은 기본적으로 페이지1부터 시작한다
			@RequestParam(defaultValue = "myno")String menu_option  //myno(받은쪽지)와 send(보낸쪽지) 가 있음
			) { // DTO에서 자료를 가져와서 list 띄워라
		
			//@RequestParam은 값이 안넘어와도 기본값을 셋팅해주는것) {
				//Model 은 화면단으로 전송하기 위해서 생성해둠
				//HttpSession은 로그인정보가 담겨있는 세션값을 사용하기 위해서 적었음. HttpSession에는 LoginServiceImpl.java 파일에서 유저아이디와 네임을 저장했음
				//HttpSession 에 담겨있는 로그인 정보를 이용해서, 해당 사용자의 쪽지를 띄운다
		log.info("■■■■GetMapping■■■■ /note/note_list 접속");

		String name = (String) session.getAttribute("name");  //LoginServiceImpl.java 에서 저장한 키값으로 불러온다
		String userid = (String) session.getAttribute("userid");  //LoginServiceImpl.java 에서 저장한 키값으로 불러온다
		log.info("■■■ 세션내용: "+name);
		log.info("■■■ 세션내용: "+userid);
		log.info("■■■ 메뉴옵션: "+menu_option);

		/* model.addAttribute("note_list", nService.note_list(userid)); */  //쪽지정보 데이터베이스에서 조회해서 화면단에서 note_list키값으로 불러다 쓸수 있음
		
		
		//■■■■■■■■■ 페이저 만들기 ■■■■■■■■■■■■
		// 게시글 갯수 계산 (게시글을 '보드'라고도 하고 '아티클'이라고도한대 회사마다 다름)
		int count = nService.note_count(); // 여기에 SQL에서 조회한 게시글 갯수가 담겨옴
		log.info("■■■서비스 note_count 에서 결과를 가져옴■■■");
		log.info("■■■count결과는 "+count);
		
		// 페이지 관련 설정 (URL에 ?curPage=1 이런식으로 쓸수 있다)
		Pager pager = new Pager(count, curPage); // 게시글15개 페이지는1페이지 기본값
		// 생성하면서, public Pager를 한번실행해서 기본준비를 마침
		int start = pager.getPageBegin(); // Pager에 담긴 값을 가져옴
		int end = pager.getPageEnd(); // Pager에 담긴 값을 가져옴
		
		List<NoteDTO> list = nService.note_list(menu_option, userid, start, end);
		log.info("■■■ 서비스 note_list 에 다녀옴");
		/* log.info("■■■ NoteDto list.toString" + list.toString()); */
		
		HashMap<String, Object> map = new HashMap<>(); // 보내야될 데이터가 많아서, 바로 보내지않고 해쉬맵을 쓴다
		map.put("list", list); // <NoteDTO> list를 ▶ 해쉬맵 "list"에 담는다
		map.put("menu_option", menu_option); // <NoteDTO> list를 ▶ 해쉬맵 "list"에 담는다
		map.put("count", count); // 리스트 count를 ▶ 해쉬맵 "count"에 담는다
		map.put("pager", pager); //
		
		log.info("■■■ 모델 생성 완료 ■■■");
		model.addAttribute("map", map); // 해쉬맵 map을, 모델"map"에 담는다 (화면단에서 ${map.list} 로 호출할 수 있음)
		log.info(" ■■■■■모델 확인 toString ■■■■■■" + map.toString());
		
		return "/note/note_list";
	}
	
	//■■■■■쪽지 보내기 기능■■■■■
	@PostMapping("/send")
	@ResponseBody  //Ajax에 리턴값을 보내주려면 리스폰스 바디가 있어야함
	public void note_send(NoteDTO nDto) {
		log.info("■■■■■ PostMapping ■■■■■ /note/send 호출됨 ■■■■■");
		log.info(nDto.toString());
				
		//전송내용 #{send_id}, #{receive_id}, #{note_content}
		nService.note_send(nDto); //리턴이 없으니까, 리스폰스 바디 써주고
	}
	

	
}//class
