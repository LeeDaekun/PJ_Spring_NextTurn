package com.nextturn.service.Member;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.nextturn.domain.MemberDTO;
import com.nextturn.persistence.MemberDAO;


@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	PasswordEncoder passwordEncoder;
	
	
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
	
	//회원정보 수정페이지를 누르면, 기본적으로 개인정보를 주워다가 채워줄때 필요함
	@Override
	public MemberDTO userView(String id) {
		return mDao.userView(id);
	}
	
	// 회원정보 수정페이지에서 ▶수정버튼을 누르면 DB업데이트 실행할 구현부
	@Override
	public void memUpdate(MemberDTO mDto, HttpSession session) {
		int result = mDao.memUpdate(mDto);  //DB에 수정성공하면 1을 반환
		
		if(result > 0) { // 수정 성공
			// 세션에 로그인유저 정보를 저장
			// .removeAttribute()써주는걸 권장
			session.removeAttribute("name");  //기존 세션있던 네임을 지우고,
			session.setAttribute("name", mDto.getName()); //로그인한 사용자 이름이 세션에 등록되있는데, 이것도 새로고침 해줄수 있게 세션내용을 바꿔줌
		}
	}
	
	
	//이 메서드는 	@Autowired 	PasswordEncoder 를 사용합니다.
	@Override
	public int pwCheck(String id, String pw) {
		String encPw = mDao.pwCheck(id);
		int result = 0;
		if(passwordEncoder.matches(pw, encPw)) {
			result = 1;
		}
		return result;
	}
	
	@Override
	public void pwUpdate(MemberDTO mDto) {
		mDao.pwUpdate(mDto);
	}
	
	
}
