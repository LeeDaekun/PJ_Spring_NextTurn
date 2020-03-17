package com.nextturn.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.nextturn.service.Member.MemberService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller // 컨트롤러 붙여준 이유는, 핸들러맵핑이 /member 붙은애를 찾아봐,
@RequestMapping("/board") 
@SessionAttributes({"memberDTO"}) // 공용저장소 만듬. (join페이지 직접 못넘어가게 하는거 할때 만듬)
public class BoardController {
	@Autowired // DI 기능을 켜고
	MemberService mService; // Service를 쓸려고 의존성 주입을 하게 해줌
	

	
	@GetMapping("/list")
	public String freeBoard() {   
		
		log.info(">>>>> Get 전송 _ board/list 게시판 호출");
		return "board/list";
	}
	
	
	
	
}
