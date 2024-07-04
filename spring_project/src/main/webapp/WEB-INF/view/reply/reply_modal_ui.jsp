<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   
<!-- <MODAL> -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
   aria-labelledby="myModallabel" aria-hidden="true">
   <div class="modal-dialog">
      <div class="modal-content">
         <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal"
               aria-hidden="true">&times;</button>
            <h4 class="madal-title" id="myModalLable">댓글쓰기</h4>
         </div>
         <div class="modal-body">
            <div class="form-group">
               <label>제목</label> 
               <input class="form-control" name='reply' value='New Reply!'>
            </div>
            <div class="form-group">
               <label>작성자</label> 
               <input class="form-control" name='replyer' value='replyer'>
            </div>
            <div class="form-group">
               <label>작성일</label>
               <input class="form-control" name='replyDate' value='2024-03-27 04:04'>
            </div>
         </div>
         <div class="modal-footer">
            <button id='modalModBtn' type="button" class="btn btn-warning">Modify</button>
            <button id='modalRemoveBtn' type="button" class="btn btn-danger">Remove</button>
            <button id='modalRegisterBtn' type="button" class="btn btn-primary">Register</button>
            <button id='modalCloseBtn' type="button" class="btn btn-dafault">Close</button>
         </div>
      </div>
      <!--/.madal-content -->
   </div>
   <!--/.modal-dialog -->
</div>

<!-- /.modal -->