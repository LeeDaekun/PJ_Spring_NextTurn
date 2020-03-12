package com.nextturn.service.Member;

import org.springframework.web.bind.annotation.PostMapping;

import com.nextturn.domain.MemberDTO;

public interface MemberService {
	
	// 회원가입(DB에 등록)
	public int memInsert(MemberDTO mDto);

	// 회원가입 id중복체크(AJAX)  --맴버컨트롤러의 	@PostMapping("/idoverlap") 에서 호출됨
	public int idOverlap(String id);
	
	// 1명의 회원정보 
	public MemberDTO userView(String id);
}
