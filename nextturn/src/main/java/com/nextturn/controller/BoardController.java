package com.nextturn.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.nextturn.domain.BoardDTO;
import com.nextturn.service.board.BoardService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller // 컨트롤러 붙여준 이유는, 핸들러맵핑이 /member 붙은애를 찾아봐,
@RequestMapping("/board")
public class BoardController {
	@Autowired // DI 기능을 켜고
	BoardService bService; // Service를 쓸려고 의존성 주입을 하게 해줌

//---------------------------------------------------------------------------------------	
	
	
	@GetMapping("/list2") // 게시판 띄우기
	public String freeBoard(Model model) { // DTO에서 자료를 가져와서 list 띄워라
		log.info(">>>>> Get 전송 _ board/list 게시판 호출");

		model.addAttribute("board_item", bService.boardList());
		// model.addAttribute("뷰단item 이름", bService.서비스에 메서드명());

		return "board/list";
	}

	
	//선생님이 알려준방법
	@GetMapping("/list")  //게시판 띄우기
	public String list(Model model) {   //DTO에서 자료를 가져와서 list 띄워라	
	
		log.info(">>>> Get: 보드리스트 2 페이지");
		List<BoardDTO> list = bService.boardList();  //서비스작업 처리한 결과를 list 에 담음
		
		HashMap<String,Object> map = new HashMap<>();  //보내야될 데이터가 많아서, 바로 보내지않고 해쉬맵을 쓴다
		map.put("list", list);
		
		model.addAttribute("map",map);  //화면단에 맵데이터를 보낸다
		
		return "board/list";
	
	}
}
