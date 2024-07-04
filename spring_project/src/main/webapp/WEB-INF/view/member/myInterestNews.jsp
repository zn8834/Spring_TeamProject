<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>



<body>

    <%@ include file="../include/topsidebar.jsp"  %>
<!--  nav_bar,side_bar end -->
      <div class="content_main">
       
         <div class="col-lg-8 shadow m-4 bg-body-tertiary" style="width:1200px; height:100px;">
            <div>
               <p class="text-center mt-3 fs-4">마이 페이지</p>   
               <p class="text-center fs-6">내가 관심 등록한 뉴스</p>
            </div>
          </div>
<!--     title body       -->
          <div class="col-lg-8 shadow mx-4 bg-body-tertiary p-5" style="width:1200px; display : flex; justify-content: center; flex-direction : column;">
            <div class="mt-1"> 
             <h5>관심 뉴스 등록 현황</h5>
            </div>
             <hr style="width:100%;">
                 <div> 
                    <form action="update" method="post">
                  <div class="form-group row mb-2">
                     <label class="col-sm-3 ">아이디</label>
                     <div class="col-sm-3">
                        <input value="${member.memberId}" class="form-control" id="memberId" name="memberId" readonly>
                     </div>
                  </div>
                  <div class="form-group row mb-1">
                     <label class="col-sm-3">비밀번호</label>
                     <div class="col-sm-3">
                        <input class="form-control" name="memberPw" id="memberPw" type="password">
                     </div>
                  </div>
                  <div class="form-group row mb-2">
                     <label class="col-sm-3">성명</label>
                     <div class="col-sm-3">
                        <input value="${member.memberName}" class="form-control" name="memberName" id="memberName" readonly>
                     </div>
                  </div>
                  <div class="form-group row mb-2">
                     <label class="col-sm-3">닉네임</label>
                     <div class="col-sm-3">
                        <input value="${member.memberNick}" class="form-control" name="memberNick" id="memberNick">
                     </div>
                  </div>
                  <div class="form-group row mb-2">
                     <label class="col-sm-3">이메일</label>
                     <div class="col-sm-4">
                        <input value="${member.memberMail}" name="memberMail" id="memberMail" readonly>@ 
                        <input value="${member.memberMail1}" name="memberMail1" id="memberMail1" readonly>
                     </div>
                  </div>
                  <div class="form-group row mb-4">
                     <label class="col-sm-3">우편번호</label>
                     <div class="col-sm-5">
                        <input name="memberAddr1"  value="${member.memberAddr1}" type="text" class="form-control address_input_1">
                        <div class="address_button btn btn-primary" onclick="execution_daum_address()">주소찾기</div>
                     </div>
                  </div>
                  <div class="form-group row mb-4">
                     <label class="col-sm-3">주소</label>
                     <div class="col-sm-5">
                        <input name="memberAddr2" value="${member.memberAddr2}" type="text" class="form-control address_input_2" readonly="readonly">
         
                     </div>
                  </div>
                  <div class="form-group row mb-4">
                     <label class="col-sm-3">상세주소</label>
                     <div class="col-sm-5">
                        <input name="memberAddr3" value="${member.memberAddr3}" type="text" class="form-control adderess_input_3">
                     </div>
                  </div>
         <div class="form-group  row">
            <div class="col-sm-offset-2 col-sm-10 ">
               <button type="submit" class="btn btn-primary " onclick="updateMember();" >수정하기</button> 
               <button type="button" class="btn btn-primary " onclick="removeMember();" >탈퇴하기</button>
            </div>
         </div>
      </form>
                    
                    <form id="removeMember" action="/member/delete" method="get">
                       <input type="hidden" value="${member.memberId}" name="memberId">
                    </form>
                    
                    
                 </div>
          </div>
   </div>
   <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
   <script>
   function updateMember() {
      if(window.confirm("수정하시겠습니까? 수정 후 재로그인 하세요")) {
         
         $("#updateMember").submit();
      }
   }
   
   function removeMember() {
      if(window.confirm("탈퇴하시겠습니까?")) {
         
         $("#removeMember").submit();
      }
   }
   
   /* 다음 주소 연동 */
   function execution_daum_address(){
      new daum.Postcode({
           oncomplete: function(data) { 
              // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수
 
                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }
 
                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 주소변수 문자열과 참고항목 문자열 합치기.
                    addr += extraAddr;
                
                } else {
                   addr += ' ';
                }
 
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                $(".address_input_1").val(data.zonecode);
                $(".address_input_2").val(addr);
                // 상세주소 입력란 disabled 속성 변경 및 커서를 상세주소 필드로 이동한다.
                $(".address_input_3").attr("readonly",false);
                $(".address_input_3").focus();
           }
      }).open();
   }
   
   </script>
       

    <div class="footer">


    </div>


   
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>