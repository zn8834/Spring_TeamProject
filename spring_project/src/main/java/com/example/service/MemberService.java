package com.example.service;


import com.example.domain.MemberVO;


public interface MemberService {
   
   //회원가입
   public void memberJoin(MemberVO member);
   
   //아이디 중복체크
   public int idCheck(String memberId);
   
   //로그인
   public MemberVO memberLogin(MemberVO member);
   
   //회원탈퇴
   public boolean deletemember(String memberId);
   
   //회원 업데이트
   public boolean update(MemberVO member);
   
}