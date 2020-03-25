package com.nextturn.domain;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor //기본생성자
@AllArgsConstructor //컨스트럭트 유징필드
@Getter
@Setter
@ToString
public class ReplyDTO {
    private int rno;
    private String type;
    private String content;
    private String writer;
    private Date regdate;
    private String bno;
}
