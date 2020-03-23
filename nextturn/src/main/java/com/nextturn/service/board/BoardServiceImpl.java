package com.nextturn.service.board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nextturn.domain.BoardDTO;

import com.nextturn.persistence.BoardDAO;

@Service
public class BoardServiceImpl implements BoardService{

	@Autowired  //의존성 주입
	private SqlSession sqlSession;  //서버접속을 위한 SQL세션
	
	private BoardDAO bDao; //DAO 객체 생성
	
	@Autowired
	public void newBoardDAO() {  //이건 이름을 왜이렇게 짓나
		bDao = sqlSession.getMapper(BoardDAO.class);  //DB에 접속해라 SQL문은 뒤로
	}


				
	@Override  //부모메서드와 같은이름을 써야함  //비지니스 단이니까 처리할 작업을 적어야함
	public List<BoardDTO> boardList(String sort_option, String search_option, String keyword,int start, int end) {
		Map<String, Object> map = new HashMap<>();
		map.put("sort_option", sort_option);//매개변수를 "sort_option" 맵에 담는다.
		map.put("start", start);			//매개변수를 "start" 맵에 담는다.
		map.put("end", end);				//매개변수를 "end" 맵에 담는다.
		map.put("search_option",search_option);  //키워드 검색에 필요함
		map.put("keyword","%"+keyword+"%");		 //키워드 검색에 필요함	
		//DAO의 boardList 에서 작업을 처리하고, 리턴하라
		return bDao.boardList(map);
	}



	@Override
	public int countArticle(String search_option, String keyword) {
		Map<String, String> map = new HashMap<>();
		map.put("search_option",search_option);  //키워드 검색에 필요함
		map.put("keyword","%"+keyword+"%");      //키워드 검색에 필요함
		
		return bDao.countArticle(map);  //dao의 카운트아티클로 이동
	}



	@Override
	public BoardDTO boardView(int bno) {
		
		return bDao.boardView(bno);
	}







	
	
	

}
