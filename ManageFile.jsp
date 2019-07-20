<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Iterator"%>
<%@page import="mybean.teacher_bean" %>
<%@page import="mybean.source_bean" %>
<%@page import="mybean.class_bean" %>
<jsp:useBean id="TeacherBean" type="mybean.teacher_bean" scope="session"/>

<!DOCTYPE html>
<html>
    <head>
        <title>ManageFile Page</title>
    </head>
    <body>
<table>

    <tr>
        <th>资源编号：</th>
        <th>资源名称:</th>
        <th>资源所属课程:</th>
        <th>资源的操作:</th>
    </tr>

<%
    if(!TeacherBean.getSources().isEmpty()){
        Iterator<source_bean> it = TeacherBean.getSources().iterator();
        while(it.hasNext()){
            source_bean n = it.next();
%>
    <tr>
        <th><%=n.getSou_ID()%></th>
        <th><%=n.getSou_Name()%></th>
        <th><%=n.getCou_ID()%></th>
        <th>
          <% out.print("<a href=upload.jsp?Cou_ID=" + n.getCou_ID() + ">"+ n.getCou_Name() +"</a>");  %>
          <a href="/DeleteFile">删除</a><a href="/DoNotShareFile">撤销共享</a>
        </th>
    </tr>
<%}}
%>

</table>



<!--这里就只是转回主页面-->
<a href="Tea_Homepage.jsp">返回教师主页面</a>
<!--转交给另一个Servlet收集教学组的所有共享资源-->
<a href="/MoreResource.jsp">more>></a>

    </body>
</html>
