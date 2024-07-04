package com.example.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.example.domain.CompanyVO;
import com.example.domain.Criteria;
import com.example.mapper.CompanyMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor

public class CompanyServiceImpl implements CompanyService {
   
//   @Setter(onMethod_=@Autowired) 대신 -> @AllArgsConstructor
   private CompanyMapper mapper;

   @Override
   public void register(CompanyVO company) {
      log.info("register..." +company);
      mapper.insertSelectKey(company);
   }

   @Override
   public CompanyVO get(Long cno) {
      log.info("get..."+cno);
      return mapper.read(cno);
   }

   @Override
   public boolean modify(CompanyVO company) {
      log.info("modify..."+company);
      return mapper.update(company)==1;
   }

   @Override
   public boolean remove(Long cno) {
      log.info("remove..."+cno);
      return mapper.delete(cno)==1;   }

//   @Override
//   public List<BoardVO> getList() {
//      log.info("getList...");
//      return mapper.getList();
//   }
   @Override
   public List<CompanyVO> getList(Criteria cri){
      log.info("get List with criteria: " + cri);
      
      return mapper.getListWithPaging(cri);
   }
   
   @Override
   public int getTotal(Criteria cri) {
      
      log.info("get total count");
      return mapper.getTotalCount(cri);
   }

}