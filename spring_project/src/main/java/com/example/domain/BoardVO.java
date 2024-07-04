package com.example.domain;

import java.util.Date;

import lombok.Data;

@Data
public class BoardVO {

   private Long bno;
   private String title;
   private String content;
   private String memberId;
   private Date regdate;
   private Date updatedate;
//   private String nickname;
   private Long hit;
   private int board_type;
   
   
   
}