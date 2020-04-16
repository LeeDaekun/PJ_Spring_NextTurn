package com.nextturn.scheduler;

import org.springframework.stereotype.Component;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
public class SchedulerTest {

	// cron 표기법 시간 반대로 표기 초 분 시 일 월 년
	//@Scheduled(cron = "0 58 9 * * *")   //스케쥴링이 잘 되는거 확인하고 주석처리함
	public void Test() {
	log.info("Welcome Scheduling  :)");
	}
}

