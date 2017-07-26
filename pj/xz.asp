<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%
if request.QueryString("from")="ck" then
	if session("can")="y" then
		lx="yes"
	else
		response.Redirect("w.asp")
	end if
end if
%>
<script type="text/javascript">
if(window.name == "tjle"){
    location.reload();
    window.name = "lm";
}
</script>
<title>选择</title>
<script type="text/javascript" src="xz.js"></script>
<script type="text/javascript" src="qbkc.asp"></script>
<link href="css.css" rel="stylesheet" type="text/css" />
</head>

<body onclick="ss2()">
<div class="bj"></div>
<input id="ck" type="hidden" value="<%response.Write(lx)%>" />
<input id="jjs" type="hidden" value="all" />
<input id="ddm" type="hidden" value="all" />
<input id="kkc" type="hidden" value="all" />
<input id="bbj" type="hidden" value="all" />
<div class="z dh" style="text-align:left;"><a href="index.asp"><span>返回主页</span></a>|<span>当前位置：</span><span><%
if lx="yes" then
	response.Write("查看")
else
	response.Write("评价")
end if%></span>/<span>选择</span></div>
<div class="z" id="x">
    <div id="js" class="xa" onclick="_xz('js')">选择教师</div>
    <div id="dm" class="xa" onclick="_xz('dm')">选择课程代码</div>
    <div id="kc" class="xa" onclick="_xz('kc')">选择课程名称</div>
    <div id="bj" class="xa" onclick="_xz('bj')">选择班级名称</div>
    <div class="qx" id="qxjs" onclick="_qxx('js')"><img src="c.png" /></div>
    <div class="qx" id="qxdm" onclick="_qxx('dm')"><img src="c.png" /></div>
    <div class="qx" id="qxkc" onclick="_qxx('kc')"><img src="c.png" /></div>
    <div class="qx" id="qxbj" onclick="_qxx('bj')"><img src="c.png" /></div>
    <div class="xztc" id="xzjs" onmouseleave="_qx(this)"></div>
    <div class="xztc" id="xzdm" onmouseleave="_qx(this)"></div>
    <div class="xztc" id="xzkc" onmouseleave="_qx(this)"></div>
    <div class="xztc" id="xzbj" onmouseleave="_qx(this)"></div> 
</div>
<div id="nr" class="z y"><div class="qxz">请选择！</div></div>
<div id="hui" onclick="fh()"></div>
<div id="bai"></div>
<div id="yxz" onclick="ss1(this)">选择内容：</div>
<div id="yxz_n">
    <p>　　教师：<span id="yxjs"></span></p>
    <p>课程代码：<span id="yxdm"></span></p>
    <p>课程名称：<span id="yxkc"></span></p>
    <p>　　班级：<span id="yxbj"></span></p>
</div>
<div id="yxz_d1"><span onclick="tj('ck.asp')">查看</span></div>
<div id="yxz_d">
    <span onclick="tj('1.asp')">学科委员会评价</span>
    <span onclick="tj('3.asp')" style="padding-left:47px; padding-right:47px;">同行评价</span>
    <span onclick="tj('2.asp')" style="padding-left:47px; padding-right:47px;">学生评价</span>
</div>
<div id="yxz_x" onclick="ss1(this)">下一步：</div>
<form method="post" name="gopj" id="gopj">
    <input name="xjs" id="xjs" type="hidden" value="all" />
    <input name="xdm" id="xdm" type="hidden" value="all" />
    <input name="xkc" id="xkc" type="hidden" value="all" />
    <input name="xbj" id="xbj" type="hidden" value="all" />
    <input name="xid" id="xid" type="hidden" value="0" />
</form>
</body>
</html>
