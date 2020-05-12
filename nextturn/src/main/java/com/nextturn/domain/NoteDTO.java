package com.nextturn.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class NoteDTO {
	//변수 이름 첫글자를 대문자로 작성시 에러남
	private int nno; 		//쪽지 번호
	private String send_id;	//발신 아이디
	private String receive_id; //수신 아이디
	private String note_content; //쪽지 내용
	private Date note_regdate;   //쪽지 날짜
	}