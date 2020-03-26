package com.nextturn.service.reply;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nextturn.domain.ReplyDTO;
import com.nextturn.persistence.ReplyDAO;

@Service
public class ReplyServiceImpl implements ReplyService {
	
	@Autowired
	private SqlSession sqlSession;
	
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
		rDao.replyCntPlus(rDto.getBno());	// 해당 게시글의 reply_cnt를 +1 해준다
		
	}

	

}
