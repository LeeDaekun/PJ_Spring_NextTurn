package com.nextturn.service.board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

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



	@Override
	public void increaseViewCnt(HttpSession session, int bno) {
		// now_time: 현재시간
		// plus_time: 조회수 +1 시간
		// now_time - plus_time = 조회수+1증가후 지난시간
		long update_time = 0; // 조회수 +1 증가한 시간
		
		if(session.getAttribute("update_time_"+bno) != null) {
			// 최근에 조회수를 올린 시간
			update_time = (long)session.getAttribute("update_time_"+bno);  //세션에 값을 long 으로 바꿔서, update 타임 담는다
		}
		
		// 현재시간
		long current_time = System.currentTimeMillis();   //시간을 오직 '초(밀리세컨드)'로 계산해버린다.  1000이 1초
		
		// 일정시간이 경과한 후 조회수 증가 처리
		if(current_time - update_time > 24*60*60*1000) {  //1초 x 60 = 60초 / 60초x60은 1시간 / 1시간 x 24는 하루
			// DB에서 조회수 +1 증가
			bDao.increaseViewCnt(bno);
			// 조회수 올린 시간 저장
			session.setAttribute("update_time_"+bno, current_time);  //커렌트 타임
		}
	}


	//뷰에서 게시글 삭제 눌렀을때
	@Override
	public void delBoard(int bno) {
		bDao.delBoard(bno);
	}







	
	
	

}
