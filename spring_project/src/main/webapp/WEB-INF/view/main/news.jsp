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
<body>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script type="text/javascript">

	$(document).ready(function() {
	    
		$('.categoryBtn').click(function() {
	        var category = $(this).data('value');
	        $('#categoryInput').val(category);
	        $('#newsCategory').submit();
	    });
	    
	    
	});
	
</script>


           <div class="card-head" style="margin: 10px 0px 0px 0px; display:flex; flex-direction:row"> 
             <img src="/resources/image/newsIcon.png" alt="Bootstrap" width="20" height="20" style="margin-left: 20px;">
             <h5>News</h5>
             
             
             <form method="get" id="newsCategory" action="/main/news">
             
			    <input type="hidden" id="categoryInput" name="text" value="default">
			    
			    <button type="button" class="btn btn-outline-warning categoryBtn" data-value="정치" style="margin-left: 30px;">
			        <img src="/resources/svg/politics.png" alt="Bootstrap" width="20" height="20">
			        정치
			    </button>
			
			    <button type="button" class="btn btn-outline-warning categoryBtn" data-value="경제" style="margin-left: 30px;">
			        <img src="/resources/svg/economic.png" alt="Bootstrap" width="20" height="20">
			        경제
			    </button>
			
			    <button type="button" class="btn btn-outline-warning categoryBtn" data-value="사회" style="margin-left: 30px;">
			        <img src="/resources/svg/social.png" alt="Bootstrap" width="20" height="20">
			        사회
			    </button>
			
			    <button type="button" class="btn btn-outline-warning categoryBtn" data-value="이슈" style="margin-left: 30px;">
			        <img src="/resources/svg/issue.png" alt="Bootstrap" width="20" height="20">
			        이슈
			    </button>
			</form>
      
           </div>
            
           <hr style="width:100%; ">
            		
            <div id="carouselExampleIndicators" class="carousel slide">
			    <div class="carousel-indicators" >
			        <c:forEach items="${news}" var="article" varStatus="status">
			            <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="${status.index}" class="${status.first ? 'active' : ''}" aria-label="Slide ${status.index + 1}" aria-current="${status.first ? 'true' : 'false'}"></button>
			        </c:forEach>
			    </div>
			    
			    <div class="carousel-inner">
				    <c:forEach items="${news}" var="article" varStatus="status">
				        <div class="carousel-item ${status.first ? 'active' : ''}">
				            <svg
				                class="d-none bd-placeholder-img bd-placeholder-img-lg d-block w-100"
				                width="800"
				                height="200"
				                xmlns="http://www.w3.org/2000/svg"
				                role="img"
				                aria-label="Placeholder: First slide"
				                preserveAspectRatio="xMidYMid slice"
				                focusable="false"
				             
				            >
				                <title></title>
				                
				                <div class="d-flex flex-column">
				                
					                <div class="d-flex justify-content-center" >
						                <text x="50%" y="5%" fill="#555" dy=".3em" style="font-size: 30px;">
						                    <tspan id="newsTitle" x="50%" dy="1.2em">${article.title.replaceAll("\\<.*?\\>","")}</tspan>
						                	<img src="../resources/image/caption.png" style="width:30px; height:30px; cursor:pointer;" onclick="captionNews()">
						                </text>
						                
					                </div>
					                <br><br><br>
					                <div class="d-flex justify-content-center" >
					                <text x="50%" y="30%" fill="#555" dy=".3em" style="font-size: 15px; width:70%;">
									    <tspan id="newsContent" x="50%" dy="1.2em">${article.description.replaceAll("\\<.*?\\>","")}</tspan>
									</text>
									</div>
									
									<form id="newsCaptionForm" method="post" action="/main/intNews">
										
										<input type="hidden" name="title" value='${article.title.replaceAll("\\<.*?\\>","")}'>
										<input type="hidden" name="originallink" value='${article.originallink.replaceAll("\\<.*?\\>","")}'>
										<input type="hidden" name="memberId" id="memberId" value='${member.memberId}'>
									</form>
									
									
								</div>
				                
				            </svg>
				        </div>
				    </c:forEach>
				</div>
			    
		    <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev" style="height:50px; top:150px;">
		        <span class="bg-warning carousel-control-prev-icon" aria-hidden="true"></span>
		        <span class="visually-hidden">Previous</span>
		    </button>
		    
		    <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next" style="height:50px; top:150px;">
		        <span class="bg-warning carousel-control-next-icon" aria-hidden="true"></span>
		        <span class="visually-hidden">Next</span>
		    </button>
		</div>
    
    <script type="text/javascript">
    
    	
    	function captionNews(){
    		
    		if(confirm("관심 뉴스로 등록하시겠습니까?")){
    			
    			var memberId = $("#memberId").val();
    			
    			if(memberId == null || memberId === ""){
    				alert("로그인 후 이용 가능합니다.");
    				return;
    			}
    			
    			
    			$("#newsCaptionForm").submit();
    			
    			alert("관심 뉴스로 등록되었습니다.");
    		}
    		else{
    			return;
    		}
    		
    	}
    
    
    
    
    
    </script>
    
    
    
    
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>