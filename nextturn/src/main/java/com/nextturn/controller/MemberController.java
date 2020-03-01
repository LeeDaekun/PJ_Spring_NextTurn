package com.nextturn.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;


@Slf4j
@Controller
@RequestMapping("/member")
public class MemberController {

	@GetMapping("/constract")
	public String viewConstract() {
		log.info(">>>>> MEMBER/CONSTRACT PAGE 출력");
		return "member/constract";
	}
}
