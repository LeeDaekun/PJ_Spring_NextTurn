package com.nextturn.service.board;

import java.util.List;

import com.nextturn.domain.BoardDTO;

public interface BoardService {
	public List<BoardDTO> boardList();
	//셀랙트라 양이 많으니까 리스트로 해야함 (오버라이딩에도 boardList를 써야함)
}
