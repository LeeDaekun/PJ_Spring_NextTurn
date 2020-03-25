package com.nextturn.service.Member;

import javax.servlet.http.HttpSession;



import com.nextturn.domain.MemberDTO;

public interface MemberService {
	
	// 회원가입(DB에 등록)
	public int memInsert(MemberDTO mDto);

	// 회원가입 id중복체크(AJAX)  --맴버컨트롤러의 	@PostMapping("/idoverlap") 에서 호출됨
	public int idOverlap(String id);
	
	// 1명의 회원정보 
	public MemberDTO userView(String id);
	
	// 회원수정(DB에 수정)
	public void memUpdate(MemberDTO mDto, HttpSession session);
	
	// 비밀번호 수정 : 현재 비밀번호 체크
	public int pwCheck(String id, String pw);
	
	// 비밀번호 수정 : DB에 수정
	public void pwUpdate(MemberDTO mDto);
}
