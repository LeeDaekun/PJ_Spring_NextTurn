package com.nextturn.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

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
		model.addAttribute("list", rService.list(bno));
		
		return "/board/commentlist";
	}
}
