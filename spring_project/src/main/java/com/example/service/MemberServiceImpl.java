package com.example.service;

import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.log;

import org.springframework.stereotype.Service;

import com.example.domain.MemberVO;
import com.example.mapper.MemberMapper;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class MemberServiceImpl implements MemberService {

   
   private final MemberMapper membermapper;
   
   @Override
   public void memberJoin(MemberVO member) {
      
      membermapper.memberJoin(member);

   }

   @Override
   public int idCheck(String memberId) {
      
      return membermapper.idCheck(memberId);
      
   }

   @Override
   public MemberVO memberLogin(MemberVO member) {
      
      return membermapper.memberLogin(member);
      
   }

   @Override
   public boolean deletemember(String memberId) {
      
      return membermapper.deletemember(memberId) == 1;
   }

   @Override
   public boolean update(MemberVO member) {
      
      
      return membermapper.memberUpdate(member) == 1;
   }

   

}