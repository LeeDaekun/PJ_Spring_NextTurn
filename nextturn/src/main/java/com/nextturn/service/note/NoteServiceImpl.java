package com.nextturn.service.note;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	public void note_listDAO() {
		System.out.println("■■■ Autowired ■■■ 서비스 impl 접속 ■■■ sqlSession이 NoteDAO와 연결됨?? ■■■");
		nDao = sqlSession.getMapper(NoteDAO.class); //이것이 DAO랑 맵퍼랑 연결시킴

	}


	
	//인터페이스 오버라이딩 ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
	@Override
	public List<NoteDTO> note_list(String menu_option, String userid, int start, int end) {
		log.info("■■■■ NoteService @Override // note_list 실행");
		
		Map<String, Object> map = new HashMap<>();
		map.put("menu_option", menu_option);
		map.put("userid", userid);
		map.put("start", start);			//매개변수를 "start" 맵에 담는다.
		map.put("end", end);				//매개변수를 "end" 맵에 담는다.
		//DAO의 boardList 에서 작업을 처리하고, 리턴하라
		
		log.info(" ■■■ SQL에 전달될 map.toString" + map.toString());
		
		return nDao.note_list(map);
	}


	//■■■■■ 쪽지 전송 기능 ■■■■■
	@Override
	public void note_send(NoteDTO nDto) {
		//전송내용 #{send_id}, #{receive_id}, #{note_content}
		nDao.note_send(nDto);	
	}


	//페이저를 위한 쪽지 카운트 확인
	@Override
	public int note_count() {
		return nDao.note_count();
	}
	
	
	
	
}
