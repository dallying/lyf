<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>结果</title>
<style type="text/css">
body{font-family:"微软雅黑";color:#333; font-size:12px;}
</style>
</head>

<body>
<%
dim  x '列出表单中所有元素
z=0
for x=1 to request.Form.count
    'response.write request.form.key(x)&" --- " & request.form(x) & "</br>"
	if request.form.key(x)<> "ksf" and request.form.key(x)<> "jfjs" then z=z+request.form(x)
next
response.write("</br>共" & x-3 & "节课。课时费" & z * cint(request.Form("ksf")) * 2)
'request.form.key(x) 为 元素名
'request.form(x) 为 元素值
%>
</body>
</html>
