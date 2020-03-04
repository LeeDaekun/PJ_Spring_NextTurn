package com.nextturn.persistence;

import com.nextturn.domain.MemberDTO;

public interface MemberDAO {

	// 회원가입 DB에 회원 등록
	public int memInsert(MemberDTO mDto);
	
	
	// 회원가입 ID중복체크(+AJAX)
	public int idOverLap(String id);
	
	
	// 회원가입 진행시 난수 생성 및 useyn 컬럼에 난수 입력
	public int getKey(String id, String key);
}

	