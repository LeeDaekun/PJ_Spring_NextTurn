package com.nextturn.service.login;

import javax.servlet.http.HttpSession;

import com.nextturn.domain.MemberDTO;

public interface LoginService {
	// 로그인
	public int login(MemberDTO mDto, HttpSession session);
	
}
