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

}
