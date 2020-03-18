package com.nextturn.persistence;

import java.util.List;

import com.nextturn.domain.BoardDTO;

public interface BoardDAO {
	
	public List<BoardDTO> boardList();
	//여기에 처리문이 없으면
	//맵퍼의 boardList 를 찾아가라
}
