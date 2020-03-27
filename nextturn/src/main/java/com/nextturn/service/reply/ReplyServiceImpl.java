package com.nextturn.service.reply;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nextturn.domain.ReplyDTO;
import com.nextturn.persistence.BoardDAO;
import com.nextturn.persistence.ReplyDAO;

@Service
public class ReplyServiceImpl implements ReplyService {
	
	@Autowired
	private SqlSession sqlSession;
	
	private BoardDAO bDao; //DAO 객체 생성
	
	@Autowired
	public void newBoardDAO() {  //이건 이름을 왜이렇게 짓나
		bDao = sqlSession.getMapper(BoardDAO.class);  //DB에 접속해라 SQL문은 뒤로
	}
	
	private ReplyDAO rDao;
	
	@Autowired
	public void newReplyDAO() {
		rDao = sqlSession.getMapper(ReplyDAO.class);  //DAO + 맵퍼가 된거랑 같다
	}

	@Override
	public List<ReplyDTO> list(int bno) {
		return rDao.list(bno);
	}

	@Override
	public void insert(ReplyDTO rDto) {
		// 비즈니스 로직
		// 1.댓글 등록
		rDao.insert(rDto);					// 해당 게시글에 댓글을 등록하고,
		
		Map<String, Object> map = new HashMap<>();//2. 게시글에 댓글카운터 -1
		map.put("bno", rDto.getBno()); //변수이름 bno를 맵이름bnoMap에 담는다
		map.put("type", "plus");  //minus라는 글자를 맵이름type 으로 불러올수 있게 준비
		bDao.replyCntUpdate(map);	// 해당 게시글의 reply_cnt를 +1 해준다
		
	}

	
	//댓글 삭제버튼 눌렀을때 삭제
	@Override
	public void deleteReply(int rno, int bno) {
		System.out.println("ReplyServiceImpl 접속"+"rno:"+rno+"//"+"bno:"+bno);
		
		//이렇게 dao 를 두개 실행하는 방법도 있지만, Mapper에도 두개를 따로 줘야하므로, 동적쿼리를 써보자
//		rDao.delReply(rno);
//		rDao.replyCntMinus(bno);
		
		rDao.delReply(rno);  //1. 댓글 삭제
		
		Map<String, Object> map = new HashMap<>();//2. 게시글에 댓글카운터 -1
		map.put("bno", bno); //변수이름 bno를 맵이름bnoMap에 담는다
		map.put("type", "minus");  //minus라는 글자를 맵이름type 으로 불러올수 있게 준비
		bDao.replyCntUpdate(map);
	}




	

}
