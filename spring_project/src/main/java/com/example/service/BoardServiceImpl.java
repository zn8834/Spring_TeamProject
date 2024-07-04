package com.example.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.example.domain.BoardVO;
import com.example.domain.Criteria;
import com.example.mapper.BoardMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class BoardServiceImpl implements BoardService {
	
	//@Setter(onMethod_ = @Autowired) 대신 -> @AllArgsConstructor
	private BoardMapper mapper;
	
//	게시글 작성
	 @Override
	    public boolean register(BoardVO board) {
	        log.info("register......." + board);
	        if (mapper.validateMember(board.getMemberId()) > 0) {
	            int rowsAffected = mapper.insertSelectKey(board);
	            return rowsAffected > 0;
	        } else {
	            log.warn("Invalid memberId: " + board.getMemberId());
	            return false;
	        }
	    }

//	게시글 조회
	@Override
	public BoardVO get(Long bno) {
		log.info("get...." + bno);
		return mapper.read(bno);
	}

//	게시글 수정
	@Override
	public boolean modify(BoardVO board) {
		log.info("modify........" + board);
		return mapper.update(board) == 1;
	}

//	게시글 삭제
	@Override
	public boolean remove(Long bno) {
		log.info("remove....." + bno);
		return mapper.delete(bno) == 1;
	}

//	게시글 페이징
	@Override
	public List<BoardVO> getList(Criteria cri) {
		
		log.info("get List with criteria: " + cri);

		return mapper.getListWithPaging(cri);
	}
	
//	게시글 전체 갯수
	@Override
	public int getTotal(Criteria cri) {
		
		log.info("get total count");
		return mapper.getTotalCount(cri);
	}
	
//	조회수
	@Override
	public void boardHit(Long bno) {
	    mapper.boardHit(bno); // Long을 전달
	}

	
//게시판 카테고리
	@Override
    public String getBoardType(Long bno) {
		log.info("getBoardType: " + bno);
        int boardTypeInt = mapper.getBoardType(bno);
        // 카테고리를 문자열로 변환하여 반환
        return BoardTypeToString(boardTypeInt);
    }
    
    // 카테고리를 문자열로 변환하는 메서드
    private String BoardTypeToString(int boardTypeInt) {
        switch (boardTypeInt) {
            case 1:
                return "정치";
            case 2:
                return "경제";
            case 3:
                return "사회";
            case 4:
                return "이슈";
            default:
                return "게시판 카테고리";
        }
    }

    
    @Override
    public boolean registertValidation(String memberId) {
        log.info("validate memberId: " + memberId);
        return mapper.validateMember(memberId) > 0;
    }
    
}
