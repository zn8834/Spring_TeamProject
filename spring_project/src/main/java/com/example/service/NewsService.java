package com.example.service;

import java.util.List;

import com.example.domain.IntnewsVO;

public interface NewsService {
	
//	 관심 뉴스 등록
	   public void insertNews(IntnewsVO news);
	
//	   상위 5개 관심 뉴스 출력
	   public List<IntnewsVO> issueNewsList();
	   
}
