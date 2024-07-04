<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<%@ include file="../include/topsidebar.jsp"  %>
<link href="/resources/css/list.css" rel="stylesheet" type="text/css">
<%
    String memberId = (String) session.getAttribute("memberId");
%>

<br/><br/><br/><br/>
<div class="container" >
	<div id="r1"><br/><br/>
		<div class="row">
			<h1 class="page-header">게시글 작성</h1><br/><br/>
			<form role="form" action="/board/register" method="post">
				<div class="col-sm-3" id="cate_r">
  		  	<select name="board_type" class="form-select" autofocus>
			<option value="">카테고리를선택해주세요</option>
			<!-- 원하는 카테고리 설정 후 게시글 작성 -->
		    <option value="">게시판 카테고리</option> 
			<option value="1">정치</option>
			<option value="2">경제</option>
			<option value="3">사회</option>
			<option value="4">이슈</option>
		    </select>
	</div><br/><br/>

                <div class="form-group row">
                    <label class="col-sm-2 text-sm-center">Title</label>
                    <div class="col-sm-8">
                        <input type="text" class="form-control" name="title" placeholder="*제목을 입력하세요" autofocus>
                    </div>
                </div><br/><br/>

                <div class="form-group row">
                    <label class="col-sm-2 text-sm-center">Content</label>
                    <div class="col-sm-8">
                        <textarea id="a3" cols="30" rows="5" class="form-control" name="content" placeholder="* 내용을 입력하세요."></textarea>
                    </div>
                </div><br/><br/>

                <div class="form-group row">
                    <label class="col-sm-2 text-sm-center">Name</label>
                    <div class="col-sm-8">
                        <input type="text" class="form-control" name="memberId" value="<%= memberId %>" readonly>
                        <small id="memberIdMessage" class="form-text text-muted">회원 아이디가 자동으로 입력됩니다.</small>
                    </div>
                </div><br/><br/>

                <div style="text-align: center;">
                    <button type="submit" class="btn btn-default">등록</button>
                    <a href="list" class="btn btn-default">취소</a>
                </div>
            </form>
        </div>
    </div>
</div>
</html>