package com.example.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ReplyVO {

   private Long rno;
   private Long bno;
   
   private String reply;
   private String memberId;
//   private String nickname;
   private Date replyDate;
   private Date updateDate;
}