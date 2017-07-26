<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<style>
body{font-family:"微软雅黑", "黑体", "宋体"; font-size:18px;}
a{padding:10px 25px; background:#f93; margin:10px; text-decoration:none; color:#fff;}
a:hover{text-decoration:underline; background:#e82;}
img{ margin-bottom:20px;}
</style>
<title>错误</title>
</head>

<body>
<div style="margin:auto; text-align:center; padding:90px;">
<img src="error.png"/><hr /><br />
<%
if request.QueryString("r")="mm" then
	response.Write("密码错误！<a href='index.asp'>返回</a>主页")
elseif request.QueryString("r")="xz" then
	response.Write("请先选择课程！<a href='index.asp'>返回</a>主页")
elseif request.QueryString("r")="qx" then
	response.Write("没有权限！<a href='index.asp'>返回</a>主页")
elseif request.QueryString("r")="cs" then
	response.Write("参数错误！<a href='index.asp'>返回</a>主页")
elseif request.QueryString("r")="nodata" then
	response.Write("无数据！<a href='index.asp'>返回</a>主页")
else
	response.Write("未知错误！<a href='index.asp'>返回</a>主页")
end if
%>
</div>
</body>
</html>
