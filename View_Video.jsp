<%@ page contentType="text/html;charset=GBK"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=GBK">
        <title>View video</title>
    </head>
    <body>
        <div class="video">
            <%
                String Tea_ID = request.getParameter("teaid");
                String Cou_ID = request.getParameter("couid");
                String Sou_Name = request.getParameter("souname");
                    
                String path = "upload/"+Tea_ID+"/"+Cou_ID+"/source/"+Sou_Name;
                //相对路径
            %>
            <video src="view_video/S04E01.mp4" autoplay controls="controls">
            Your browser does'n support video
            </video>
        </div>
    </body>
</html>
