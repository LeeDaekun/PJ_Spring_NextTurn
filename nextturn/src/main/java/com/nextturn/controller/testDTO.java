package com.nextturn.controller;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor  //컨피그 유징 필드 자동생성  
@Getter  //게터 자동생성
@Setter   //세터 자동생성
@ToString   //투스트링 자동생성


public class testDTO {
	String name;
	int score;
	
}
