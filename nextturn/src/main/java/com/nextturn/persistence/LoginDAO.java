package com.nextturn.persistence;

import com.nextturn.domain.MemberDTO;

public interface LoginDAO {
	// 로그인
	public MemberDTO loginUser(MemberDTO mDto);  //맵퍼안만들어주면 빨간줄
	
}
