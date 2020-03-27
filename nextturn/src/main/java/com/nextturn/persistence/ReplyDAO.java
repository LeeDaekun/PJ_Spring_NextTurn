package com.nextturn.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.nextturn.domain.ReplyDTO;

public interface ReplyDAO {
	public List<ReplyDTO> list(@Param("bno") int bno);
	//맵퍼에도 list 아이디가 있어야함
	
	//댓글 등록하기
	public void insert(ReplyDTO rDto);
	
	
	//댓글 카운터 1 올림
	public void replyCntUpdate(Map<String, Object> map);

	//댓글 삭제버튼 눌렀을때 동작
	public void delReply(int rno);
	
	public void replyCntMinus(int bno);  //리플 카운터 마이너스
}


	
