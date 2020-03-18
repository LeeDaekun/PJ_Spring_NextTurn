package com.nextturn.service.board;

import java.util.List;

import com.nextturn.domain.BoardDTO;

public interface BoardService {
	
	//목록 (페이지 나누기, 검색 기능 포함)
	//셀랙트라 양이 많으니까 리스트로 해야함 (오버라이딩에도 boardList를 써야함)
	public List<BoardDTO> boardList(int start, int end);
	

	//게시글 갯수 계산
	public int countArticle();
	



}//BoardService