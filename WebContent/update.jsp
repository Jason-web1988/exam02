<%@page import="exam02.dto.Board"%>
<%@page import="exam02.dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	request.setCharacterEncoding("UTF-8");
	
	BoardDao boardDao = BoardDao.getInstance();
	
	int idx = Integer.parseInt(request.getParameter("idx"));
	Board board = boardDao.selectBoardByNo(idx);
	
%>
<h2>게시물 작성</h2>
<form action="/exam02/index.jsp?pp=action&idx=<%=idx %>" method="post" id="updateBoard">
	<input type="hidden" name="action" value="updateBoard">
	<table border="1">
	<tr>
		<th>작성자</th>
		<td><input type="text" id="writer" name="writer" value="<%=board.getWriter()%>" style="width:99%"></td>
	</tr>
	<tr>
		<th>제목</th>
		<td><input type="text" id="subject" name="subject" value="<%=board.getSubject() %>" style="width:99%"></td>
	</tr>
	<tr>
		<th>내용</th>
		<td><textarea id="content" name="content" cols="154" rows="8"><%=board.getContent()%></textarea></td>
	</tr>
	</table>
</form>
<br>
<div class="btn_group">
	<button type="button" onclick="location.href='/exam02/index.jsp?pp=list'">목록</button>
	<button type="button" onclick="updateBoard();">완료</button>
</div>