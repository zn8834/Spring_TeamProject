<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">

<%@ include file="../include/topsidebar.jsp"  %>
<link href="/resources/css/list.css" rel="stylesheet" type="text/css">

	<script type="text/javascript">
//문서가 로드될 때 수정 버튼과 목록버튼에 대한 이벤트 처리를 대기 시키는 것 
		$(function(){
			
			var operForm = $("#operForm");
			
			$("button[data-oper='modify']").on("click", function(e) {
				operForm.attr("action","/board/modify").submit();
			});
			
			$("button[data-oper='list']").on("click", function(e) {
				operForm.find("#bno").remove();
				operForm.attr("action", "/board/list")
				operForm.submit();
			});

			$("button[data-oper='remove']").on("click", function(e) {
				operForm.attr("action","/board/remove").submit();
			});
		});
	</script>
	
	<br/><br/><br/><br/>
	<div class="container">
		<div id="g1"><br/>
			<div class="row">
				<h1 class="page-header">게시글 조회</h1>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2 text-sm-center">Hit : </label>
					<div class="col-sm-1">
						<input class="form-control" name='hit'
					 	value='<c:out value="${board.hit}"/>' readonly="readonly">
					</div>
			</div><br/>
			
			<div class="form-group row">
			 	<label class="col-sm-2 text-sm-center">Category : </label>
			  		<div class="col-sm-1">
						<input class="form-control" name='bno'
						value='<c:out value="${board.board_type}"/>' readonly="readonly">
					</div>
			</div><br/>
			
			<div class="form-group row">
			 	<label class="col-sm-2 text-sm-center">No.  </label>
			  		<div class="col-sm-8">
				 	<input class="form-control" name='bno'
					value='<c:out value="${board.bno }"/>' readonly="readonly">
					</div>
			</div><br/><br/>

			<div class="form-group row">
			 	<label class="col-sm-2 text-sm-center">Title : </label>
			  		<div class="col-sm-8">
				 	<input class="form-control" name='title'
					value='<c:out value="${board.title }"/>' readonly="readonly">
					</div>
			</div><br/><br/>

			<div class="form-group row">
				<label class="col-sm-2 text-sm-center">Content : </label>
					<div class="col-sm-8">
						<textarea id="a3" cols="30" rows="5" class="form-control" style="resize: none;" readonly="readonly">
						<c:out value="${board.content}" /></textarea>
					</div>
			</div><br/><br/>

			<div class="form-group row">
				<label class="col-sm-2 text-sm-center">Name : </label>
					<div class="col-sm-8">
					<input class="form-control" name='memberId'
					value='<c:out value="${board.memberId }"/>' readonly="readonly">
					</div>
			</div><br/><br/>
			
<!-- 			<div class="form-group row"> -->
<!-- 				<label class="col-sm-2 text-sm-center">NickName : </label> -->
<!-- 					<div class="col-sm-8"> -->
<!-- 						<input class="form-control" name='nickname' -->
<%-- 						value='<c:out value="${board.memberNick }"/>' readonly="readonly"> --%>
<!-- 					</div> -->
<!-- 			</div><br/> -->
			
				
			<div style=" text-align: center;">
			<button data-oper='modify' class="btn btn-default">수정하기</button>
			<button data-oper='remove' class="btn btn-#FE2E2E">삭제하기</button>
			
<!-- 			<a href="list"> -->
<!-- 			자바 스크립트에 data-oper있음 -->
			<button data-oper='list' type="button" class="btn btn-default">돌아가기</button>
<!-- 			</a>	 -->
			</div>
			
			<form id='operForm' action="/board/modify" method="get">
				<input type='hidden' id='bno' name='bno' value='<c:out value="${board.bno}"/>'>
				<input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum}" />'>
    			<input type='hidden' name='keyword' value='<c:out value="${cri.keyword}"/>'>
    			<input type='hidden' name='amount' value='<c:out value="${cri.amount}"/>'>
    			<input type='hidden' name='type' value='<c:out value="${cri.type}"/>'>
    			<input type='hidden' name='board_type' value='<c:out value="${cri.board_type}"/>'>
			</form>

			<br/><br/> <br/><br/>
				
				
		<!-- 댓글조회	 -->
			<div class="card mb-2">
				<div class="card-header bg-rightgray">
		        	<i class="fa fa-comment fa"></i> 댓글목록
				</div><br/>
			<div class="card-body-2">
				<ul class="list-group list-group-flush"></ul>
			    	<li class="list-group-item">
		 			<ul class="chat"></ul>
		 			<div class="panel-footer"></div>
		 	</div>
			 </div>
  				 
		<!-- 댓글작성	 -->
  			 <div class="div_reply">
				<div class="card mb-2">
					<form onsubmit="return false">
   						<div class="card-header bg-bg-rightgray">
			        		<i class="fa fa-comment fa"></i> 댓글쓰기
						</div>
				        <p><br/>
				           	<label>닉네임 : </label> <input type="text" name="replyer_nickname">
				        </p>
				        <p><br/>
				           	<label>작성자 : </label> <input type="text" name="replyer">
				        </p>
				        <p>
				            <label>내용 : </label><textarea rows="5" cols="50" name="reply"></textarea>
				        </p>
				        <p>
				        	<input type="hidden" name="bno" value="${get.bno}">
				        </p>
					<button id='addReplyBtn' class='btn btn-outline-dark btn-xs pull-right'>등록</button>
					</form>
				</div>
			</div><br/><br/><br/><br/>
			
		 <hr style="width:100%;height:1px;border:none;background-color:black;"><br/><br/><br/><br/>
		</div>
	</div>		
							
				
			
			
			<!-- ./end row -->
<%-- 			<%@include file="../reply/reply_modal_ui.jsp" %> --%>
<%-- 			<%@include file="../reply/reply.jsp"%> --%>
		
		<script type="text/javascript" src="/resources/js/reply/reply_new_btn_load.js"></script>
			
		<script type="text/javascript" src="/resources/js/reply/reply_ajax.js"></script>
		
		<script type="text/javascript" src="/resources/js/reply/reply_list.js"></script>
		
		<script type="text/javascript" src="/resources/js/reply/reply_list_load.js"></script>

		<script type="text/javascript" src="/resources/js/reply/reply_list_click_load.js"></script>

		<script type="text/javascript" src="/resources/js/reply/reply_page_click_load.js"></script>
			
		
<%-- 				<%@include file="../reply/reply_ajax_test.jsp"%> --%>
			
</html>