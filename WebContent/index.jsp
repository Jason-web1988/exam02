<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!DOCTYPE html>


<jsp:include page="include/top.jsp"/>
<article>
	<jsp:include page="${empty param.pp?'list.jsp' : param.pp +='.jsp'}"/>
</article>
<br>
<jsp:include page="include/footer.jsp"/>