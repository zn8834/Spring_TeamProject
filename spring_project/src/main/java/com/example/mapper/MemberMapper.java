package com.example.mapper;

import com.example.domain.MemberVO;

public interface MemberMapper {
   
   //회원가입
   public void memberJoin(MemberVO member);
   
   //아이디 중복 검사
   public int idCheck(String memberId);
   
   //로그인
   public MemberVO memberLogin(MemberVO member);
   
   //회원 정보 수정
   public int memberUpdate(MemberVO member);
   
   //회원 삭제
   public int deletemember(String memberId);

}