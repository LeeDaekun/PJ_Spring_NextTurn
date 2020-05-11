package com.nextturn.domain;

import java.sql.Date;

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
	private int nno; 		//쪽지 번호
	private String send_id;	//발신 아이디
	private String Receive_id; //수신 아이디
	private String note_content; //쪽지 내용
	private Date note_regdate;   //쪽지 날짜
	}