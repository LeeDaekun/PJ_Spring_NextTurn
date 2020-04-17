package com.nextturn.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor  //생성자
@AllArgsConstructor  //유징필드
@Getter
@Setter
@ToString
public class AttachDTO { 
	private String fullname;
	private int bno;
	private Date regdate;
}
