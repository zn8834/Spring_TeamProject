package com.example.domain;

import lombok.Data;

@Data
public class MemberVO {
   
   //회원 아이디
   private String memberId;

   //회원 비밀번호
   private String memberPw;
   
   //회원 이름
   private String memberName;
   
   //회원 닉네임
   private String memberNick;
   
   //회원 메일
   private String memberMail;
   
   //회원 도메인
   private String memberMail1;
   
   //회원 우편번호
   private String memberAddr1;
   
   //회원 주소
   private String memberAddr2;
   
   //회원 상세주소
   private String memberAddr3;
   
   //관리자 체크
   private String adminCk;
   
   //생성일자
   private String regDate;
   
   //회원 보유 머니
   private String money;
   
   
}