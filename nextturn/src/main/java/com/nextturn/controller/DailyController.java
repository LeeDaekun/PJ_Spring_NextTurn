package com.nextturn.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.nextturn.domain.DailyDTO;
import com.nextturn.domain.NoteDTO;
import com.nextturn.service.daily.DailyService;

import lombok.extern.slf4j.Slf4j;
	
	//ex 등록 기능
	//	ㄴ1) 화면단 (View) - 메서드1개
	//  ㄴ2) 실제동작 (Action) - 메서드 1개
	
	//■■■■■ 조회 ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ (1개의 메서드 필요)
	//■■■■■ 등록 ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ (1개의 메서드 필요-Action)
	//■■■■■ 수정 ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ (1개의 메서드 필요-Action)
	//■■■■■ 삭제 ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ (

@Controller
@Slf4j
@RequestMapping("/daily")
public class DailyController {

	@Autowired
	DailyService dService;  //데일리서비스 객체를 자동으로 생성해주고 오토와이어드가 주입시켜줌
	//예) DailyService ds = new DailyService();  //인스턴스 ds생성  (스프링이 객체 생성 자동으로 해서 안써도 됨)
	//ds랑 dService 랑 같은거다. ds = dService;
	
	
	
	@GetMapping("/create")  //insert
	public void dailyAppend(DailyDTO dDto) {
		log.info("■■■■■ 컨트롤러 ■■■■■ 데일리 인서트");
		//DailyService ds = new DailyService();  //인스턴스 ds생성  (스프링이 객체 생성 자동으로 해서 안써도 됨)
		//ds.dailyCreate();	//인스턴스 ds호출
		log.info(dDto.toString());
		
		dService.dailyCreate(dDto);  //서비스단 진입
	}

	
	@GetMapping("/read") //select
	public String dailySelectAll(DailyDTO dDto, Model model) {
		log.info("■■■■■ dailySelectAll");
		
		List<DailyDTO> list = dService.dailyRead(dDto);  //서비스단 진입
		model.addAttribute("DailyList",list);  //모델은 키 벨류값으로 해야함 (이거 두줄을 하나로 합쳐도 됨)
		
		//테스트 출력
		for (DailyDTO dailyDTO : list) {
			log.info("■■■■■ 모델 출력목록 ■■■■■"+dailyDTO.toString());
		}
		
		return "/note/dailyCheck";  //jsp 파일경로
	}
	
	
	
	@PostMapping("/update")
	public void dailyUpdate() {
		log.info("■■■■■ dailyUpdate");
		dService.dailyUpdate();
	}
	
	
	
	@GetMapping("/delete")
	public void dailyDelete() {
		log.info("■■■■■ dailyDelete");
		dService.dailyDelete();
	}
		
}//class
