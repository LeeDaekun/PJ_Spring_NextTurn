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
public class ProductDTO {
    private int pno;
    private String pname;
    private String ptype;
    private String pmemo;
    private String p_img;
    private int plevel;
    private double p_star;
    private Date regdate;
}