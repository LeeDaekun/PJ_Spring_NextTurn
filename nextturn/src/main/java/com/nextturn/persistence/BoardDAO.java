package com.nextturn.persistence;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.nextturn.domain.BoardDTO;

public interface BoardDAO {
	//여기에 처리문이 없으면
	//맵퍼의 boardList 를 찾아가라
	

	public List<BoardDTO> boardList(@Param("map") Map<String, Object>map);

	//게시글 갯수 계산
	public int countArticle();
	
}


	