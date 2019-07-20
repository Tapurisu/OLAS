<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.FileReader"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>MarkDown</title>
		<!--适配手机-->
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
		<link rel="shortcut icon" href="http://admin.zrstt.cn/group1/M00/00/00/rB_YCFsQ_OmAP6VFAAAQvtuENdk882.ico">
		<!--使用bootstrap的样式，比较好看-->
		<link href="http://cdn.bootcss.com/bootstrap/3.3.1/css/bootstrap.min.css" rel="stylesheet">
		<style>
			#text-input {
				margin-left: 0%;
				padding: 0px;
				height: 0px;
				width: 0%;
				border: none;
				resize: none;
			}
			
			#preview {
                                margin-left: 20%;
				padding: 15px;
				width: 60%;
				border: none;
				height: 400px;
				overflow-y:auto; 
				overflow-x:auto;
			}
			
                        #write-text {
				margin-left: 20%;
				padding: 15px;
				height: 600px;
				width: 60%;
				border: none;
				resize: none;
			}
                        
			body {
				overflow-x: none;
			}
		</style>
	</head>

	<body>
		<center>
			<h1>MarkDown_Test</h1>
		</center>

                <%
                    
                    String Tea_ID = request.getParameter("teaid");
                    String Cou_ID = request.getParameter("couid");
                    String Class_ID = request.getParameter("classid");
                    String Name = request.getParameter("name");
                    
                    String apath = request.getServletContext().getRealPath("/") + "upload/"+Tea_ID+"/"+Cou_ID+"/"+Class_ID+"/"+Name+"homework.txt";
                    
                //作业txt文件的绝对路径
                    String path = request.getServletContext().getRealPath("/")+"view_txt/use.txt";
                
                    FileReader reader = new FileReader(path);
                    BufferedReader bufferedReader = new BufferedReader(reader);
                    StringBuffer txt = new StringBuffer();
                    String temp = null;
                    while((temp = bufferedReader.readLine()) != null) {
                        txt.append(temp);
                        txt.append("\n");
                    }
                    reader.close();
                    bufferedReader.close();
                %>
        
		<div class="row">
                    <textarea class="bg-success" id="text-input" oninput="this.editor.update()" rows="6"><%=txt%></textarea>
                    <div id="preview" class="bg-primary" rows="6"> </div>
		</div>
                <div class="row">
                    <form action = "HomeworkServlet" method="post" >
                        <textarea name="work" class="bg-success" id="write-text" rows="6"></textarea>
                        <input type="submit" value="提交">
                    </form>
		</div>
		<script src="https://cdn.bootcss.com/markdown.js/0.5.0/markdown.min.js"></script>
		<script>
			function Editor(input, preview) {
				this.update = function() {
					preview.innerHTML = markdown.toHTML(input.value);
				};
				input.editor = this;
				this.update();
			}
			var $ = function(id) {
				return document.getElementById(id);
			};
			new Editor($("text-input"), $("preview"));
		</script>
	</body>

        
        
</html>

