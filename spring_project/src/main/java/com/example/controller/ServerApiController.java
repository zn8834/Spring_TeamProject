package com.example.controller;

import java.net.URI;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Base64;
import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.RequestEntity;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.util.UriComponentsBuilder;

import com.example.domain.IntnewsVO;
import com.example.domain.MemberVO;
import com.example.domain.NewsApiVO;
import com.example.domain.ServerApiVO;
import com.example.domain.chartApiVO;
import com.example.service.MemberService;
import com.example.service.NewsService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/main/*")
public class ServerApiController {
    
	@Autowired
	MemberService memberservice;
	
	@Autowired
	NewsService newsservice;
	
	@GetMapping("/mainPage")
	public void mainPage(Model model) {
		
		String mainNews = "속보";
		String company = "삼성전자";
		
		news(mainNews, model);
		chart(company, model);
	}
   
	
//	@RequestMapping(value="/news", method= {RequestMethod.GET})
    @GetMapping("/news")
    public String news(String text, Model model) {
		
    
        String query = text;
        
        if(text == null) {
    		query = "속보";
    	}
        
        
        String encode = Base64.getEncoder().encodeToString(query.getBytes(StandardCharsets.UTF_8));
    
        URI uri = UriComponentsBuilder.fromUriString("https://openapi.naver.com/")
        .path("v1/search/news.json")
        .queryParam("query", query)
        .queryParam("display", 5)
        .queryParam("sort", "sim")
        .encode()
        .build()
        .toUri();

        log.info("uri : {}", uri);
       
        RequestEntity<Void> req = RequestEntity
        .get(uri)
        .header("X-Naver-Client-Id", "8FuasSq49i12orkVTtYH")
        .header("X-Naver-Client-Secret", "0mRs4FmlxT")
        .build();
        
//        헤더 정보 네이버 토큰 통해서 요청 보내고 build 한다
        
        RestTemplate restTemplate = new RestTemplate();
        ResponseEntity<String> resp = restTemplate.exchange(req, String.class);
        
        ObjectMapper om = new ObjectMapper();
        ServerApiVO resultVO = null;
        
        try {
        	resultVO = om.readValue(resp.getBody(), ServerApiVO.class);
        }
        catch(JsonMappingException e){
        	e.printStackTrace();
        }
        catch(JsonProcessingException e) {
        	e.printStackTrace();
        }
        
        List<NewsApiVO> news = resultVO.getItems();
        
        model.addAttribute("news", news);
        		
        return "/main/news";
        
    }
    
    @GetMapping("/chart")
    public String chart(String company, Model model){
    	
    	
    	if(company == null) {
    		company = "삼성전자";
    	}
    	

//    	                8Fdhf51mOrWnVtTvKXQHljH7PnRectmyki1JN4CGBw6HLN3WDjwnSG7WZihk7keg753l5qhJoLNUbaoDlioRkA%253D%253D
    	String enKey = "8Fdhf51mOrWnVtTvKXQHljH7PnRectmyki1JN4CGBw6HLN3WDjwnSG7WZihk7keg753l5qhJoLNUbaoDlioRkA%3D%3D";
    	               
    	String deKey = "8Fdhf51mOrWnVtTvKXQHljH7PnRectmyki1JN4CGBw6HLN3WDjwnSG7WZihk7keg753l5qhJoLNUbaoDlioRkA==";
    	
//    	String encodeCompany = Base64.getEncoder().encodeToString(company.getBytes(StandardCharsets.UTF_8));
    	
        URI uri = UriComponentsBuilder.fromUriString("https://apis.data.go.kr/1160100/service/GetStockSecuritiesInfoService")
        .path("/getStockPriceInfo")
        .queryParam("serviceKey", deKey)
        .queryParam("numOfRows", 10)
        .queryParam("pageNo", 1)
        .queryParam("resultType", "json")
        .queryParam("itmsNm", company)
        .encode()
        .build()
        .toUri();

        log.info("uri : {}", uri);
       
        RequestEntity<Void> req = RequestEntity
                .get(uri)
                .build();
        
        
        RestTemplate restTemplate = new RestTemplate();
        ResponseEntity<String> resp = restTemplate.exchange(req, String.class);
        
//      JSON BODY에 해당 하는 부분 추출
        String responseBody = resp.getBody();
        List<chartApiVO> result = new ArrayList<>();
        
//		JSON 파싱하기
        try {
        	JSONParser jsonParser = new JSONParser();
			JSONObject jsonObject = (JSONObject) jsonParser.parse(responseBody);
			
			JSONObject jsonResponse = (JSONObject) jsonObject.get("response");
			JSONObject jsonBody = (JSONObject) jsonResponse.get("body");
			JSONObject jsonItems = (JSONObject) jsonBody.get("items");
			
			JSONArray jsonItemList = (JSONArray) jsonItems.get("item");
			
			
			
			for(Object o : jsonItemList) {
				JSONObject jsonItem = (JSONObject) o;
				
				chartApiVO item = new chartApiVO();
				
				item.setBasDt((String) jsonItem.get("basDt"));
				item.setSrtnCd((String) jsonItem.get("srtnCd"));
				item.setIsinCd((String) jsonItem.get("isinCd"));
				item.setItmsNm((String) jsonItem.get("itmsNm"));
				item.setMrktCtg((String) jsonItem.get("mrktCtg"));
				item.setClpr((String) jsonItem.get("clpr"));
				item.setVs((String) jsonItem.get("vs"));
				item.setFltRt((String) jsonItem.get("fltRt"));
				item.setMkp((String) jsonItem.get("mkp"));
				item.setHipr((String) jsonItem.get("hipr"));
				item.setLopr((String) jsonItem.get("lopr"));
				item.setTrqu((String) jsonItem.get("trqu"));
				item.setTrPrc((String) jsonItem.get("trPrc"));
				item.setLstgStCnt((String) jsonItem.get("lstgStCnt"));
				item.setMrktTotAmt((String) jsonItem.get("mrktTotAmt"));
						
				result.add(item);
				
			
			}
		
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        
        Collections.reverse(result);
        model.addAttribute("chart", result);
        
        return "/main/chart";
    }

    
    @PostMapping("/login")
    public String loginPOST(HttpServletRequest request, MemberVO member, RedirectAttributes rttr) {

        HttpSession session = request.getSession();
       
		MemberVO lvo = memberservice.memberLogin(member);
         
          if(lvo == null) {                                // 일치하지 않는 아이디, 비밀번호 입력 경우
            
            int result = 0;
            rttr.addFlashAttribute("result", result);
            return "redirect:/main/mainPage";
            
        }
        
        session.setAttribute("member", lvo);             // 일치하는 아이디, 비밀번호 경우 (로그인 성공)
        
        return "redirect:/main/mainPage";
    }
   
   @PostMapping("/intNews")
   public String intNews(HttpServletRequest request, IntnewsVO news, RedirectAttributes rttr) {
	   
	   newsservice.insertNews(news);
	   
	   return "redirect:/main/news";
   }
   
   @GetMapping("/issue")
   public String issue(Model model){
   	
   	
//       model.addAttribute("issue", issue);
	   model.addAttribute("list", newsservice.issueNewsList());
       return "/main/issue";
   }
   

   
}
   