<%@page import="java.util.Iterator"%>
<%@page import="mybean.class_bean"%>
<%@page import="mybean.teacher_bean"%>
<%@page import="mybean.source_bean"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="TeacherBean" type="mybean.teacher_bean" scope="session"/>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>UploadFile Page</title>
    </head>
    <body>
        <fieldset>
            <legend>上传单个文件</legend>
            <form action="UploadServlet" method="post" enctype="multipart/form-data">
                上传文件：
                <input type="file" name="file"><br>
                <input type="submit" value="上传">
            </form>
        </fieldset>
        <br/>
        <fieldset>
            <legend>上传多个文件</legend>
            <form action="UploadServlet" method="post" enctype="multipart/form-data">
                上传文件：
                <input type="file" name="file1"><br>
                上传文件：
                <input type="file" name="file2"><br>
                <input type="submit" value="上传">
            </form>
        </fieldset>
        <%
        RequestDispatcher dispatcher = request.getRequestDispatcher("");
        %>
    </body>
</html>
