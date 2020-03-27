package com.nextturn.controller;

import java.io.ObjectInputStream.GetField;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.nextturn.domain.ReplyDTO;
import com.nextturn.service.reply.ReplyService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/reply")
public class ReplyController {
	
	@Autowired
	private ReplyService rService;
	
	
	
	//댓글 출력창
	@GetMapping("/list")
	public String list(int bno, Model model) {
		
		log.info("리플 리스트 페이지 띄움");
		model.addAttribute("Reply_List", rService.list(bno));
		
		return "/board/commentlist2";
	}
	
	
	@ResponseBody  //데이터만 보내줌 (화면단 결정 안함)
	@PostMapping("/insert")
	public void insert(ReplyDTO rDto) {
		log.info(">>>>포스트방식으로 Reply컨트롤러의  /insert 호출됨");
		log.info(rDto.toString());
				
		rService.insert(rDto); //리턴이 없으니까, 리스폰스 바디 써주고
	}

	//댓글 삭제부
	@ResponseBody
	@PostMapping("/delReply")
	public void delete(int rno, int bno) {
		log.info(">>>>포스트방식으로 Reply컨트롤러의  /delReply 호출됨");
		log.info("컨트롤러 rno: "+rno);
		log.info("컨트롤러 bno: "+bno);
		rService.deleteReply(rno,bno);
	}

	
}
