<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

   <title>BZO</title>

   
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://getbootstrap.com/docs/5.3/assets/css/docs.css" rel="stylesheet">
    <link href="/resources/css/mainPage.css" rel="stylesheet" type="text/css">
      
</head>
<body style="background-color: rgb(243,243,243);">
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>



   <%@ include file="../include/topsidebar.jsp" %>

<!--  content  4menu end-->

<!--    content main 첫번째 줄 차트,챗 -->

   <div class="content_main">
      <div class="col-lg-8 shadow m-4 bg-body-tertiary" style="width:1200px; height:100px;">
            <div>
               <p class="text-center mt-3 fs-4">회원 페이지</p>   
               <p class="text-center fs-6">${member.memberNick}님 반갑습니다.</p>
            </div>
         </div>

   <div class="mb-3 d-flex">
          <div class="shadow ms-3 p-3 menu_box flex-column d-flex justify-content-center align-items-center" style="width:600px; height:360px;">
              <a href="./mypage" class="fs-3 text-black fw-bold"><img src="/resources/svg/people.svg" width="40" height="40"/></a> <br/>
            <a href="./mypage" class="fs-5 text-black fw-bold">회원정보 조회/수정</a>           
                       
          </div>
         <div class="shadow ms-3 p-3 menu_box flex-column d-flex justify-content-center align-items-center" style="width:600px; height:360px;">
               <a href="./myInterestNews" class="fs-3 text-black fw-bold"><img src="/resources/svg/newspaper.svg" width="40" height="40"/></a> <br/>
            <a href="./myInterestNews" class="fs-5 text-black fw-bold">관심 뉴스</a>
                             
                       
          </div>
     </div>
              


   
   <!--    content main 두번째 줄 뉴스,핫이슈 -->
   
      <div class="mb-3 d-flex">
          <div class="shadow ms-3 p-3 menu_box d-flex flex-column justify-content-center align-items-center" style="width:600px; height:360px;">
                     <a href="./mypage" class="fs-3 text-black fw-bold"><img src="/resources/svg/bookmark.svg" width="40" height="40"/></a> <br/>
                  <a href="./mypage" class="fs-5 text-black fw-bold">관심 게시물</a>
                    
                    
                    </div>
           
            
            
            
            
             <div class="shadow ms-3 p-3 menu_box d-flex flex-column justify-content-center align-items-center" style="width:600px; height:360px;">
                        <a href="./mypage" class="fs-3 text-black fw-bold"><img src="/resources/svg/feelpyo.svg" width="40" height="40"/></a> <br/>
                     <button type="button" class="btn btn fs-5 fw-bold" onclick="removeMember();" >탈퇴하기</button>
                    </div>
     </div>
            <form id="removeMember" action="/member/delete" method="get">
                       <input type="hidden" value="${member.memberId}" name="memberId">
                    </form>
  </div>

      <script>
         function removeMember() {
            if(window.confirm("탈퇴하시겠습니까?")) {
               
               $("#removeMember").submit();
            }
         }   
   
   </script>


   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>