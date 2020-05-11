package com.nextturn.service.note;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nextturn.domain.NoteDTO;
import com.nextturn.persistence.NoteDAO;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class NoteServiceImpl implements NoteService{
	
	@Autowired
	private SqlSession sqlSession;
	
	private NoteDAO nDao;
	
	//이부분 설명필요함
	@Autowired
	public void note_viewDAO() {
		System.out.println("■■■서비스 impl 접속■■■ sqlSession이 NoteDAO와 연결됨??  ■■■");
		nDao = sqlSession.getMapper(NoteDAO.class); //이것이 DAO랑 맵퍼랑 연결시킴
		System.out.println("■■■nDao에 무슨정보가 담기나?"+nDao);  //org.apache.ibatis.binding.MapperProxy@5fcbd36  이런게 담겨있는데?
	}


	
	//인터페이스 오버라이딩 ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
	@Override
	public List<NoteDTO> note_view() {
		log.info("■■■■ @오버라이딩 note_view 실행");
		return nDao.note_view();
	}
	
	
	
	
}
