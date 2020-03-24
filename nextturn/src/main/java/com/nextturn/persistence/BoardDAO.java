package com.nextturn.persistence;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.nextturn.domain.BoardDTO;

public interface BoardDAO {
	//여기에 처리문이 없으면
	//맵퍼의 boardList 를 찾아가라
	

	public List<BoardDTO> boardList(@Param("map") Map<String, Object>map);  //스트링과 오브젝트를 받는 맵
						//@param ("map")을 BoardMapper의 boardList를 호출한다
						//boardList안에 paging_footer 도 포함되어있어서 start.end 를 쓸수 있음

	//게시글 갯수 계산
	public int countArticle(@Param("map") Map<String, String> map); //스트링 2개를 받는 맵,Mapper로 전달
	
	
	// 맵퍼는 매개변수를 파라매터 1, 파라매터2 이렇게 순번으로 인식
	public BoardDTO boardView(int bno); //
	

	// 게시글 조회수 +1 증가
	public void increaseViewCnt(@Param("bno") int bno);

	
}
