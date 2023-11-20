<%@ page import="com.example.dao.BoardDAO" %>
<%@ page import="com.example.bean.BoardVO" %><%--
  Created by IntelliJ IDEA.
  User: 김민혁
  Date: 2023-11-18
  Time: 오전 5:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>게시글 상세정보</title>
  <link rel="stylesheet" href="board.css">

</head>
<body>
<%
  BoardDAO boardDAO = new BoardDAO();
  String id = request.getParameter("id");
  BoardVO u = boardDAO.getBoard(Integer.parseInt(id));
  request.setAttribute("vo",u);
%>

<h1> 게시글 정보</h1>
<table id="edit">

<tr>
  <td> Title</td> <td>${vo.getTitle()}</td>
</tr>
<tr>
  <td> Writer</td> <td>${vo.getWriter()}</td>
</tr>
<tr>
  <td> Content</td> <td>${vo.getContent()}</td>
</tr>
<tr>
  <td> Category</td> <td>${vo.getCategory()}</td>
</tr>
<tr>
  <td> Photo file</td> <td><c:if test="${vo.getImg() ne''}"><br/>
  <img width="500px" src="${pageContext.request.contextPath}/upload/${vo.getImg()}" class="img"></c:if></td>
</tr>

</table>

<button type="button" onclick="history.back()" > 뒤로가기 </button>
<button type="button" onclick="location.href='editform.jsp?id=${vo.getSeq()}'" > 수정하기 </button>

</body>
</html>
