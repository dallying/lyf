<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>查看</title>
<link href="css.css" rel="stylesheet" type="text/css" />
</head>
<style>
.y5{margin:2px 0 2px 20px;display:-moz-inline-box;display:inline-block;width:80px; text-align:center; padding:5px 0;}
.pj1{color:#fff; background:#a18231}
.pj2{color:#fff; background:#1ba3b8}
.pj3{color:#fff; background:#1b75b8}
.pjlx{margin:30px 0 0 0; padding:10px; width:9em; color:#aaa;}

.lxt{border-left:3px #a18231 solid;}
.yj1{padding:10px; border-bottom:1px #a18231 solid; cursor:pointer;border-left:3px #a18231 solid; padding-left:8px;}
.yj1:hover{ background:#a18231; border-bottom:1px #a18231 solid; color:#fff;}
.yyj1{border-left:3px #a18231 solid; padding-left:6px;}
.yyj1d{border-bottom:1px #a18231 solid;}

.lxth{border-left:3px #1ba3b8 solid;}
.yj2{padding:10px; border-bottom:1px #1ba3b8 solid; cursor:pointer;border-left:3px #1ba3b8 solid; padding-left:8px;}
.yj2:hover{ background:#1ba3b8; border-bottom:1px #1ba3b8 solid; color:#fff;}
.yyj2{border-left:3px #1ba3b8 solid; padding-left:8px;}
.yyj2d{border-bottom:1px #1ba3b8 solid;}

.lxs{border-left:3px #1b75b8 solid;}
.yj3{padding:10px; border-bottom:1px #1b75b8 solid; cursor:pointer;border-left:3px #1b75b8 solid; padding-left:8px;}
.yj3:hover{ background:#1b75b8; border-bottom:1px #1b75b8 solid; color:#fff;}
.yyj3{border-left:3px #1b75b8 solid; padding-left:8px;}
.yyj3d{border-bottom:1px #1b75b8 solid;}

.cx{margin-bottom:20px; padding:10px; background:#f93; width:9em; text-align:center; color:#fff; cursor:pointer;}
.cx:hover{background:#d71;}
.rk{margin-top:40px;}
.yy1{padding:3px 12px; border-bottom:1px #ddd solid; color:#aaa; font-size:12px;}
.yy2{padding:15px 12px; font-size:14px; text-align:right;}
.yy2 span{margin:0 30px;}
.ckmx{color:#444; cursor:pointer;}
.ckmx:hover{color:#55f;}
#bg{display:none;position:fixed; left:20%; right:20%; min-width:600px; top:50px; height:286px; z-index:997; background:#FFF; padding-top:60px; border:10px #499FDD solid; font-size:18px; text-align:center;}
table {font-size:12px;}
table td{ border:1px solid #edede8;} 
.sj{font-size:11px; color:#bbb; margin:5px 0 0 350px;}
</style>
<script type="text/javascript">
var jt1=true;
var jt2=true;
var jt3=true;
function ck(l, w){
	if (window.XMLHttpRequest){
		xmlhttp = new XMLHttpRequest();
	}else{
		xmlhttp = new ActiveXobject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function(){
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200){
			var re = xmlhttp.responseText;
			document.getElementById('bg').innerHTML = re;
		}
	}
	xmlhttp.open("GET","mx.asp?lx=" + l + "&id=" + w + "&whhc=" + Math.random(), false);
	xmlhttp.send();
	document.getElementById("hui").style.display = "block";
	document.getElementById("bg").style.display = "block";
}
function cxxz(){
	window.location.href="xz.asp?from=ck";
}
function fh(){
	document.getElementById("hui").style.display = "none";
	document.getElementById("bg").style.display = "none";
}
</script>
<form name="cx" action="xz.asp" method="post"><input name="yc" type="hidden" value="c" /></form>
<%
if session("can")<>"y" then
	can=false
else
	can=true
	iid = int(request.Form("xid"))
	rkjs = request.Form("xjs")
	tkbj = request.Form("xbj")
	kcmc = request.Form("xkc")
	kcdm = request.Form("xdm")
	session("js")=rkjs
	ii=0:jj=0:kk=0
end if
%>
<body>
<div class="bj" style="margin-bottom:20px;"></div>
<div id="nr" class="z y">
<div onclick="cxxz()" class="cx"<%if not can then response.Write(" style='display:none'")%>>重新选择</div>
<%
if can then
	Set conn=Server.CreateObject("ADODB.Connection")
	connstring = "provider=microsoft.jet.oledb.4.0;" & "data source = " & server.mappath("l.mdb")
	conn.open connstring
	set rs = server.CreateObject("ADODB.Recordset")
	strsql = "select * from jsyb where iid=" & iid
	rs.open strsql, conn, 0 ,1
	max=0:min=100
	i=0
	y=""
	zzf=0
	response.Write("<div class='yy y0'><span class='y1'>教师姓名</span><span class='y2'>课程代码</span><span class='y3'>课程名称</span><span class='y4'>班级</span><span class='y5'>评价次数</span><span class='y5'>平均分</span></div>")
	response.Write("<div class='pjlx lxt'>学科委员会评价：</div>")
	do until rs.eof
		i=i+1
		fs=rs("zf")
		if fs>max then max=fs
		if fs<min then min=fs
		y=y & "<div class='yy1 yyj1'><span class='y1'>" & rkjs & "</span><span class='y2'>" & kcdm & "</span><span class='y3'>" & kcmc & "</span><span class='y4'>" & tkbj & "</span><span class='y5'><span class='ckmx' onclick=ck('jsyb','" & rs("id") & "')>查看明细</span></span><span class='y5'>" & fs & "</span></div>"
		zzf=zzf+int(fs)
		rs.movenext
	loop
	if i<>0 then
		pj=round(zzf/i,2)
	else
		pj=0
	end if
	ii=i
	response.Write("<div class='yy yj1' id='z1'><span class='y1'>" & rkjs & "</span><span class='y2'>" & kcdm & "</span><span class='y3'>" & kcmc & "</span><span class='y4'>" & tkbj & "</span><span class='y5'>" &  i & "</span><span class='y5 pj1'>" & pj & "</span></div>")
	if i<>0 then
		ymy="<div class='yy1 yyj1'><span class='y1'>任课教师</span><span class='y2'>课程代码</span><span class='y3'>课程名称</span><span class='y4'>班级</span><span class='y5'>&nbsp;</span><span class='y5'>得分</span></div>"
		zdx="<div class='yy2 yyj1 yyj1d'><span>最高分：" & max & "</span><span>最低分：" & min & "</span><a href='qb.asp?id=" & iid & "&lx=jsyb" & "' target='_blank'><span>查看汇总表</span></a></div>"
	else
		ymy="":zdx=""
	end if
	y="<div id='sjt1' style='display:none; background:#fefef4;'>" & ymy & y & zdx & "</div>"
	response.Write(y)
	rs.close
	conn.close
else
	response.Write("<div class='qxz'>无权限查看！点击<a href='index.asp'><span>返回</span></a>主页</div>")
end if
%>
<!-- ///////////////////////////////////////////////////////////                                   ////////////////同行 -->
<%
if can then
	Set conn=Server.CreateObject("ADODB.Connection")
	connstring = "provider=microsoft.jet.oledb.4.0;" & "data source = " & server.mappath("l.mdb")
	conn.open connstring
	set rs = server.CreateObject("ADODB.Recordset")
	strsql = "select * from thyb where iid=" & iid
	rs.open strsql, conn, 0 ,1
	min=100:max=0
	i=0
	y=""
	zzf=0
	response.Write("<div class='pjlx lxth'>同行评价：</div>")
	do until rs.eof
		i=i+1
		fs=rs("zf")
		if fs>max then max=fs
		if fs<min then min=fs
		y=y & "<div class='yy1 yyj2'><span class='y1'>" & rkjs & "</span><span class='y2'>" & kcdm & "</span><span class='y3'>" & kcmc & "</span><span class='y4'>" & tkbj & "</span><span class='y5'><span class='ckmx' onclick=ck('thyb','" & rs("id") & "')>查看明细</span></span><span class='y5'>" & fs & "</span></div>"
		zzf=zzf+int(fs)
		rs.movenext
	loop
	if i<>0 then
		pj=round(zzf/i,2)
	else
		pj=0
	end if
	jj=i
	response.Write("<div class='yy yj2' id='z2'><span class='y1'>" & rkjs & "</span><span class='y2'>" & kcdm & "</span><span class='y3'>" & kcmc & "</span><span class='y4'>" & tkbj & "</span><span class='y5'>" &  i & "</span><span class='y5 pj2'>" & pj & "</span></div>")
	if i<>0 then
		ymy="<div class='yy1 yyj2' id='z2'><span class='y1'>任课教师</span><span class='y2'>课程代码</span><span class='y3'>课程名称</span><span class='y4'>班级</span><span class='y5'>&nbsp;</span><span class='y5'>得分</span></div>"
		zdx="<div class='yy2 yyj2 yyj2d'><span>最高分：" & max & "</span><span>最低分：" & min & "</span><a href='qb.asp?id=" & iid & "&lx=thyb" & "' target='_blank'><span>查看汇总表</span></a></div>"
	else
		ymy="":zdx=""
	end if
	y="<div id='sjt2' style='display:none; background:#fefef4;'>" & ymy & y & zdx & "</div>"
	response.Write(y)
	rs.close
	conn.close
end if
%>
<!-- ///////////////////////////////////////////////////////////                                   ////////////////学生 -->
<%
if can then
	Set conn=Server.CreateObject("ADODB.Connection")
	connstring = "provider=microsoft.jet.oledb.4.0;" & "data source = " & server.mappath("l.mdb")
	conn.open connstring
	set rs = server.CreateObject("ADODB.Recordset")
	strsql = "select * from xsyb where iid=" & iid
	rs.open strsql, conn, 0 ,1
	max=0:min=100
	i=0
	y=""
	zzf=0
	response.Write("<div class='pjlx lxs'>学生评价：</div>")
	do until rs.eof
		i=i+1
		fs=rs("zf")
		if fs>max then max=fs
		if fs<min then min=fs
		y=y & "<div class='yy1 yyj3'><span class='y1'>" & rkjs & "</span><span class='y2'>" & kcdm & "</span><span class='y3'>" & kcmc & "</span><span class='y4'>" & tkbj & "</span><span class='y5'><span class='ckmx' onclick=ck('xsyb','" & rs("id") & "')>查看明细</span></span><span class='y5'>" & fs & "</span></div>"
		zzf=zzf+int(fs)
		rs.movenext
	loop
	if i<>0 then
		pj=round(zzf/i,2)
	else
		pj=0
	end if
	kk=i
	response.Write("<div class='yy yj3' id='z3'><span class='y1'>" & rkjs & "</span><span class='y2'>" & kcdm & "</span><span class='y3'>" & kcmc & "</span><span class='y4'>" & tkbj & "</span><span class='y5'>" &  i & "</span><span class='y5 pj3'>" & pj & "</span></div>")
	if i<>0 then
		ymy="<div class='yy1 yyj3' id='z3'><span class='y1'>任课教师</span><span class='y2'>课程代码</span><span class='y3'>课程名称</span><span class='y4'>班级</span><span class='y5'>&nbsp;</span><span class='y5'>得分</span></div>"
		zdx="<div class='yy2 yyj3 yyj3d'><span>最高分：" & max & "</span><span>最低分：" & min & "</span><a href='qb.asp?id=" & iid & "&lx=xsyb" & "' target='_blank'><span>查看汇总表</span></a></div>"
	else
		ymy="":zdx=""
	end if
	y="<div id='sjt3' style='display:none; background:#fefef4;'>" & ymy & y & zdx & "</div>"
	response.Write(y)
	rs.close
	conn.close
end if
%>
</div>
<div id="hui" onclick="fh()"></div>
<div id='bg'></div>
</body>
<script type="text/javascript" src="js/jquery-1.11.3.min.js"></script>
<script>
$(document).ready(function(){
	$("#z1").click(function(){
		$("#sjt1").slideToggle(<%response.Write(ii*40)%>);
	});
	$("#z2").click(function(){
		$("#sjt2").slideToggle(<%response.Write(jj*40)%>);
	});
	$("#z3").click(function(){
		$("#sjt3").slideToggle(<%response.Write(kk*40)%>);
	});
});
</script>
</html>
