package com.example.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.domain.BoardVO;
import com.example.domain.Criteria;
import com.example.domain.MemberVO;
import com.example.service.MemberService;

import lombok.AllArgsConstructor;

@Controller
@RequestMapping(value = "/member")
@AllArgsConstructor
public class MemberController {
   
   private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
   
   private MemberService memberservice;
   
      //회원가입 페이지 이동
      @GetMapping({"join", "modify"})
      public void loginGET() {
         
         logger.info("회원가입 페이지 진입");
         
      }
      
      
      
      //1.회원가입
      @PostMapping("/join")
      public String joinPOST(MemberVO member) {
         
         logger.info("join 진입");
         
         // 회원가입 서비스 실행
         memberservice.memberJoin(member);
         
         logger.info("join Service 성공");
         
         return "redirect:/main/mainPage";
         
      }
      
      @PostMapping("/memberIdChk")
      @ResponseBody
      public String memberIdChkPOST(String memberId) {
         
         logger.info("memberIdChk() 진입");
         
         int result = memberservice.idCheck(memberId);
         
         logger.info("결과값 = " + result);
         
         if(result != 0) {
            
            return "fail";   // 중복 아이디가 존재
            
         } else {
            
            return "success";   // 중복 아이디 x
            
         }   
         
      }
      
      @GetMapping("/logout.do")//로그아웃
       public String logoutMainGET(HttpServletRequest request) {
           
         logger.info("logoutMainGET메서드 진입");
           
           HttpSession session = request.getSession();
           
           session.invalidate();
           
           return "redirect:/main/mainPage";    
          
       }
      
      @GetMapping("/delete")//3.삭제
      public String deletemember(@RequestParam("memberId") String memberId, HttpServletRequest request) {
          
         memberservice.deletemember(memberId);
         
         HttpSession session = request.getSession();
         
         session.removeAttribute(memberId);
         session.invalidate();
         
        logger.info("멤버 삭제");
          
          return "redirect:/main/mainPage";    
         
      }
      
      @PostMapping("/update") //4.수정
        public String update(MemberVO member, RedirectAttributes rttr,  HttpServletRequest request, @RequestParam("memberId") String memberId) {
        
         logger.info("modify:" + member);
        
        if(memberservice.update(member)) {
           rttr.addFlashAttribute("result", "success");
           
        }
        
        return "redirect:/member/logout.do";
      }
      

}