<%@page import="java.util.Map"%>
<%@page import="exam02.dto.Comment"%>
<%@page import="java.util.List"%>
<%@page import="exam02.dao.CommentDao"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="exam02.dto.Board"%>
<%@page import="exam02.dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	int idx = Integer.parseInt(request.getParameter("idx"));
	System.out.println("idx >> " + idx);
	
	//게시글 불러오기
	BoardDao boardDao = BoardDao.getInstance();
	Board board = boardDao.selectBoardByNo(idx);
	System.out.println("board >> " + board);

	//시간 양식에 맞게 설정
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm");
	
	//댓글 불러오기
	CommentDao commentDao = CommentDao.getInstance();
	List<Comment> list = commentDao.selectCommentByNo(idx);
 	 

	
%>
<h2>게시물  조회</h2>
<table border="1">
	<tr>
		<th>제목</th>
		<td colspan="3" style="width:400px;"><input style="width:99%; type="text" id="subject" name="subject" value="<%=board.getSubject()%>" readonly="readonly"></td>
	</tr>
	<tr>
		<th>작성자</th>
		<td><input style="width:97%;" type="text" id="writer" name="writer" value="<%=board.getWriter()%>" readonly="readonly"></td>
		<th>작성일 </th>
		<td><input style="width:97%; type="text" id="regDate" name="regDate" value="<%=sdf.format(board.getRegDate())%>"  readonly="readonly"></td>
	</tr>
	<tr>
		<td colspan="4">
		<textarea rows="8" cols="162"  readonly="readonly"><%=board.getContent()%></textarea>
		</td>
	</tr>
</table>
<br>
<table  border="1" rules="groups">
	
	<%if(list==null){ %>
	<% out.print("<td colspan='4'>-- 댓글없음 --</td>");%>
	<%}else{ %>
	<tr>	
		<th colspan="4" style="text-align:center;">댓글조회</th>
	</tr>
	<%for(Comment comment : list){ %>
	<tr>
		<td><%=comment.getWriter() %></td>
		<td><%=comment.getContent() %></td>
		<td><%=sdf.format(comment.getRegDate())%></td>
		<td><a href="/exam02/index.jsp?pp=action&idx=<%=comment.getIdx()%>&action=deleteComment">삭제</a></td>
	</tr>
	<%}
	} %>
</table>
<br>
<form action="/exam02/index.jsp?pp=action&idx=<%=idx %>" method="post" id="commentInsert">
	<input type="hidden" name="action" value="commentInsert">
	<table border="1">
	<tr>
			<th style="width:100px;">작성자</th>
			<td style="width:200px;"><input type="text" id="writer" name="writer" style="width:95%;"></td>
			<th>내&nbsp&nbsp용</th>
			<td><input type="text" id="content" name="content" style="width:99%;"></td>
			<td style="width:73px;"><button type="submit">작성완료</button></td>
	</tr>
	</table>
</form>
<br>
<div class="btn_group">
	<button type="button" onclick="location.href='/exam02/index.jsp?pp=list'">목록</button>
	<button type="button" onclick="location.href='/exam02/index.jsp?pp=update&idx=<%=idx%>'">수정</button>
<!-- 	<button type="button" onclick="deleteBoard();">삭제</button> -->
	<button type="button" onclick="location.href='/exam02/index.jsp?pp=action&idx=<%=idx%>&action=deleteBoard'">삭제</button> 
</div>