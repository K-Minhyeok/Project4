<%@ page import="java.io.File" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %><%--
  Created by IntelliJ IDEA.
  User: 김민혁
  Date: 2023-11-17
  Time: 오전 10:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    String filename;
    int sizeLimit = 15 * 1024 * 1024;
    String realpath = request.getServletContext().getRealPath("upload");

    File dir = new File(realpath);
    if(!dir.exists()){
        dir.mkdirs();
    }

    MultipartRequest multipartRequest = new MultipartRequest(request,realpath,sizeLimit,"utf-8",new DefaultFileRenamePolicy());

    filename = multipartRequest.getFilesystemName("img");

%>
<html>
<head>
    <title>Title</title>
</head>
<body>

origin path: <%= multipartRequest.getOriginalFileName("img")%> <br>
upload path : ${pageContext.request.contextPath}/upload/<%=filename%> <br>
real path : <%=realpath%> <br>

<img src ="${pageContext.request.contextPath}/upload/<%=filename%>" />

     file name : <%=filename%> <br>

</body>
</html>
