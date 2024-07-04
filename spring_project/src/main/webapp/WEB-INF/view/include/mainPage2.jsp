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

<script type="text/javascript">
	
	/* $(document).ready(function() {
	    $.ajax({
	        type: "GET",
	        url: "/main/news?text=ㅇㅇ",
	        success: function(response) {
	            console.log("서버응답 성공 : " + response);
	            
	            // 서버 응답에서 뉴스 제목과 내용을 배열로 저장
	            var newsTitles = [];
	            var newsContents = [];
	            $(response).find('.carousel-item').each(function(index, element) {
	                var title = $(element).find('#newsTitle').text();
	                var content = $(element).find('#newsContent').text();
	                newsTitles.push(title);
	                newsContents.push(content);
	            });
	            
	            // 가져온 뉴스 제목과 내용을 출력
	            for (var i = 0; i < newsTitles.length; i++) {
	                var newsItem = $('#newsPage');
	                newsItem.append('<h3>' + newsTitles[i] + '</h3>');
	                newsItem.append('<p>' + newsContents[i] + '</p>');
	                $('.col-lg-8').append(newsItem);
	            }
	        },
	        error: function(xhr, status, error) {
	            console.error("Error:", error);
	        }
	    });
	}); */
	
	
</script>


    <div class="header">
        <nav class="shadow p-2 border-bottom">
		    <div class="d-flex justify-content-start bg-body-tertiary">
			    <div class="d-flex ps-5">
			    	<a href="mainPage" class="d-flex align-items-center mb-2 mb-lg-0 text-warning text-decoration-none">
			            <span class="fs-4 fw-bold"><b>BZO</b></span>
		        	</a>
			    </div>
		    </div>
 		 </nav>
    </div>

    <div class="content_body">    
		<div class="shadow d-flex flex-column flex-shrink-0 p-3 float-start bg-body-tertiary " style="width: 280px;">
        <div class="content_left_bar">

            <div class="cl_user_info">
				 <span class="fs-4">Login</span>
		         <hr>
		         <form>
		         	<div class="d-flex justify-content-center flex-column">
				        <p>ID : <input type="text" name="ID" size="15" required></p>
				        <p>PW : <input type="password" name="psw" size="15" placeholder="비밀번호" required></p>
			        </div>
			        <div class="d-flex justify-content-center">
			        	<div class="pe-3">
			       		<input type="submit" class="btn btn-success btn-sm" value="Log in">
			       		</div>
			       		<button type="button" class="btn btn-info btn-sm fs-6" style="height:30px;">
			       			<a href="#" class="text-decoration-none text-light">Sign up</a>
			       		</button>
			       	
			        </div>
				   </form>
				   <hr>
            </div>
		
            <div class="cl_nav_bar">
				<ul class="nav nav-pills d-flex flex-column mb-2">
			         <li class="nav-item">
			           <a href="#" class="nav-link active mb-3" aria-current="page">
						<img src="/resources/svg/building.svg" alt="Bootstrap" width="20" height="20">
			             기업정보
			           </a>
			         </li>
			         <li>
			           <a href="#" class="nav-link link-body-emphasis mb-3">
			             <img src="/resources/svg/community.svg" alt="Bootstrap" width="20" height="20">
			             이슈게시판
			           </a>
			         </li>
			         <li>
			           <a href="#" class="nav-link link-body-emphasis mb-3">
			             <img src="/resources/svg/newspaper.svg" alt="Bootstrap" width="20" height="20">
			             뉴스
			           </a>
			         </li>
			         <li>
			           <a href="#" class="nav-link link-body-emphasis">
			             <img src="/resources/svg/stock.svg" alt="Bootstrap" width="20" height="20">
			             모의전
			           </a>
			         </li>
			       </ul>
			       <hr>
			       <div class="dropdown d-flex flex-column justify-content-end">
			         <a href="#" class="d-flex align-items-center link-body-emphasis text-decoration-none dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
			           <img src="https://github.com/mdo.png" alt="" width="32" height="32" class="rounded-circle me-2">
			           <strong>mdo</strong>
			         </a>
			         <ul class="dropdown-menu text-small shadow">
			           <li><a class="dropdown-item" href="#">New project...</a></li>
			           <li><a class="dropdown-item" href="#">Settings</a></li>
			           <li><a class="dropdown-item" href="#">Profile</a></li>
			           <li><hr class="dropdown-divider"></li>
			           <li><a class="dropdown-item" href="#">Sign out</a></li>
			         </ul>
			       </div>
			     </div>
            </div>
            
        </div>
       </div>
<!--  nav_bar,side_bar end -->

   <div class="content_main mx-5">
<!--  content  4menu  탑 바 밑 4개 메뉴  -->
		<div class="mb-3 ms-3 d-flex">
			 <div class="shadow d-flex align-items-center menu_box" style="height:65px; width:300px;">         
	            	<img src="/resources/svg/building.svg" alt="Bootstrap" width="20" height="20" style="margin-left:40px;">
	            	<h5 style="text-align: center; margin-left:40px;">Company<br>Information</h5>
	          </div>
	          <div class="shadow ms-3 d-flex align-items-center menu_box" style="height:65px; width:300px;">         
	            	<img src="/resources/svg/community.svg" alt="Bootstrap" width="20" height="20" style="margin-left:40px;">
	            	<h5 style="text-align: center; margin-left:40px;">Issue Community</h5>
	          </div>
	          <div class="shadow ms-3 d-flex align-items-center menu_box" style="height:65px; width:300px;">         
	            	<img src="/resources/svg/stock.svg" alt="Bootstrap" width="20" height="20" style="margin-left:40px;">
	            	<h5 style="text-align: center; margin-left:40px;">Stock Simulator</h5>
	          </div>
	          <div class="shadow ms-3 d-flex align-items-center menu_box" style="height:65px; width:300px;">         
	            	<img src="/resources/svg/person-lines-fill.svg" alt="Bootstrap" width="20" height="20" style="margin-left:40px;">
	            	<h5 style="text-align: center; margin-left:40px;">My Page</h5>
	          </div>
		</div>
<!--  content  4menu end-->

<!-- 	content main 첫번째 줄 차트,챗 -->

   <!-- 	content main 두번째 줄 뉴스,핫이슈 -->
   
	 
   
  

	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>