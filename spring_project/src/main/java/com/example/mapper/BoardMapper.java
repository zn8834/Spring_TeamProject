package com.example.mapper;

import java.util.List;
import com.example.domain.BoardVO;
import com.example.domain.Criteria;

public interface BoardMapper {

//	@Select("select * from board where bno > 0")
	public List<BoardVO> getList();

	public List<BoardVO> getListWithPaging(Criteria cri);
	
	public void insert(BoardVO board);
	
	public Integer insertSelectKey(BoardVO board);
	
	public BoardVO read(Long bno);
	
	public int delete(Long bno);
	
	public int update(BoardVO board);
	
	public int getTotalCount(Criteria cri);

	// 조회수 증가 메서드 추가
	public void boardHit(Long bno); 
	
	// 카테고리 리스트 
	public  int getBoardType(Long bno);


//	public int insertValidation(BoardVO board);

	public int validateMember(String memberId);
}
