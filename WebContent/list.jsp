<%@page import="java.text.SimpleDateFormat"%>
<%@page import="exam02.dto.Board"%>
<%@page import="java.util.List"%>
<%@page import="exam02.dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	BoardDao boardDao = BoardDao.getInstance();
	List<Board> list = boardDao.selectBoardByAll();
	
	int count = boardDao.countList();
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm");
	
	
%>
<p>총 <%=count%> 개의 게시물이 있습니다.</p>

<table border="1">
	<thead>
		<th>번호</th>
		<th>작성자</th>
		<th>제목</th>
		<th>작성일</th>
	</thead>
	<tbody>
		<% for(Board board : list){ %>	
		<tr>
			<td><%=board.getIdx()%></td>
			<td><%=board.getWriter()%></td>
			<td><a href="/exam02/index.jsp?pp=detail&idx=<%=board.getIdx()%>"><%=board.getContent()%></a></td>
			<td><%=sdf.format(board.getRegDate())%></td>
		<tr>
		<%} %>
	</tbody>
</table>
<br>
<div class="btn_group">
	<button type="button" onclick="location.href='/exam02/index.jsp?pp=insert'">작성</button>
</div>