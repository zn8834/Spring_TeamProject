<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="com.example.domain.MemberVO" %>
<%@ page import="com.example.domain.BoardVO" %>
<%@ page import="javax.servlet.http.HttpSession" %> 

<!-- Main Content -->
<div>

<link href="/resources/css/list.css" rel="stylesheet" type="text/css">
   <div class="row">
      <!-- 게시판 카테고리 -->
      <div class="col-lg-12" id='title' >
         자유게시판
      </div>  
   
   <hr style="width:90%;height:2px;border:none;background-color:black;">
     <script>
    function searchByType(type) {
        document.getElementById("boardType").value = type;
        document.getElementById("pageNum").value = 1; // 페이지 번호 초기화
        document.getElementById("searchForm").submit();
    }
</script>
  
<div class="row content-center">
    <!-- 카테고리 링크 -->
    <div class="col-lg-11 text-center" id="category-links">
  
    
        <span class="category-link" onclick="searchByType(0)">자유</span>
        <span class="category-text">|</span>
        <span class="category-link" onclick="searchByType(1)">정치</span>
        <span class="category-text">|</span>
        <span class="category-link" onclick="searchByType(2)">경제</span>
        <span class="category-text">|</span>
        <span class="category-link" onclick="searchByType(3)">사회</span>
        <span class="category-text">|</span>
        <span class="category-link" onclick="searchByType(4)">이슈</span>
    </div>
</div>
<br/><br/>
<!-- 검색 폼 시작 -->
<div class="row justify-content-end">
    <div class="col-lg-5 text-right">
        <form id='searchForm' action="/board/list" method='get'>
    <input type='hidden' name='board_type' id="boardType" value="">
    <select name='type'>
        <option value="" ${empty pageMaker.cri.type ? 'selected' : ''}>검색</option>
        <option value="T" ${pageMaker.cri.type == 'T' ? 'selected' : ''}>제목</option>
        <option value="C" ${pageMaker.cri.type == 'C' ? 'selected' : ''}>내용</option>
        <option value="W" ${pageMaker.cri.type == 'W' ? 'selected' : ''}>작성자</option>
        <option value="TC" ${pageMaker.cri.type == 'TC' ? 'selected' : ''}>제목 및 내용</option>
    </select>
    <input type='text' name='keyword' value='<c:out value="${pageMaker.cri.keyword}"/>' />
    <button type="submit" class='btn btn-default'>Search</button>
</form>
</div>
<br/><br/>

      <div class="row" id="content">
         <div class="col-md-11">
            <div class="table-responsive">
                  <table class="table table-hover" width="120%" cellspacing="0" >
                  <thead class="table-warning">
                     <tr>
                        <th>No.</th>
                        <th>제목</th>
                        <th>내용</th>
                        <th>닉네임</th>
                        <th>작성일</th>
                        <th>조회</th>
                        <th>카테고리</th>
                     </tr>
                  </thead>
                  <c:forEach items="${list}" var="board">
                     <tr>
                        <td><c:out value="${board.bno}" /></td>
                           
                        <td>
                        
<%--                            <a href='/board/get?bno=<c:out value="${board.bno}"/>'> --%>
<%--                               <c:out value="${board.title}" /></a> --%>
                              
                           <a class='move' href='<c:out value="${board.bno}"/>'> 
                           <c:out value="${board.title}" />
                           </a>
                        </td>

                        <td><c:out value="${board.content}" /></td>
                        <td><c:out value="${board.memberId}" /></td>
                        <td><fmt:formatDate pattern="yyyy-MM-dd" value="${board.regdate}" /></td>
                        <td><c:out value="${board.hit}" /></td>
                        <td><c:out value="${board.board_type}" /></td>
                        
                     </tr>
                  </c:forEach>
               </table>

               <div class="d-flex justify-content-end">
                  <a href="/board/register" class="btnn">글쓰기</a>
               </div><br/>
               <div class="d-flex justify-content-end">
                  <a href="list" class="btnn">전체글보기</a>
               </div>
               <script>
               //글조회
               function fn_view(code){
                   
                   var form = document.getElementById("boardForm");
                   var url = "<c:url value='/board/hit.do'/>";
                   url = url + "?hit=" + code;
                   
                   form.action = url;    
                   form.submit(); 
               }
               </script>
               
               <nav aria-label="Page navigation example">
                  <ul class="pagination justify-content-center">

                  <c:if test="${pageMaker.prev}">
                     <li class="page-item">
                     <a class="page-link" href="${pageMaker.startPage -1}" aria-label="Previous"> 
                     <span aria-hidden="true">&laquo;</span> <!-- 왼쪽으로 꺽인 괄호<< -->
                     </a>
                     </li>
                  </c:if>

                  <c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
                     <li class="page-item ${pageMaker.cri.pageNum == num ? "active":""}">
                        <a class="page-link" href="${num}">${num}</a></li>
                  </c:forEach>

                  <c:if test="${pageMaker.next}">
                     <li class="page-item">
                        <a class="page-link" href="${pageMaker.endPage +1}" aria-label="Next"> 
                           <span aria-hidden="true">&raquo;</span> <!--  오른쪽으로 꺽인 괄호>> -->
                        </a>
                     </li>
                  </c:if>
   
               </ul>
            </nav>
   
            <form id='actionForm' action="/board/list" method='get'>
               <input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
                <input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
                
                <input type='hidden' name='type' value='<c:out value="${ pageMaker.cri.type}"/>'>
                <input type='hidden' name='keyword' value='<c:out value="${ pageMaker.cri.keyword}"/>'>
            </form>

            </div>
         </div>

      </div>
   <!-- /.container-fluid -->
   <script>
   function searchByType(type) {
      document.getElementById("boardType").value = type;
      document.getElementById("searchForm").submit();
   }
</script>
   </div>
</div>
</div>
<%-- <%@include file="../include/sidebar2.jsp"%> --%>
<!-- End of Main Content -->