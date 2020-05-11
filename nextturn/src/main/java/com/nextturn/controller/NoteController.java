package com.nextturn.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.nextturn.service.note.NoteService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/note")
public class NoteController {
	
	@Autowired
	private NoteService nService;
	
	@GetMapping("/note_view")
	public String note_view(Model model) {
		log.info("■■■■■■■■노트 컨트롤러 /note/note_view 접속");
		model.addAttribute("note_View", nService.note_view());
		System.out.println("★★★서비스"+nService.note_view());
		return "/note/note_view";
	}
	
	
	
	
}//class
