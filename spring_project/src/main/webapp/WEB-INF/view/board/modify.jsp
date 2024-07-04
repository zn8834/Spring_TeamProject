<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html lang="en">

<%@ include file="../include/topsidebar.jsp"  %>
<link href="/resources/css/list.css" rel="stylesheet" type="text/css">


	<script type="text/javascript">
		$(function() {
			
			const formObj = $("form");

			$('button').on("click",
					function(e)
					{
						e.preventDefault();

						const operation = $(this).data("oper");

						console.log(operation);
	
						if (operation === 'remove')
						{
							formObj.attr("action", "/board/remove");
						}
						else if (operation === 'list')
						{
// 							self.location="/board/list";
							formObj.attr("action", "/board/list").attr("method","get");
							
							var pageNumTag = $("input[name='pageNum']").clone();
							var amountTag = $("input[name='amount']").clone();
							var keywordTag = $("input[name='keyword']").clone();
							var typeTag = $("input[name='type']").clone();
							
							formObj.empty();
							
							formObj.append(pageNumTag);
							formObj.append(amountTag);
							formObj.append(keywordTag);
							formObj.append(typeTag);
							
// 							return;
						}
						
						formObj.submit();
					});
		});
	</script><br/><br/><br/><br/>

	<div class="container">
		<div id="m1"><br/>
			<div class="row">
				<h1 class="page-header">게시글 수정</h1>
			</div><br/>
			
					<form role="form" action="/board/modify" method="post">
					
					<input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum }" />'>
					<input type='hidden' name='amount' value='<c:out value="${cri.amount }" />'>
	    			<input type='hidden' name='type' value='<c:out value="${cri.type }"/>'>
	    			<input type='hidden' name='keyword' value='<c:out value="${cri.keyword }"/>'>
	    			
					<div class="form-group row">
					 <label class="col-sm-2 text-sm-center">글번호</label>
					   <div class="col-sm-8">
						 <input class="form-control" name='bno'
						value='<c:out value="${board.bno }"/>' readonly="readonly">
						</div>
					</div><br/><br/>

					<div class="form-group row">
					 <label class="col-sm-2 text-sm-center">제목</label>
					  <div class="col-sm-8">
					 <input class="form-control" name='title'
						value='<c:out value="${board.title }"/>'>
					</div>
					</div><br/><br/>

					<div class="form-group row">
					<label class="col-sm-2 text-sm-center">내용 </label>
					<div class="col-sm-8">
					<textarea id="a3" cols="30" rows="5" class="form-control"
					 name="content" style="resize: none;">
					<c:out value="${board.content}" /></textarea>
					</div>
					</div><br/><br/>

					<div class="form-group row">
					<label class="col-sm-2 text-sm-center">이름 </label>
					<div class="col-sm-8">
					<input class="form-control" name='memberId'
						value='<c:out value="${board.memberId }"/>' readonly="readonly">
					</div>
					</div><br/><br/>

					<div class="form-group row">
						<label class="col-sm-2 text-sm-center">작성일</label>
						<div class="col-sm-8">
						<input class="form-control" name='regdate'
								value='<fmt:formatDate pattern = "yyyy/mm/dd" value="${board.regdate}" />'
								readonly="readonly">
						</div>
					</div><br/>
					
					<div class="form-group row">
						<label class="col-sm-2 text-sm-center">수정일</label>
						<div class="col-sm-8">
						<input class="form-control" name='updatedate'
								value='<fmt:formatDate pattern = "yyyy/mm/dd" value="${board.updatedate}" />'
								readonly="readonly">
						</div>
					</div><br/>
					
					<div style=" text-align: center;">
					<button type="submit" data-oper='modify' class="btn btn-default">수정</button>
					<button type="submit" data-oper='remove' class="btn btn-default">삭제</button>
					<button type="submit" data-oper='list' class="btn btn-default ">목록</button></div>
				</form>
		</div>
	</div>
	
<!-- </body> -->

</html>