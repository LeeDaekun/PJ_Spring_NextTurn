package com.nextturn.service.Member;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nextturn.domain.MemberDTO;
import com.nextturn.persistence.MemberDAO;

@Service
public class MemberServiceImpl implements MemberService {
//임플리먼트 (구현)을 했으면 @Override 를 반드시 해줘야한다.

	@Autowired
	private SqlSession sqlSession;
	
	private MemberDAO mDao;
	@Autowired
	public void newMemberDAO() {
		mDao = sqlSession.getMapper(MemberDAO.class);
	}
	
	@Override  //이 클래스를 처음 시작할때 만든것
	public int memInsert(MemberDTO mDto) {
		return mDao.memInsert(mDto);
	}

	@Override  //아이디 중복체크 할때 만든것, 부모Service 에서 만들면 여기에도 반드시 생성해야됨
	public int idOverlap(String id) {
		// TODO Auto-generated method stub
		return mDao.idOverLap(id);  //여기 안해서 개고생했음
	}
	
	
}
