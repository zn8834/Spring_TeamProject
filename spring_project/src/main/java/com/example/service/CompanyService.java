package com.example.service;

import java.util.List;

import com.example.domain.CompanyVO;
import com.example.domain.Criteria;

public interface CompanyService {
   public void register(CompanyVO company);
   
   public CompanyVO get(Long cno);
   
   public boolean modify(CompanyVO company);
   
   public boolean remove(Long cno);
   
//   public List<BoardVO> getList();
   
   public List<CompanyVO> getList(Criteria cri);

   public int getTotal(Criteria cri);
   
   
}