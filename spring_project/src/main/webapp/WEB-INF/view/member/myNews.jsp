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
		
</head>

<style>
    .news-table td {
        padding: 10px 0; /* 위아래 10px 간격을 줌 */
    }
    
    .container {
        display: flex; /* Flexbox를 사용하여 요소들을 가로로 배치 */
    }

    .news-container {
        flex: 1; /* Flexbox 내에서 공간을 동적으로 할당 */
        margin-right: 20px; /* 오른쪽 여백 */
        border-right: 2px solid #ccc; /* 회색 실선으로 구분선 생성 */
        padding-right: 20px; /* 구분선과 내용 사이의 간격 */
    }
</style>

<body>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>



           <div class="card-head" style="margin: 10px 0px 0px 0px; display:flex; flex-direction:row"> 
             
             <img src="/resources/image/hot.png" alt="Bootstrap" width="20" height="20" style="margin-left:20px;">
             <h5>HOT ISSUE</h5>
			 
           </div>
           
           <hr style="width:100%; ">
          
          
		    <div style="margin-left:50px;">
		    	<img src="/resources/image/newsIcon.png" alt="Bootstrap" width="20" height="20">
		        <strong>화제의 뉴스</strong>
		        <table class="news-table">
		            <c:forEach items="${list}" var="issueNews" varStatus="status">
		                <tr>
		                    <td><strong>${status.index + 1}</strong></td> <!-- 순번을 진하게 출력 -->
		                    <td><c:out value="${issueNews.title}" /></td>
		                </tr>
		            </c:forEach>
		        </table>
		    </div>
			
			    

           
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>