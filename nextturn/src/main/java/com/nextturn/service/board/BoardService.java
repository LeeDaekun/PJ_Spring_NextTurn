package com.nextturn.service.board;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.nextturn.domain.BoardDTO;

public interface BoardService {
	
	//목록
    public List<BoardDTO> boardList(String sort_option, String search_option, String keyword, String type, int start, int end);
	//BoardServiceImpl 오버라이딩 해서 사용가능 
	//sort_option = 정렬옵션(

	
	//게시글 갯수 계산
	public int countArticle(String search_option, String keyword, String type);

	//게시글 출력
	public BoardDTO boardView(int bno);
	// 리턴은 DTO로  받는건 int bno
	
	public void increaseViewCnt(HttpSession session, int bno);

	//게시글 삭제할때
	public void delBoard(int bno);

	//게시글 등록 (sql insert)
	public void write(BoardDTO bDto);

	//게시글 수정 (sql update)
	public void update(BoardDTO bDto);
	
	//게시글에 답글 달기
	public void answer(BoardDTO bDto);
	
	//해당 게시글 첨부파일 목록 출력
	public List<String> getAttach(int bno);
	
	
	



}//BoardService