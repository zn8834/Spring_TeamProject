package com.example.domain;

import java.util.Date;

import lombok.Data;

@Data
public class CompanyBoardVO {
   
   private long bno;
   private String title;
   private int cno;
   private String content;
   private String writer;
   private Date regdate;
   private Date updatedate;
   private int hit;
   
}