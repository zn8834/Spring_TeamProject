package com.example.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.example.domain.CompanyVO;
import com.example.domain.Criteria;

public interface CompanyMapper {
   
//   @Select("select * from tbl_board where bno > 0")
   public List<CompanyVO> getList();
   
   public List<CompanyVO> getListWithPaging(Criteria cri);
   
   public void insert(CompanyVO company);
   
   public Integer insertSelectKey(CompanyVO company);
   
   public CompanyVO read(Long cno); 
   
   public int delete(Long cno);
   
   public int update(CompanyVO company);

   public int getTotalCount(Criteria cri);
}