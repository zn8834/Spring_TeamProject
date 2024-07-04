<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
  
   <title>create</title>
   
   
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://getbootstrap.com/docs/5.3/assets/css/docs.css" rel="stylesheet">
    <link href="/resources/css/mainPage.css" rel="stylesheet" type="text/css">
    
<script type="text/javascript">
   function checkForm() {
      if (!document.newMember.id.value) {
         alert("아이디를 입력하세요.");
         return false;
      }

      if (!document.newMember.password.value) {
         alert("비밀번호를 입력하세요.");
         return false;
      }

      if (document.newMember.password.value != document.newMember.password_confirm.value) {
         alert("비밀번호를 동일하게 입력하세요.");
         return false;
      }
   }
</script>
	
</head>
<body>

    
    

    <div class="header">
        <nav class="shadow p-2 bg-body-tertiary border-bottom">
		    <div class="d-flex justify-content-start">
			    <div class="d-flex ps-5">
			    	<a href="main.jsp" class="d-flex align-items-center mb-2 mb-lg-0 text-warning text-decoration-none">
			            <span class="fs-4 fw-bold"><b>BZO</b></span>
		        	</a>
			    </div>
		    </div>
 		 </nav>
    </div>

    <div class="content_body">    
		<div class="shadow d-flex flex-column flex-shrink-0 p-3 float-start bg-body-tertiary" style="width: 280px;">
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
		<div class="content_main">
       
         <div class="col-lg-8 shadow m-4 bg-body-tertiary" style="width:1200px; height:100px;">
            <div>
            	<p class="text-center mt-3 fs-4">회원 가입</p>	
            	<p class="text-center fs-6">회원가입 회원가입</p>
            </div>
          </div>
<!--  	title body       -->
          <div class="col-lg-8 shadow mx-4 bg-body-tertiary p-5" style="width:1200px; display : flex; justify-content: center; flex-direction : column;">
            <div class="mt-1"> 
             <h5>회원가입</h5>
            </div>
             <hr style="width:100%;">
                 <div> 
                    <form name="newMember" class="form-horizontal"  action="processAddMember.jsp" method="post" onsubmit="return checkForm()">
			<div class="form-group row mb-2">
				<label class="col-sm-3 ">아이디</label>
				<div class="col-sm-3">
					<input name="id" type="text" class="form-control" placeholder="id" >
				</div>
			</div>
			<div class="form-group row mb-1">
				<label class="col-sm-3">비밀번호</label>
				<div class="col-sm-3">
					<input name="password" type="text" class="form-control" placeholder="password" >
				</div>
			</div>
			<div class="form-group row mb-2">
				<label class="col-sm-3">비밀번호 확인</label>
				<div class="col-sm-3">
					<input name="password_confirm" type="text" class="form-control" placeholder="pw confirm" >
				</div>
			</div>
			<div class="form-group row mb-2">
				<label class="col-sm-3">성명</label>
				<div class="col-sm-3">
					<input name="name" type="text" class="form-control" placeholder="name" >
				</div>
			</div>
			<div class="form-group row mb-2">
				<label class="col-sm-3">닉네임</label>
				<div class="col-sm-3">
					<input name="nickname" type="text" class="form-control" placeholder="nickname" >
				</div>
			</div>
			<div class="form-group row mb-2">
				<label class="col-sm-3">이메일</label>
				<div class="col-sm-8">
					<input type="text" name="mail1" maxlength="50">@ 
					<select name="mail2">
						<option>naver.com</option>
						<option>daum.net</option>
						<option>gmail.com</option>
						<option>nate.com</option>
					</select>
				</div>				
			</div>
			<div class="form-group row mb-2">
				<label class="col-sm-3">전화번호</label>
				<div class="col-sm-3">
					<input name="phone" type="text" class="form-control" placeholder="phone" >

				</div>
			</div>
			<div class="form-group row mb-4">
				<label class="col-sm-3">주소</label>
				<div class="col-sm-5">
					<input name="address" type="text" class="form-control" placeholder="address">

				</div>
			</div>
			<div class="form-group  row">
				<div class="col-sm-offset-2 col-sm-10 ">
					<input type="submit" class="btn btn-primary " value="등록 " > 
					<input type="reset" class="btn btn-primary " value="취소 " onclick="reset()" >
				</div>
			</div>
		</form>
                    
                 </div>
          </div>

   </div>
       

    <div class="footer">


    </div>


	
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>