<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
   <title>companyList</title>
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
	<link href="/resources/css/mainPage.css" rel="stylesheet" type="text/css">
   <script src="/resources/jquery.min.js"></script>
<%@include file="../include/topsidebar.jsp"%>

</head>
<body>
<div class="content_main mx-5">
<div class="container-fluid">
        
    
     <div class="row">
     <form class="d-flex col-12 col-sm-6 col-md-3 " style=" margin:auto; "action="/company/companyList" method="get">
        <input class="form-control me-sm-2" type="text" placeholder="Search" name='keyword' value='<c:out value="${pageMaker.cri.keyword }"/>'/>
        <input type='hidden' name='pageNum' value='<c:out value="${pageMaker.cri.pageNum }"/>'/>
        <input type='hidden' name='amount' value='<c:out value="${pageMaker.cri.amount }"/>'/>
        <button type="button" class="btn btn-warning" type="submit">Search</button>
     </form>
     </div>
     
     
     
   <div class="row">
       
    <div class="card col-lg-8 shadow mb-4" style=" margin:30px; width:1130px; height:400px;">
       <div class="card-head" style="margin: 10px 0px 0px 0px;"> 
        <h3>Company List</h3>
        <hr style="border: solid 2px; width:100%; ">
       </div>
           <div class="card-body" style="max-height: 300px; overflow:auto;"> 
              <table class="table table-hover" style="margin:auto; ">
                <thead style="text-align:center">
                  <tr>
                    <th scope="col">번호</th>
                    <th scope="col">기업명</th>
                    <th scope="col">평가 금액</th>
                  </tr>
                </thead>
                 <tbody style="text-align:center">
                <c:forEach items="${companyList}" var="company">
                              <tr scope="row" class="table-Default">
                                 <th><c:out value="${company.cno}" /></th>
                                 <th >
                           <a class='move' href='<c:out value="${company.cno }"/>'>
                              <c:out value="${company.c_name }"/>
                           </a>
                                 </th>
                                 <th><c:out value="${company.profit }"/></th>
                              </tr>
                     </c:forEach>
                     </tbody>
                  </table>
                 </div>
          </div>
          
          
          
          <form id='actionForm' action="/company/list" method='get'>
            <input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum }'>
            <input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
            
            <input type='hidden' name='type' value='<c:out value="${pageMaker.cri.type}"/>'>
            <input type='hidden' name='keyword' value='<c:out value="${pageMaker.cri.keyword}"/>'>
         </form>


   </div>
   </div>
 <script>
 
       var actionForm = $("#actionForm");
       
      $(".move").on(
      "click",
      function(e) {
         
         e.preventDefault();
         actionForm.append("<input type='hidden' name='cno' value='"
                     +$(this).attr("href")+"'>");
         actionForm.attr("action","/company/company");
         actionForm.submit();
      });
 </script>  

  

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</div>
</body>
</html>
