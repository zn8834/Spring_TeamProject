package com.example.service;

import java.util.List;


import com.example.domain.BoardVO;
import com.example.domain.Criteria;

public interface BoardService {

	public boolean  register(BoardVO board);
	
	public BoardVO get(Long bno);
	
	public boolean modify(BoardVO board);
	
	public boolean remove(Long bno);
	
	public List<BoardVO> getList(Criteria cri);
	
	public int getTotal(Criteria cri);
	
	public String getBoardType(Long bno);

	public void boardHit(Long bno); 

	
	public boolean registertValidation(String memberId);

}
