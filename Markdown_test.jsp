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
			h1 {
				font-family: Consolas, monaco, monospace;
				font-size: 23px;
				font-style: normal;
				font-variant: normal;
				font-weight: 500;
				line-height: 23px;
			}
			
			h3 {
				font-family: Consolas, monaco, monospace;
				font-size: 17px;
				font-style: normal;
				font-variant: normal;
				font-weight: 500;
				line-height: 23px;
			}
			
			p {
				font-family: Consolas, monaco, monospace;
				font-size: 14px;
				font-style: normal;
				font-variant: normal;
				font-weight: 400;
				line-height: 23px;
			}
			
			blockquote {
				font-family: Consolas, monaco, monospace;
				font-size: 17px;
				font-style: normal;
				font-variant: normal;
				font-weight: 400;
				line-height: 23px;
			}
			
			pre {
				font-family: Consolas, monaco, monospace;
				font-size: 12px;
				font-style: normal;
				font-variant: normal;
				font-weight: 400;
				line-height: 23px;
			}
			
			#text-input {
				margin-left: 4%;
				padding: 15px;
				height: 400px;
				width: 70%;
				border: none;
				resize: none;
			}
			
			#preview {
				padding: 15px;
				width: 70%;
				border: none;
				height: 400px;
				overflow-y:auto; 
				overflow-x:auto;
			}
			
			body {
				overflow-x: none;
			}
		</style>
	</head>

	<body>
		<center>
			<h1>MarkDown Edit</h1>
		</center>

		<div class="row">
			<div class="col-md-6">
				<textarea class="bg-success" id="text-input" oninput="this.editor.update()" rows="6">Type **Markdown** here.</textarea>
			</div>
			<div class="col-md-6">
				<div id="preview" class="bg-primary" rows="6"> </div>
			</div>
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

