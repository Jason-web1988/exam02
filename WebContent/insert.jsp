<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<h2>게시물 작성</h2>
<form action="/exam02/index.jsp?pp=action" method="post" id="insertBoard">
	<input type="hidden" name="action" value="insertBoard">
	<table border="1">
	<tr>
		<th>작성자</th>
		<td><input type="text" id="writer" name="writer" style="width:99%"></td>
	</tr>
	<tr>
		<th>제목</th>
		<td><input type="text" id="subject" name="subject" style="width:99%"></td>
	</tr>
	<tr>
		<th>내용</th>
		<td><textarea id="content" name="content" cols="154" rows="8"></textarea></td>
	</tr>
	</table>
</form>
<br>
<div class="btn_group">
	<button type="button" onclick="location.href='/exam02/index.jsp?pp=list'">목록</button>
	<button type="button" onclick="insertBoard();">완료</button>
</div>