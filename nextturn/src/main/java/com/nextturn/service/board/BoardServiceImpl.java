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



	@Override  //부모메서드와 같은이름을 써야함
	public List<BoardDTO> boardList(int start, int end) {
		Map<String, Object> map = new HashMap<>();
		map.put("start", start);
		map.put("end", end);
		//비지니스 단이니까 처리할 작업을 적어야함
		//DAO의 boardList 에서 작업을 처리하고, 리턴하라
		return bDao.boardList(map);
	}



	@Override
	public int countArticle() {
		// TODO Auto-generated method stub
		return bDao.countArticle();  //dao의 카운트아티클로 이동
	}
	
	

}
