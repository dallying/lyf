<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>验证</title>
<style>
body,input{font-family:"微软雅黑", "黑体", "宋体"; font-size:18px;}
.a{margin:auto; text-align:center; padding:90px;}
.a input{padding:10px; margin-right:15px; border:1px #ddd solid; background:#fff;}
.a input:hover{border:1px #f93 solid;}
.an:hover{border:1px #f93 solid; background:#f93; color:#fff; cursor:pointer;}
#mm{width:16em;}
#tj{width:5em;}
</style>
</head>

<body>
<%
if session("can")="y" then response.Redirect("xz.asp?from=ck")
%>
<form action="yz.asp?from=w" method="post">
<div class="a">
	<input type="hidden" value="w" name="yc" />
	输入密码：<input id="mm" name="mm" type="password" /><input class="an" id="tj" name="" type="submit" value="验证" />
    <br /><br /><br /><span style="color:#aaa;">测试密码：123</span>
</div>
</form>
</body>
</html>
