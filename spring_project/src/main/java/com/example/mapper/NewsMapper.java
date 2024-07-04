package com.example.mapper;

import java.util.List;

import com.example.domain.BoardVO;
import com.example.domain.IntnewsVO;

public interface NewsMapper {
   
   //관심 뉴스 등록
   public void insertNews(IntnewsVO news);
   
   public List<IntnewsVO> getList();

}