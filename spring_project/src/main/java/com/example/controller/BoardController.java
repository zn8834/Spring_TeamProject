package com.example.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.domain.BoardVO;
import com.example.domain.Criteria;
import com.example.domain.PageDTO;
import com.example.service.BoardService;
import com.example.service.MemberService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/board/*")
@AllArgsConstructor
public class BoardController {

	private BoardService service;
	
//	private final MemberService memberService;
	
	@GetMapping("/register") 
	public void register() {
		
	}
	@PostMapping("/register")
    public String register(BoardVO board, HttpSession session, Model model) {
        log.info("register: " + board);

        // 세션에서 회원 아이디 가져오기//웹마켓에서 member, main 부분 찾아보기
        String memberId = (String) session.getAttribute("memberId");

        if (memberId == null) {
            //model.addAttribute("error", "로그인이 필요합니다.");
//            return "redirect:/member/login"; // 로그인 페이지로 리다이렉트
        	return "redirect:/main/mainPage";
        }

        // 회원 아이디 설정
        board.setMemberId(memberId);

        // 게시글 등록 로직 수행
        if (service.register(board)) {
            return "redirect:/board/list";
        } else {
            model.addAttribute("message", "게시글 등록에 실패했습니다.");
            return "errorPage";
        }
    }
	     
	@GetMapping("/list")
	public String list(Criteria cri, Model model, HttpServletRequest request) {
	
		
		
		
////	    HttpSession session = request.getSession();
////	    
////	    String memberId = (String) session.getAttribute("memberId");
////
////        if (memberId == null) {
////            //model.addAttribute("error", "로그인이 필요합니다.");
////            return "redirect:/main/mainPage"; // 로그인 페이지로 리다이렉트
////        }
//  
////	        model.addAttribute("memberId", memberId);
	        
	        log.info("list: " + cri);
		    model.addAttribute("list", service.getList(cri));
		    int total = service.getTotal(cri);
		    log.info("total:" + total);
	
		    model.addAttribute("pageMaker", new PageDTO(cri, total));
	    
	    
	    return "board/list";
	}
//세션부분은 일단 나중에.. 너무 어렵다..ㅜ

	//댓글
	@RequestMapping(value="/board/addComment.do")
    @ResponseBody
    public String ajax_addComment(@ModelAttribute("boardVO") BoardVO boardVO, HttpServletRequest request) throws Exception{
        
        HttpSession session = request.getSession();
        
        return "success";
    }
	
	
//	// 게시글 작성
//	  @PostMapping("/register") 
//	    public String register(BoardVO board,  Model model) {
//	        log.info("register: " + board);
////	        service.register(board);
////	        rttr.addFlashAttribute("result", board.getBno());
////	        return "redirect:/board/list";
//	        if (service.register(board)) {
//	            return "redirect:/board/list";
//	        } else {
//	            model.addAttribute("message", "Invalid member ID or other error.");
//	            return "redirect:/board/write";
//	        }
//	}
//	
	//검색
	  @GetMapping({"/get", "/modify"})
	    public void get(@RequestParam("bno") Long bno, @ModelAttribute("cri") Criteria cri, Model model) {
	        log.info("/get or /modify");
	        service.boardHit(bno); 
	        model.addAttribute("board", service.get(bno));
	    }
	
	//수정
	  @PostMapping("/modify") 
	  	public String modify(BoardVO board, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		  	log.info("modify:" + board);
		
			if(service.modify(board)) {
				rttr.addFlashAttribute("result", "success");
			}
			return "redirect:/board/list" + cri.getListLink();
	  }
	
	//삭제
	@RequestMapping(value = "/remove", method = { RequestMethod.GET, RequestMethod.POST })
		public String remove(@RequestParam("bno") Long bno, Criteria cri, RedirectAttributes rttr) {
		
			log.info("remove..." + bno);
			if (service.remove(bno)) {
				rttr.addFlashAttribute("result", "success");
			}
			return "redirect:/board/list" + cri.getListLink();
		}
	
}
