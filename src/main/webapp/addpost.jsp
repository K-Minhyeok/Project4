<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.example.dao.BoardDAO"%>
<%@ page import="com.example.*,java.io.File" %>
<%@ page import="com.oreilly.servlet.*" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.example.dao.FileUpload"%>
<%@ page import="com.example.bean.BoardVO" %>


<% request.setCharacterEncoding("utf-8"); %>


<%--<jsp:useBean id="u" class="com.example.bean.BoardVO" />--%>
<jsp:setProperty property="*" name="u"/>


<%
	request.setCharacterEncoding("utf-8");
	BoardDAO boardDAO = new BoardDAO();

	FileUpload upload = new FileUpload();
	BoardVO u = upload.uploadPhoto(request);
	int i = boardDAO.insertBoard(u);
	String msg = "데이터 추가 성공 !";
	if(i == 0) msg = "[에러] 데이터 추가 실패 ";
%>

<script>
	alert('<%=msg%>');
	location.href='posts.jsp';
</script>