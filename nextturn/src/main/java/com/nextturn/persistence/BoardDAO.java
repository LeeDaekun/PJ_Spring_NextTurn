package com.nextturn.persistence;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.nextturn.domain.BoardDTO;

public interface BoardDAO {

	//게시글 갯수 계산
	public int countArticle(@Param("map") Map<String, String> map); //스트링 2개를 받는 맵,Mapper로 전달

	public List<BoardDTO> boardList(@Param("map") Map<String, Object> map);  //스트링과 오브젝트를 받는 맵
	//@param ("map")을 BoardMapper의 boardList를 호출한다
	//boardList안에 paging_footer 도 포함되어있어서 start.end 를 쓸수 있음

	
	// 게시글 조회수 +1 증가
	public void increaseViewCnt(@Param("bno") int bno);
	
	// 상세게시글 출력 (맵퍼는 매개변수를 파라매터 1, 파라매터2 이렇게 순번으로 인식)
	public BoardDTO boardView(int bno); //
	
	// 게시글 삭제
	public void delBoard(int bno);
	
	// 댓글 수 업데이트			//파라메타1 파라메타2 는 읽을수 있는데, 맵은 못읽는다? 그래서 써준다고 하는데, 자세히 알아봐야함 
	public void replyCntUpdate(@Param("map") Map<String, Object> map);
	//public void replyCntUpdate(Map<String, Object> map);   원래는 이렇게 쓰는거
	
	//게시글 등록
	public void write(BoardDTO bDto);
	
	//게시글 수정
	public void update(BoardDTO bDto);
	
	// 게시글 답글 등록
	public void answer(BoardDTO bDto);
	
	// re_step 수정
	public void updateStep(BoardDTO bDto);
}
