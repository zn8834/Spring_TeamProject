package com.example.service;

import java.util.List;

import com.example.domain.CompanyBoardVO;
import com.example.domain.Criteria;

public interface CompanyBoardService {
   public void register(CompanyBoardVO c_board);
   
   public CompanyBoardVO get(Long bno);
   
   public boolean modify(CompanyBoardVO c_board);
   
   public boolean remove(Long bno);
   
//   public List<BoardVO> getList();
   
   public List<CompanyBoardVO> getList(Criteria cri, Long cno);

   public int getTotal(Criteria cri);
   
   
}