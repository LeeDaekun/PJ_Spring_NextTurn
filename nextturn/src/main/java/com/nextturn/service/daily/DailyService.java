package com.nextturn.service.daily;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nextturn.domain.DailyDTO;
import com.nextturn.domain.NoteDTO;
import com.nextturn.persistence.DailyDAO;

import lombok.extern.slf4j.Slf4j;


	//	인터페이스 만들고 구현받아서 오버라이딩한 메서드를 사용할 것이냐
	//or
	// 내가 그냥 직접 메서드 만들어서 사용할 것이냐
	
@Service
@Slf4j
public class DailyService {

	//---DAO 연결---------------------------------	
	@Autowired
	private SqlSession sqlSession;
	
	DailyDAO dDao; //전역변수
	@Autowired
	public void newDailyDAO() {
		dDao = sqlSession.getMapper(DailyDAO.class);
	}
	//------------------------------------------
	
	
	//데일리 등록
	public void dailyCreate(DailyDTO dDto) {
		log.info("■■■■■ 데일리 서비스 진입");
		log.info(dDto.toString());
		
		dDao.dailyCreate(dDto);//impl 에서 하는건데 impl없이 했으므로 service 에 쓴다
	}
	
	//데일리 리스트 조회 (제네릭으로 리턴 받을 타입을 설정)
	public List<DailyDTO> dailyRead(DailyDTO dDto) {
		log.info("■■■■■ 데일리 서비스 진입");
		log.info(dDto.toString());
		
		//오늘의 데일리 명단을 조회결과
		//dDao.dailyRead(dDto);  이걸 바로 리턴받자
		
		return dDao.dailyRead(dDto);  //컨트롤러 단으로 넘길 리턴값
		
	}	
	
	public void dailyUpdate() {
		
	}
	
	public void dailyDelete() {
		
	}
	
	
}//class
