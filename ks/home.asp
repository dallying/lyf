<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>选择教师</title>
<style type="text/css">
body{ font-family:"微软雅黑";color:#333}
.xmdiv{width:680px; margin:auto;}
.xm {font-size: 14px; background:#e82; margin:8px; padding:17px 10px; float:left; width:100px; text-align:center; color:#eee;}
.xm:hover{cursor:pointer;}
.bt{font-size:30px; margin:20px 5px;}
.xm:hover{background:#990000}
</style>
</head>
<body>
<form action="time.asp" method="post" name="b">
<input name="xm" type="text" style="display:none" id="xm" />
<div class='xmdiv'>
<div class="bt">选择教师：</div>
<%
Set conn=Server.CreateObject("ADODB.Connection")
connstring = "provider=microsoft.jet.oledb.4.0;" & "data source = " & server.mappath("database/ks.mdb")
conn.open connstring
set rs=server.CreateObject("ADODB.Recordset")
rs.open "kcxxb", conn, 0 ,1
do until rs.eof
	response.Write("<div class='xm' onclick=""tj('" & rs(0) & "')"">" & rs(0) & "</div>")
	rs.movenext
loop
response.Write("</div>")
rs.close
set conn = nothing
%>
</form>
</body>
<script type="text/javascript">
function tj(a){
	document.getElementById("xm").value =a
	document.b.submit();
}
</script>
</html>
