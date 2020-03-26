package com.nextturn.persistence;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.nextturn.domain.ReplyDTO;

public interface ReplyDAO {
	public List<ReplyDTO> list(@Param("bno") int bno);
	//맵퍼에도 list 아이디가 있어야함
	
	//댓글 등록하기
	public void insert(ReplyDTO rDto);
	
	
	//댓글 카운터 1 올림
	public void replyCntPlus(int bno);
}


	
