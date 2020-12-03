<%@page import="exam02.dao.BoardDao"%>
<%@page import="exam02.dto.Board"%>
<%@page import="exam02.dao.CommentDao"%>
<%@page import="exam02.dto.Comment"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
CommentDao commentDao = CommentDao.getInstance();
BoardDao boardDao = BoardDao.getInstance();

String action =request.getParameter("action");
int idx = -1;
int bIdx = -1;
/* System.out.println("idx >> " + idx); */

String writer = request.getParameter("writer");
String subject = request.getParameter("subject");
String content = request.getParameter("content");


switch(action){
	case "commentInsert" :
		bIdx = Integer.parseInt(request.getParameter("idx"));
		Comment commentInsert = new Comment(bIdx, writer, content);
		int insertRes = commentDao.insertComment(commentInsert);
		System.out.println("insertRes >> " + insertRes);
		break;
	case "deleteComment" :
		idx = Integer.parseInt(request.getParameter("idx"));
		int deleteComment = commentDao.deleteComment(idx);
		System.out.println("deleteComment >> " + deleteComment);
		break;
	case "updateBoard" :
		idx= Integer.parseInt(request.getParameter("idx"));
		Board board = new Board(idx, writer, subject, content);
		int updateBoard = boardDao.updateBoard(board);
		System.out.println("updateBoard >> " + updateBoard);
		break;
	case "insertBoard" :
		Board insertBoard = new Board(writer, subject, content);
		int inserBoardtRes = boardDao.insertBoard(insertBoard);
		System.out.println("inserBoardtRes >> " + inserBoardtRes);
		break;
	case "deleteBoard" :
		idx = Integer.parseInt(request.getParameter("idx"));
		int deleteBoardRes = boardDao.deleteBoard(idx);
		int delComment = commentDao.deleteBetweenCandB(idx);
		System.out.println("deleteBoardRes >> " + deleteBoardRes);
		System.out.println("delComment >> " + delComment);
}


%>
<script>
	location.href="/exam02/index.jsp?pp=list";
</script>