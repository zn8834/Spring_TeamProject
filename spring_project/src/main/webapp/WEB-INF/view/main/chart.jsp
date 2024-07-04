<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<body>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://getbootstrap.com/docs/5.3/assets/css/docs.css" rel="stylesheet">
<link href="/resources/css/mainPage.css" rel="stylesheet" type="text/css">
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js@3.5.1/dist/chart.min.js"></script>



<script type="text/javascript">

// 	$(document).ready(function(){
// 		myChart;
// 	})

	$(function(){
		
		var ctx = document.getElementById("lineCanvas").getContext('2d');
		
		var labels = new Array();
		var data = new Array();
		
		<c:forEach items="${chart}" var="result">
			
			var json = new Object();
			
			labels.push("${result.basDt}");
			data.push("${result.clpr}");
		
		</c:forEach>
		
		new Chart(ctx, {
			
		    type: 'line',
		
		    data: {
		
		        labels: labels,
		
		        datasets: [{
					
		        	label: 'Price',
		        	
		            data: data,
		
		            backgroundColor: 'rgba(54, 162, 235, 0.2)',
		
		            borderColor: 'rgba(54, 162, 235, 1)',
		
		            borderWidth: 1
		
		        }]
		
		    }
		
		});
		
		
	});

</script>
	
	<div class="card-head" style="display:flex; flex-direction:row; justify-content:space-between; align-items:center;"> 
      
      <h5><img src="/resources/image/chartIcon.png" alt="Bootstrap" width="20" height="20">Chart</h5>
      
      <form method="get" id="searchChart" action="/main/chart">
             
		    <div class="input-group mb-3" style="width:100%;">
			  <input type="text" class="form-control" placeholder="기업명으로 검색하기" name="company">
			  <button class="btn btn-outline-warning categoryBtn" type="submit">검색</button>
			</div>
		</form>
      
      
     </div>
	
	<hr style="width:100%; height:1px;">
	
	<div>
		<canvas id="lineCanvas" width="100" height="30"></canvas>
	</div>	
	
	<div class="card-body table-responsive p-0" style="overflow:auto; height:68px;">
	      <table class="table table-striped table-valign-middle" style="font-size:9px;">
	        <thead>
	        <tr>
	          <th>기준날짜</th>
	          <th>종목명</th>
	          <th>종목코드</th>
	          <th>시장구분</th>
	          <th>종가</th>
	          <th>전일대비</th>
	          <th>등락률</th>
	          <th>고가</th>
	          <th>저가</th>
	          <th>거래량</th>
	          
	        </tr>
	        </thead>
	        
	        <c:forEach items="${chart}" var="stock">
		        <tbody>
		        <tr>
		          <td>
		          	${stock.basDt}
		          </td>
		          <td>
<!-- 		          종목명 -->
		            ${stock.itmsNm} 
		          </td>
		          <td>
<!-- 		          종목코드 -->
		          	${stock.isinCd}
		          
				  </td>
				  <td>
		          
		            ${stock.mrktCtg}
		          </td>
		          <td>
		          
		            ${stock.clpr}
		          </td>
		          <td>
		            ${stock.vs}
		          </td>
		          <td>
		            ${stock.fltRt}%
		          </td>
		          <td>
		            ${stock.hipr}
		           
		          </td>
		          <td>
		            ${stock.lopr}
		          </td>
		          <td>
		            ${stock.trqu}
		          </td>
		          
		        </tr>
		        
		        </tbody>
		    </c:forEach>
	      </table>
	</div>
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
	
</body>
</html>