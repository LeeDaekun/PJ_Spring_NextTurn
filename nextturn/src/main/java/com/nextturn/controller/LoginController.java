package com.nextturn.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.nextturn.domain.MemberDTO;
import com.nextturn.service.login.LoginService;

import lombok.extern.slf4j.Slf4j;

@RestController
@RequestMapping("/login")
@Slf4j
@Controller
public class LoginController {

	
	@Autowired
	LoginService lService;  //서비스단을 만들어야 에러가 사라짐
	
	@PostMapping("/in")
	public Integer logIn(MemberDTO mDto, HttpSession session) {  //httpsession 은 서버에 저장된다 로그인 정보값을 계속 기억하고있음(세션어트리뷰트, 쿠키의 친구)
		log.info("★★★★★★★★★★★★★★★ POST: LOGIN/LOGIN ACTION");
		log.info(mDto.toString());
		// 로그인
		int result = lService.login(mDto, session);  //성공하면 리턴1이 된
		log.info("★★★★★★★★★★★★★★★ 결과는 " + result);
		
		return result;
	}
	
}
