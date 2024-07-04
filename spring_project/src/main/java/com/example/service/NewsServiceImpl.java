package com.example.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.example.domain.IntnewsVO;
import com.example.mapper.NewsMapper;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class NewsServiceImpl implements NewsService {

   
   private final NewsMapper newsmapper;

	@Override
	public void insertNews(IntnewsVO news) {
		// TODO Auto-generated method stub
		newsmapper.insertNews(news);
	}

	@Override
	public List<IntnewsVO> issueNewsList() {
		// TODO Auto-generated method stub
		return newsmapper.getList();
	}
   
  
   

}