package com.nextturn.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.nextturn.domain.NoteDTO;
import com.nextturn.service.note.NoteService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/note")
public class NoteController {
	
	@Autowired
	private NoteService nService;
	
	
	//■■■■■현재 로그인한 사용자에게 온 쪽지 확인하기■■■■■
	@GetMapping("/note_view")
	public String note_view(Model model,HttpSession session) {
		//Model 은 화면단으로 전송하기 위해서 생성해둠
		//HttpSession은 로그인정보가 담겨있는 세션값을 사용하기 위해서 적었음. HttpSession에는 LoginServiceImpl.java 파일에서 유저아이디와 네임을 저장했음
		//HttpSession 에 담겨있는 로그인 정보를 이용해서, 해당 사용자의 쪽지를 띄운다
		log.info("■■■■GetMapping■■■■ /note/note_view 접속");

		String name = (String) session.getAttribute("name");  //LoginServiceImpl.java 에서 저장한 키값으로 불러온다
		String userid = (String) session.getAttribute("userid");  //LoginServiceImpl.java 에서 저장한 키값으로 불러온다
		log.info("■■■ 세션내용: "+name);
		log.info("■■■ 세션내용: "+userid);

		model.addAttribute("note_View", nService.note_view(userid));  //쪽지정보 데이터베이스에서 조회해서 화면단에서 note_View키값으로 불러다 쓸수 있음
		return "/note/note_view";
	}
	
	//■■■■■쪽지 보내기 기능■■■■■
	@PostMapping("/send")
	public void note_send(NoteDTO nDto) {
		log.info("■■■■■ PostMapping ■■■■■ /note/send 호출됨 ■■■■■");
		log.info(nDto.toString());
				
		//전송내용 #{send_id}, #{Receive_id}, #{note_content}
		nService.note_send(nDto); //리턴이 없으니까, 리스폰스 바디 써주고
	}
	
	
	
	
}//class
