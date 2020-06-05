package com.nextturn.persistence;

import java.util.List;

import com.nextturn.domain.DailyDTO;

public interface DailyDAO {
	//등록, 조회, 수정, 삭제
	//인터페이스에는 추상메서드만 올수 있다. (추상메서드는 {} <-이거 (실행문)이 없음, 이름만 있고 실체가 없다고함)
	public void dailyCreate(DailyDTO dDto);
	public List<DailyDTO> dailyRead(DailyDTO dDto);
	public void dailyUpdate();
	public void dailyDelete();
}//class
